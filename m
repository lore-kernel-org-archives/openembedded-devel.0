Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P3bVI-0004uO-3J
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Oct 2010 23:26:26 +0200
Received: by iwn38 with SMTP id 38so28371iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Oct 2010 14:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type;
	bh=Tlb4w0aFzPwMlwFzsRdXalpnMkQIBqzF7Xz8VPJF5fI=;
	b=XsoKV+HSob9w0Xq2Ht9Kcl3cxSooUtwjUUbUYwKTXioJ0yiSisbv4nIpBQsVtEk8wQ
	JbL6SjvuzDkpq8kYc2H9no9d+lGK2cl0n7H1oNPRSVeSIWSDe17YDy2tXwUoRBrH04JL
	QpHclw97c+0gMPNIlAH4UK9+E++IoW5MpVS+8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=C6xTVL6/Avlzwe5LAGrayn4eMuBheYrSMjisLCEZBW+p+lv49EQh+3KScoJWUGsPJg
	I8Hm3WxKQkqO6MkyAU7p0Am+HGUY8g8xCFL4SZW+atgA26olg5mZ+YcZV8yYSsNpzAO+
	L1LdFGMaPgaD8Th+JdZ5VI+CIOKiyHraA48aM=
Received: by 10.231.157.135 with SMTP id b7mr14565447ibx.164.1286400359960;
	Wed, 06 Oct 2010 14:25:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Wed, 6 Oct 2010 14:25:39 -0700 (PDT)
In-Reply-To: <20100930123029.23600@gmx.net>
References: <20100930123029.23600@gmx.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Oct 2010 14:25:39 -0700
Message-ID: <AANLkTim36hWbTkqRa8afYfcgEXaEx3cLDD4C=Jq9LWy6@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: freetype-devel@nongnu.org
Subject: Re: [patch] fix for building freetype-native on a symlinked build environment
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
X-List-Received-Date: Wed, 06 Oct 2010 21:26:26 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 30, 2010 at 5:30 AM, Alexander Stohr <Alexander.Stohr@gmx.de> wrote:
> in an environment where the "/home" partition had not enough space
> for holding a complete open embedded project i created a symlink to
> an adequate partition on a second drive for hosting the build environment.
>
> this turned out to badly impact on misc build steps.
> the most recent problem i found is the build step used for freetype.
>
> in the seemingly hand written configure script there is
> a directory names comparison where some extra actions
> are needed in case the directory is not the base dir of freetype build.
> in my setup the names were different for some reasons in the embedding tools
> (not caring whats the exact origin). in fact both were the very same dir object.
> this lead to execution of parts of the script that were not intended
> so that this mis-detection finally stopped the build.
>
> the attached patch fixes that problem by changing the comparisonn code so that it
> uses the inode numbers of the relevant paths for the comparison.
>
> the patch further applies a check for an already existing subdir.
> this suppresses a message on the console in a benign case.
>
> the patch applies to freetype-2.3.6 but should be quite easily portable
> to any known later release including the relatively fresh 2.4.2 version.
>

if you can prepate patches for OE to apply this. It will be helpful.

> regards, Alex.
> --
> Neu: GMX De-Mail - Einfach wie E-Mail, sicher wie ein Brief!
> Jetzt De-Mail-Adresse reservieren: http://portal.gmx.net/de/go/demail
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


