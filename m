Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2B9D777223
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 12:39:12 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id q128so1153947wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 05:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=oUNnchMcuf64LIvwE5k+mce+/7MP03Fl+5f9mCov3ao=;
	b=k1XKQhJqe4+jw8c9MgDX6eT/7Fc9WylaDqe5m8DSHSURuPEkU7tZhsACfTf5jMzkzB
	qtCys2W7rO6OG7vTIv49E8xX7upx7265qt9pMQDq+3OK7QoGGwh5Y7Mgk5Dku31/V42S
	Lc3t2R2g1L3c4SkgCW3OgrHQiBl7Wu0UZ8aOfIaTdp6pyKxNOimqqLDwOtSIAVSSlQwA
	ZmZk3ct8/NrX3czhaezDWeqf08uK23huNPOgnEULoJWKciF8tJIfbNY9pSkRKjzY81L2
	NeKVtC6hsGBAU28Iv2dqqX+EoKyxigowo/VAQ+Nm7m0ODYLHS8JDOS7ZtwkidKpJ0WdS
	mppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=oUNnchMcuf64LIvwE5k+mce+/7MP03Fl+5f9mCov3ao=;
	b=Hhu0RBJToulT+36X5M03g3U8Ity5E5u5AmNgE0P4gTlbWp2zAm3Dfiyi93lszkuD81
	JcPvts6wJX9sXwFrtO110DQPnUSXlf6S9gyqVVNHWlNt3yBtFJwI6pEcb8FTl1UOooZc
	yqhydaGkxNG/JsnO+WvNtnghSE1EVleXjCRRBIcUMZn25QujZ15j4ReSMkCWxuOJ8Z7B
	L44e4+3J0otDHEP+tTnQMC2/57XfW2pIt1jWMBxbkoY9znXrrs0gUWnR7LmKs+SMIXPG
	uP9KcUuhFM3w9rSx0jxBImDnYBhqf+HrAAmPpusT6mnUoAJus/ZtrVHCOOwb8OCCLPNU
	sTFQ==
X-Gm-Message-State: AEkoout0E3Eiiqv8f7a/PzKVvQWaBjCjXdleTs+5qD3cpADoNUemToVXHX/07DA4EH/zgt1jwiJMzemgEUOoUQ==
X-Received: by 10.194.143.17 with SMTP id sa17mr8787841wjb.97.1470919153144;
	Thu, 11 Aug 2016 05:39:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.139.148 with HTTP; Thu, 11 Aug 2016 05:38:52 -0700 (PDT)
In-Reply-To: <e653ed48-a9d7-9bd7-1d12-0cf5b85e82b3@eumx.net>
References: <1470910246-952-1-git-send-email-ricardo.ribalda@gmail.com>
	<e653ed48-a9d7-9bd7-1d12-0cf5b85e82b3@eumx.net>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 11 Aug 2016 14:38:52 +0200
Message-ID: <CAPybu_1GS7hooaLivwd8FZTUJQBv=q_gcWKEmehc8ooDJ=YFkA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] gflags: New recipe
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
X-List-Received-Date: Thu, 11 Aug 2016 12:39:16 -0000
Content-Type: text/plain; charset=UTF-8

Hi

On Thu, Aug 11, 2016 at 2:22 PM,  <ml@embed.me.uk> wrote:

>> +RDEPENDS_${PN} += "bash"
>
>
> Where does this dependency come from, seems odd that a compiled library
> should depend on bash?

From an openembedded warning :)

package/usr/bin/gflags_completions.sh:#!/bin/bash

Regards!

