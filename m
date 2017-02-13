Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 11EEF731DA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 21:40:47 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id r141so2315781wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 13:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Qii7y+OcW4ui+OOz0EP3a3nbvZKv77bnIvSzTpx95dc=;
	b=R1PHjxHOua8M2XocJ3qmMRAT1iSiiNvigD5Mbsx/UQ8b8Dt+r23gEPsZvztOh+T4aK
	r/v5MfuG+LwNwVsExJc1UadYa5kZPO0Si/EB1Y+9JO0gOC6hjYFHaOYRHHFgqWnRABeS
	N58rP4pbGXG4WwIkOzSaC3xl/vjx+9HAsIviUojP310LY6/SI6VaIngELjcnahXyw+q1
	6NvHLdvUDD3rbcWB0J9/kYnMRTNmyTxKCdgRV9xUwgDl5/IvvpaG2/buMtW/OL2u4nkB
	RUUZBtjw1/W3nV2iUGGnAy/f3/xJ72vGmCuO0tAwXNCAMzzp5PJQScA63V3q8vgrhxbY
	7DpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Qii7y+OcW4ui+OOz0EP3a3nbvZKv77bnIvSzTpx95dc=;
	b=RBZRY2Pdl5nkhQh0CHZIknWXpvuKPSfjMlYajk8UTy/StZmEPW7Sq0mC9+gc88h7Do
	L6thNrrUsFPxkFyWk2/inoe9JRoNPyf8USgG0VViiEbzFKnyA8L3p8OHB0hjm+IcGue8
	Oaqcy0VSiErUofO3tXTUFnm5LOqRKVNFEwjyQpLGuHV6qqyE0/w1JxEbatX/NWmAzJkx
	ghuXasARgDBdYIioUF9OQjKS9UjPOYVcJVnuniAikQABTR9PEUqzw7m38gG8g8q0TTr6
	tzkicTlbNxuSDshc3Fb7u0guCF8xhKyIZ4zTMDpm4nykg73NJaVOcHClYgM75b2PUQB5
	u3Rg==
X-Gm-Message-State: AMke39nr1fx/YfhjUSygsPcGgpCQ2RfZPd3YzW4me7oATq0LbxYlnuPFvFEc1TQac1lokAwxy/fCaeayXt0qrg==
X-Received: by 10.28.211.205 with SMTP id k196mr321734wmg.124.1487022047798;
	Mon, 13 Feb 2017 13:40:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Mon, 13 Feb 2017 13:40:46 -0800 (PST)
In-Reply-To: <CA+chaQe+tq9r35iW6JMgLDuPV+v82zmPrPTaK359NQeTdzRodw@mail.gmail.com>
References: <1487019728-19329-1-git-send-email-max.krummenacher@toradex.com>
	<1487019728-19329-3-git-send-email-max.krummenacher@toradex.com>
	<CA+chaQe+tq9r35iW6JMgLDuPV+v82zmPrPTaK359NQeTdzRodw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 13 Feb 2017 22:40:46 +0100
Message-ID: <CA+chaQdeBHucjgvjgff=kudTnTX1+cxxGv6yMnGb39UjuOxSaA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [meta-oe][PATCH][master-next 3/4] pywbem: depend on python-m2crypto-native and its rdepends
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
X-List-Received-Date: Mon, 13 Feb 2017 21:40:48 -0000
Content-Type: text/plain; charset=UTF-8

Oh, I see what you did in master-next 1/4, but is it worth creating
.bbclass for just 2 dependencies which probably won't be used by so many
recipes?

On Mon, Feb 13, 2017 at 10:39 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Did you test this change? You added it to inherit not DEPENDS..
>
> On Mon, Feb 13, 2017 at 10:02 PM, Max Krummenacher <max.oss.09@gmail.com>
> wrote:
>
>> This fixed the build, remove blacklist also.
>>
>> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
>> ---
>>  meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb | 6 +-----
>>  1 file changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb
>> b/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb
>> index 8b5394e..14d4e69 100644
>> --- a/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb
>> +++ b/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb
>> @@ -16,14 +16,13 @@ HOMEPAGE = "http://pywbem.sf.net/"
>>  LICENSE = "LGPLv2"
>>  LIC_FILES_CHKSUM = "file://pywbem/LICENSE.txt;md5
>> =fbc093901857fcd118f065f900982c24"
>>  SECTION = "Development/Libraries"
>> -DEPENDS = "python-m2crypto-native"
>>  SRC_URI = "http://jaist.dl.sourceforge.net/project/${BPN}/${BPN}/${BP}
>> /${BP}-dev.r704.zip"
>>  SRC_URI[md5sum] = "84072451dcdd1aa9ee82363848faf7ad"
>>  SRC_URI[sha256sum] = "898035866d3cc741bbcd62c4ac26e
>> 633ad07b7c11d89db2472b9f923f3fd3ed8"
>>
>>  S = "${WORKDIR}/${BP}-dev"
>>
>> -inherit setuptools python-dir
>> +inherit setuptools python-m2crypto-native
>>
>>  do_install_append() {
>>      mv ${D}${bindir}/wbemcli.py ${D}${bindir}/pywbemcli
>> @@ -34,6 +33,3 @@ do_install_append() {
>>  }
>>
>>  BBCLASSEXTEND = "native"
>> -
>> -PNBLACKLIST[pywbem] ?= "Fails to build with RSS
>> http://errors.yoctoproject.org/Errors/Details/130596/"
>> -PNBLACKLIST[pywbem] ?= "Fails to build with RSS
>> http://errors.yoctoproject.org/Errors/Details/130681/"
>> --
>> 2.6.6
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

