Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 405B7CA0EE6
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 11:27:43 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.11678.1755602859727440096
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Aug 2025 04:27:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L979M/Im;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-618b62dba1aso4865827a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Aug 2025 04:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755602858; x=1756207658; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=db1QE8GCNWmv02PTXQdBxnzCcKKGiJ2DERAxnHOKhF8=;
        b=L979M/Imy8k2vplI2WmB2UKJA96pieUC6um0ROkpqscOCnvuamLpXCz1JGryYWj5cw
         G73YZ40ekrxSxcrB1ATNwqlBFi5uDbj9YrBiIo8DFJZ/Xc2i3B4dUy2Hqm9grBuCQaZ5
         o0f8f7w2x3XHrUj2YYAo467/WgB44JCI3Gl266nYOkxYr+YMgTAdI3NMFTYcvQfkQ32Q
         IU9/VlpJZ24BrEPD9GrVK16SpqzZotz1epSxP9EbpzaiHo6zlLlOl4fgn1/T+dKK3+PO
         AlI4W5e2q6hSBVH1YaDQBsLz8Hs86NtU9KDZrWXIZfywhsjNzzJoq2gs27Cekx49vs53
         oihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755602858; x=1756207658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=db1QE8GCNWmv02PTXQdBxnzCcKKGiJ2DERAxnHOKhF8=;
        b=K5SL9gVCC0fJLTRrXjFHzo0jGYJnb4hHodJx8GPcVcFsWPornTNR9jHVGc4Wm6MBho
         ylAWZKs4IEZGWb+lDPXJyhXsK9vdyM58CVABCW8CSHKQ9XONFRaE025Ca6MNvn9/JUZO
         vQGvu7emBEQqy0Atjw5kptuA50hj4sgy+OQICTK91qrnoh7gz51OaGr1Jrr+DqTuT775
         v8EOseZCzCL3R8f0C+X0xhhyMZgXgsK/lyml7tfEl4wXwtPVnwozxa+LtYLJ5yMqTdZf
         BhO/XBMgI70/MzN9TV42K8KUcBsKq9b04DBHWa9ZeSpMrvUWPYNqKE+VJpNo2lAlRJaj
         32JQ==
X-Gm-Message-State: AOJu0YxxGUofu4tkRfyspzNwtuqLdaxyywZ91LeAX65L9yu9ndTW0KBi
	EzT0mHT+cGkgvlLmdBgOS51nL/ta2+EOyO+8D/PnddsLNHRN1UXERvtT
X-Gm-Gg: ASbGnctYQV/82i9vAmCciqrQBLkjocrI05wg7RZWbDrLyfbfCaMeXiiYA7Ei/aaPXSW
	s4L6zUORCJW7Y9WM8gpWxdb/fDC3Yo5vhXZi9ciPHAliXpxs0TAT0vVJ6BPQqpBhOouFccS2BAm
	Ji+aw28C1mO7XCQRhRRhVqejKrh9GsbJtmDqyW8zLLS37MhldQBwamESVYcNu8hcHBbFc4cr3u+
	POrXYW/VGYuu+IIGv/7PLSfqCKhlSBRNHZg9p0K5jNcR8i5LugAxGEK3h22obvl25l/SDuVa0Eu
	PiyLETYFYwNy+A6gITXJKV/vXKqzwiTWvvCAgzKGAmsXOgkmRRdXoTE+qAS5qIzXBnEUsH+iE21
	sF8Zh24SeXbXD+eKo94Iqez5tSXKfS/LaSJzGWwbeCQ==
X-Google-Smtp-Source: AGHT+IFg4GLDm+SRur4eUR+3Bfxt/k/FuXp6wb0MUNPaDadFUpJA348i77T0D+Vq27gLmS7fW4m0Og==
X-Received: by 2002:a05:6402:510e:b0:61a:3236:22b5 with SMTP id 4fb4d7f45d1cf-61a7e75a49dmr1693824a12.25.1755602857841;
        Tue, 19 Aug 2025 04:27:37 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a75777beesm1561852a12.26.2025.08.19.04.27.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 04:27:37 -0700 (PDT)
Message-ID: <e21b33b0-8be5-49e7-ad82-52ff7fc73c70@gmail.com>
Date: Tue, 19 Aug 2025 13:27:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][scarthgap][PATCH] mbedtls: drop tag
 parameter from SRC_URI.
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
 "akuster808@gmail.com" <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <20250815105844.584334-1-karn.jye.lau@intel.com>
 <04cd09ff-cb1d-4948-a198-7b2b7a244f16@gmail.com>
 <CA+chaQdBWW2jkTrUw0ipruVzRT8NWyn-1a5WmQMtH0BpZBy5oQ@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CA+chaQdBWW2jkTrUw0ipruVzRT8NWyn-1a5WmQMtH0BpZBy5oQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Aug 2025 11:27:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119004

On 8/19/25 13:24, Martin Jansa wrote:
> On Tue, Aug 19, 2025 at 12:44 PM Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
> wrote:
>> Armin, Khem,
>>
>> Would that be possible to prepare an unscheduled fix-release with this?
>> It keeps tripping people, I see reports on all channels.
> Khem already merged the fix yesterday. Thanks Khem!

Oh, I wish it worked like this with everything I wish for.

Sorry for the noise then, and thanks for the fix.

