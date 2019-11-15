Return-Path: <crg7475@mailbox.org>
X-Greylist: delayed 435 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 15 Nov 2019 15:16:44 UTC
Received: from mout-u-107.mailbox.org (mout-u-107.mailbox.org [91.198.250.252])
	by mail.openembedded.org (Postfix) with ESMTP id D1C7B6D6F5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 15:16:44 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mout-u-107.mailbox.org (Postfix) with ESMTPS id 47F1wV47DBzKmhd
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 16:09:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-language:content-transfer-encoding:content-type
	:content-type:in-reply-to:mime-version:date:date:message-id:from
	:from:references:subject:subject:received; s=mail20150812; t=
	1573830566; bh=+NTwZBYqvs+qQLpc8P+GGT9CpUFPRrGXaQn88hEwboo=; b=X
	i01ORdya/r+c5c6Njzu9RsavZMl8MId4MgQjNBVJAUTOLNt0RxkrFmdtuv+7LFt4
	e4PaQMjRCysqR3WfTT9asnJ4CGii9Quro7Hec+0bKJ31hiryiBCNdAEkKPKzXY50
	A8FyfK9UEVdH0xheDIJ9aT6OhcD0lTlQyoNzQbnxHhMF8Hq97ZaJMOmdDfz98zDP
	uS1BzEIuVXQIwyUu4TA2CKTjlEhPxH0KhlvVgJC6JwhgKHSi22HF/Awi6KuoRath
	yOkbJYshmNpPMgkuZG4ASMci3rx+uNZptyjChc2szuHSRSZkoMo6CgP+bt2QpiFw
	xiJ+OHNZxOvEU5IvA+d3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1573830568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=9HEulXyJ1HtWMLtUqL2J/Ps3RcfYiKXID+heOpHp2DI=;
	b=NYCzJNmpl/TYL3ZAvbjaJeMgquifbfMNm2cjOWtCJpyX+EYa77E56M84qK1iCDGnQOmvkS
	6gAXpg2PdeAVP/EAjd4Pl4FqPLdgLvW6f/Lyv4mB1k4oHx6M1PoFaqbaT0FxaoXc6uGNd1
	+gzg+nZUIqd4n9ThG/pQlQluMsL74R5vNBDldxItSHSbn1jVjTCZjjbLUJqcywjKzGUptW
	1UhCI+KrSgd6/rJ/hMkcsWe5zpX/mBYU/TgZrxCkLnCYswX9CAM6SBMUvJpefZr9Kxn8NM
	D3oYkrW0HzMr28wdgyhOKv7DwGldi9CwilkbgW0ZBuubqTGaCiLBxX5yr7nN8Q==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
	[80.241.56.115]) (amavisd-new, port 10030) with ESMTP id 5533bhFRdLks
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 16:09:26 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
References: <1573752010-26608-1-git-send-email-leon.anavi@konsulko.com>
	<dbae500e-b459-005e-ec2b-5d4f5ef66f18@gmail.com>
From: Carlos Rafael Giani <crg7475@mailbox.org>
Message-ID: <2feeb01f-2110-e266-3bdb-635c38577c39@mailbox.org>
Date: Fri, 15 Nov 2019 16:09:25 +0100
MIME-Version: 1.0
In-Reply-To: <dbae500e-b459-005e-ec2b-5d4f5ef66f18@gmail.com>
Subject: Re: [meta-oe][PATCH] surf: Add simple web browser
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Nov 2019 15:16:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

meta-browser would be more appropriate.

On 14.11.19 19:52, akuster808 wrote:
>
> On 11/14/19 9:20 AM, Leon Anavi wrote:
>> Add a recipe for surf, a simple web browser based on WebKit2/GTK+.
> shouldn't this go into the meta-webserver layer ?
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ---
>>   .../0001-config.mk-Fix-compiler-and-linker.patch   | 36 ++++++++++++++++++++++
>>   meta-oe/recipes-graphics/surf/surf_2.0.bb          | 30 ++++++++++++++++++
>>   2 files changed, 66 insertions(+)
>>   create mode 100644 meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
>>   create mode 100644 meta-oe/recipes-graphics/surf/surf_2.0.bb
>>
>> diff --git a/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch b/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
>> new file mode 100644
>> index 0000000..a3e33ea
>> --- /dev/null
>> +++ b/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
>> @@ -0,0 +1,36 @@
>> +From df199f82752398f86d2332dce53f52e2cfb50c87 Mon Sep 17 00:00:00 2001
>> +From: Leon Anavi <leon.anavi@konsulko.com>
>> +Date: Thu, 14 Nov 2019 14:28:39 +0000
>> +Subject: [PATCH] config.mk: Fix compiler and linker
>> +
>> +Do not set explicitly compiler and linker.
>> +
>> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> +---
>> + config.mk | 6 +++---
>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/config.mk b/config.mk
>> +index df6e812..bf07406 100644
>> +--- a/config.mk
>> ++++ b/config.mk
>> +@@ -15,8 +15,8 @@ GTKINC = `pkg-config --cflags gtk+-3.0 webkit2gtk-4.0`
>> + GTKLIB = `pkg-config --libs gtk+-3.0 webkit2gtk-4.0`
>> +
>> + # includes and libs
>> +-INCS = -I. -I/usr/include -I${X11INC} ${GTKINC}
>> +-LIBS = -L/usr/lib -lc -L${X11LIB} -lX11 ${GTKLIB} -lgthread-2.0
>> ++INCS = ${GTKINC}
>> ++LIBS = -lc -lX11 ${GTKLIB} -lgthread-2.0
>> +
>> + # flags
>> + CPPFLAGS = -DVERSION=\"${VERSION}\" -DWEBEXTDIR=\"${LIBPREFIX}\" -D_DEFAULT_SOURCE
>> +@@ -28,4 +28,4 @@ LDFLAGS = -s ${LIBS}
>> + #LDFLAGS = ${LIBS}
>> +
>> + # compiler and linker
>> +-CC = cc
>> ++#CC = cc
>> +--
>> +2.7.4
>> +
>> diff --git a/meta-oe/recipes-graphics/surf/surf_2.0.bb b/meta-oe/recipes-graphics/surf/surf_2.0.bb
>> new file mode 100644
>> index 0000000..98d3b23
>> --- /dev/null
>> +++ b/meta-oe/recipes-graphics/surf/surf_2.0.bb
>> @@ -0,0 +1,30 @@
>> +SUMMARY = "Simple web browser"
>> +DESCRIPTION = "Simple open source web browser based on WebKit2/GTK"
>> +HOMEPAGE = "https://surf.suckless.org/"
>> +SECTION = "x11/graphics"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b57e7f7720307a02d5a6598b00fe3afa"
>> +
>> +DEPENDS = "webkitgtk gtk+ gtk+3 glib-2.0 xserver-nodm-init"
>> +
>> +REQUIRED_DISTRO_FEATURES = "x11"
>> +
>> +SRC_URI = "git://git.suckless.org/surf;branch=surf-webkit2 \
>> +           file://0001-config.mk-Fix-compiler-and-linker.patch \
>> +"
>> +SRCREV = "b814567e2bf8bda07cea8de1c7a062f4aa437b65"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit pkgconfig
>> +
>> +TARGET_CC_ARCH += "${LDFLAGS}"
>> +
>> +do_install () {
>> +	install -d ${D}${bindir}
>> +	install -m 0644 ${S}/surf ${D}${bindir}
>> +	chmod +x ${D}${bindir}/surf
>> +}
>> +
>> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>> +INHIBIT_PACKAGE_STRIP = "1"

