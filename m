Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADE5FD4F08
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 17:19:41 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.784.1773163180080366409
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 10:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hOSP/QWK;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439ce3605ecso4062158f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 10:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773163178; x=1773767978; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ffEXMT44L9TS0ZW7enfHd4Kfic2hy8z6hhSD6xRhob4=;
        b=hOSP/QWKirQ0mcELzFfGoDaqXp3W1lj3IiPT3+6qd20UgT0RY7kNA4An58Dp48hkzY
         EHq6I2LdgDuXtNQlVdBmr5HVioaXgw5A06hYaCaeh3DR9xrwrT2HlX/4m1ePXV5Akcr5
         FhQ/xCnAeqm/Pq/iJHlhceUxwejpN7huPSGvzA6cNNFtWLSVM6g0JVYBl8n0yDN/bIKm
         cBHOkQgm/Vh/MS+XMA1TDmnlowmr8gxSYw08sFaGzjQJXy7ue60vGMzmUUtsxgS/Drl5
         KwUh1rfh7Xr2qjO6OLvPBV6Z60cjLV/CKqscj5sDyxHkGZZRAjK2rKP0koYDJyzardhl
         AVjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773163178; x=1773767978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ffEXMT44L9TS0ZW7enfHd4Kfic2hy8z6hhSD6xRhob4=;
        b=Dikixm7il18zBb4ely5ArNKyOiVKKwVQOoh07FK0140jYZ20zgvSKV5jMH4EBt+Ru2
         4E42i+aXTtL3voKzULtQ1QtkckFpzARzISqaBFQBavHy8SYHJQFhpNjfdgl0gQU0dmKj
         i17eImr8JcuOE4JrHny5PyNlpD9URntZxstfeefc2qw0jU85tmuONwAtuEltmSQaZBHf
         AQdT0VqirAdS1UKlR/NX74sAXWOu5Ih1Qc4oeLODK9zSYWmnFB6FJb5sPaxROb6q9e0E
         kfK4GV0w5H6eZK3dL1tDrPW6nGv2dW3/B+6JHhz/PNBbi8amPsadxwQf2+KVufQdcdyA
         fuGA==
X-Forwarded-Encrypted: i=1; AJvYcCXIXgdDiT723nwMM3j3ZjbrGEAaxSJT+VW3Rhu18kq12ZvYDVmTlZEX3Vd/SfnYgpCq6iQubHh0lBIBUK5Vho4okU0=@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywco9A2pC4vDE2nffDmI4P4ggGV6lz1AOATVDitNQN2pYj/FzW4
	nR7edsEgAVqKGhV++oXjoJvroWQH0MzJxQAVRC2dGEj/xIzD5bQ8AzzcEST+/g==
X-Gm-Gg: ATEYQzxOAIjHbwvKWdxmSzX1NN2nE9YwNIj1mgOyilGAw11oA86VEYyQMd8561Lq+FO
	UUBFUavt4uuq6KHP6OKJlLGanm5p9LYM0PAGkNVoTqz9CvM0dygJ1OU5T1el8NkC3cNfucYdxAH
	Orfwwgs6SnSfydGEV3Av+OYXriXg4NorCvuXrWgyv6QAhbc9pVZm735sb2bG/GmeV867cEmXSZy
	9lyqJC9kXf9azi6lymNZvpdFNeIYahSqz3gHklDURPMw9maXZRbjzD8/rGlg8N20RKrvIZ+4jMN
	u2kVucvCk4osOFvohhBkqS3wDQLFGvQD5u/S/f1GHrISIg8HMODkqnwiEDgEGZNHeXS8cuCUNQ+
	1zx/KCXiY6B4ozNY+spfTl9UnP8s0sgthsX/4YsxxCOWuaf3rZouOE/efVcRkmkJKnhAAZ03uUg
	lt2hh13zQ/CB2M2EsN9KS5BAe09SXqGd0=
X-Received: by 2002:a05:6000:40dd:b0:439:cb5c:b18d with SMTP id ffacd0b85a97d-439da893f6cmr28150497f8f.38.1773163178072;
        Tue, 10 Mar 2026 10:19:38 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d840sm39821144f8f.8.2026.03.10.10.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 10:19:37 -0700 (PDT)
Message-ID: <1f68cd24-b5ab-406a-b245-1c0d9b592367@gmail.com>
Date: Tue, 10 Mar 2026 18:19:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] cxx: Add cxx recipe
To: deepesh.varatharajan@windriver.com,
 openembedded-devel@lists.openembedded.org
References: <20260310134815.374345-1-Deepesh.Varatharajan@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260310134815.374345-1-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 17:19:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125035

On 3/10/26 14:48, Varatharajan, Deepesh via lists.openembedded.org wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> Add a recipe for the cxx crate, which provides a safe and efficient
> bridge for interoperability between Rust and C++ code. It allows
> defining the FFI boundary in a shared Rust module and generates
> compatible bindings for both languages during the build process.
>
> The crate is implemented in Rust and supports zero-overhead FFI with
> common Rust and C++ standard library types.
>
> More information: https://crates.io/crates/cxx
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  meta-oe/recipes-devtools/cxx/cxx-crates.inc | 130 ++++++++++++++++++++
>  meta-oe/recipes-devtools/cxx/cxx_1.0.194.bb |  34 +++++
>  2 files changed, 164 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/cxx/cxx-crates.inc
>  create mode 100644 meta-oe/recipes-devtools/cxx/cxx_1.0.194.bb
>

This is mostly just a thought, I don't intend this as a blocker of this
patch. Maybe a loud thought, or a quick-discussion starter?

cxx is pretty generic name, I find it hard to guess that it's a Rust
library for FFI.

Debian prefixes this (and similar packages) with librust - this one is
called librust-cxx. Fedora calls it rust-cxx. (Though OpenSuse just
calls it cxx - I guess there is accepted no standard)
What if we would follow Debian or Fedora naming with such Rust
libraries, similar to what is done with many Python and Perl recipes? I
imagine that over time there will be more similar recipes.

