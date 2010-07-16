Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OZsdF-0007va-6y
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 23:39:46 +0200
Received: by fxm12 with SMTP id 12so1367793fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jul 2010 14:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=+z77wjFMU7gy5v5hrsX/uOi+iff4Y1T0riajPYpIo90=;
	b=JEuzeIjMrZ/9OrKEhLkYo/1UKeUR6W0fTm/3sRvBiRNKEwbh9ryShBSdLppkfdJaD+
	dVgSmsdMqO0fA/BMlyzJNBsZUsXaGhpeCsGYl5C1369KokcdFz7JR//O3mj2SX0tgyjI
	koDouMxaG673Hgs3MmSVmi2Mt7eInFUpWKY9k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=V6q7H6PxEmdsTwH72EYp6ETTPVZd4MAia6epszmJG/B+3bzrDlxqyql2SPYSQbev4q
	IBLekOcGByH6aQT4r8bl6PWzRgCVviWPNBLQnC7MG7/zMxdqbipLWi4GsN7kbpO/F0W1
	gJqU0jO7nmx/ccraqJWorIqEohdJTw1+GxBNY=
Received: by 10.223.114.75 with SMTP id d11mr1159694faq.44.1279316379573;
	Fri, 16 Jul 2010 14:39:39 -0700 (PDT)
Received: from s42.loc (85-127-92-50.dynamic.xdsl-line.inode.at [85.127.92.50])
	by mx.google.com with ESMTPS id 14sm909492fav.26.2010.07.16.14.39.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 16 Jul 2010 14:39:38 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OZscz-0002FJ-Ug; Fri, 16 Jul 2010 23:39:29 +0200
Date: Fri, 16 Jul 2010 23:39:29 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100716213929.GI23169@mx.loc>
References: <1279208884.2345.2030.camel@mill.internal.reciva.com>
	<1279315934-8363-1-git-send-email-rep.dot.nop@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1279315934-8363-1-git-send-email-rep.dot.nop@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][v2] gcc-cross: fix PV and make it compile
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
X-List-Received-Date: Fri, 16 Jul 2010 21:39:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 16, 2010 at 11:32:14PM +0200, Bernhard Reutner-Fischer wrote:

>index 2e24d63..40b46d6 100644
>--- a/recipes/gcc/gcc-svn.inc
>+++ b/recipes/gcc/gcc-svn.inc
>@@ -1,7 +1,7 @@
> DEFAULT_PREFERENCE = "-999"
> ARM_INSTRUCTION_SET = "arm"
> 
>-SRCREV = "158653"
>+SRCREV = "162223"
> 
> require gcc-common.inc
> 
>@@ -9,9 +9,9 @@ DEPENDS = "mpfr gmp libmpc"
> NATIVEDEPS = "mpfr-native gmp-native libmpc-native"
> 
> BINV = "4.6.0"
>-PV = "4.6+svnr${SRCPV}"
>+PKGV = "4.6+svnr${SRCPV}"
> 
>-FILESPATHPKG .= ":gcc-svn"
>+FILESPATHPKG .= ":gcc-${PV}"

If i don't munge PR then i will not rebuild if the revision changes.
With above we'll always end up with (e.g.) gcc-cross-svn-r0
which is rather inconvenient, no?


