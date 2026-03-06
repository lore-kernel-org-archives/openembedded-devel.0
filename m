Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33415F513FB
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 05:39:28 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63528.1772775559169414742
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 21:39:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SiOZWqQJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439baf33150so3997384f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 21:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772775557; x=1773380357; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TPhG6LrZ1iB0u1chi8v76TlAFaT8aKQqPsYdzBJAznw=;
        b=SiOZWqQJuMXuvFRtFFExCGFKimfpM1eSRirbiXsFqqKPqlSL6KTUXlf9xIkn3UDchI
         wW9SIxEdl138pDn4sONpPg3PRjmcZCcUqUJwsC+VQ3YQPPBgqgesoI+fcuENgPa2WTyo
         DoBkIPsQoi/oIJZsZiNrUpzNnqpMQiJawCUTom71FG0t4zGKyrhKrG4LLfgG5KzGcOcW
         nVeG42Hxe29qIsrxylVrxL9ROnAkFrHoyRUuFdXmGRfrcjNR1VqGMyG2+97LnMId1JsL
         bbH6thEipfUhPeqa+gXNoaIJwc4otAHq3m92aehDwffvTLsMC7ubQWdR+Hvy1hmiioQd
         4jCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772775557; x=1773380357;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TPhG6LrZ1iB0u1chi8v76TlAFaT8aKQqPsYdzBJAznw=;
        b=o1j/s4QKmEht45GnRDgTNbESagv4g/B169yOp7bWpOkkm47m8Z+OJQ4igtgYzAMNJ4
         90SnLGMAJrrrvVa6ffE9aRAxZ6KLugvFC0Jc7AZMZ7FXC4qG90o1TyRg/pT38Ae3amS+
         f1013Ux589YuT6WkIv74FZkfbBcbQOzsGP45lEVAWebWR67om5rx4YOIY2VVwdbglnMF
         lrewJjVnw3e63PUz9uziL+pdLfLFDIYpg8/2q3E3GUzv9I1fo0YPS7FpHov6wniMmZa8
         ovXnjUtBBGkBWURQT9fH4GWKL3/m3eYkg9uUT5Oz+1CH7nPZSD3QPI9uwfOzRAv2o3V/
         aY1A==
X-Gm-Message-State: AOJu0YzfLBYYXYXYiWY0upuIGGfFmrxpjeMGQOx4+VaueNIYDDWK7K4V
	Eab8h7WxVhzAqn0vKtMTmyE1icilJq7jYmR0GTgmxPcM9RunOQHI+A1J
X-Gm-Gg: ATEYQzyAcFlclzBCpEyEjYpoSxP4VEXJm5xS+/VEnf89IgouMyeHWjyhiyETWxjnAQe
	Qp4Mg7q7+2emekACGaxgIXWjAGU4BRi1n5s1/GkZGUivtyvZpXRE8dynJL/YZtyW+/wVn9B1H6U
	JwY9+BRm9QwjsZEN/EMWOSXq0lPD0B1ibytPK9bkNNydov0woESOV3MJfvaN4tdCPzuXL32rQDm
	6g6ZtaQX1ktbSqaSj6Z8Vg6gutFfVS3r6CG/67qYtiGQPnv8OqcjMu7KwKZiOXLrNc9CvVrbYqL
	w2eaikmUXxouh/Lk3J0V2o48/8sc4V1lQ60m6BYjbuLsRc85/i3BW1tb4u2OlDkvKrFi1uajag1
	3FkRK3A3uCL4EIqbwSkEoNd5gmb52TyHjNC7abSF73fQrXgGVGBg2qJ9afYZQpUsHZ2YXq9akiE
	bFAhfCDx2wbK1F2OK7+T8n3MLDXYUYC7w=
X-Received: by 2002:a05:6000:2003:b0:439:c078:9a57 with SMTP id ffacd0b85a97d-439da657e70mr1392883f8f.25.1772775557389;
        Thu, 05 Mar 2026 21:39:17 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2bdf8sm1323038f8f.25.2026.03.05.21.39.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 21:39:16 -0800 (PST)
Message-ID: <5163b217-02f5-44b9-a75c-76be7ddbab00@gmail.com>
Date: Fri, 6 Mar 2026 06:39:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-gnome][whinlatter][PATCH] gimp: ignore already fixed
 CVEs
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20260305192503.3864009-1-skandigraun@gmail.com>
 <CA+s=J=yh6GZMp9Rtp6cX1+VYjS74c+yJqoEUaMqckUUTSTu=4g@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CA+s=J=yh6GZMp9Rtp6cX1+VYjS74c+yJqoEUaMqckUUTSTu=4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 05:39:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124899

On 3/6/26 05:41, Anuj Mittal wrote:
> This doesn't apply. Can you please check?

Apparently I have sent this a few days ago already, just forgot about
it... please ignore.

> On Fri, Mar 6, 2026 at 3:25 AM Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
> wrote:
>> There are a number of CVEs which are tracked by NVD with insufficient
>> version information, but are aleady fixed.
>>
>> CVE-2026-0797[1][2], CVE-2026-2044[3], CVE-2026-2045[4], CVE-2026-2047[5]
>> CVE-2026-2048[6]
>>
>> [1]: https://gitlab.gnome.org/GNOME/gimp/-/commit/13849c5a9a65c2366c47f703d9d075e4bfb83525
>> [2]: https://gitlab.gnome.org/GNOME/gimp/-/commit/ca449c745d58daa3f4b1ed4c2030d35d401a009d
>> [3]: https://gitlab.gnome.org/GNOME/gimp/-/commit/3b5f9ec2b4c03cf4a51a5414f2793844c26747e5
>> [4]: https://gitlab.gnome.org/GNOME/gimp/-/commit/bb896f67942557658b3fbfc67a1c073775c002c7
>> [5]: https://gitlab.gnome.org/GNOME/gimp/-/commit/5873e16f80cf4152d25a4c86b08553008a331e90
>> [6]: https://gitlab.gnome.org/GNOME/gimp/-/commit/fa69ac5ec5692f675de5c50a6df758f7d3e45117
>>
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> ---
>>  meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb b/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
>> index 860fb5d26b..b22eb3a1d3 100644
>> --- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
>> +++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
>> @@ -135,4 +135,8 @@ RDEPENDS:${PN} = "mypaint-brushes-1.0 glib-networking python3-pygobject"
>>
>>  CVE_STATUS[CVE-2007-3741] = "not-applicable-platform: This only applies for Mandriva Linux"
>>  CVE_STATUS[CVE-2025-8672] = "not-applicable-config: the vulnerability only affects MacOS"
>> -CVE_STATUS[CVE-2025-15059] = "fixed-version: The issue is fixed since v3.0.8"
>> +
>> +CVE_STATUS_GROUPS += "CVE_STATUS_FIXED_IN_308"
>> +CVE_STATUS_FIXED_IN_308[status] = "fixed-version: The issue is fixed since v3.0.8"
>> +CVE_STATUS_FIXED_IN_308 = "CVE-2025-15059 CVE-2026-0797 CVE-2026-2044 CVE-2026-2045 \
>> +    CVE-2026-2047 CVE-2026-2048"
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#124892): https://lists.openembedded.org/g/openembedded-devel/message/124892
>> Mute This Topic: https://lists.openembedded.org/mt/118158077/3616702
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [anuj.mittal@oss.qualcomm.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


