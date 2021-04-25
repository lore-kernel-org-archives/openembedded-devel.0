Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web08.7618.1619390079211985230
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Apr 2021 15:34:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qrKykQX+;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id md17so473271pjb.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Apr 2021 15:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=gCIa5ZsUlUgwxDt79E0ULXO4mrUZlS4OB+UNsZD4gvc=;
        b=qrKykQX+6xzemdLVuHWcECZeXTJytg0TOPMDoVXeBpyi77UNgWJVHYNYs2h9O8YxXS
         pGD1wkrjaqsXQ6d0AhMH21CHEhXexL8TnxfC8qX7NDiEZI0Q1ZwZkLbIdzcMScMSIfRH
         PnZaT9p9Z11fEk7+3GcFCrFyEIO5gYqsGKmfOyD0HVBUzaWx39p4oGXq1kxZBOdk5ZWB
         73HFWyJVPt1o5r14kQpMdl3sCpmodhFPmjEILfp//XjB9nYceDEcQgxKoKIrJcei/oPb
         zcha5/ws/LgH4yXRvU1rr1sBxvH/lSuq9EXemSQxZVZegs3lSVMqmv//nDaNT0Z+UE83
         gx2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=gCIa5ZsUlUgwxDt79E0ULXO4mrUZlS4OB+UNsZD4gvc=;
        b=AoTTC7mD6Nde0DZG5HtHQ+CT6YChaNSlRrDzCG17ohtXUscKv8vH8BMN0s/+pe6Aau
         5XZHHqcJIs9KuzWiFvh189/DKTmpot3msdu2yeGug2lD4Uz6QC8HAZTbzhwnnV6S7WwM
         dWnl+GH7TuHt8k17A/hWyVU3YLDdVFGC984xpWC6n3NseutDGaXaXAE1rgkdtX0u6FAq
         D+MDAbmr1A3mWlV3ZhK4TDzu9Vr0psj1qGm62KKSeDIypM7bQOCqv6fsiDXwt4XAVXzG
         0o3W3t7IljK2/zV6NX9a+BZh83BIGtv99St+4tDRLGXb3sNrrHVH9Qf3EE34j9mBVZyo
         ztwQ==
X-Gm-Message-State: AOAM530PbOGMK4k2rp6A0EyVvDUODSQz9kmHxID0kXwMZqGa01jHihFM
	dZL8QRFbJo7xN1tvJCsrCMWMr/f2M2u6uQ==
X-Google-Smtp-Source: ABdhPJxJZJ7M14JwjDirDkDXWL07Xmqtin1OLqeVOqF8BDb0BI6vwejVlxxQPMMDjycey0A9PuHHEg==
X-Received: by 2002:a17:902:dccc:b029:ed:32ed:e7d0 with SMTP id t12-20020a170902dcccb02900ed32ede7d0mr1437951pll.79.1619390078605;
        Sun, 25 Apr 2021 15:34:38 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:880e:6a48:f6c3:8404? ([2601:202:4180:a5c0:880e:6a48:f6c3:8404])
        by smtp.gmail.com with ESMTPSA id w2sm9464521pfi.104.2021.04.25.15.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Apr 2021 15:34:37 -0700 (PDT)
Subject: Re: [oe] [hardknott 0/6] Patch review April 24th
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <cover.1619258978.git.akuster808@gmail.com>
 <CA+chaQeSzuwXe2YRgc68xek+ZygZ7D16Q3jj=jBrTico5TvCEA@mail.gmail.com>
 <87d755d5-1068-dd5a-58e1-7ffbec9310b7@gmail.com>
 <CA+chaQdcK1_kimSqjafGH4b5Ek+gGE2P2fLrDYJ15dGmrNpqvA@mail.gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <d271c705-e4f1-7003-555e-217901b8c32e@gmail.com>
Date: Sun, 25 Apr 2021 15:34:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQdcK1_kimSqjafGH4b5Ek+gGE2P2fLrDYJ15dGmrNpqvA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 4/25/21 2:41 PM, Martin Jansa wrote:
>
>
> On Sun, Apr 25, 2021 at 1:56 PM akuster808 <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>
>
>     On 4/24/21 3:36 AM, Martin Jansa wrote:
>     > Please take
>     >
>     https://git.openembedded.org/meta-openembedded/commit/?id=b5ad9c011db2581cc84e5daa139acf73a0f6f5c0
>     > as well to fix
>     >
>     https://git.openembedded.org/meta-openembedded/commit/?h=hardknott&id=98a26903f770aa8698770817bdaf6175367917e1
>     > merged in previous PR.
>
>     Hardknott already has that commit. Was this meant for Gatesgarth?
>
>
> I don't see b5ad9c011db2581cc84e5daa139acf73a0f6f5c0 in hardknott nor
> in hardknott-next:
> https://git.openembedded.org/meta-openembedded/log/?h=hardknott-next&qt=grep&q=tbb
>
> And in master it's between the last 2 commits you did cherry-pick for
> hardknott in this round, so I don't understand why this one was skipped.
All will right itself soon. I think its a timing issue.
see stable/hardknott-nut.

-armin
>
> It's not needed in gatesgarth, because the tbb upgrade which dropped
> in PE wasn't merged to gatesgarth.

