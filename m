Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80BAFFEC0EB
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 17:33:45 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3177.1774373618537383522
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 10:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Im70iwoC;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439c56e822eso1448978f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 10:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774373617; x=1774978417; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=99rQVKZBbp8ElS+OQC4SDWDMjMNGtTsvk3YtTAZ1Y7c=;
        b=Im70iwoCEogyLNwVEksF9AxZDLaplo9vdd7ohcvsBpqvb1NOFhwCVUhsNm4mPowRbZ
         ygGqISqQSTb2RiANanrOaDa0E98mtoxBvYBtrC2Y2wGo3NvRjamG9hSKt4NICGFBS/9W
         u28ZfLtNexDiUhXSr28x/z3+78V1AcmC9txlAeGAE1INmmuByn/rdy4Z/5GkKm9lrxqx
         t/3/tKLDKB8OhGHQGYA+PIuOPPa8x6eycVNpmMKHwPQQHcayYoeuD5oP69JWsF0vCouY
         LTlnMWTiDjbeEEF0Jwusl5zRqfw+Oouu5j0CMsnfWKNzGhJYtCn6apiJWmdarFeFY1+n
         ZHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774373617; x=1774978417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=99rQVKZBbp8ElS+OQC4SDWDMjMNGtTsvk3YtTAZ1Y7c=;
        b=aqyDT9xkwru3xu13HrAC0MGvajlWUzegJZfuNFfgd86sEH8Fmc/AcuQ6SJjXdThPvg
         O3Jg8dEpFS5RAJGoOeh5lZwRvgfRvjAUbqv3oNjiJLRJUdfRrPTFWiBGZTxWyVi5VIY9
         iwYwY1K5N2Obn+5HY6LF9lEoITIH4z0jEaJ7umLuB3DGA3k47M1M1T9OmUYZQ8atfEcc
         FqWXf10G4rJXoSAHyftMtcnhov4+Vux2w/ui2a2ZQeUzN6WjxKJGmFS1H5/ZEeZHOaxW
         K9aOAXx+7EQREMxeWKbHJFlxLJIbXlL03rOhzAwxnPMdL224A4szDmP66ZlBRtsMGCu8
         rFrg==
X-Forwarded-Encrypted: i=1; AJvYcCUPz6IFAH5u09VEq444rkLfCtyvd4OmcYl8MeLyYa7velT2tvG3JNNc79bbyVRmUGKcixlrNzXT81QQNiQ87om5jyU=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyk+I1icwGXvPnYuH0NVDXAcByz4bKMrtel8qa/+FgDvienjqtm
	BjnReIG4sLCFUuAJnvJLWhEPIWUracXPRkqOOHHyYik7vTmt+kagu3qX
X-Gm-Gg: ATEYQzzGf5TRI3FkV7Cj2bcw4dM22NuVipiKVCkZwa6A60eTXLGmfhAoDQSziqMlImY
	RQFvjzcoPjJYbOfPSdRI4P+0WeBUZxcI2ag7UVQvYtqncz6VF1PPqgB6oSqmeGRFQxMXsXEpvqF
	LpS2qmse0gUvpot+Xe7upGONd8YAXAdEQb0l435du8JMIfqBQ3cHCHWAsm/feROOjzCSv2WwxyX
	pON5uKrFFeTqUDNgrCjGsSbGpEj97jsKLQI2cyMaZalIMSEb/VfhrPdydQIzn5Z7Vm79vVvp9Ag
	UgjxUPRaS0P7HZa50qsXdifFV/wp3oIw4OzaCLwX/dyps0yNqPgMhtgSkymy9BpYd3PJ9oCucR9
	R5iDaOM3kncTIFPOPRFVqw+2DtOdmA/PfyJdfjkkVBzHETKyf3MSX2WwLm5EJIKNyjSaNicgEKp
	2qZOFkqzCM+1TYhUDjRmcxaO3kaoxCXYQ=
X-Received: by 2002:a05:6000:2084:b0:43b:3f2d:7d3c with SMTP id ffacd0b85a97d-43b88a21758mr505371f8f.2.1774373616675;
        Tue, 24 Mar 2026 10:33:36 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b646b0d3dsm37620591f8f.16.2026.03.24.10.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 10:33:36 -0700 (PDT)
Message-ID: <02d2aef4-80d1-4c1a-9196-8dcadac7c233@gmail.com>
Date: Tue, 24 Mar 2026 18:33:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH V1] rocksdb: Add an option to set
 static library
To: mail2szahir@gmail.com, openembedded-devel@lists.openembedded.org
References: <20260217125514.34002-1-zahir.basha@kpit.com>
 <1727f87b-6567-485b-93ca-4b63e5b8d831@gmail.com>
 <991492.1771485025027262629@lists.openembedded.org>
 <1b945bbb-041e-4f12-91cc-4dd5850fdf40@gmail.com>
 <564384.1774373144857693534@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <564384.1774373144857693534@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 17:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125583


On 3/24/26 18:25, aszh07 via lists.openembedded.org wrote:
> Hi Gyorgy Sarvari,
> 
> What is the current status of this one and when will it be integrated?
> 

It's in my staging repo:
https://git.openembedded.org/meta-openembedded-contrib/commit/?h=stable/kirkstone-nut&id=33822593e5aed47f619a385579a47c366859408a

I expect it to be part of next week's PR.

