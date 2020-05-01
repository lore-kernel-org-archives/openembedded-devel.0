Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.11945.1588345042430301603
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 May 2020 07:57:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d+n78GJ4;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id r26so6585563wmh.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 May 2020 07:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=3owGNdxnyvVKw5zFUx3GAvisQFAEFMiAfQiF1eDQrhg=;
        b=d+n78GJ4jCZgcmDnNkknYJFQtgk7B0BD4EXKDDDR0kxaai/j23wjJURPhrQWNX7+5Y
         JSlPDjLNtZsBk7WlhM29jB2iVKuKtMKCGLWyOAygpYIe8FJjo/zpusmgR1QRdRUQg7xs
         SyiXgsgHo/uWUyCzhvWDPqzMGex4nZAVipWOGyIs3PfKmA7ZhoNBqa0A4rBtGZxK5B46
         8Bd3JtyylnJ40f9eIV57F5RmR34pYwaREfGiFEguOT46AdRzs9L4LxPaYhCdHmUfIopE
         0nLVuyNBC0SroFH5W+eejoasnizFBTxgtpkZVBU88gIcmzrLUUwURA3rL22HMX/mZGLb
         uoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=3owGNdxnyvVKw5zFUx3GAvisQFAEFMiAfQiF1eDQrhg=;
        b=mRqjcgbQKdzeUDlTRQrm2PLLAiDTT93iPRjHDy4U17AjyZgpbid6wL9qnahMGXaEW+
         hsd2pqnfbyizgYYb9lFxl544C470u4HcizBmjjNGYV4JLbi2raof5M7yOf4g8qWDW+++
         lSA41VOCgA8VEU5yjwqSOYTI0sgcY9LfH9jkjg1K96p1gay2cdhnCC4QjvGpAs3WGSLd
         NWRglLFIJINyHqZ5nUq+bcG+THspGT1NPPUU9pf6EyqvkA4KMEY54IXLY9qi25txu+Hd
         r5zhYzWcowsF8iThRyAejnEX3JSaXBu0JkvQ5Bqx9AOlBbJkF25R6XfwS/v4mHn0q6CP
         EUew==
X-Gm-Message-State: AGi0PuaU8E0ekldkug37ihnvIBFFCVNKLEaV9lOP0WRNcVYeidudTtAq
	miZpCcjyOxQD8V+qEewLgtg=
X-Google-Smtp-Source: APiQypI+WnuF0FaF+QZtVOO2Gx/fTkruy23mpmqGKC5iKqBaMKkgNzOfMKH/gqVhtMNV+4MKB3G0YA==
X-Received: by 2002:a05:600c:20f:: with SMTP id 15mr4556614wmi.71.1588345040744;
        Fri, 01 May 2020 07:57:20 -0700 (PDT)
Return-Path: <oecore.mailinglist@gmail.com>
Received: from [192.168.42.52] (ppp-94-65-43-120.home.otenet.gr. [94.65.43.120])
        by smtp.gmail.com with ESMTPSA id u7sm4963950wmg.41.2020.05.01.07.57.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2020 07:57:19 -0700 (PDT)
Subject: Re: [oe] [meta-java] host gcc-9, icetea-7 gcc-9 but how older gcc versions?
To: "robert.berger.oe.devel" <robert.berger.oe.devel@gmail.com>,
 openembedded-devel@lists.openembedded.org,
 Richard Leitner <richard.leitner@skidata.com>
References: <7946cd8c-4a94-5e5a-7bdc-64963af21006@gmail.com>
 <20200429100259.GA249641@pcleri>
 <92bb1785-280d-ba90-9366-e2a7793d36d5@gmail.com>
 <20200429130233.GB249641@pcleri>
 <1550debd-8a7f-9a1a-0e12-9566b69405b4@gmail.com>
 <cbc9dc58-61a7-8133-698c-6570f85f85f6@gmail.com>
 <20200430211745.GC410632@pcleri>
 <160AE28F2E93B445.19580@lists.openembedded.org>
 <0237cfe6-4162-a253-4799-678177dca1ab@gmail.com>
From: "Robert Berger" <oecore.mailinglist@gmail.com>
Message-ID: <1110be9f-444f-5b6c-f16c-e638493b31e1@gmail.com>
Date: Fri, 1 May 2020 17:57:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <0237cfe6-4162-a253-4799-678177dca1ab@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

So I guess the compiler is __NOT__ wrong to complain, since desc could 
be NULL.

Regards,

Robert


