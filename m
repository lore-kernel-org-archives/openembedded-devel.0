Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 56C276067D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2016 13:55:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3JDstfo018428
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 19 Apr 2016 06:54:55 -0700
Received: from tal.localnet (128.224.22.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 19 Apr 2016 06:54:53 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Joe MacDonald <joe_macdonald@mentor.com>
Date: Tue, 19 Apr 2016 09:54:53 -0400
Message-ID: <2862560.T3V9HA8dKh@tal>
Organization: Wind River 
User-Agent: KMail/4.13.3 (Linux/3.13.0-85-generic; KDE/4.13.3; x86_64; ; )
In-Reply-To: <1461036607-24650-1-git-send-email-joe_macdonald@mentor.com>
References: <1461036607-24650-1-git-send-email-joe_macdonald@mentor.com>
MIME-Version: 1.0
Cc: anders@chargestorm.se, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] dnsmasq: get systemd only working again
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Apr 2016 13:55:02 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On April 18, 2016 23:30:07 Joe MacDonald wrote:
> From: Mark Asselstine <mark.asselstine@windriver.com>
> 
> The changes made in commit 2497cf2960537152427c99629b2af412787eb6c2
> [dnsmasq: steal resolvconf support from Ubuntu] broke systemd only
> dnsmasq runtime. No sysvinit scripts are included in systemd only
> builds (and should not be) and the dnsmasq executable has not moved to
> /usr/sbin.
> 
> Reverting to the previous version of the systemd service file. If
> folks want the local dnsmasq instance to be queried before going to
> an external DNS they should add 'nameserver 127.0.0.1' to
> /etc/resolv.conf. Or submit a change which will work with systemd.
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> ---
> 
> Mark,
> 
> Thanks for the patch.  In the interests of not causing any more hassle
> than I already have, I'm proposing this as an alternative to what you sent
> earlier today.  This hopefully preserves the resolvconf/start-stop
> functionality while not relying on any sysvinit-ness.  What do you think
> about this as a middle-ground?

No worries about causing hassle. Things brake, things get fixed, we move on and 
learn.

The approach is fine with me. When looking at this yesterday I question the 
need for this 'wrapper' and side with Arch Linux approach. But I definitely 
trust your call on this, knowing you have spent many more hours dealing with 
dnsmasq and resolv.conf than I ever will in my lifetime.

Anyways, definitely no complaints from me with this change, if you can sort out 
the runtime issues that Anders seems to have run in to.

Thanks for getting to this so quickly,
Mark

> 
> Anders,
> 
> I trust that nothing Mark and I are discussing here changes the issue you
> noted about dnsmasq just falling over after a few minutes.  I propose we
> dig into that separately, since it looks like a different problem probably
> related to the uprev.  If it turns out that once we merge something to
> support systemd-only builds that resolves the 'dnsmasq vandalizes itself'
> issue, even better.
> 
> -J.
> 
>  .../recipes-support/dnsmasq/dnsmasq.inc            |  9 ++--
>  .../dnsmasq/files/dnsmasq-resolvconf-helper        | 62
> ++++++++++++++++++++++ .../recipes-support/dnsmasq/files/dnsmasq.service  |
>  9 ++--
>  3 files changed, 72 insertions(+), 8 deletions(-)
>  create mode 100644
> meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf-helper
> 
> diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc index
> 622e630..df58e5c 100644
> --- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> @@ -60,11 +60,12 @@ do_install () {
>          install -m 644 dbus/dnsmasq.conf ${D}${sysconfdir}/dbus-1/system.d/
> fi
>      if [ "${@base_contains('PACKAGECONFIG', 'resolvconf', 'resolvconf', '',
> d)}" != "" ]; then -	install -d ${D}${sysconfdir}/resolvconf/update.d/
> -	install -m 0755 ${WORKDIR}/dnsmasq.resolvconf
> ${D}${sysconfdir}/resolvconf/update.d/dnsmasq +        install -d
> ${D}${sysconfdir}/resolvconf/update.d/
> +        install -m 0755 ${WORKDIR}/dnsmasq.resolvconf
> ${D}${sysconfdir}/resolvconf/update.d/dnsmasq
> 
> -	install -d ${D}${sysconfdir}/default/volatiles
> -	install -m 0644 ${WORKDIR}/99_dnsmasq ${D}${sysconfdir}/default/volatiles
> +        install -d ${D}${sysconfdir}/default/volatiles
> +        install -m 0644 ${WORKDIR}/99_dnsmasq
> ${D}${sysconfdir}/default/volatiles +        install -m 0755
> ${WORKDIR}/dnsmasq-resolvconf-helper ${D}${bindir} fi
>  }
> 
> diff --git
> a/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf-helper
> b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf-helper
> new file mode 100644
> index 0000000..db54d46
> --- /dev/null
> +++
> b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf-helper
> @@ -0,0 +1,62 @@
> +#!/bin/bash
> +#
> +# Borrowing heavily from the dnsmasq initscript's version of support for
> +# resolvconf, intended for use in systemd-only configurations.
> +#
> +PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
> +DAEMON=/usr/sbin/dnsmasq
> +NAME=dnsmasq
> +
> +# Most configuration options in /etc/default/dnsmasq are deprecated
> +# but still honoured.
> +if [ -r /etc/default/$NAME ]; then
> +   . /etc/default/$NAME
> +fi
> +
> +start_resolvconf()
> +{
> +   # If interface "lo" is explicitly disabled in /etc/default/dnsmasq
> +   # Then dnsmasq won't be providing local DNS, so don't add it to
> +   # the resolvconf server set.
> +   for interface in $DNSMASQ_EXCEPT
> +   do
> +      [ $interface = lo ] && return
> +   done
> +
> +   if [ -x /sbin/resolvconf ] ; then
> +      echo "nameserver 127.0.0.1" |
> +      /sbin/resolvconf -a lo.$NAME
> +   fi
> +   return 0
> +}
> +
> +stop_resolvconf()
> +{
> +   if [ -x /sbin/resolvconf ] ; then
> +      /sbin/resolvconf -d lo.$NAME
> +   fi
> +   return 0
> +}
> +
> +case "$1" in
> +   start)
> +      start_resolvconf
> +      exit 0
> +      ;;
> +   stop)
> +      stop_resolvconf
> +      exit 0
> +      ;;
> +   restart)
> +      stop_resolvconf
> +      start_resolvconf
> +      exit 0
> +      ;;
> +   *)
> +      echo "Usage: /etc/init.d/$NAME {start|stop|restart}" >&2
> +      exit 3
> +      ;;
> +esac
> +
> +exit 0
> +
> diff --git a/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service
> b/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service index
> c3637e1..5824b62 100644
> --- a/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service
> +++ b/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service
> @@ -5,10 +5,10 @@ After=network.target
>  [Service]
>  Type=forking
>  PIDFile=/run/dnsmasq.pid
> -ExecStartPre=/usr/sbin/dnsmasq --test
> -ExecStart=/etc/init.d/dnsmasq systemd-exec
> -ExecStartPost=/etc/init.d/dnsmasq systemd-start-resolvconf
> -ExecStopPre=/etc/init.d/dnsmasq systemd-stop-resolvconf
> +ExecStartPre=/usr/bin/dnsmasq --test
> +ExecStart=/usr/bin/dnsmasq -x $MAINPID
> +ExecStartPost=/usr/bin/dnsmasq-resolvconf-helper start
> +ExecStop=/usr/bin/dnsmasq-resolvconf-helper stop
>  ExecReload=/bin/kill -HUP $MAINPID
> 
>  [Install]


