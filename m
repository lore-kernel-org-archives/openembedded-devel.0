Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C0FC83F0A
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 18:30:06 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.4429.1752085800685153718
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 11:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KTMpzDJ0;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae0bde4d5c9so21836566b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 11:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752085799; x=1752690599; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mZI8/IgB6C3UZq3nDVAyhbp1XJiC4W0u2RQm6M1oLvU=;
        b=KTMpzDJ0mW8SbRH6w4P8In1FY3B8bfKa7wnxOXhwIILHPcBSkXRP/8c1gjWK74O09o
         6o9Ev4wrnbv6kXEzu91PTPWyReRCo3ccLTmv+/p4fCaOvkaGEP5NQySTugSlgn5Ll7ZZ
         CWBrkJPA4gUeoXKWFAUIbmsf6nShB1LM+9fyd92NIbabpVkLShqUufNkpJN2wsrdhhYT
         6nFEmhctdkoKNYdyBzXSFBou6svcfVZTBlMcD0x6FeeyumgWI2YCavU/JbQ0eCRGJ5fy
         lkwcHPaycg2JIdg733bH9sAkcSo6STGqMsrmaF99lVo7B4k3ymdAXIQrDu6maElvy8yD
         u6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752085799; x=1752690599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mZI8/IgB6C3UZq3nDVAyhbp1XJiC4W0u2RQm6M1oLvU=;
        b=ktWfli8mU9/33r4Jd25E72sIJ2YzOlQfIw07e+72s1E7H8UmTMcPTd6qnkdg/c6oLq
         G5rbuCcQxLJ2VnLEDDRgkOyycryNAdTRdgvEPncGbA/8dloLllCuxGYIWK8ThrNwEhWn
         8VMxsK5Aj3GEU2lZvUk3N60FVkShV8CpXsRI0cKjyL2sETzS0Vc3Cb+SvdzUFLYXw0qy
         iolkqHV6+ocQkXKgOC1JZlhrALFi3UOnjFwVDO0pskiei9aF4HnzR5EEBHPHFVUpyPNd
         zpHqa/FdGQBaDgTqKAytsTTVhS9Ai/s0opY3LxVK7KsMz0gf0GX9tuFs0sCiULCt7/nR
         TmGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMGBVFZWK1TqNjtk+r1qQk1cCWEAaE2NftqlPL9yUfuQLBlsRSmCWx/zFdlHzNavRR3HRU9VFIDCUuDX6u5r51i0M=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx0FBBsOVAjANyy9eU+gChns5tTtQtpkGrYGe1cue1J16lvOJ9t
	jqq4ji/cjPehPp5FzadAD0CMgZiu5w7/s6W+EdjE4L2bRMmP4M/YZXS6HF/f3A==
X-Gm-Gg: ASbGncsyY5l6c+RzDZ02eO+nvWY2pStThjM82bNxdFWweZdD15M1lXa/5l/xuFJ8Pue
	+GOTY5tJm1rI3YbbjNXn7KqKmtOqTySNGgIMwaOYm/Rf1SDhxZAL2KhUwD3ywKZZMwZ3T6rR0/p
	UuoQNN0wBTnXGMUB8yR+ClHVfDOlwqLFmN7kgdvn2G/IB8vtzztmOfA8Wj3tHrM83KGNwIkSci/
	cysbkpWHEmVnsA5rlDHuLiy1NCtTcXxhddrErIM+JONf7DxTV8Y49GnlhsAoNMtRSnRpQP+wbem
	tyszjJPwaQTKQxqsp6IlUpEvBpthxSph7gcoSQ7Xgq7u/4rrAdwd1dyUuxM5ojC6MolRBA==
X-Google-Smtp-Source: AGHT+IGn9OCQWlDSixuOze81XBys0Eu2PuD9aZKKTDFQOQ5ZJtXmN8DJmx/HNwrym9F42axSKpKXMQ==
X-Received: by 2002:a17:906:8f01:b0:ae0:d332:f637 with SMTP id a640c23a62f3a-ae6e13a247amr93455266b.31.1752085798744;
        Wed, 09 Jul 2025 11:29:58 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6ac5469sm1155417566b.98.2025.07.09.11.29.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 11:29:58 -0700 (PDT)
Message-ID: <7aa6ac10-2fd3-42c3-b5e0-1c03530a84ac@gmail.com>
Date: Wed, 9 Jul 2025 20:29:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-openembedded][PATCH 13/20] read-edid: Add patch for
 CMake 4+ compatibility
To: alperyasinak1@gmail.com, openembedded-devel@lists.openembedded.org
References: <20250709173054.605430-1-alperyasinak1@gmail.com>
 <20250709173054.605430-13-alperyasinak1@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250709173054.605430-13-alperyasinak1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 18:30:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118377

On 7/9/25 19:30, Alper Ak via lists.openembedded.org wrote:
> +| -- Configuring incomplete, errors occurred!
> +
> +Upstream-Status: Pending
> +
>
It looks that the developer accept contributions via email, according to
the homepage of the project: http://www.polypux.org/projects/read-edid/
- maybe you could send him also the same patch for the application?

