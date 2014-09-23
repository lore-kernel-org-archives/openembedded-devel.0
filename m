Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id ADE0B609BF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 17:56:16 +0000 (UTC)
Received: by mail-ie0-f170.google.com with SMTP id x19so7102705ier.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 10:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=kTDay8M8eWkayuK3/dHpybrVdNYQkyXDM51MMwdTgtY=;
	b=hBiFdhI7nL7NupdqWyNNkTFllHUaMYAw0TdmuIs1gPnjkgaPZVytxej0SZDOr6BUyj
	vd1GapFN7L81QNcKEq3NX8dfbSMjvtb6Og63frcLqcfH4TxABBxCSrLJUUARQLLo98XJ
	n2vk8si9hi9sLMHrIcZxMLzx8r06sP0i+/jlbyrcoB7KmsEwkUnpme4hDVLl2Vb2GWB2
	Wn6VeJRMAGcFKjhZbOubNxnaw3j8WC+UdHKmaSdh1jS0iBeltP940kLrU4i4SixvT4tg
	m57WBAKQVxrvdQLKXbaqSv4APDvXVF56rB78mYCN1TRW0tJqHVEaJzChq3SPJOnrdM9A
	fmbA==
X-Received: by 10.50.87.99 with SMTP id w3mr5705846igz.4.1411494977453; Tue,
	23 Sep 2014 10:56:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.240.6 with HTTP; Tue, 23 Sep 2014 10:55:47 -0700 (PDT)
In-Reply-To: <20140923162921.GA25706@jama>
References: <1411282139-8785-1-git-send-email-raj.khem@gmail.com>
	<20140923162921.GA25706@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Sep 2014 10:55:47 -0700
Message-ID: <CAMKF1sq=stznnrk7jeNPcbXwofpAGT6PYhzJeQdcKNN8HeAfOg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] packagegroups: Move inheriting packagegroup below PACKAGE_ARCH assignment
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Sep 2014 17:56:17 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 23, 2014 at 9:29 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sat, Sep 20, 2014 at 11:48:59PM -0700, Khem Raj wrote:
>> Fixes errors
>>
>> sets PACKAGE_ARCH before inherit packagegroup
>
> wasn't this already resolved in:
> commit 5a25dde053e93e64b945776ab3fbf8b67c8c0773
> Author: Martin Jansa <Martin.Jansa@gmail.com>
> Date:   Sun Aug 24 18:01:11 2014 +0200
>
>     packagegroup*: set PACKAGE_ARCH before packagegroup inherit
>
> ?
>

Yes. I was on a prior SHA, ignore it

