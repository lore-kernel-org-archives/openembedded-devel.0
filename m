Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E117EF483E6
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 19:09:37 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3091.1774292969169428990
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 12:09:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HRzRgIbZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48700b1ba53so29869715e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 12:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774292967; x=1774897767; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xtvjsB1XLRhwfvLYmI+OR+xNdGqdyY5g6h26SVxbvmM=;
        b=HRzRgIbZLrtBgDDUxywGVEL5VeWX64acr6ldJtVopVyeUKZB1Dr/X8JjoM//0cOHrH
         npKyE6Ip8aeLgg//RgiqZzfTnTXrSmYFVETjPmixs+rqGa4qwB9SlL6wZe8glHdXr18i
         yUN68Bfm4WnZkBYXUqT+aGj8Le4jEOYKsvzblA1RYVSj6RD94dtrJQGSlpBSOVyXwe5C
         gCJJmjBX2rNWV3mBxSUBQjd/JhbDZhyvBOwtWXqjYSswFtmnjtUxn0+ODSC7mhuv9jR4
         ygLdcEOfLLSEvrvg5Bi7O8C6vb+2uH41Gsz/HFPfip6/owGawaD5W2Apx5zDy9jjG1nI
         myMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774292967; x=1774897767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xtvjsB1XLRhwfvLYmI+OR+xNdGqdyY5g6h26SVxbvmM=;
        b=dXCMLWqf7qEZSL1aOgMttbfeE03QCt8j0zvB+Xth0sKsefPgrlenGIg5oJzBh38ERF
         Or3Ot8A1VJEANwOQsogVqd1VdWssbeDb6+5reKYjrzHy4oas9rOGD8DMU7DCu0yTdAkR
         Yg0iCSr6qEEO4GSaPcXy3uOM7Pkqa3HwBrbcaePsJKFWQEyll/nCRnjVYuR7V1IhGZvN
         HHSv8i/qNw2ekm4sZsSSl7XnXXE8p5jpfWq6rR18qMNPpUm7wILgvVhOO0FjhdQ0Sdwd
         sdy3bz4H/rk7hSQHU6aH6l0mmgbWRtprBdQpJuPG+aHHfQZITdvZMg0WGbZbAND6xsdD
         +85A==
X-Forwarded-Encrypted: i=1; AJvYcCUz1eUOgcBcYPNzCv8CV1ipzIFFErVDZgYnRSfU5iPRV4h4NVOqS2XhwTdJTyS1fx4heSqm1D3OK5o6jBeCrKDTiVY=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw1j5z/tW5ssJvtCG29k6u+isL/3knZUGKY4LC4+AK4WA5JQogx
	LomaVrtBZyeF/bGFC7hGBQ+ecsV/FRVNgIRqbBY8mZ7Bf+GJ4ZUb+AWr
X-Gm-Gg: ATEYQzxKA/AmE8cwrT7+wEEnUo3Gunq8IH0oCcpBqSpE8YlRjaxCBgU+k/MZbaOlnvL
	YpsfCpjzbD/Blh3EnDYREbDx5KcrIZYLb9R80+RnjytI6FW46bqeQMCU0Ro2xMIAuXWZhA5qZc/
	ykvtni2aT7tUh+rKz5UwMAwx+unbij/bJD/gl7ZVjT5qSuFzD/btfxXMvPl5oOgmmZOw/dCoGPH
	FahZRyk048yTnFPRSYF50L58VZSgDQa6kMKjuNIQLtkhFaCevJ9wtsim/NzMkhW3mxZDKaYRm4k
	d0c99rm8naPZjEc1/vV5gU5B26ck00Hjscg3E9FZEPvvMNviT1Khc9eKBfn+Z163Cw5vt06BC+W
	JdzgCPqEXfRKDK2zBTZZhQqjgS3oqYtF1j5zy2k6sM9nK750ApZd8Q1VZgOJLgXsUv0txHqLkSO
	MejGyatdneV3Wiv3ZjpIhqnRmeQq75AZM=
X-Received: by 2002:a05:600c:c10b:b0:485:2fe9:336f with SMTP id 5b1f17b1804b1-486fee2cf68mr137222865e9.30.1774292967216;
        Mon, 23 Mar 2026 12:09:27 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe82ae69sm279023855e9.9.2026.03.23.12.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 12:09:26 -0700 (PDT)
Message-ID: <0d78104c-3a32-47c4-97d7-91dcd9ece822@gmail.com>
Date: Mon, 23 Mar 2026 20:09:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v2] image_types_sparse: switch ext*
 conversion to ext2simg_android
To: git-patches@bmwtechworks.in, openembedded-devel@lists.openembedded.org
Cc: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
References: <20260323091500.1196198-1-git-patches@bmwtechworks.in>
 <189F8A77E50C1281.1003@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <189F8A77E50C1281.1003@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 19:09:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125525

Sorry for the spam... Looked a bit further, and want to share a few more
thoughts.

