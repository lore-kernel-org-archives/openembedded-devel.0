Return-Path: <tuanha@viosoft.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7A18C6BF3E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 09:35:11 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id i130so894266pgd.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 01:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=viosoft-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=189T0v43vUfvbLKv496ppd51UFg49uWASrCkBztmLC4=;
	b=SXGkAk76Kuv5V8PbjyMc5g+BxcmcjxbH3r76RbAP7HL1pWgyfaI9hzQrJYfT0k1Kma
	tX0IcdizKv5dQMazmpij+401aLq80u34s52abwtxQP+/VzQTIwBOYE0ftg7R71PpHZQY
	acwbmLk7MOhcL6UHE9fjzEj2gN8TRWCtwZ5Fuup0InbvwNtoq4BtB23fWwWyUgohDrfO
	zp/w6AomaIS8coG2ChxDl4p/vH2gk7/MJbHxNiDvUmGyRg3bT8p0JDmVZ5Jq4CoYMJ9J
	Ys+hsmAAy6pFUK4Oo8iVbOo6UAxwe13zEKPgZapZ+Y49RSqIHzuyUC+iHxP3itHeqiOq
	v4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=189T0v43vUfvbLKv496ppd51UFg49uWASrCkBztmLC4=;
	b=gTeemgxm21d61mmRPZ8+2DeI//DSnLy5mrj5At3bO+UoRYvML6qsCBQxcZUIkMhiem
	Dd1fI2Vj985TzKqEGE3NSZuYOh+TV/8r3+wkXKihwDkjdoYwk7qOgbeCO7pEf+2LNnzo
	DQbL8BqbbZ4gOYk0IBPhjNmy/Lca/ZBkwmYUEXtHNUihnEiF9SgOb4PJaGwMNc1joZtZ
	yE3jvZMS3vUIIGT5FOqZ+ht+42Q+FCC9QsYbEZLPKMtNoR+Ts/B+JQgPkK+wHonoxNGb
	yPGYN/mq25ugTriFtc7mV1FojUA68dZxTb2+Xbp2qbNQ8qW98PLllE2HndbASo8BfVNP
	ibvQ==
X-Gm-Message-State: AHQUAuahc/TzBsWu7xJW/01GvfqXV0VUJhJp90t8E8TIf5rkcgSVWP5o
	8hEihNp2njGKTQyju07XWcfSPqdH4w8=
X-Google-Smtp-Source: AHgI3IZTtSvnF10xFE0GaT9o/Sqt2hlgffomQfWktWkpP/ysFYREgLYsFJrwNepWgt8d2oeM5vam4Q==
X-Received: by 2002:a65:6259:: with SMTP id q25mr3089330pgv.235.1550828111990; 
	Fri, 22 Feb 2019 01:35:11 -0800 (PST)
Received: from [192.168.100.8] ([123.16.252.182])
	by smtp.gmail.com with ESMTPSA id
	g71sm3836392pfg.157.2019.02.22.01.35.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 01:35:11 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>
References: <35f095b0-e865-3794-e16f-f7d7ca17c770@viosoft.com>
	<CAMKF1sowGDE5y80P=U7oo-k7SQdz5gfm=sHw6XULE0KO4EWfXw@mail.gmail.com>
From: Hoang Anh Tuan <tuanha@viosoft.com>
Message-ID: <53f8f596-93a9-845e-2364-051044fab99d@viosoft.com>
Date: Fri, 22 Feb 2019 16:35:08 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sowGDE5y80P=U7oo-k7SQdz5gfm=sHw6XULE0KO4EWfXw@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH 1/2] tk_8.6.9: Add tkConfig.sh in crossscript
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
X-List-Received-Date: Fri, 22 Feb 2019 09:35:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

I tried to apply on master or master-next and it worked. What do I have 
to do now?

On 22/02/2019 11:25, Khem Raj wrote:
> Does not apply. Please rebase it on top of master or master-next and resend.
>
> On Thu, Feb 21, 2019 at 6:11 PM Hoang Anh Tuan <tuanha@viosoft.com> wrote:
>>
>> Signed-off-by: Hoang Anh Tuan <tuanha@viosoft.com>
>> ---
>>    meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb | 25 +++++++++++++++++++++++++
>>    1 file changed, 25 insertions(+)
>>
>> diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb
>> b/meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb
>> index 9eec4bb..459ae82 100644
>> --- a/meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb
>> +++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb
>> @@ -50,6 +50,11 @@ do_install_append() {
>>        ln -sf libtk${VER}.so ${D}${libdir}/libtk${VER}.so.0
>>        oe_libinstall -so libtk${VER} ${D}${libdir}
>>        ln -sf wish${VER} ${D}${bindir}/wish
>> +
>> +    sed -i "s;-L${B};-L${STAGING_LIBDIR};g" tkConfig.sh
>> +    sed -i "s;'${WORKDIR};'${STAGING_INCDIR};g" tkConfig.sh
>> +    install -d ${D}${bindir_crossscripts}
>> +    install -m 0755 tkConfig.sh ${D}${bindir_crossscripts}
>>    }
>>
>>    PACKAGECONFIG ??= "xft"
>> @@ -69,3 +74,23 @@ BBCLASSEXTEND = "native nativesdk"
>>
>>    # Fix the path in sstate
>>    SSTATE_SCAN_FILES += "*Config.sh"
>> +
>> +inherit binconfig
>> +
>> +SYSROOT_DIRS += "${bindir_crossscripts}"
>> +
>> +# Fix some paths that might be used by Tcl extensions
>> +BINCONFIG_GLOB = "*Config.sh"
>> +
>> +# Cleanup host path from ${libdir}/tclConfig.sh and remove the
>> +# ${bindir_crossscripts}/tclConfig.sh from target
>> +PACKAGE_PREPROCESS_FUNCS += "tcl_package_preprocess"
>> +tcl_package_preprocess() {
>> +        sed -i -e "s;${DEBUG_PREFIX_MAP};;g" \
>> +               -e "s;-L${STAGING_LIBDIR};-L${libdir};g" \
>> +               -e "s;${STAGING_INCDIR};${includedir};g" \
>> +               -e "s;--sysroot=${RECIPE_SYSROOT};;g" \
>> +               ${PKGD}${libdir}/tkConfig.sh
>> +
>> +        rm -f ${PKGD}${bindir_crossscripts}/tkConfig.sh
>> +}
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

