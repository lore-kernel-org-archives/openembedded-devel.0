Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OQmax-0007UJ-R9
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jun 2010 21:23:49 +0200
Received: by pwj10 with SMTP id 10so88056pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jun 2010 12:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=NZ+tSnGo7onVKpvdW3l0F/v4KKeRAt/lOaPHNViOOsw=;
	b=ugZAAzCU5ZAVFQwly/ZdPhUM0oZjYwjLXC0D8WVDqYy/VOacCHmoTCv+9cNd6jN+/D
	ybL9l7g2s2F/wN3aQQEeNAjVwBAMACrhBHVL/GEtXtH47CsGo8Pd+A7QdK8fpsTRcKix
	5hjvxmjpyfOEZvLitPpAvbTUEIKacJxTsUFYY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=navHVwDFLM75j8hbq4Kgt20fARr1veHAE8s4MQfzMS9YC8dQEz7A3ppX6z7Ce+o7Zb
	60+AAjQ4M43ztz4YOLkn1IMVcHVccyjw5OXR8dPve1ArY9a3ZKL9gcEiDJTckCi+YUup
	6iX4Evx1lG1fPgJtATRsV1kY3uwIn2uoy0P/M=
Received: by 10.115.102.16 with SMTP id e16mr4303860wam.117.1277144591507;
	Mon, 21 Jun 2010 11:23:11 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id c22sm87695266wam.18.2010.06.21.11.23.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 21 Jun 2010 11:23:10 -0700 (PDT)
Date: Mon, 21 Jun 2010 11:24:06 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100621182406.GA27606@gmail.com>
References: <1276606987-8681-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0
In-Reply-To: <1276606987-8681-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH] ipkg-utils: convert mtime to int before comparing it
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
X-List-Received-Date: Mon, 21 Jun 2010 19:23:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (15/06/10 15:03), Enrico Scholz wrote:
> The st_mtime attribute (which is a float) is compared against a value
> from the timestamp database, which was stored as an integer there.


Is it stored as integer or long int? Did you try it on x86_64 box.
> 
> When working on a filesystem with precise timestamps the comparision
> will fail nearly everytime hence.
> 
> Although it might be possible to enhance the database to store the
> fractional part too, this will complicate things more than we would
> gain by this change.
> 
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
>  .../ipkg-utils-native_1.6+cvs20050404.bb           |    2 +-
>  .../ipkg-utils/ipkg-make-index-track-stamps.patch  |    2 +-
>  recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb   |    2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes/ipkg-utils/ipkg-utils-native_1.6+cvs20050404.bb b/recipes/ipkg-utils/ipkg-utils-native_1.6+cvs20050404.bb
> index 98cc7f1..11e124b 100644
> --- a/recipes/ipkg-utils/ipkg-utils-native_1.6+cvs20050404.bb
> +++ b/recipes/ipkg-utils/ipkg-utils-native_1.6+cvs20050404.bb
> @@ -1,7 +1,7 @@
>  require ipkg-utils_${PV}.bb
>  
>  RDEPENDS_${PN} = ""
> -PR = "r22"
> +PR = "r23"
>  
>  inherit native
>  
> diff --git a/recipes/ipkg-utils/ipkg-utils/ipkg-make-index-track-stamps.patch b/recipes/ipkg-utils/ipkg-utils/ipkg-make-index-track-stamps.patch
> index ad6df4f..68758ed 100644
> --- a/recipes/ipkg-utils/ipkg-utils/ipkg-make-index-track-stamps.patch
> +++ b/recipes/ipkg-utils/ipkg-utils/ipkg-make-index-track-stamps.patch
> @@ -53,7 +53,7 @@ Index: ipkg-utils/ipkg-make-index
>  +     fnameStat = os.stat(filename)
>        if old_pkg_hash.has_key(basename):
>  -          if (verbose):
> -+          if pkgsStamps.has_key(basename) and fnameStat.st_mtime == pkgsStamps[basename]:
> ++          if pkgsStamps.has_key(basename) and int(fnameStat.st_mtime) == pkgsStamps[basename]:
>  +            if (verbose):
>                  sys.stderr.write("Found %s in Packages\n" % (filename,))
>  -          pkg = old_pkg_hash[basename]
> diff --git a/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb b/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
> index fe1f28b..aa2bfbb 100644
> --- a/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
> +++ b/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
> @@ -5,7 +5,7 @@ LICENSE = "GPL"
>  CONFLICTS = "ipkg-link"
>  RDEPENDS_${PN} = "python"
>  SRCDATE = "20050930"
> -PR = "r25"
> +PR = "r26"
>  
>  SRC_URI = "${HANDHELDS_CVS};module=ipkg-utils \
>             file://ipkg-utils-fix.patch \
> -- 
> 1.7.0.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


