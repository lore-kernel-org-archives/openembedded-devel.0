Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 53A4975CC2
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Nov 2015 14:36:07 +0000 (UTC)
Received: by lbjm5 with SMTP id m5so89352078lbj.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Nov 2015 06:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=50KmIJA8m8XzXhA3pBzrg0oQmFkmPwNqI10yfiVdHs0=;
	b=voegS8+hgvi8oubJVojYaTCU2GNzn6FmA4X26aHYE/lo7h1GWZyPD92wU1Wb0p3Sif
	mrgoHGz29sfgi3RdpoaiIkUJ7p8utygHse/NdDoBHRZms8Jlw4g94NKDr4EQonesmLcw
	azDTc7zGrVXNDeRR5FfvvDBrTWeg0w1iToLw+PkqVgmSpV1sM3taIvGA/pWbt8C3yCdC
	1uv7kDttIUWpcZS5JYzaePuBbO59m3Yo4f33iik7sSiB3RlByub9gmxDFgHkK1sNvWys
	uUbSRuk5UyBr3NK9PluVcYmkPLUZlLcFWcchGys2tdcgbLo0ICgPRyyVxrgn2hQHJ2xF
	VofQ==
X-Received: by 10.112.168.228 with SMTP id zz4mr10409239lbb.73.1446474966830; 
	Mon, 02 Nov 2015 06:36:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.114.245.193 with HTTP; Mon, 2 Nov 2015 06:35:47 -0800 (PST)
In-Reply-To: <20151102140313.GA15877@jama>
References: <1445523733-20612-1-git-send-email-ricardo.ribalda@gmail.com>
	<20151102140313.GA15877@jama>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Mon, 2 Nov 2015 15:35:47 +0100
Message-ID: <CAPybu_2HdYz7yP7QdUr2qi0wDcwT312uDMLSd5avMxdt3nztDQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] gerbil: Visualization and analysis tool for hyperspectral images
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
X-List-Received-Date: Mon, 02 Nov 2015 14:36:09 -0000
Content-Type: text/plain; charset=UTF-8

Hello

I want to cry :( It runtime depends on the sse instruction set.


Would you accept something like this on the recipe?

COMPATIBLE_MACHINE = "(-)"
COMPATIBLE_MACHINE_x86 = "(.*)"
COMPATIBLE_MACHINE_x86-64 = "(.*)"


Thanks and Regards!



On Mon, Nov 2, 2015 at 3:03 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Oct 22, 2015 at 04:22:13PM +0200, Ricardo Ribalda Delgado wrote:
>> New recipe
>
> Still fails for qemuarm:
> http://errors.yoctoproject.org/Errors/Details/21264/
>
>>
>> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>> ---
>> v2:
>>
>> v1 failed to link, it was missing the glu library.
>>
>> I have not been able to replicate the build error :S
>>
>> But after some static analysis it seems that:
>>
>> glu should have been automatically added with the cmake
>> variable OPENGL_LIBRARIES, set in FindOpeGL.cmake
>>
>> But if glu is not present, then it is not added....
>>
>> Sorry for the inconvenience!
>>
>>
>>
>>  meta-oe/recipes-graphics/gerbil/gerbil_git.bb | 30 +++++++++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>  create mode 100644 meta-oe/recipes-graphics/gerbil/gerbil_git.bb
>>
>> diff --git a/meta-oe/recipes-graphics/gerbil/gerbil_git.bb b/meta-oe/recipes-graphics/gerbil/gerbil_git.bb
>> new file mode 100644
>> index 000000000000..bfcd7c7ce803
>> --- /dev/null
>> +++ b/meta-oe/recipes-graphics/gerbil/gerbil_git.bb
>> @@ -0,0 +1,30 @@
>> +DESCRIPTION = "Generic framework for visualization and analysis of multispectral and hyperspectral data that strives to both bring new innovations in analysis capabilities and be of use in a wide range of hyperspectral data applications"
>> +HOMEPAGE = "http://gerbilvis.org/"
>> +LICENSE = "GPLv3"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
>> +DEPENDS = "boost qt4-x11-free tbb opencv libglu virtual/libgl"
>> +SRCREV = "670e06da516ed51dbae75e41e043900256bdabba"
>> +
>> +SRC_URI = "git://github.com/gerbilvis/gerbil.git"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit distutils-base cmake qt4x11
>> +
>> +export EXTRA_OECMAKE = "\
>> +                        -DQT_MOC_EXECUTABLE=${OE_QMAKE_MOC} \
>> +                        -DQT_UIC_EXECUTABLE=${OE_QMAKE_UIC} \
>> +                        -DQT_RCC_EXECUTABLE=${OE_QMAKE_RCC} \
>> +                        "
>> +
>> +do_configure() {
>> +        # Ensure we get the cmake configure and not qmake
>> +        cmake_do_configure
>> +}
>> +do_install() {
>> +        install -d ${D}${bindir}
>> +        install -m 755 bin/gerbil ${D}${bindir}/
>> +        install -m 755 bin/qgerbil ${D}${bindir}/
>> +}
>> +
>> +RDEPENDS_${PN} += "qt4-x11-free"
>> --
>> 2.6.1
>>
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



-- 
Ricardo Ribalda

