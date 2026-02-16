Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 816F9EF5867
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 17:25:44 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24907.1771262735358104528
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Feb 2026 09:25:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OuSDNYQS;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-481188b7760so28836385e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 09:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771262734; x=1771867534; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xcz3GVBGDroSuhghe2OjpJ+4rrBE/aIbuED9IeSC9w4=;
        b=OuSDNYQS3bwDBSnJxSbDc3co17gZyWXpG+tmCrvJWxv3mmDj/woFNTulYgZb+ymE7Y
         LY96AHL1Rh79ElNlqmBL1drgbXebnSb2G88DagvQ0X/sqr0kH5TZ3fs+eC3TvJjUym6T
         X7ChltK3StQgg6xbuKIQM6G+Z9oDbKnFIUtdYn4kTsV9tR/NXKjLRfSZQzadjgJvP544
         2l6+IVVQXvsj0jP5IE+dg8wWBAMaTDMXSwujYM9oWEEdH+ZPuJd95V66ihzQhRdF+yyj
         SI8DCX65eDdY29dTjyQaaPGf67KbUg9jb0ig3vxGFHQfGINwvnK9DPEYaMWjUTtG4QFa
         fkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771262734; x=1771867534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xcz3GVBGDroSuhghe2OjpJ+4rrBE/aIbuED9IeSC9w4=;
        b=tyj8xi+yv4P5qbYPQvzf1/opufZccUWzD6+DL5TCX8GxWj/EKtjH0EX3b7PQoQKUQi
         fzYxUQt5aChuhE9LURufXbmDLut2kgX8MPT+WxiWw2atgp6lckqn+QDhZmVQCxcNfnfE
         KmfL5qIH9eu+23YMZrfPm/1G3TKTWtEYrMgCCWkm53c5cdn4QbEwp7bf5o9WUOCDL3d3
         caSXTOH7klptFg66poz4lvMko4PwG39aK9r7lPzSwvMtBvIEyg/NoIfRj2gQZhlPdkCt
         VFLf7od+cHj3SAs8JgnZoMe27795qggG7IbzTkIFPV0IlWd5x9Juk7RIzHTXHg2MP54D
         ttWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgIMAOJ+oklYbEvcHHQXgQEk1Dqh/cv2OUKz2OGCFN6tx+Ur79U2gbwli3ESbH9xDKYxKKhw4HQ/uVM/QKJvyOq00=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxcNIbvaVcEciG8FXcc/9RTzePHhJ2SuFN9039LJlvPO/I5UUd/
	TQQqMoFUEzhc5enOwDbslVHAm2r5+U58H6kOd1bpB5a+KB8Kv77TW/aM
X-Gm-Gg: AZuq6aK4JpiKCL1PzxpEa9PJyEBKx8KUtGzNWrz+Pnk0GSvs6ITVAPE/uO2Lj82xlq1
	tD3PTCTyCXa3bwPmbxw3P5vuOPhspocYIopzsGtdoT4fxOVa+rItRP1f15tH3HqASZvlZ6dKXhS
	btiiE2wNH/nA5djbYAWx8uDzDlGmFYc+RUH+9CGAjPbeqBP0e84jdYXTqk505Nfg8c8hPnSJKgo
	OWqEUM1cariss+afH4mf/RoDx/1v9X5jPZwW0TQ3Pqs4kh0SvavSC9fBwRURJ0GJWxvKIB0sVPP
	CjuSqy0sP4NGHnN0Zl8QW4QB0o0m6q/9JnTJD8pcB/dhsT7v8aPMzUjEXoUY2Bw+T27Y9ios56B
	lHd4Z6xIKOBZFKvH8YmfKkLxSjBXG4U6NlG+Ba81mKCuOOYCvzdEmNhCaJwxxXSp3RXQQosB+LU
	0KeGsnaK40Na8URxzJmWM6cKIoR+hPCKc=
X-Received: by 2002:a05:600c:1c12:b0:480:49ce:42cc with SMTP id 5b1f17b1804b1-48373a02cfbmr215326725e9.9.1771262733640;
        Mon, 16 Feb 2026 09:25:33 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d92267bsm670545955e9.0.2026.02.16.09.25.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 09:25:33 -0800 (PST)
Message-ID: <ed54336e-ab11-4d0f-9abb-9f3ebd911ee3@gmail.com>
Date: Mon, 16 Feb 2026 18:25:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][PATCH] tigervnc: Fix do_rootfs Error
To: liuyd.fnst@fujitsu.com, openembedded-devel@lists.openembedded.org
References: <20260214013547.22916-1-liuyd.fnst@fujitsu.com>
 <189484259C10B564.151929@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <189484259C10B564.151929@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 17:25:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124430

On 2/15/26 21:03, Gyorgy Sarvari via lists.openembedded.org wrote:
> On 2/14/26 02:35, Yiding Liu (Fujitsu) via lists.openembedded.org wrote:
>> Fix the following error:
>> ERROR: core-image-minimal-1.0-r0 do_rootfs: Postinstall scriptlets of ['tigervnc'] have failed. If the intention is to defer them to first boot,
>> then please place them into pkg_postinst_ontarget:${PN} ().
> How could I reproduce this?
> I added tigervnc to IMAGE_INSTALL, and built it once with systemd as
> INIT_MANAGER and once with sysvinit (also added systemd/sysvinit to
> DISTRO_FEATURES), but the build succeeded in both cases.
> Am I missing some config step?
>

Yes, I was missing an important step: I wasn't trying it correctly :)

I could reproduce it... but I'm not sure if this patch is how it should
be solved.
Currently it looks that systemd integration is broken for this recipe.
systemd is complaining during rootfs generation:
"Failed to enable unit: Refusing to operate on template unit
vncserver@.service when destination unit multi-user.target is a
non-template unit"

It says the same during runtime too, when I try to enable the script
with systemctl.

Not really sure what this error means in English, if it's only a problem
with the script name or something more. Will try to mine it from the
systemd docs (if someone knows the answer already, please feel free post
it).


>> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
>> ---
>>  meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb
>> index a5413a9108..12854632d5 100644
>> --- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb
>> +++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb
>> @@ -95,6 +95,7 @@ FILES:${PN} += " \
>>  "
>>  
>>  SYSTEMD_SERVICE:${PN} = "vncserver@.service"
>> +SYSTEMD_AUTO_ENABLE:${PN} = "disable"
>>  
>>  CVE_STATUS[CVE-2014-8241] = "fixed-version: The vulnerable code is not present in the used version (1.15.0)"
>>  CVE_STATUS[CVE-2023-6377] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"
>>
>>
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124406): https://lists.openembedded.org/g/openembedded-devel/message/124406
> Mute This Topic: https://lists.openembedded.org/mt/117803450/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