On 3/23/26 19:03, Gyorgy Sarvari via lists.openembedded.org wrote:
> On 3/23/26 10:15, Ashish Kumar Mishra via lists.openembedded.org wrote:
> 
> ...SNIP...
> 
>> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
>> index 186ff9a488..b7ab46f12b 100644
>> --- a/meta-oe/conf/layer.conf
>> +++ b/meta-oe/conf/layer.conf
>> @@ -12,8 +12,16 @@
>>  BBPATH .= ":${LAYERDIR}"
>>  
>>  # We have a recipes directory, add to BBFILES
>> -BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
>> +# Adding dynamic layers recipes
>> +BBFILES += "\
>> +    ${LAYERDIR}/recipes-*/*/*.bb \
>> +    ${LAYERDIR}/recipes-*/*/*.bbappend \
>> +    ${LAYERDIR}/dynamic-layers/selinux/recipes-*/*/*.bb \
>> +    ${LAYERDIR}/dynamic-layers/selinux/recipes-*/*/*.bbappend \
>> +"
>>  
> 
> Sorry for not asking earlier... but why is this done actually? Only to
> make it available without meta-selinux aswell? If so, then I think
> instead the recipes (or a part of them maybe?) should be moved to the
> main meta-oe folder. Changing BBFILES like this kind of defeats the
> purpose of dynamic-layers.
> 
> Thinking a bit loudly, assuming that the above guess is correct about
> the reason:
> Question is, why do these recipes depend on meta-selinux? Do they really
> depend? This is a question, not a challenge, I'm not that familiar with
> these particular recipe. If they really do depend, then making this
> BBFILES extension will cause broken recipes in the layer, possibly it
> will fail.


Since I'm sending this message anyway, I might even finish this sentence
that I left here half baked: "...possibly it will fail yocto
compatibility check."


> If they don't depend, then there is no need for them to be in the
> dynamic layer folder, they can become standard ones.
> 


FWIW I just ran two tests. First I dropped the old android-tools recipe
from meta-oe, and just copied the android-tools folder from
dynamic-layers to the main layer.

1. I removed the libselinux dependency of android-tools recipe, and
built it without meta-selinux present
2. I left the recipe with the original libselinux dependency, and added
meta-selinux to my build (along with the DISTRO_FEATURES that are
described in the readme).

Both builds produced bit-identical artifacts, for both class-native and
class-target. When I ran a "grep -ri selinux" in all produced artifacts,
the only thing came up was some includes in the -src package, guarded by
"#ifdef __ANDROID__".
Makes me really wonder if the android-tools recipe still depends on
meta-selinux, or it is just a remnant from an old version of the recipe.

If there is still some partial runtime-dependency on the meta-selinux
layer that remains hidden from me, possibly that could be solved with a
PACKAGECONFIG and/or bbappend in the dynamic-layers folder?


> 
>> +# Prefer android-tools from selinux dynamic layer (29.0.6) over the older version (5.1.1)
>> +PREFERRED_VERSION:pn-android-tools = "29.0.6.r14%"
> 
> PREFERRED_VERSION should use weak assignment (?= or ??=), otherwise it
> may shadow other user-preference. Alternatively, maybe you could check
> the version/avalability of ext2simg_android in image_type_sparse
> bbclass, and complain hard if it's wrong? That would put the version
> selection on the user's shoulder. (Just an idea, no need to like it)
> 
> 
>>  BBFILE_COLLECTIONS += "openembedded-layer"
>>  BBFILE_PATTERN_openembedded-layer := "^${LAYERDIR}/"
>>  
>> diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
>> index 74928ed171..39b8ef5fe8 100644
>> --- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
>> +++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
>> @@ -166,6 +166,37 @@ do_install() {
>>          install -d ${D}${bindir}
>>          install -m0755 ${B}/mkbootimg/mkbootimg ${D}${bindir}
>>      fi
>> +
>> +    # e2fsprogs expecting headers in sparse/ subdirectory
>> +    # to resolve the "Multiple shlib providers" conflict.
>> +    rm -f ${D}${libdir}/android/libsparse.so*
>> +    rm -f ${D}${libdir}/android/libbase.so*
>> +    rm -f ${D}${libdir}/android/liblog.so*
>> +
>> +    if [ -d "${S}/system/core/libsparse/include/sparse" ]; then
>> +        install -d ${D}${includedir}/sparse
>> +        cp -r ${S}/system/core/libsparse/include/sparse/* ${D}${includedir}/sparse/
>> +    else
>> +        bberror "Sparse headers not found in ${S}/system/core/libsparse/include/sparse"
>> +    fi
>> +
>> +    install -d ${D}${libdir}
>> +    for lib in libsparse libbase liblog; do
>> +        if [ -f "${S}/debian/out/system/core/${lib}.so" ]; then
>> +            bbwarn "Installing ${lib} to sysroot"
> 
> 
> One bbwarn escaped here.
> 
> 
>> +            install -m 0755 ${S}/debian/out/system/core/${lib}.so ${D}${libdir}/${lib}.so.0
>> +            ln -sf ${lib}.so.0 ${D}${libdir}/${lib}.so
>> +        fi
>> +    done
>> +
>> +    install -d ${D}${libdir}/android
>> +    for lib in libsparse libbase liblog; do
>> +        if [ -f "${D}${libdir}/${lib}.so.0" ]; then
>> +            ln -sf ../${lib}.so.0 ${D}${libdir}/android/${lib}.so.0
>> +            ln -sf ../${lib}.so ${D}${libdir}/android/${lib}.so
>> +        fi
>> +    done
>> +
>>  }
>>  
>>  PACKAGES =+ "${PN}-fstools ${PN}-adbd"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125524): https://lists.openembedded.org/g/openembedded-devel/message/125524
> Mute This Topic: https://lists.openembedded.org/mt/118461929/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


