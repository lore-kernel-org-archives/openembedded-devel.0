Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P2QRf-0001UU-7s
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 Oct 2010 17:25:48 +0200
Received: by wwe15 with SMTP id 15so1323339wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Oct 2010 08:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=hHbixtwPOawosdGdza8IXPw1ZFqdPL9AS8T3/dZJYR8=;
	b=ANHhrRViufP3j1mt+7a3Z6gbuKMWP2cBDKeemZhknYg+XV9ovCeB1Ic6lNTZN9Z2Q3
	h6D5Al/W6jnYuuXin2Q1UH2n71Moj84X/3eF/uuhVHPBoSJYmwXFaVfq2M7cgseiWngq
	RCJw3S6eZUEg60N+aVJqH93PDdUKgWx2iXQnI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=O1Evwr2jSaS8Rtl9smKNVN98qzscMYHo18iLHZbyUWVvtA4Dcjo9PTu7v+f9/2z2Vj
	FK6KbDdXyHs/OVzgmwkWGJD8pNqmA1tQAeSVEYB1bVurn7lSluB0cJvYX5T7BS298cPp
	8vgv6HEd6hY5h74oN0/ZvEQzupO82nV5Uy3cY=
Received: by 10.227.135.141 with SMTP id n13mr7007286wbt.97.1286119529999;
	Sun, 03 Oct 2010 08:25:29 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.169 with HTTP; Sun, 3 Oct 2010 08:25:09 -0700 (PDT)
In-Reply-To: <i89i90$7hp$1@dough.gmane.org>
References: <i89i90$7hp$1@dough.gmane.org>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 3 Oct 2010 08:25:09 -0700
X-Google-Sender-Auth: cyeGPkQcNAts5qSfXpsv1J2S__Y
Message-ID: <AANLkTi=N_zeiKZXy4W5umM=K5sb5JYvHCY5C+bFsrhL9@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: gtk+ build failure after create_wrapper commit
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
X-List-Received-Date: Sun, 03 Oct 2010 15:25:48 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 3, 2010 at 2:26 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:

> Last nights build failed with:
>
> | make[2]: Entering directory
>
> `/OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gtk+-2.20.1-r9.3/gtk+-2.20.1/demos'
> | /OE/angstrom-dev/sysroots/x86_64-linux/usr/bin/gdk-pixbuf-csource
> - --raw --build-list          \
> |               apple_red  ./apple-red.png      \
> |                 gnome_foot ./gnome-foot.png   \
> |         > test-inline-pixbufs.h                               \
> |       || (rm -f test-inline-pixbufs.h && false)
> | Usage: gdk-pixbuf-csource [options] [image]
> |        gdk-pixbuf-csource [options] --build-list [[name image]...]
> |   --stream                   generate pixbuf data stream
> |   --struct                   generate GdkPixdata structure
> |   --macros                   generate image size/pixel macros
> |   --rle                      use one byte run-length-encoding
> |   --raw                      provide raw image data copy
> |   --extern                   generate extern symbols
> |   --static                   generate static symbols
> |   --decoder                  provide rle decoder
> |   --name=identifier          C macro/variable name
> |   --build-list               parse (name, image) pairs
> |   -h, --help                 show this help message
> |   -v, --version              print version informations
> |   --g-fatal-warnings         make warnings fatal (abort)
> | make[2]: *** [test-inline-pixbufs.h] Error 1
> | make[2]: Leaving directory
>
> `/OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gtk+-2.20.1-r9.3/gtk+-2.20.1/demos'
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory
>
> `/OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gtk+-2.20.1-r9.3/gtk+-2.20.1'
> | make: *** [all] Error 2
>
> I'll have a better look at work tomorrow, but if anyone has a fix ready,
> don't hesitate to speak up :)
>

Reverted for now, working on a fix.  Sorry about that.  Must have missed
something obvious.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

