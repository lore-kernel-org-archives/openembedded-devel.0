Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QJR17-00054x-8v
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 16:00:57 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>)
	id 1QJQtP-0006fS-5Q; Mon, 09 May 2011 15:52:59 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1304872895-21596-6-git-send-email-otavio@ossystems.com.br>
References: <1304872895-21596-1-git-send-email-otavio@ossystems.com.br>
	<1304872895-21596-6-git-send-email-otavio@ossystems.com.br>
Date: Mon, 09 May 2011 14:58:13 +0100
Message-ID: <1304949493.8000.81.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH v3 06/11] p910nd: add version 0.95
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 May 2011 14:00:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-05-08 at 16:41 +0000, Otavio Salvador wrote:
> +++ b/meta-oe/recipes-support/p910nd/files/p910nd.init
> @@ -0,0 +1,31 @@
> +#! /bin/sh
> +
> +test -f /usr/sbin/p910nd || exit 0
> +
> +test -d /var/spool/p910nd || mkdir -p /var/spool/p910nd

This script seems to include a lot of hardwired assumptions about distro
file layout.  Could you make it respect ${sbindir} et al.?

> +    echo -n "Starting p910nd printer daemon: p910nd"
> +    /usr/sbin/p910nd -b -f /dev/usb/lp0 0

... and likewise here, this device node seems a bit over-specific.

> +    echo "."
> +    ;;
> +  stop)
> +    echo -n "Stopping p910nd printer daemon: p910nd"
> +    start-stop-daemon --stop --quiet --exec /usr/sbin/p9100d

This doesn't look like it's going to work: it tries to stop "p9100d" but
that doesn't seem to be the correct name of the executable.

> +do_compile () {
> +	${CC} ${LDFLAGS} -o p910nd p910nd.c
> +}

Shouldn't this also mention $(CFLAGS)?

p.




