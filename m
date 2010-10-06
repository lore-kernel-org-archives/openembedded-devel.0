Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P3Xpp-0006FV-VH for openembedded-devel@lists.openembedded.org;
	Wed, 06 Oct 2010 19:31:30 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P3XpX-0001vk-Bj for openembedded-devel@lists.openembedded.org;
	Wed, 06 Oct 2010 19:31:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Oct 2010 19:31:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Oct 2010 19:31:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 06 Oct 2010 19:30:55 +0200
Message-ID: <i8ibof$3pq$1@dough.gmane.org>
References: <1286388898-7029-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100822 Shredder/3.0.7pre
In-Reply-To: <1286388898-7029-1-git-send-email-ynezz@true.cz>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] init-scripts: introduce DONTUSETIMESTAMP variable in bootmisc.sh
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
X-List-Received-Date: Wed, 06 Oct 2010 17:31:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 06-10-10 20:14, Petr Štetiar wrote:
> This variable is useful on systems with battery backed RTC. Imagine, that the
> board is shut down and then switched on after, for example three days.
> Althought the value in RTC is correct, this scripts sets system time with the
> wrong values.

So you shut it down at 20101003 and boot it at 20101006, that should
give you roughly:

SYSTEMDATE=`date "+%Y%m%d"` -> 20101006
TIMESTAMP=`cat /etc/timestamp | awk '{ print substr($0,9,4)
substr($0,1,4);}'` -> 20101003

NEEDUPDATE=`expr \( $TIMESTAMP \> $SYSTEMDATE \)` -> 0

So why is your rtc having a date older than the shutdown date?

regards,

Koen



> 
> Signed-off-by: Petr Štetiar <ynezz@true.cz>
> ---
>  recipes/initscripts/initscripts-1.0/bootmisc.sh |   15 +++++++++------
>  recipes/initscripts/initscripts_1.0.bb          |    2 +-
>  2 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/recipes/initscripts/initscripts-1.0/bootmisc.sh b/recipes/initscripts/initscripts-1.0/bootmisc.sh
> index d19477b..6abefcd 100755
> --- a/recipes/initscripts/initscripts-1.0/bootmisc.sh
> +++ b/recipes/initscripts/initscripts-1.0/bootmisc.sh
> @@ -69,12 +69,15 @@ fi
>  test -x /etc/init.d/hwclock.sh && /etc/init.d/hwclock.sh start
>  if test -e /etc/timestamp
>  then
> -	SYSTEMDATE=`date "+%Y%m%d"`
> -	TIMESTAMP=`cat /etc/timestamp | awk '{ print substr($0,9,4) substr($0,1,4);}'`
> -        NEEDUPDATE=`expr \( $TIMESTAMP \> $SYSTEMDATE \)`                                                 
> -        if [ $NEEDUPDATE -eq 1 ]; then 
> -		date `cat /etc/timestamp`
> -		/etc/init.d/hwclock.sh stop
> +	if test "$DONTUSETIMESTAMP" != no
> +	then
> +		SYSTEMDATE=`date "+%Y%m%d"`
> +		TIMESTAMP=`cat /etc/timestamp | awk '{ print substr($0,9,4) substr($0,1,4);}'`
> +	        NEEDUPDATE=`expr \( $TIMESTAMP \> $SYSTEMDATE \)`                                                 
> +        	if [ $NEEDUPDATE -eq 1 ]; then 
> +			date `cat /etc/timestamp`
> +			/etc/init.d/hwclock.sh stop
> +		fi
>  	fi
>  fi
>  : exit 0
> diff --git a/recipes/initscripts/initscripts_1.0.bb b/recipes/initscripts/initscripts_1.0.bb
> index cc60624..3987c60 100644
> --- a/recipes/initscripts/initscripts_1.0.bb
> +++ b/recipes/initscripts/initscripts_1.0.bb
> @@ -4,7 +4,7 @@ PRIORITY = "required"
>  DEPENDS = "makedevs"
>  RDEPENDS_${PN} = "makedevs"
>  LICENSE = "GPL"
> -PR = "r124"
> +PR = "r125"
>  
>  SRC_URI = "file://functions \
>             file://halt \

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMrLJOMkyGM64RGpERAr5QAJ45x3QEvOpxYGWwO2xpqqcqhLE4SQCfWySh
rKzUepwOYIYCXcK3PPiOuzQ=
=V/Ap
-----END PGP SIGNATURE-----



