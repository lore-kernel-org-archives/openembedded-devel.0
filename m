Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4A736609B2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2015 18:26:35 +0000 (UTC)
Received: by igbsb11 with SMTP id sb11so15423413igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2015 11:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=tftkiUTxhvbNo8+4gLtzdzjaBLD4pA1ghG9HQ//0IV8=;
	b=WmT7WKxPAhKYfMTAds+ha0Er2/sevQg/4IF3GkeQCtlKZlV/WbUJ6zbhkMJNWUB+nZ
	a5wCC5PH++MZW4Mh++y620Vmjw0lIO5JoP4SioMdyTGV/d8dzPNLt1SsXoVxKvt5YNDs
	84bJGM8DWRcidrGvQXUtvO4H7o1LwAUoKFB/Xd/rvfqjXV98f8PVJRRrCsjyR7JjZ3JW
	Z+NPmXNVo/O/AonWJpRPNs3KweXC0+M9Y8Kyjv43UAv5q5TWKmFZQVSBHuSh+U4SXeu2
	50bOLja7y/3FAtGm5wTwsCXkePsIAuAsQwXx2kZVe8lOrvT4CXNqNAMx9wUR+g/JxHyP
	g06Q==
X-Received: by 10.43.63.76 with SMTP id xd12mr4900662icb.11.1432232795879;
	Thu, 21 May 2015 11:26:35 -0700 (PDT)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by mx.google.com with ESMTPSA id
	m193sm15455121iom.19.2015.05.21.11.26.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 May 2015 11:26:35 -0700 (PDT)
Message-ID: <555E2359.3080509@gmail.com>
Date: Thu, 21 May 2015 14:26:33 -0400
From: Trevor Woerner <twoerner@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <5548E485.6080505@gmail.com>
In-Reply-To: <5548E485.6080505@gmail.com>
Subject: Re: ODROID-C1 support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 May 2015 18:26:37 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi Christian,

On 05/05/15 11:40, Christian Ege wrote:
> I've created a BSP Layer for the ODROID-C1 and other Amlogic based
> devices like the Wetek.Play
>
> https://github.com/linux-meson/meta-amlogic

Thanks! I've been playing with your layer. For the most part it's going
well. I've noticed a small glitch, however, and I'm not 100% sure how to
fix it (otherwise I would have just sent you a github pull request).

If I have your layer added to the BBLAYERS mix but I'm _not_ building
for "odroidc1" (or "wetekplay", I assume) then I get an error because
the build system can't find the amlsetfb.sh file. You have two
"amlsetfb.sh" files, one for the odroidc1 and one for the wetekplay
which you've added to recipes-core/initscripts/odroidc1 and
recipes-core/initscripts/wetekplay. If the MACHINE is odroidc1 then the
recipes-core/initscripts/odroidc1/amsetfb.sh file is found, otherwise it
is not.

I can work around this issue by adding a MACHINE-specific override to
your initscripts_1.%.bbappend:

-SRC_URI_append = " file://amlsetfb.sh \
+SRC_URI_append_odroidc1 = " file://amlsetfb.sh \

but I'm guessing another override would be required for the wetekplay as
well.

Why would someone include your layer and not build for odroidc1 or
wetekplay? Sometimes that's what people do ;-) (look at Angstrom, for
example). Besides, a BSP layer should be able to play nicely with other
layers even when its machines aren't being used :-)

