Return-Path: <rapphil@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4C54B65D34
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Dec 2014 01:15:56 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id e89so197983qgf.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Dec 2014 17:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=GzWot7THDSn9D9OkcCJwmIytld1KGatW9McwrUcM1ik=;
	b=Z/dR9HBfJAtCDFMqhtlGZtfw8mcbNA+KNBYb25e3HsGHozLQ8clUKTyViAM1y9R0NG
	Gmxj1cnF0YT6KdfNpR1N/iLIEMuUhBkzJI9+EGKZ3GtxUsdKVz5uU52Lzo9lUexhjUUM
	IqLyhiOZUWsy8cmVdMoYm5ODq0MuVir+705Oh1wzMvihnd7zPAQ2Rz0CP5iVVWYjifkT
	aCbvTNS5Ai05C6c+q3C2CfMYGFSXG8mxBj27ERL2JeajqxDJiHRA2RWj3zJxCvPSgidh
	DOcYHOPe4gZbYBBPiciftfGww5mmE+u6BxsNcvSzigYnT+A87MpK+k+Ysp1l/EcNGeH9
	UhCg==
MIME-Version: 1.0
X-Received: by 10.224.46.131 with SMTP id j3mr30167295qaf.86.1417828556745;
	Fri, 05 Dec 2014 17:15:56 -0800 (PST)
Received: by 10.140.142.134 with HTTP; Fri, 5 Dec 2014 17:15:56 -0800 (PST)
In-Reply-To: <20141205225538.GB2446@jama>
References: <1417801829-2363-1-git-send-email-rapphil@gmail.com>
	<20141205225538.GB2446@jama>
Date: Fri, 5 Dec 2014 23:15:56 -0200
Message-ID: <CAENGNhd1fzx8SOchN1oYi5VJYyAujDwwNmHx81XpdOu66GGXxA@mail.gmail.com>
From: Raphael Philipe <rapphil@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] libftdi: update to 1.1
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
X-List-Received-Date: Sat, 06 Dec 2014 01:16:01 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin,
do you mean to use the -M40 parameter for git format-patch?

I did that, but the produced patch was exacly the same as without it.

Please noticed that I deleted libftdi_0.19.bb and created libftdi_1.1.bb.

Can you help me?



On Fri, Dec 5, 2014 at 8:55 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Dec 05, 2014 at 03:50:29PM -0200, Raphael Silva wrote:
>> Previous version was 0.19, but it had a failing recipe due to
>> the fact that libusb was not detect during do_configure.
>> This problem does not happen in version 1.1.
>
> Please resend with -M40
>
>> Signed-off-by: Mario Goulart <mario.goulart@gmail.com>
>> Signed-off-by: Raphael Silva <rapphil@gmail.com>
>> ---
>>  meta-oe/recipes-support/libftdi/libftdi_0.19.bb | 31 -------------------------
>>  meta-oe/recipes-support/libftdi/libftdi_1.1.bb  | 29 +++++++++++++++++++++++
>>  2 files changed, 29 insertions(+), 31 deletions(-)
>>  delete mode 100644 meta-oe/recipes-support/libftdi/libftdi_0.19.bb
>>  create mode 100644 meta-oe/recipes-support/libftdi/libftdi_1.1.bb
>>
>> diff --git a/meta-oe/recipes-support/libftdi/libftdi_0.19.bb b/meta-oe/recipes-support/libftdi/libftdi_0.19.bb
>> deleted file mode 100644
>> index 773b791..0000000
>> --- a/meta-oe/recipes-support/libftdi/libftdi_0.19.bb
>> +++ /dev/null
>> @@ -1,31 +0,0 @@
>> -DESCRIPTION = "libftdi is a library to talk to FTDI chips.\
>> -FT232BM/245BM, FT2232C/D and FT232/245R using libusb,\
>> -including the popular bitbang mode."
>> -HOMEPAGE = "http://www.intra2net.com/en/developer/libftdi/"
>> -SECTION = "libs"
>> -
>> -PR = "r1"
>> -
>> -LICENSE = "LGPLv2.1 GPLv2"
>> -LIC_FILES_CHKSUM= "file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe \
>> -                   file://COPYING.LIB;md5=db979804f025cf55aabec7129cb671ed \
>> -"
>> -
>> -PNBLACKLIST[libftdi] = "BROKEN: needs to be updated to detect libusb with pkg-config instead of libusb-config"
>> -
>> -DEPENDS = "virtual/libusb0"
>> -DEPENDS_virtclass-native = "virtual/libusb0-native"
>> -
>> -SRC_URI = "http://www.intra2net.com/en/developer/libftdi/download/libftdi-${PV}.tar.gz \
>> -           file://libtool-m4.patch \
>> -"
>> -SRC_URI[md5sum] = "e6e25f33b4327b1b7aa1156947da45f3"
>> -SRC_URI[sha256sum] = "567c9d2c42d92fc401c5aba2deed45ffb2433990984e816bcdf31e441aef06be"
>> -
>> -PACKAGECONFIG ??= ""
>> -PACKAGECONFIG[cpp-wrapper] = "--enable-libftdipp,--disable-libftdipp,boost"
>> -
>> -inherit autotools binconfig pkgconfig
>> -
>> -BBCLASSEXTEND = "native"
>> -
>> diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.1.bb b/meta-oe/recipes-support/libftdi/libftdi_1.1.bb
>> new file mode 100644
>> index 0000000..641e5a7
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/libftdi/libftdi_1.1.bb
>> @@ -0,0 +1,29 @@
>> +DESCRIPTION = "libftdi is a library to talk to FTDI chips.\
>> +FT232BM/245BM, FT2232C/D and FT232/245R using libusb,\
>> +including the popular bitbang mode."
>> +HOMEPAGE = "http://www.intra2net.com/en/developer/libftdi/"
>> +SECTION = "libs"
>> +
>> +LICENSE = "LGPLv2.1 GPLv2"
>> +LIC_FILES_CHKSUM= "\
>> +    file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe \
>> +    file://COPYING.LIB;md5=db979804f025cf55aabec7129cb671ed \
>> +"
>> +
>> +DEPENDS = "libusb1"
>> +
>> +SRC_URI = "http://www.intra2net.com/en/developer/${BPN}/download/${BPN}1-${PV}.tar.bz2"
>> +
>> +SRC_URI[md5sum] = "b79a6356978aa8e69f8eecc3a720ff79"
>> +SRC_URI[sha256sum] = "c0b1af1a13e2c6682a1d8041e5b164a1e0d90267cd378bb51e059bd62f821e21"
>> +
>> +S = "${WORKDIR}/${BPN}1-${PV}"
>> +
>> +PACKAGECONFIG ??= ""
>> +PACKAGECONFIG[cpp-wrapper] = "-DFTDI_BUILD_CPP=on,-DFTDI_BUILD_CPP=off,boost"
>> +
>> +inherit cmake binconfig pkgconfig
>> +
>> +FILES_${PN}-dev += "${libdir}/cmake"
>> +
>> +BBCLASSEXTEND = "native"
>> --
>> 2.2.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

