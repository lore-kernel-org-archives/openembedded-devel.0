Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 80B57608B7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 14:21:35 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id c85so290645155wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 06:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=J7O3QVNYyyQub9kqZq6ccDqnNwz353heJApRMzKz3EE=;
	b=C+M5pas+4A9NrsRNpY8w9h/Dw4NNcgnFvlYWcL16o3SHrRweKdfkrlZSnHqUDEp/2O
	hhbivzQSpDd9PZVW8TSmK/CbpRnFVRVr6RZ1GU89krJ8Z9SL8do7EBSd16HHG9fbvxik
	CirMjsxiztkvLbqbPBgWbgmlFNelaJZKAR25aH4tM/xGsG+ivZ+bpyEwdwCGhVhlnETW
	9JtLRR4szAhBuqgL5G/k/HMJDyywXxID70Xc1FpZLinNP4JPytP9qurTwz/YfdeQexnV
	HCpLCvuAP5sQNF0O/AN8MD28wHOIvmzjnqSiXNkk1svuoJuG6fj5RNLBgDHxxodq+Gju
	uCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=J7O3QVNYyyQub9kqZq6ccDqnNwz353heJApRMzKz3EE=;
	b=pfcDiW16ybCqQ1CWQ9anZJ7JtH4DM7mx1+CiQNiCVCaDYJj9k9H5oPu7f8RMQETvIU
	4Dh68i6be3LktT3FjKYiecZrkLCHc+HroDzkLrImLKshMLJqsArg0bLGkR3Yg7aNU4hw
	zZ9CgqLLM+DE6mnJHSr+OLmLVgLcIFMqBDRoca96Jf2j5mSnWHYF/P+eHPZB2vn1lbym
	L2sVlVDClAYgCh4kwjv+U5JrAPgm5oSrKVp6fgQ7ebYRJlx4YVMviGTOHbJk46u08gr7
	Nh7SSwggW3zl3JZ2NlulvobwX2YjAwfe2PMz7lluZ1WCkyhzgKV0FkVKAxGbWXLkA/Lb
	593Q==
X-Gm-Message-State: AIkVDXJtfqbQPSQGuJS7HOc1L1+0JNcXgpIC4ThLBThcZlkoTkr2kfEl0XieaJHxwhgELPHnsq8vTbgH3tihnQ==
X-Received: by 10.28.136.68 with SMTP id k65mr27149740wmd.48.1484835695928;
	Thu, 19 Jan 2017 06:21:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.164.227 with HTTP; Thu, 19 Jan 2017 06:21:15 -0800 (PST)
In-Reply-To: <20170119114529.GG3265@jama>
References: <20161229133508.5584-1-ricardo.ribalda@gmail.com>
	<20161229133508.5584-2-ricardo.ribalda@gmail.com>
	<20170119114529.GG3265@jama>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 19 Jan 2017 15:21:15 +0100
Message-ID: <CAPybu_32sRCZGtLQgTzX7bUtqrzfUWawhQy+LJXOCTtO7Q0o3w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/2] opencv: Update to version 3.2
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
X-List-Received-Date: Thu, 19 Jan 2017 14:21:37 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin



On Thu, Jan 19, 2017 at 12:45 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Dec 29, 2016 at 02:35:08PM +0100, Ricardo Ribalda Delgado wrote:
>> -Only enable protobuf as dependency if dnn module is enabled
>> -Download manually xfeatures from 3rd party repo
>> -Remove uneeded fixgcc60patch
>
> Fails to build now:
> http://errors.yoctoproject.org/Errors/Details/117456/
>


I have not been able to replicate it in for qemux86. By looking at the
error message it looks like something on the freetype module. Until we
figure out what is going on, maybe we could pakcageconfig that module
and disable it by default (it is part of contrib)

What do you think?

