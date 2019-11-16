Return-Path: <leon.anavi@konsulko.com>
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	by mail.openembedded.org (Postfix) with ESMTP id D3D987F7AD
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Nov 2019 17:17:02 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id q2so14091936ljg.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Nov 2019 09:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=eahf85VREXMcnANqlbaZswfqIBAHNMCKT7Se+RAenA0=;
	b=iGa8JUvL5+j9MMZg87UBRErVTxfZxoCRB4DPUFwTg1WUojG4vBIPEM3cZnx/Yuq4qh
	VH6DNf7LQdKAScF9S0/EYGDyBWa8oAD6up8zIML5AzDPA6GwT6rDzgIcEdhh9aRlSwoW
	DHuYDvJDlW3TKO3h7aeQJGcGkxQiSvI/xvAPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=eahf85VREXMcnANqlbaZswfqIBAHNMCKT7Se+RAenA0=;
	b=hfzafcrdSI6QAwrLt1mzH37CTvQK8Fa0oPLMg46YHYA7TZBK/LobcNvdMwV3w3L6ka
	A3orVbVoKcelECekfSB5ecIl17g2u/f3wB94T9Ll5e9adAJqBbUo0zVJFbBosW4E2YPk
	wUBTXvry25aym0BGGmPMZYPUiAE1MJh5U7UvkQWGjwnT+7tfIXsIv289NHXjntL1apUy
	c0qqWyBkKqtprrVE2WQroCXzKQWdqMpxHiRqISOlR9ClJZtQWqWdPPmjxvmUOIz1n5ko
	mxQYI8wUSapMYe0R52Z4V0BF5E5LSS9nihXoZV/4PBTW/HzWNJodZCxqiDLqXZWCdJYO
	0qbQ==
X-Gm-Message-State: APjAAAXIL3yCB9u0KSRv8teAT5qM+DujqvELbwWWc7ilPDVSBMI0OLx4
	s6I6KBazPW4YNovXefHuB89QGgq/50o=
X-Google-Smtp-Source: APXvYqzt8JSM1r0kJwogerCQzNJGjovdxLPD8X/aOxnGmJt6Z0VlOdQ2dg77rwntQEnOKriq0dH8Og==
X-Received: by 2002:a2e:9841:: with SMTP id e1mr15296168ljj.19.1573924622988; 
	Sat, 16 Nov 2019 09:17:02 -0800 (PST)
Received: from [192.168.4.166] ([78.130.245.67])
	by smtp.gmail.com with ESMTPSA id k8sm6364931lfm.41.2019.11.16.09.17.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Nov 2019 09:17:02 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>, Ross Burton <ross.burton@intel.com>
References: <1573752010-26608-1-git-send-email-leon.anavi@konsulko.com>
	<dbae500e-b459-005e-ec2b-5d4f5ef66f18@gmail.com>
	<2feeb01f-2110-e266-3bdb-635c38577c39@mailbox.org>
	<30fccbf16335d228013fb5d59b0ae1cc18c25a38.camel@gmail.com>
	<ea1acf07-73d8-0e08-8979-2e89c6552bbb@intel.com>
	<CAMKF1sob3Znp-dXkpnr-avGtA=-t=yKtbU6ckW-w_zgmb8VeNg@mail.gmail.com>
From: Leon Anavi <leon.anavi@konsulko.com>
Message-ID: <0eeb54b2-c3b9-c78d-4ccb-121c0429e5d8@konsulko.com>
Date: Sat, 16 Nov 2019 19:17:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sob3Znp-dXkpnr-avGtA=-t=yKtbU6ckW-w_zgmb8VeNg@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] surf: Add simple web browser
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
X-List-Received-Date: Sat, 16 Nov 2019 17:17:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Khem, Ross,

On 15.11.19 г. 22:49 ч., Khem Raj wrote:
> On Fri, Nov 15, 2019 at 11:25 AM Ross Burton <ross.burton@intel.com> wrote:
>> On 15/11/2019 17:30, Khem Raj wrote:
>>> On Fri, 2019-11-15 at 16:09 +0100, Carlos Rafael Giani wrote:
>>>> meta-browser would be more appropriate.
>>> I was contemplating that as well. but these layer has more chromium and
>>> firefox lineage
>> But it's called meta-browser and not meta-firefox-and-chromium. :)
>>
> certainly, worth proposing there.
Layer meta-browser was on my radar before submitting the patch to 
meta-oe. I also thought that this layer is more about chromium and 
firefox. Links, another lightweight browser, is in meta-oe.

In the mean time I've fixed the configurations so that surf recipe 
doesn't need INHIBIT_PACKAGE_DEBUG_SPLIT or INHIBIT_PACKAGE_STRIP anymore.

Best regards,
Leon
>
>> Ross
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

-- 
Leon Anavi
Software Engineer
konsulko.com


