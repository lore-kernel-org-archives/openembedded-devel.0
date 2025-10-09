Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D281CCD184
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 17:09:28 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.5950.1760029762617386833
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 10:09:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m1cyhZlw;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b54f55a290cso118657466b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 10:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760029761; x=1760634561; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XhZtY42DqkJFyKuJ7VRKJFyZdKcAzfZXt9E8nAGxq1o=;
        b=m1cyhZlwasA1x40zuk7CjYP6kmILzVfbU/q7SVdE249qnwbHNKRqWTIQcvd8fMHcA6
         syWaH9kCL4eSprGDiksZjJ5ARP+JrGnUbZ7N/1eoikyNCWn+me4BFhw8ebgxDBSyCUhG
         jdBYhyPh+iYtujVx5xcPCpuOcSIJcmLFMKsu2yoZydAPbbeY3xoXcqDBfIGWKFOY3RpT
         cwv6/XytWgyg2CpRK7aYQmvXgP1GBmyqx9teJG5ZEV50F6TxsLNWTVifXAU1WiAaIikG
         du/QGgxK6n57zW+oviszZG2/OPOzxWXLoKJJbD/WwmuitZ9kfldE9I8D7twsvXIEJVtF
         qUpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760029761; x=1760634561;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XhZtY42DqkJFyKuJ7VRKJFyZdKcAzfZXt9E8nAGxq1o=;
        b=fmgi4wlPeHFTvSGAjK4p9BRhETMRUE8TZ3IQpiFS3RoytWULY13cJbISXgbNd4SugS
         yK+kFs60CI1OWXYydjkjZip9tY8vMavVbyVV1liQkYDhAQ+1NEQ0Z7QBdD1uX4RD1a9i
         5h7KPAfZAVIjs9h0Z1jsSLFbC+0WVpinxH/0H1aoQh8v4RLwi/njotEan/yVNgeSBCSo
         Q8edM5zg0Lvg6ethFS+4azUrccAPjeEomrP5IJdCeZwHjCZU9pOGxQMeEQVx7j/xmkib
         8Tt6xm2Sh/eslfULydnTpND9s7zLHai5PFLg05cIo8gDCbFOwVhhrHj/3Qoq1KMS9rKW
         HTpA==
X-Gm-Message-State: AOJu0YwKpiBcGW5QjaQhqSiutcVB8D7SdBGSBRLonbNF6vo+HfRjPrLC
	+krqSAbYCXhjhy0aN3gn0tnMUOHd3kxTVSi+jgbalnJqtS+OFQ8pwQLYwH8SCQ==
X-Gm-Gg: ASbGnctLzjzHhJNOG7IVAe8a/hXhVZIZcoWifXZJGjyU+dX9hurrP4SlYE/GOFsU/gD
	2jLFHFYJQt2CCjtOmYZ8NCBaDDhlnLxOS3nDS2G8GbezVAa1WGo5Mz/6YUfkigcHAykHtpsFhse
	BYiQ4/7PYUH8RQW9F47WVoyAQm2iX8pt28m/gFw+cI8EHuLvsZzXIYsYIzHkGPflbD5FSToh3Gf
	PlzN2xiUGg5Tw1h2CNjxQwUka9UW4u7SuH75/F2/HUn3kjiXen2cRUwXT8tq3TN30wOJ6gd2NsI
	wm11gtObOlsvVRMo+k+gyBdqGGEK+x51SnfK+j02Ln4iN6UISpZmIH/S96rPDs86N3EXe27l2nq
	2f7E27CLcxsnk4+2oOfA+7KHjX27GxsVRVCnDJQKNfLa4RRhYLuzelFv1XGNU5rhKjw==
X-Google-Smtp-Source: AGHT+IHoBwTGrgKQ8GEH42zV4gM+hQ9x6lrli/ksWoD//A/BlWfrld5natZGfy11hhSjGWmlPqThTg==
X-Received: by 2002:a17:907:7f0b:b0:b09:c230:12dc with SMTP id a640c23a62f3a-b50aa48d330mr898480266b.8.1760029760761;
        Thu, 09 Oct 2025 10:09:20 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d69dbd99sm17729266b.40.2025.10.09.10.09.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 10:09:20 -0700 (PDT)
Message-ID: <6822ecae-ec76-4cc2-84d1-b2aa7efe0698@gmail.com>
Date: Thu, 9 Oct 2025 19:09:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
From: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: Last call for Walnascar patches
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 17:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120434

Hello,

The last merge for Walnascar branch of meta-oe is planned soon - I
intend to submit the PR early next week.

If there is something you would like to get into it still, please send
it by the end of Friday, tomorrow.

Thank you.

