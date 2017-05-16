Return-Path: <liu.ming50@gmail.com>
Received: from mail-ua0-f182.google.com (mail-ua0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id F0F7772F62
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 11:16:46 +0000 (UTC)
Received: by mail-ua0-f182.google.com with SMTP id g49so97123209uaa.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 04:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RzE5oCY+uJUmOHXAog7JC5txk1b6Ca5AwwSRM1xzBAk=;
	b=dg4mrv3PwVUOfBuu4vULnGale+Bdiy/jHyMe5R28J5SC5DdSGxdEzhnBXLJhPczeHW
	NYoOK3+s72HVIupkJwKbq6M89hRKupeYyur+t0Gq0+hZGPJsqT+PdwA8DQaoVwJF89pC
	XDMDejDRuTSZsk5QYncBDbZIp4nye1rFezeS/Fri9XcobEolcvF5eLOvaVbmXgIVK4d6
	JmN34WTCesT1/kjRbrFp/eez/x55s2Et/Fy0Cg1rh+36SJmeIM3ch7PwfCP/8LJEQ5Sk
	b0okVXwEhot00YYLFj8A2i41RQZNviAcdZQqeVle2D6u0/D+hKngbDl8l4/VccJXmLMf
	DtFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RzE5oCY+uJUmOHXAog7JC5txk1b6Ca5AwwSRM1xzBAk=;
	b=hYgQXd7SOSSIxo/7/f1vslooF+uVhaVykZ01G5aCGHXG1l1vVWHqMP3109O/KzCmxx
	i6V4X9xcTWDGV/LY2YuEP9SGEsxUyeEkNxD2bkT6hYjAHiXwfPI6d9pN3EFtBRrcmqKf
	Ji3G2K84j5vwkQnCkbT0DGT8WY+5knnqRWt6i0FTiWCxfc6OPKG+Kwjwv3qy41aGRnOB
	QMiQveWWuLNaeglITYiyW36XL77ETVz06Ku0AwnJu0/IgMLzL1KFx/NsZZVo4QBdK3Yu
	kji2SznUuHsJybG/FhDU65Y4774Cd0Hd5ic956hOXrYdYK3UZWOFsVwEEJqXM9AgQ8ml
	Ft8w==
X-Gm-Message-State: AODbwcD/UfGhVJs7gv59S+4GZbtmAt8ofjpWyKkFNpwIbVlgXEZ+SOSi
	loh4x5JHLf7RP26BuS0gtbJC3oEU7g==
X-Received: by 10.159.38.54 with SMTP id 51mr5565705uag.0.1494933407571; Tue,
	16 May 2017 04:16:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.47.74 with HTTP; Tue, 16 May 2017 04:16:47 -0700 (PDT)
In-Reply-To: <CA+chaQcV9VeDHj5TLFzibJyVNHDLOR7AdW4vM=KR_adAPTs1rw@mail.gmail.com>
References: <1494931796-11721-1-git-send-email-liu.ming50@gmail.com>
	<CA+chaQcV9VeDHj5TLFzibJyVNHDLOR7AdW4vM=KR_adAPTs1rw@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Tue, 16 May 2017 13:16:47 +0200
Message-ID: <CALatG=7qve-xez_Ahedq0i5K_jv3hBrt+ysiGmFGLQmVBSni1g@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH] xerces-c: fix a wrong PACKAGECONFIG option
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
X-List-Received-Date: Tue, 16 May 2017 11:16:47 -0000
Content-Type: text/plain; charset="UTF-8"

Hi, Martin:

Arha, thanks for the review, will send a V2.

//Ming Liu

2017-05-16 13:12 GMT+02:00 Martin Jansa <martin.jansa@gmail.com>:

> You should use ${prefix} if there isn't better variable instead of
> hardcoding /usr
>
> On Tue, May 16, 2017 at 12:49 PM, <liu.ming50@gmail.com> wrote:
>
>> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>>
>> In xerces-c's configure, these options is being referred as follows:
>> ......
>>     curl_flags="-I$with_curl/include"
>>     curl_libs="-L$with_curl/lib -lcurl"
>>
>>     icu_flags="-I$with_icu/include"
>>     icu_libs="-L$with_icu/lib -licuuc -licudata"
>> ......
>>
>> so they shouldn't be set to ${STAGING_DIR}, use
>> ${STAGING_DIR_TARGET}/usr instead.
>>
>> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
>> ---
>>  meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
>> b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
>> index b848b06..3bcedd7 100644
>> --- a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
>> +++ b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
>> @@ -16,8 +16,8 @@ SRC_URI[sha256sum] = "9408f12c1628ecf80730bedbe8b2c
>> aad810edd01bb4c66f77b60c873e8
>>  inherit autotools
>>
>>  PACKAGECONFIG ??= "curl icu"
>> -PACKAGECONFIG[curl] = "--with-curl=${STAGING_DIR},--with-curl=no,curl"
>> -PACKAGECONFIG[icu] = "--with-icu=${STAGING_DIR},--with-icu=no,icu"
>> +PACKAGECONFIG[curl] = "--with-curl=${STAGING_DIR_TAR
>> GET}/usr,--with-curl=no,curl"
>> +PACKAGECONFIG[icu] = "--with-icu=${STAGING_DIR_TARG
>> ET}/usr,--with-icu=no,icu"
>>
>>  do_install_prepend () {
>>      sed -i -e 's:-L${STAGING_DIR}/lib:-L\$\{libdir\}:g' ${B}/xerces-c.pc
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

