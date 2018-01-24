Return-Path: <raj.khem@gmail.com>
Received: from mail-ot0-f180.google.com (mail-ot0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1533060125
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2018 05:36:00 +0000 (UTC)
Received: by mail-ot0-f180.google.com with SMTP id v5so2606100oth.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jan 2018 21:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=amJi6BV65oEgbgJBLBKLRWowsDT+prBHLxBqTidwhUE=;
	b=DAMt/YWrnNGQG9QXu2LABa/RJdOlfB2OnXBINEez2+2UkzFjpq1PTMEnbjip8g8Xpq
	024ZeAySgB8DzhSLKHHnE+Be1fO4eKm3DGLDUXO4bmMnvUxooYNl1vQ5LgtHbSha3kTT
	bFVzWKVQQVYVXq5BxgDw+MTAbPnsGCDuRkqk7F4DqsDU3rz7d35bMkBYXz2iAsDGASHC
	ZvhtI/Dw9oXCUQ/roJygXbzcAk8QxliIzaUHJCXlHkbd13j2h1XKPJxQYzt8yYs3DnE1
	w1gWOyogg9bnyLN5Bj80IAzNxqYzFJH+aWwqIea+9IDQ0SEZyxvBIz3KrSeFMl1k+Ghe
	rRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=amJi6BV65oEgbgJBLBKLRWowsDT+prBHLxBqTidwhUE=;
	b=apLSPmm0OJ2JUMlsVNHA+WHo8T23k/d2KIf8EUm1LGu2BMX/pf8Qq9HvaSEqb1IBJl
	BZnNOU6PT37Me9aYuzuJMfw+4geUzKzcfBanOtsuViO2EY54C88Q/tXyuvZGaii6Cri4
	gdfrDZdXMa++LMf0kXtazaZ082o+27RTDlaAJFkGN0Gl6gWWC7+wxYdbdhDQfHym2Gl9
	EfE7UKFy4WTrThspuXLs/WEDaYLGPe+cDOx4onvm4uh5tkQG/CkzdtXaLzhbHZJCCGed
	vJ+hxRtRysrtdaYGL6xKv98Ta7JV7BJvEnxOryk+OAbcKO/nnAZViMaMNwLBuVBfjRGl
	4qUw==
X-Gm-Message-State: AKwxytcXffHSyPV1uTiZn6IgspvxYFV8Qfl/k13dXINF1keAFFLJJB3z
	H7CdBhKw7qpEbkH9187d4l/wnd6N
X-Google-Smtp-Source: AH8x227URqOsk1pNMDGM8fMFJiZ03o17kZ5O6r72gc3Hk2mVSCSuE1YUk8n+TGOwXLUF7F31lGKEZg==
X-Received: by 10.157.61.131 with SMTP id l3mr8180101otc.23.1516772161889;
	Tue, 23 Jan 2018 21:36:01 -0800 (PST)
Received: from [172.20.1.220] (207-91-160-20.nstci.net. [207.91.160.20])
	by smtp.gmail.com with ESMTPSA id g5sm1085656ote.77.2018.01.23.21.36.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Jan 2018 21:36:00 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1513700032-7807-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <d5b06505-41aa-f1d7-de0e-e865f605477c@gmail.com>
Date: Tue, 23 Jan 2018 23:35:59 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <1513700032-7807-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Subject: Re: [meta-oe][PATCH] dnfdragora: new add
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Jan 2018 05:36:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/19/17 10:13 AM, zhengrq wrote:
> +PV = "1.0.1+git"

perhaps including SRCPV in PV is better here

> +SRCREV = "4fef4ce889b8e4fa03191d414f63bfd50796152a"


