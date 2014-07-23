Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 78606701A9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 22:15:30 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id rp18so1501102iec.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 15:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=w1SLdFlzKGs5FjJd8IhBzTfopS+d4YCuQqz9uGBLKSM=;
	b=vzmPdfo6SZN5tMiHb9NvqAxTSngDsD3vEXfN3y+JWGL7ymeYkKDRKye92sV234VPIi
	LtSp8/o3l6jNapOe/5Xg5y1x/5EsfenfK1yxMJ6JQCDfWLbHbcF+X81fpGC5nhyKFywa
	sh3P5ce094LvGsdhFDFlcTh1hqXVr7ImkFQFgQ3KW2rlBxyVzcFATnVy6ckarrWs0cGd
	H7HQXUSuW8IB1xBhvG/oHy+XtBZCOQhH6C43tEkKlFalgGFTHB3xIKwV9HwIorYhh1QL
	oD7lJd2ViiqV5YDgcFkGKF1Cq9qLl7iP3xg6VlEme58cW5H+VzIUvgwCEQPdnBfG1Kuy
	m0YA==
X-Received: by 10.42.90.74 with SMTP id j10mr6808323icm.29.1406153731958; Wed,
	23 Jul 2014 15:15:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Wed, 23 Jul 2014 15:15:01 -0700 (PDT)
In-Reply-To: <20140723215641.GC4842@bshelton-desktop>
References: <20140723215641.GC4842@bshelton-desktop>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Jul 2014 15:15:01 -0700
Message-ID: <CAMKF1somUu5FJGNgbWXE9+4i5wG1bAP1kNA09TvRF8j5p_MBXw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-nslu2] Setting util-linux hwclock ALTERNATIVE_PRIORITY in meta-nslu2
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
X-List-Received-Date: Wed, 23 Jul 2014 22:15:31 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 23, 2014 at 2:56 PM, Ben Shelton <ben.shelton@ni.com> wrote:
> If I were going to lower the util-linux hwclock ALTERNATIVE_PRIORITY
> from meta-nslu2 so it can be raised back in oe-core for other platforms,
> which file(s) would be the appropriate place to do it?
>

its in meta-slugos you would look into

https://github.com/kraj/meta-slugos/tree/master/recipes-core/initscripts

> Thanks,
> Ben
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

