Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1717CAC5A5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 08:36:47 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.6666.1758789401804326926
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 01:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d/2DJnys;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-62f24b7be4fso1434042a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 01:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758789400; x=1759394200; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oQLff9qPdxXWyvFmKYukSUxlv0T6Ppx78A2jm3bVLqY=;
        b=d/2DJnysPDUY+SFEKkwmRTnFcrtU2jj7ntN5yBrKbKYaNa2HVrqq5bhHlH+FBDw/3Q
         R+kLXwe36bpwkTqyqYOH4tBCqCmDSizAQQl4jxUEN90+yk1XRapvzuX3ldpIHIoHjvey
         EtntQMyYNCwsrtUDCxl+60MxAVtm6aX4V0fYQ/m5iS7uf6BV/T6sQ9YRPM0M0Nr+p9eG
         m9hgl40g4ChS9ie5L4D5HnXyeIQxCGnhAr4NESxdc9tLDka3kSwLIz+IWFuaK1Fn0ZSl
         DSFDk8E5Nk8R0UR2NsPxv0M7G6kYG33ht+Ty+sQJ2Vmt+a4kxsSuRMhkZ3k8gI/zDnTo
         nDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758789400; x=1759394200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oQLff9qPdxXWyvFmKYukSUxlv0T6Ppx78A2jm3bVLqY=;
        b=egrx51KiSRlwibuCqxsm9Usi9kXhnjeNuYaISV3ocOhLL6wYa5WdPQplsC6KP3iey8
         gKR1ti089VA4gDqMlXZ9BAmkDN93QsA76/Togq49LL3DVshv2hRIx3N0U5WAklIjYjFR
         QhkJ9ydX0HLUNOdtNLCQGGFcEEcjRv99eEX79hSgLR6sIPhorHue3Glnq8cEVwCULhJ4
         l1myXrCuEbcLk1P73B7BNhlnQDzWFX39ykAVH1YaZvca6ePhBGETic8kdTntMIhZewlm
         ro1sI4EjLKYc1HsVTkD0qJR2+ohvhCfw9guZPqUaY3tms7kAvCyi7N0oa1egl0ECHK4G
         y5cA==
X-Gm-Message-State: AOJu0Ywy4b+/bAMI8taEqjldLF2TTxaFD7WsJCM/lI06zKrNQ84Z5iga
	AcPeHgwsczn+B95RNOJNn/dFBC4KHi1LPXntljfIOPqUylH7Aae3ZHQB
X-Gm-Gg: ASbGncvk+Vin+WocHJjji7T5zIg+Wk5U/GMTkY+SRTE8AA4B7AevFbYIPfJnaxalYvr
	6sDUEVkq0v3zITkL6NJQWbkqUNIzD/3DuV9WOLUZ7XZr/r51VQLGGSOAFt5bUo8EY8cc4cVJpc3
	Zn5Ildc+Q+jUu9pXj17VU7rJ6dCSYnIYvuhGtqtHIeGtr1lLOhstbCTL4XF476HMkBxDGsx4X55
	VbSZ4SpD2DWEt3i1N/VN+gQ1JNNv3KRTk+Lu3eX2hAZuNx8uZ5tHwA1T/HwUxPK48541Fqy46Sh
	hJB4oN9zMoA6TMSWdFN1uvjhNjZve55iigCZvw1j91axDxsQ9GJwHDipzY0/4b61aqTBH953E/J
	lW6BHolZDKUwRttfUkjlJlWRKoTc92Gk=
X-Google-Smtp-Source: AGHT+IGR7iPyOQloxeqka2LZ0YBktU7pku6XJrNsHCFj6iG5hKC+T624zgWgr0HGTbYh2x3P4teDag==
X-Received: by 2002:a17:907:9725:b0:b2d:a873:38d with SMTP id a640c23a62f3a-b34bc68c556mr303270266b.43.1758789399710;
        Thu, 25 Sep 2025 01:36:39 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b35458950edsm116789066b.90.2025.09.25.01.36.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 01:36:39 -0700 (PDT)
Message-ID: <286fb0ad-076f-4281-9b7d-79f2fa711089@gmail.com>
Date: Thu, 25 Sep 2025 10:36:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-gnome][kirkstone][PATCH 01/20] gedit: upgrade 42.0 ->
 42.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250924122839.4184719-1-skandigraun@gmail.com>
 <20250924122839.4184719-2-skandigraun@gmail.com>
 <CAMKF1soKbOp3+p=+P9oPwL-2am4Fz3YBB5yNvd+Q+=B2Ka6+5g@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1soKbOp3+p=+P9oPwL-2am4Fz3YBB5yNvd+Q+=B2Ka6+5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 08:36:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119853

On 9/24/25 20:19, Khem Raj wrote:
> this sets looks ok to me, Another question I have is we need to keep
> an eye on scarthgap as well and ensure that versions in kirkstone are
> not newer for a longer time. Folks upgrading from kirkstone to
> scarthgap will have adverse experience.

Thanks for the review.

Yeah, this sounds like a reasonable question, though don't know if there
are many such recipes, if any at all . In any case, I can take a look at
Scarthgap once I finished with the initial commit review in Kirkstone,
which I hope to happen around the very end of the week - unless someone
else would like to do it (any takers on the ML?)

>
> On Wed, Sep 24, 2025 at 5:28 AM Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
> wrote:
>> From: Wang Mingyu <wangmy@fujitsu.com>
>>
>> Changelog:
>> Translation updates.
>>
>> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> (cherry picked from commit e0462bfb13d571e8ee55b5cff2d0fca7aee98393)
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> ---
>>  meta-gnome/recipes-gnome/gedit/{gedit_42.0.bb => gedit_42.1.bb} | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>  rename meta-gnome/recipes-gnome/gedit/{gedit_42.0.bb => gedit_42.1.bb} (91%)
>>
>> diff --git a/meta-gnome/recipes-gnome/gedit/gedit_42.0.bb b/meta-gnome/recipes-gnome/gedit/gedit_42.1.bb
>> similarity index 91%
>> rename from meta-gnome/recipes-gnome/gedit/gedit_42.0.bb
>> rename to meta-gnome/recipes-gnome/gedit/gedit_42.1.bb
>> index 5bb5525d53..e2bbf1889f 100644
>> --- a/meta-gnome/recipes-gnome/gedit/gedit_42.0.bb
>> +++ b/meta-gnome/recipes-gnome/gedit/gedit_42.1.bb
>> @@ -21,7 +21,7 @@ inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk-doc val
>>  def gnome_verdir(v):
>>      return oe.utils.trim_version(v, 1)
>>
>> -SRC_URI[archive.sha256sum] = "a87991f42961eb4f6abcdbaabb784760c23aeaeefae6363d3e21a61e9c458437"
>> +SRC_URI[archive.sha256sum] = "7f1fd43df5110d4c37de6541993f41f0fbc3efc790900e92053479ba069920e9"
>>
>>  # gobject-introspection is mandatory and cannot be configured
>>  # x11 is needed for tepl and gtksourceview4
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#119804): https://lists.openembedded.org/g/openembedded-devel/message/119804
>> Mute This Topic: https://lists.openembedded.org/mt/115410718/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


