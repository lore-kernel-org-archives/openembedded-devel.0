Received: from qmta02.westchester.pa.hmc1.comcast.net ([76.96.53.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john@soundmetrics.com>) id 1NYmBw-0001tZ-Hh
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 21:02:47 +0100
Received: from omta02.westchester.pa.hmc1.comcast.net ([76.96.53.7])
	by qmta02.westchester.pa.hmc1.comcast.net with comcast
	id Z7kf1d00109Ku2s097zB3q; Sat, 23 Jan 2010 19:59:11 +0000
Received: from [192.168.10.133] ([75.147.191.205])
	by omta02.westchester.pa.hmc1.comcast.net with bizsmtp
	id Z7zA1d0014SLwm3027zABR; Sat, 23 Jan 2010 19:59:10 +0000
Message-ID: <4B5B550E.9060104@soundmetrics.com>
Date: Sat, 23 Jan 2010 11:59:10 -0800
From: John Faith <john@soundmetrics.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.22) Gecko/20090605 SeaMonkey/1.1.17
	(Ubuntu-1.1.17+nobinonly-0ubuntu1)
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <1264273402-29910-1-git-send-email-john@soundmetrics.com>
	<hjfj5e$kei$1@ger.gmane.org>
In-Reply-To: <hjfj5e$kei$1@ger.gmane.org>
X-SA-Exim-Connect-IP: 76.96.53.9
X-SA-Exim-Mail-From: john@soundmetrics.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] socat: Add version 1.7.1.2
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
X-List-Received-Date: Sat, 23 Jan 2010 20:02:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> On 23-01-10 20:03, John Faith wrote:
> +do_configure() {
> +	# Override this function to avoid autoconf/automake/aclocal/autoheader
> +	# since config.h.in gets recreated.
> +	(cd ${S} && gnu-configize) || die "failure in running gnu-configize"
> +	oe_runconf
>   
>
> Isn't the whole point of autotools_do_configure to recreate such files?
> When config.h.in triggers an errror it's usually a case of people
> abusing aclocal.m4.
>
> regards,
>
> Koen
>
>   
Hello,
It looked like the config.h.in included in the source tarfile was needed 
which is why I avoided the autoheader-generated one.  Does oe generally 
have any trouble with a config.h.in included in a package's source?

Thanks,
John




