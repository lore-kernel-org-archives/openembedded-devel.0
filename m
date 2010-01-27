Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NaDDL-0006qD-QF for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jan 2010 20:06:10 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NaDAv-0002kP-TE for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jan 2010 20:03:37 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2010 20:03:37 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2010 20:03:37 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 27 Jan 2010 20:02:48 +0100
Message-ID: <hjq2kn$tge$1@ger.gmane.org>
References: <1264615116-13972-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100113 Shredder/3.0.2pre
In-Reply-To: <1264615116-13972-1-git-send-email-ynezz@true.cz>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC][PATCH] udev: get rid of 'timestamp in the future' tar messages
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
X-List-Received-Date: Wed, 27 Jan 2010 19:06:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Acked-by: Koen Kooi <koen@openembedded.org>

On 27-01-10 18:58, Petr Štetiar wrote:
> This patch tries to get rid of spew of the useless tar messages durring boot
> process on machines without RTC, such as the Beagleboard. Example:
> 
> Please wait: booting...
> Starting udev
> tar: dev/.udev/uevent_seqnum: time stamp 1970-01-01 01:00:21 is 14.122497521 s in the future
> tar: dev/.udev/rules.d: time stamp 1970-01-01 01:00:07 is 0.119201623 s in the future
> tar: dev/.udev/db/\x2fdevices\x2fvirtual\x2fblock\x2fram9: time stamp 1970-01-01 01:00:22 is 15.118713341 s in the future
> 
> [ more then 100 similar lines cutted off]
> 
> Signed-off-by: Petr Štetiar <ynezz@true.cz>
> ---
>  recipes/udev/udev-141/init |    2 +-
>  recipes/udev/udev_141.bb   |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/udev/udev-141/init b/recipes/udev/udev-141/init
> index 24ca9d8..66705e6 100644
> --- a/recipes/udev/udev-141/init
> +++ b/recipes/udev/udev-141/init
> @@ -44,7 +44,7 @@ if [ "$DEVCACHE" != "" ]; then
>  	   cmp -s /tmp/uname /etc/udev/saved.uname && \
>  	   cmp -s /tmp/cmdline /etc/udev/saved.cmdline && \
>  	   cmp -s /tmp/atags /etc/udev/saved.atags; then
> -		(cd /; tar xf $DEVCACHE)
> +		(cd /; tar xf $DEVCACHE > /dev/null 2>&1)
>  		not_first_boot=1
>  	fi
>  fi
> diff --git a/recipes/udev/udev_141.bb b/recipes/udev/udev_141.bb
> index df5e346..d1fee30 100644
> --- a/recipes/udev/udev_141.bb
> +++ b/recipes/udev/udev_141.bb
> @@ -6,7 +6,7 @@ LICENSE = "GPL"
>  # Untested
>  DEFAULT_PREFERENCE = "-1"
>  
> -PR = "r20"
> +PR = "r21"
>  
>  # needed for init.d script
>  RDEPENDS_${PN} += "udev-utils"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLYI3YMkyGM64RGpERAtOnAJ0fuEwr3nf15aWgtGFyicC63zw/DwCfVVMQ
To9KI1WaIVVe1+DHwGEDA3Y=
=cMGK
-----END PGP SIGNATURE-----



