Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2DA5CCFA13
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 10:04:02 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44979.1762769037985076894
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 02:03:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XDRkhb41;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47755a7652eso18635405e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 02:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762769036; x=1763373836; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uzy8bBxwLUT8jU5vWbwz+7zq7L40mwNt/vpds+Rg5nY=;
        b=XDRkhb4124GNap3SBEw/+kLi5HwzBJoepWVhGbaeXkLpIoJt4RRe+JqPgWHRLcHqgC
         Vb/GGqH7veQvhmagWI2WjtFnqgYmA/IRsWjSnIHkT0dBhXPcLvB8V8/pVY971qFKLBI2
         e5kilNh5EZYegSp/DrG8YSF94thuKxMr4xq2uYBqsy/huT3odV2aWDVzXJNWdDoOnILH
         DGufOjmJ4VVNbsuXOiHXHdh8WBQ73KBdfQX3tAJ7ABQIeifTXODd1ElFiV3Y4H+3C0CM
         8NmgPhsVM6BN4k65LCMYyrMPoFU8plDkYlsWh0bADlaDIa6isVn68+8pMZ5nKJzPLKnH
         kRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762769036; x=1763373836;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uzy8bBxwLUT8jU5vWbwz+7zq7L40mwNt/vpds+Rg5nY=;
        b=NkQ8sWym0x9PabPQJdu4en1VZBxG99sKH+0HdJUETJX3UMcB0aGyYkHdySputg7dyP
         ev59KqdEkkJvz46yJJzTpDGojX7WC2fnnIv+KQifpRbpR5+gWTGXmsOIcsrIKZS+9dWJ
         S8tNYmXlVF5CxZLkq0+1birFa3+dYgbyosqrLqnbCSIYpfpKQUCKdN5ti6yB5zqufPul
         hcECjldUcGgKXlLOXaKUB67yg9NBbAgxjIQlBmSzt8JT28Q8Thq4YrQqhgVqafwk4Am2
         oKK1CTKjCs4JmtDOcWnogwvRQy+RhssGtGIuXKldkcJ82OsYulj0pWPF69eGDEDNcf0w
         Bzdg==
X-Forwarded-Encrypted: i=1; AJvYcCV5b0x8jxCsag4ZoMoOznZY3ETRc6nK579fkIzh0/cPb4st5gdzCdFqzcy5Qt24UPX7A8hgA43s5jPwXtCCQfke3F8=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy7HTbAsWWv3QlFijAVO3OH7zgeVTvfOF/klNCCMRssh8up/V3a
	+hH4nt40FuqsMbnSOlk2+id2sm/ohN7mTI1NFV4Ch82gI1xldocjstWj
X-Gm-Gg: ASbGncsN7Xy3tUaZTranmgGxFtmjbSm3mr0LmmNOnK/U2bi55vfHG9Cvhv4yNgcTeWO
	tLSqNjK/u55OhkFSxjOKqunqbhNiNTWcTaPVNNJRBdIAbS0z2q25dcOqEy4YF1v1RM93qTnsI7s
	2I6BfXXFYuIWBU29W6fkm+PmsRZMF1LJqT/jpYE5cdd1k+dewc0LTMTB5UbYt2EffZYKnKFubn1
	ZZsRnjk13Y6Sr3tqzpWZI9Hk/IdXDon9Ix0cLVpNCtCvbpNhqkFfSSKoMWrw4WOTwN0z3HgsAAR
	+vtKrKrJ0KUlZSzTvQpmKIz9G82Ms0u2nnx89l5MklIDEe4y/nGpbXAqzT5Omvvhpg1ELh1pncJ
	jEmeJXvPcmFe5716XjEqYNHBMfbcf2MQEYqYlQbw+p7YQ5tJOWrgjMMgRiZyvWbvTpZAI4zD5Nq
	O8jWRRWeuGSP0NFvQlhpE=
X-Google-Smtp-Source: AGHT+IFmcbl5OiDrUSY4B9XN55EEewHv6IOFcLfm5+X0iA6/kYWsnmJJ/Jj8L544lpIhj5vooLSKtQ==
X-Received: by 2002:a05:600c:1d1d:b0:46e:7e22:ff6a with SMTP id 5b1f17b1804b1-47773230ad6mr61584985e9.15.1762769036072;
        Mon, 10 Nov 2025 02:03:56 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477641b622asm108418205e9.4.2025.11.10.02.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 02:03:55 -0800 (PST)
Message-ID: <261f6c69-4cd5-4abc-a440-555784cf9f9c@gmail.com>
Date: Mon, 10 Nov 2025 11:03:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][master][PATCH v2] imagemagick: adds ptest for
 imagemagick
To: ashishkumar.mishra@bmwtechworks.in,
 openembedded-devel@lists.openembedded.org
References: <20251106091410.2390576-1-ashishkumar.mishra@bmwtechworks.in>
 <325659.1762767571343182210@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <325659.1762767571343182210@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 10:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121455

On 11/10/25 10:39, AshishKumar Mishra via lists.openembedded.org wrote:
> Hi Khem Raj, 
> Can you please consider this patch for master branch 
> Have reworked on the updated imagemagick version as suggested @ Re:
> [meta-oe][master][PATCH] imagemagick: adds ptest for imagemagick
> recipe
> <https://lists.openembedded.org/g/openembedded-devel/message/121327> 

This has been already staged in master-next:
https://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=96b97c0c6490b713b559a4e82bd699a2ebe357d3

>  
> Thanks ,
> Ashish 
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121454): https://lists.openembedded.org/g/openembedded-devel/message/121454
> Mute This Topic: https://lists.openembedded.org/mt/116149980/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


