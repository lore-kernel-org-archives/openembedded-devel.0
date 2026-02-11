Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD02E9E304
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 12:44:57 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18059.1770813894490872186
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Feb 2026 04:44:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gQPxczyT;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48336a6e932so23814995e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Feb 2026 04:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770813893; x=1771418693; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Ry3hh6jP1wZN/MYOEJWOneyAiEgLS8XoiVNz4GNKWI=;
        b=gQPxczyThayOfhE8dfV1aN73HZpEh7MLsiiGZaps/dayFSOZN8/LM9T1voYIT5cmd3
         Qy7pcKXdFP2zpmQdf8wZ8gThVxcIC1Z03CbSWCzM4J5WhHQCC5BDylXLajSCVftWcGAg
         G50gCne2FHoB4FdseOFi/wwrGETseGF0U/rL4y0MqDv6H0uqR4mHNELJlGQFoBT253Ao
         oCzqzIhyhdV5g3J1rSpNS3DEx6F9vgLopsw83qA2jRCmseHMcoBMN8hfZfvnbKu9onYe
         LCEC1w4ODbv+4I8o1+UCuUYPrpjvtUs7lFfUQLS2ByDfjh5iArSxzC/UN9HmeDRqwZQB
         1e2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770813893; x=1771418693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Ry3hh6jP1wZN/MYOEJWOneyAiEgLS8XoiVNz4GNKWI=;
        b=lPKpS2gEXf9IU6p5oN9TXL/+iS0ZvLeqzRyytoj5GO2la8bDKqUaQogiFx/SgZFnRU
         Qt/vx9ez4RPlnLe74we8eaMvp1Et5qI+r1kZ5I15swWNz7qcH6gH6nZ42+1pcutXmP5I
         aZhmOTLYkdsBajq5euEG+dJMUVFGXV7Tu4uLeLyfMAEDzkZu4bUU+QGZjAVFVF4XyaPU
         TeAl/w03LHe09/vUeOL60ayuFR85nFjp5VV9L1GlyR4DnBPr1KpEaZjUbTLckRq7c9w0
         TqYxICZU0otfonzwLcEFDCnQ2YdRc8K+3tW3H5kWpcOTGNvHB8ACmZKhEGV29xyl3z8y
         VjQQ==
X-Gm-Message-State: AOJu0Yx6wEAqL7nkeOyUiSl1/HZS0Zf5qZSxE9UHxepKn4hDYQBZmqBK
	73q+HHqgx4qD/eEYvmM3YhgyT58zoW4AIgkYPyJGhiTvkAVfLJk8ItFG
X-Gm-Gg: AZuq6aJXEZSE8Ce0mxe4lhuUw16G3gtR3zFyexHJ+psEB11ci4b04579tGZSH426PfX
	/RPJanwc8qmQK6XFoHtO1Jj/0/zuwI0Vw/xX75hf0OWTTOzpqIA2qv2is6J3qs0hi4ULKoBdpLt
	/L8vMzs3Kwy7ERpPffWN+j8JWKT5PyQUchb81OTdoMyncgAflW6e5KzlMDyLwg4kfrVOdhursHm
	435pvofC9QrmtZvMm1646HXOx0WBLF06ZzgsvqHu5AFA00eR1sIy3oRGG44fWplGQyNaW8Gj6lI
	leXTXOz9GEi67ASHbUimoi/X4r68XkZyAZf8Us/0o9+j2kIdRIhDbpVMrWaAGmyMiwrqTee0Ayv
	V+5vmpTjK/OGIjTst3KFztxzJ2eTHLDiB5NyNK0K6g6h4IwS56tspJYtBTqul7Tiil/T8QMFrHq
	s1bHQwN9ugos4tFS7wSDB/XybJhoVcnKolQurwZ0+k8g==
X-Received: by 2002:a05:600c:540e:b0:480:4a4f:c363 with SMTP id 5b1f17b1804b1-4835b90a346mr34373585e9.9.1770813892564;
        Wed, 11 Feb 2026 04:44:52 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5e11f5sm118763865e9.4.2026.02.11.04.44.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 04:44:52 -0800 (PST)
Message-ID: <c34cac95-1a5b-453b-953d-38f0f270fb42@gmail.com>
Date: Wed, 11 Feb 2026 13:44:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-gnome][scarthgap][PATCH 06/10] gnome-commander:
 upgrade 1.16.1 -> 1.16.2
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20260208145143.20464-1-skandigraun@gmail.com>
 <20260208145143.20464-6-skandigraun@gmail.com>
 <CA+s=J=w5QNcRXXSk4uTGdp6m9DAzLXhabbCnLbRJVcsMhSQUzg@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CA+s=J=w5QNcRXXSk4uTGdp6m9DAzLXhabbCnLbRJVcsMhSQUzg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Feb 2026 12:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124338

On 2/11/26 13:39, Anuj Mittal wrote:
> On Sun, Feb 8, 2026 at 10:52 PM Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
> wrote:
>> Changes:
>>  - Fix double g_error_free call in remote_close_callback
>>  - Fix build with taglib 2.0
>>  - Set project gnu++11 c++ language version explicitely
>>
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> ---
>>  .../{gnome-commander_1.16.1.bb => gnome-commander_1.16.2.bb}    | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>  rename meta-gnome/recipes-gnome/gnome-commander/{gnome-commander_1.16.1.bb => gnome-commander_1.16.2.bb} (91%)
>>
>> diff --git a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.2.bb
>> similarity index 91%
>> rename from meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb
>> rename to meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.2.bb
>> index bb36d59e56..3cbeba9ae2 100644
>> --- a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb
>> +++ b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.2.bb
>> @@ -17,7 +17,7 @@ GIR_MESON_ENABLE_FLAG = 'enabled'
>>  GIR_MESON_DISABLE_FLAG = 'disabled'
>>
>>  SRC_URI += "file://0001-Build-fix-needed-with-taglib-2.0.patch"
>> -SRC_URI[archive.sha256sum] = "3f1d00c4a650fe7902167648286b32c9ca4ef86e31a5d8ccca0139f12d10d0b3"
>> +SRC_URI[archive.sha256sum] = "7cf5d56c77a95d828f25407294312abaae20dc6b556ceafd9424dbfe209e5ed3"
>>
> This seems to be causing a build failure:
>
> patching file src/tags/gnome-cmd-tags-taglib.cc
> Hunk #1 FAILED at 150.
> 1 out of 1 hunk FAILED -- rejects in file src/tags/gnome-cmd-tags-taglib.cc
> Patch 0001-Build-fix-needed-with-taglib-2.0.patch does not apply
> (enforce with -f)

I can definitely remember dropping this patch... but apparently I forgot
to squash it into this patch /me facepalming
Sorry for that, will send a v2

