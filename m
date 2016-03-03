Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2F08F731D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Mar 2016 13:47:30 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id hb3so64528703igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Mar 2016 05:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Q84e9u84+e8FrEyznhI4Cq/Qv6pULMgweCjM7iS2heg=;
	b=1rpuHwbHqCvCXB5unKOvIirJVpH4svVMBdDLVTcEWAB4R29Zk3tQ/hpRPnUFeeNTcZ
	syLOHRZl3ZRBu4fGlxwHf7x3W1HJ3sW+xndSptdwrg6L3eKJrKzUX6iF/rSE/stohUmt
	H4+K/EPCZOJzi/YYscex898J0kdpp9nZx+Ytya+d9nLIVPZOoaz2yUUwFA+BfhyMCXb8
	GjZwcOxs2jZhEMrr6WzDo50TE7L69olxCwQChOGj7kqpxD7OCTitOdAURfEZS2Q34BmG
	7+mJZPdggGQMctScn2Vp5PL9sMqDDTeapLhxpRxifY4jtTXuVYJvHWl1WMBmHCemIGgR
	kk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Q84e9u84+e8FrEyznhI4Cq/Qv6pULMgweCjM7iS2heg=;
	b=bqfj0HjMFc3UxiGMLhdXeBY5BDKuDbOaXJGibC8TV9nd/Z1qIq3zzQ+n1D0qVV8RF3
	rgD/iCNvjurVCk6gD2Rc7gNgt3yUCiziKCJo/DjUPl7jyyrA6KpaCXoBOBlmioGt4zC+
	Gcb/wP9cQ0drC29qCdMfmKeE30KiXp/ztXGCDSJc+q6KnB/k5n/yxA+nYFyxyuj33njO
	113n+Y/k1vc17OO6qxoMYdQnzbXi8/AIJBj+4mah9vnA9by53YAuk4EbATfDeGrDxjss
	Zc2O5T4cuNeyQel+J7AiZL/RMxPOE5VnCDg9WK0SuYjcTNTuO9Tj2w7lz6z3yygRhGAk
	gxJQ==
X-Gm-Message-State: AD7BkJJhanw1/XmTqWcg6zoM83dPBcpL6hhhgyIgKgrHSVLTrBaYacbxVsXPBe6ihH3vzSR2v1UQjYU6/iyN42Ud
X-Received: by 10.50.112.101 with SMTP id ip5mr984872igb.52.1457012851403;
	Thu, 03 Mar 2016 05:47:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 3 Mar 2016 05:47:12 -0800 (PST)
In-Reply-To: <1457002594-12327-1-git-send-email-anders.roxell@linaro.org>
References: <1456994787-29216-1-git-send-email-anders.roxell@linaro.org>
	<1457002594-12327-1-git-send-email-anders.roxell@linaro.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 3 Mar 2016 13:47:12 +0000
Message-ID: <CAJTo0LY-OnDmo=KyCJF2Tsc+8Xxn4mKBXmy3=6vLj3ATi7P9vQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCHv2] cunit: delete *.la files
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
X-List-Received-Date: Thu, 03 Mar 2016 13:47:31 -0000
Content-Type: text/plain; charset=UTF-8

On 3 March 2016 at 10:56, Anders Roxell <anders.roxell@linaro.org> wrote:

> +inherit autotools-brokensep remove-libtool
>

I should point out this was meant to be something that the distro or user
inherited, not per-recipe to avoid broken .la files.

Ross

