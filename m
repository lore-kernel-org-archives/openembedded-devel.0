Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PHH6O-0005MA-FR
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Nov 2010 15:29:16 +0100
Received: by bwz10 with SMTP id 10so3906592bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Nov 2010 06:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=hWuFqNQtBX1kfoRfthZaYp1caOy/wzQa4g/kWrRJLKo=;
	b=NJ6gqjL6G5zkIWeZ9FI1FZybr6JaTIgfSJfDKAIOmbfLYFWYCyHu0g+F4w5hYT6gPE
	y5PaNAKeyyylaktxchuBvWUFipuelMy05my1m19/000cDDGiPxR9TGvoVeCi5W1HaA84
	S5aghlUXhT0fRtwJN+4BanMrmlZonWEoVawyw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=u3iXMh3PoHzUP47e4qXDkTtYut+c7HFnih84mjfnmBJ7L21yNHNz+YWtKYP1bCTO5i
	YolWeOOYN3Bbgxj5JW9qBiVh7RmYfKRL5jAhOHaa6fxWhHNr1Wm3r7+UqBsT5bjjchOR
	8lI6IrYXRdz4TwNX3Zse2yYcmauTi/f0JR3JA=
Received: by 10.204.72.140 with SMTP id m12mr4031732bkj.163.1289658492581;
	Sat, 13 Nov 2010 06:28:12 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id d12sm2056252bkw.19.2010.11.13.06.28.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 13 Nov 2010 06:28:11 -0800 (PST)
Date: Sat, 13 Nov 2010 15:27:52 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101113142752.GK3843@jama>
References: <1289657589.3693.113.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1289657589.3693.113.camel@mattotaupa>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Revert "unzip: Add update-alternatives to unzip"
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
X-List-Received-Date: Sat, 13 Nov 2010 14:29:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hi Paul, 

On Sat, Nov 13, 2010 at 03:13:09PM +0100, Paul Menzel wrote:
> This reverts commit 902b98f32ffd35661e43382f47226f65528ff1b1.
> 
> With this patch, decompressing zip files does not work anymore in `angstrom-2008.1, angstrom-2010.x`, `minimal` and `minimal-uclibc`.
> diff --git a/recipes/unzip/unzip_552.bb b/recipes/unzip/unzip_552.bb
> index 0decc4a..6e3497e 100644
> --- a/recipes/unzip/unzip_552.bb
> +++ b/recipes/unzip/unzip_552.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "A (de)compression library for the ZIP format"
>  SECTION = "console/utils"
>  LICENSE = "Info-ZIP"
> -PR = "r2"
> +PR = "r1"

Even with revert the PR should be increased (need manual change).

>  SRC_URI = "${SOURCEFORGE_MIRROR}/project/infozip/UnZip%205.x%20and%20earlier/5.52/unzip${PV}.tar.gz"
>  S = "${WORKDIR}/unzip-5.52"
>  
> @@ -19,15 +19,6 @@ do_install() {
>          oe_runmake -f unix/Makefile install prefix=${D}${prefix}
>  	install -d ${D}${mandir}
>  	mv ${D}${prefix}/man/* ${D}${mandir}
> -	mv ${D}${bindir}/unzip ${D}${bindir}/unzip.${PN}
> -}

limit this mv only to target's do_install while do_install for
unzip-native keeps unzip name (or you can add unzip -> unzip.${PN} 
link to unzip-native)

Regards,
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


