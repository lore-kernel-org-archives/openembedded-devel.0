Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P2TTf-0006U8-BW
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 Oct 2010 20:40:05 +0200
Received: by wwe15 with SMTP id 15so1416502wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Oct 2010 11:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=gUhBhGs/di5a1Bb4Vf8h7D4ReNRNm2luuOlzr1qyCms=;
	b=FcPoRziJ0G2H404Qia8Nqqumcr8+kAT1SA0tEf3YOZXxN0IlGWTxmOvRxis9O006WB
	4WHKFS2tXdahfCT2kOj1ekLlIOYeFNtcodgvokwtnkBSCapjTmYmN0kv5WQFsajNZ+q0
	ITlU3q6rgIp2qKEnOjer+KeJNDr3eYGpnSFnA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=TUlfYcOM/FRLCMWbYcKuMExIjbr8czeh48E4kPK5BYFE5Uf/l/tZtpf2l0uO7Ex3Io
	SfzCpCCb0bvAqcEaY07ngF6Ncw+kxymiZK+R137N1vC0olEf0PofGLQsa8YMNbPCUg+B
	MgT/AGHL3MxOa0cN5QM+++B3iPQIEYqGJVD1A=
Received: by 10.216.0.206 with SMTP id 56mr6808068web.33.1286131183249; Sun,
	03 Oct 2010 11:39:43 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.169 with HTTP; Sun, 3 Oct 2010 11:39:22 -0700 (PDT)
In-Reply-To: <AANLkTi=N_zeiKZXy4W5umM=K5sb5JYvHCY5C+bFsrhL9@mail.gmail.com>
References: <i89i90$7hp$1@dough.gmane.org>
	<AANLkTi=N_zeiKZXy4W5umM=K5sb5JYvHCY5C+bFsrhL9@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 3 Oct 2010 11:39:22 -0700
X-Google-Sender-Auth: VxoBYQ2tKgfygT6eZj8FqCS5xOM
Message-ID: <AANLkTimmq=tcfb_x_S5T4Jp3UXFR7hdofO7arBXvPeKL@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
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
X-List-Received-Date: Sun, 03 Oct 2010 18:40:05 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 3, 2010 at 8:25 AM, Chris Larson <clarson@kergoth.com> wrote:

>
>
> On Sun, Oct 3, 2010 at 2:26 AM, Koen Kooi <k.kooi@student.utwente.nl>wrote:
>
>> Last nights build failed with:
>>
>> | make[2]: Entering directory
>>
>> `/OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gtk+-2.20.1-r9.3/gtk+-2.20.1/demos'
>> | /OE/angstrom-dev/sysroots/x86_64-linux/usr/bin/gdk-pixbuf-csource
>> - --raw --build-list          \
>> |               apple_red  ./apple-red.png      \
>> |                 gnome_foot ./gnome-foot.png   \
>> |         > test-inline-pixbufs.h                               \
>> |       || (rm -f test-inline-pixbufs.h && false)
>> | Usage: gdk-pixbuf-csource [options] [image]
>> |        gdk-pixbuf-csource [options] --build-list [[name image]...]
>> |   --stream                   generate pixbuf data stream
>> |   --struct                   generate GdkPixdata structure
>> |   --macros                   generate image size/pixel macros
>> |   --rle                      use one byte run-length-encoding
>> |   --raw                      provide raw image data copy
>> |   --extern                   generate extern symbols
>> |   --static                   generate static symbols
>> |   --decoder                  provide rle decoder
>> |   --name=identifier          C macro/variable name
>> |   --build-list               parse (name, image) pairs
>> |   -h, --help                 show this help message
>> |   -v, --version              print version informations
>> |   --g-fatal-warnings         make warnings fatal (abort)
>> | make[2]: *** [test-inline-pixbufs.h] Error 1
>> | make[2]: Leaving directory
>>
>> `/OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gtk+-2.20.1-r9.3/gtk+-2.20.1/demos'
>> | make[1]: *** [all-recursive] Error 1
>> | make[1]: Leaving directory
>>
>> `/OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gtk+-2.20.1-r9.3/gtk+-2.20.1'
>> | make: *** [all] Error 2
>>
>> I'll have a better look at work tomorrow, but if anyone has a fix ready,
>> don't hesitate to speak up :)
>>
>
> Reverted for now, working on a fix.  Sorry about that.  Must have missed
> something obvious.
>

Fixed, confirmed gtk+ builds with it.  Sorry for the hassle.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

