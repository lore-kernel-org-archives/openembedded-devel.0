Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6BC7671CBD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Feb 2018 06:22:55 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id u12so988835ite.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jan 2018 22:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=cAUpPJHrjmNL2gXpS1x0xkvosD2ztgj3lCYvRjArtsw=;
	b=tpcoATR9ZdWrabfENWdA+fyeczYXp0qwbaPmg0p+eY0CLSfPs8rEu5li8Syi1i1Cfg
	JNyNVBRMnG7eLOWlm2Gf5Ty+FZTADfyc8mmfgvpk7JMPPnOpy0krEnwfG8FHNbh9TIQ7
	lTJDSFPWPRjzqS/vA8S5u7WEArdu/RRS5JmmzzsaMyFvlMT0728Z3BknTVdYJ4Ws9GwZ
	EjSjVrLcS5Hilrj40nO7pvoFiKqz74Vc1Gj3RZn+IwXXeJyXPBVSpKWHQxOAABNUAd8+
	az4uzG3Qj58VUNPchI8M7sPoLVpvrp4ESgI32YrXGbT4Ym0kMIUt10V21vYQ/8EPR/ce
	wS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=cAUpPJHrjmNL2gXpS1x0xkvosD2ztgj3lCYvRjArtsw=;
	b=nvo9mopUK9hfNJjzK7XIyTPNoG73SZZ/OBXmm1VLDHL57FlX4Jlitf+8XDIkb8XCXL
	SkEfrOJlAesxGDhwYvaYFEVeXYI4iBwWXCAKB2DYaVLiudntPs4pGH/a7esQbHPbqiC7
	3Q6nsOuKkwEt3+14a7zCE6orwEpg5C8b1QVECI8+x/aoUfnSYNKtQYSJhkggmADFiuyF
	v3g6xEwZK7qg/a55UIr/fTXzvXfHeoj093s8LDNbcCjok/5aYi+5irU45EUsGrExm9Hc
	K3d8qtv4G0cMCcc4YI7Iy/REDZbrUtReSQCmNc1H8wXDvTqrdXhESFuEZoQvOeaeRe4c
	yGog==
X-Gm-Message-State: AKwxytdNjuOcCVZe1a1R89YvlaVBCAfXHrKKhsv+45UnHAssEYKtrNeO
	LrIowLVOUQ3Ulv/Mest10OtO7npq
X-Google-Smtp-Source: AH8x227HlBvB8ljmOeFeu981QZXK4+JoOEsIWj7RNP4rd7E8W0khgTqoj9JylKg9lsdjRRcZPTk4Ag==
X-Received: by 10.36.114.193 with SMTP id x184mr1205287itc.71.1517466176249;
	Wed, 31 Jan 2018 22:22:56 -0800 (PST)
Received: from hermes.local ([2601:646:8880:466c:e1aa:81eb:4e58:3992])
	by smtp.gmail.com with ESMTPSA id v2sm8345396iob.72.2018.01.31.22.22.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Jan 2018 22:22:55 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <20180131152754.25696-1-otavio@ossystems.com.br>
	<CA+chaQdGSCfm2aNj+EXFy+unv4c+D7oBNmz3uWdHUFpjFO_DPg@mail.gmail.com>
	<CAP9ODKq3xOnxc3PjpkbFWgsS8R2xvZgZy+yb3tJ9ST7p3SsjAg@mail.gmail.com>
	<0e0174bb-bb63-d7b0-8921-93dd5dea9802@xevo.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <110670ee-7ada-92f7-a186-79eec84ead27@gmail.com>
Date: Wed, 31 Jan 2018 22:22:54 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <0e0174bb-bb63-d7b0-8921-93dd5dea9802@xevo.com>
Subject: Re: [global meta-oe PATCH] Stop using base_conditional utility method
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
X-List-Received-Date: Thu, 01 Feb 2018 06:22:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 1/31/18 5:18 PM, Martin Kelly wrote:
> Would it possible to fast-track this to master? It is breaking all my 
> builds.

you can always cherry pick from patchwork.

> 
> On 01/31/2018 07:53 AM, Otavio Salvador wrote:
>> On Wed, Jan 31, 2018 at 1:37 PM, Martin Jansa <martin.jansa@gmail.com> 
>> wrote:
>>> FWIW: I've sent the same change yesterday.
>>
>> Great; it was not merged yet it seems as I got parse errors :-(  Armin?
>>

