Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 452C6763F8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2016 12:52:52 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 28 Apr 2016 05:52:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,546,1455004800"; d="scan'208";a="954760588"
Received: from jlock-mobl2.ger.corp.intel.com ([10.252.13.137])
	by fmsmga001.fm.intel.com with ESMTP; 28 Apr 2016 05:52:25 -0700
Message-ID: <1461847944.3302.20.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Apr 2016 13:52:24 +0100
In-Reply-To: <1461846639-9563-1-git-send-email-richard.leitner@skidata.com>
References: <1461846639-9563-1-git-send-email-richard.leitner@skidata.com>
X-Mailer: Evolution 3.18.5.2 (3.18.5.2-1.fc23) 
Mime-Version: 1.0
Subject: Re: [meta-networking][PATCH][jethro] samba: fix smbd and nmbd paths in sysv initscript
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
X-List-Received-Date: Thu, 28 Apr 2016 12:52:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-04-28 at 14:30 +0200, Richard Leitner wrote:
> For the jethro branch.

Any idea whether this change is required in the master branch?

> The sysv initscript provided by samba assumes smbd and nmbd are
> installed in /opt/samba/bin/. In our case both binaries are installed
> to
> /usr/sbin/ by default. Therefore fix these paths.

Rather than hard-code these in a patch, which is equally broken for
people who don't use the default sbindir, it would make more sense to
sed ${sbindir} into the init file in a do_install_append ().

This is a fairly common pattern so you should be able to find several
examples, i.e. the bind recipe in OE-Core.

Regards,

Joshua

> 
> Furthermore fix the name of the initscript in its usage text.
> 
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ---
>  .../samba-4.1.12/22-fix-sysv-init-script.patch     | 23
> ++++++++++++++++++++++
>  .../recipes-connectivity/samba/samba_4.1.12.bb     |  1 +
>  2 files changed, 24 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/samba/samba-
> 4.1.12/22-fix-sysv-init-script.patch
> 
> diff --git a/meta-networking/recipes-connectivity/samba/samba-
> 4.1.12/22-fix-sysv-init-script.patch b/meta-networking/recipes-
> connectivity/samba/samba-4.1.12/22-fix-sysv-init-script.patch
> new file mode 100644
> index 0000000..aec3262
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/samba/samba-4.1.12/22-fix-
> sysv-init-script.patch
> @@ -0,0 +1,23 @@
> +--- a/packaging/sysv/samba.init
> ++++ b/packaging/sysv/samba.init
> +@@ -21,17 +21,14 @@
> + case "$1" in
> + 
> + 'start')
> +-#
> +-# Edit these lines to suit your installation (paths, workgroup,
> host)
> +-#
> +-   /opt/samba/bin/smbd -D -s/opt/samba/smb.conf
> +-   /opt/samba/bin/nmbd -D -l/opt/samba/log -s/opt/samba/smb.conf
> ++   /usr/sbin/smbd -D -s/etc/samba/smb.conf
> ++   /usr/sbin/nmbd -D -l/var/volatile/log/samba
> -s/etc/samba/smb.conf
> +    ;;
> + 'stop')
> +    killproc nmbd
> +    killproc smbd
> +    ;;
> + *)
> +-   echo "Usage: /etc/init.d/samba.server { start | stop }"
> ++   echo "Usage: /etc/init.d/samba.sh { start | stop }"
> +    ;;
> + esac
> diff --git a/meta-networking/recipes-
> connectivity/samba/samba_4.1.12.bb b/meta-networking/recipes-
> connectivity/samba/samba_4.1.12.bb
> index 863d783..a6c5935 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
> @@ -34,6 +34,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-
> ${PV}.tar.gz \
>             file://19-systemd-daemon-is-contained-by-libsystemd.patch 
> \
>             file://20-do-not-import-target-module-while-cross-
> compile.patch \
>             file://21-add-config-option-without-valgrind.patch \
> +           file://22-fix-sysv-init-script.patch \
>            "
>  
>  SRC_URI[md5sum] = "232016d7581a1ba11e991ec2674553c4"
> -- 
> 2.1.4
> 

