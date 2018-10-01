Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7439A793B7
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Oct 2018 16:13:12 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id q5-v6so5479641qki.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Oct 2018 09:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=z5rRB2B+s/vuOkUBTZSZvpqHh+d+H+Cfpohcsnubq9o=;
	b=kjIiHRbAiPqo6FffWkoe/lZn4Rpk7vY/cSaapABT0tuCLcTd/OO2ks2pZecCJmY3H/
	1DTuXI99wyfJPMetqY6lsq2rEKj/tIvra0tQBJ+vC3UOZkiVghpKaYop7JKB9MYnG//3
	n8E1t03v1w2JLqOTHPcNg8uooJ56JHVL/obeeYJgPeBCJyF2XQFmQmbdPDN+KTlrc63u
	cQzNK/BDzk9IchcFfYN09Nvd+iWV6Hj9/rzrZcwYpN3FTny92vhe7Fbe+cb+7k1pACkc
	F30OCYDRnzy8W3Qrpf4luYX7832DOPlQmdsFce/ybnA8z23xE0RamgoDWFM2f9eQhhzL
	B7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=z5rRB2B+s/vuOkUBTZSZvpqHh+d+H+Cfpohcsnubq9o=;
	b=HcTEFNtczlTGeXGmgDEUTfbW4uotn55gzaqdN1Ml6G8NbDGGq0b/RX6X7VLXOZ7O8n
	9E0CcvNG9fzokNTedDx6OTb2GpDRsE4qB3DLm+1mIdF0Ufv6V1R9cpnsNOOEoBWZisFY
	uGrwy6AsMADnR+4/NhoGwSjExxCuimmaRezoCD6sXvhk1UM/CN/dTTxk2QWv+KAmfHIY
	rtSAGYPIh/h+Y0MOYatYA/5x3Rz0exbpPwapiT1g1qiFVAvHvC2uzaRQ4ugKczStH1Aq
	Sv4dmdpnlSAHy0F3wv9pZs7zwjlE/+bod7jcjw8LpaZz/Nyd8u03qx3GcWt3D0ATCvds
	hjOA==
X-Gm-Message-State: ABuFfogExph3fyswuUrPAWGYHErx7L1bpR7QxHtdXHE5otF2I3DJY6W0
	XKgjEYWrvrKM/cXqQRY4Qusgo/ZLu1xHYvLO06hTQ7WY
X-Google-Smtp-Source: ACcGV63QwLeoarzsWJF38yCecS4WZynXySINBiIXyNfKXjm86WJTee+J4mna+JdUvbVDCQwLsCJV9pw0lMVB5kOkxHM=
X-Received: by 2002:a37:9904:: with SMTP id
	b4-v6mr8894894qke.102.1538410392933; 
	Mon, 01 Oct 2018 09:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <20180918082608.1088-1-max+openembedded@blarg.de>
	<CAMKF1spwKoe9+NqUsU6DZ0PvSWtT9N3-uPEUS8Y7n3heCHeM8A@mail.gmail.com>
	<20180927125422.6pt6cpm2hsp35nbj@swift.blarg.de>
In-Reply-To: <20180927125422.6pt6cpm2hsp35nbj@swift.blarg.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Oct 2018 09:12:46 -0700
Message-ID: <CAMKF1sqVqDtx688PAYBOX-OEWUBtX48L=d5CxMiz_rkKRULrYg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/8] [meta-oe] devtools/php: remove the failing ${D}/${TMPDIR} code
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
X-List-Received-Date: Mon, 01 Oct 2018 16:13:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 27, 2018 at 5:54 AM Max Kellermann
<max+openembedded@blarg.de> wrote:
>
> On 2018/09/24 20:48, Khem Raj <raj.khem@gmail.com> wrote:
> > http://errors.yoctoproject.org/Errors/Details/193970/
>
> Hm, I tried to go back and forth to find what is causing this
> nonsensical path.  There must be be something which concatenates two
> absolute paths, but I can't reproduce it.
>
> In any case, the code which my patch removed makes the problem only
> worse.  My build directory happens to be inside /usr/src/, and so the
> shell script finally attempts to remove /usr/ which is non-empty,
> which crashes the build.
>
> Do you have an idea how to reproduce these strange paths?
>

Build info has all needed bits you need and if you want to use the
distro I use to validate
then you can try

https://github.com/YoeDistro/yoe-distro

> Max

