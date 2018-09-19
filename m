Return-Path: <twoerner@gmail.com>
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by mail.openembedded.org (Postfix) with ESMTP id 75D1F79319
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2018 05:18:58 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id p6-v6so3817332ljc.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 22:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Z2gAFlHnzx/MdLqPpaBRE5x5BpVL+YnXCKX4Wzk3lF4=;
	b=S7Sj+0Lba6iXFAGG8WEHnyYhv4/73WCMiTXGbpcTPQS/7kJU3J00JCgSQMRJZZq2Xn
	sHpQJFMV9SfeHMZr6Gtma/hdY+l4K+d8wBWS0tO6tKdOim351/cgzIFhc3mLt9aQthGR
	0vrjxg5LasQ19kH7LEXQWzePdaIrjd97zBh3nrP1DeR6Jfgcf7jRjQiN1P/Zgka/QAd3
	zWo6DOY+Qpifdm9N1nCeSaGpJnungR4ZYGSF1JHyydGeqaOcne/zeom/tsNMgjWoXP/5
	6FLhkBIaCzctC/R0PHv92awSMjveTm/1DZcWeVdLy3zNDVsRJfJb7KytJn3gnQnbV7Mb
	eErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Z2gAFlHnzx/MdLqPpaBRE5x5BpVL+YnXCKX4Wzk3lF4=;
	b=Ds8CQJq2Uui4v7fZ2WKmbefpqJMKM90ZEp6iC1QajE9B+EoRSe5PtHXseJp0cw07w+
	DHYsQD+5P0hMwTIh1qa78v1sSjeJOUlNU24qBIQDFxA89ncy8PKih+1a6es/pyVkl2vH
	B56OX8e3VsLt9Mw9SU9FJZ/cmFiREFBFf/bXHCINt5MPqTPAn2oVIVTohuVN4fJut6Cr
	gXlYHkGb/2f3sTPJXzAj53S2mL+FD3ltOhOVWMIuS/CYyxWhNdcmMjP1izsNVNsZj8FJ
	FAxECMDEPnJHGCIYI4RRuM2r//hCWJWoI8tz10rs7b4IfOMWNbZMscSjRsJ5Cef3oXww
	rBVQ==
X-Gm-Message-State: APzg51Ac8tf7U6ys2wqU+2sVaM+y9jWa0IMUXtBMnkpH33g5Xolvw4Zn
	3q4cssRHRai60wk406B+coDC/2aT9R3RhS5mxbw=
X-Google-Smtp-Source: ANB0VdbW1Sh0jv3QNTKzjSM1/ittxEqeema5prQKwQw1LAlLvcp23igp0gP1K7mYGJhCoJUke1u1u9XJ8EbonRcP/Bw=
X-Received: by 2002:a2e:9057:: with SMTP id
	n23-v6mr5750812ljg.44.1537334338842; 
	Tue, 18 Sep 2018 22:18:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:6b14:0:0:0:0:0 with HTTP; Tue, 18 Sep 2018 22:18:58
	-0700 (PDT)
In-Reply-To: <07cd7df8-ea07-3cda-e742-dca4e7407f42@gmail.com>
References: <1530121431-7102-1-git-send-email-daniel.diaz@linaro.org>
	<CAHUNapSw15o5NeYXieviKstPeynfaPaGsF+pCUuZP3GXE68mCw@mail.gmail.com>
	<07cd7df8-ea07-3cda-e742-dca4e7407f42@gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 19 Sep 2018 01:18:58 -0400
Message-ID: <CAHUNapQXBVdrWc5GnPr0zw_We-vQHzOyngdffHCjz6quVUjABQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] bpftool: add new recipe
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
X-List-Received-Date: Wed, 19 Sep 2018 05:18:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 19, 2018 at 12:36 AM, akuster808 <akuster808@gmail.com> wrote:

> On 09/18/2018 09:23 PM, Trevor Woerner wrote:
> > This recipe only works for kernels > 4.14-ish.
> > Some BSP layers aren't there yet (e.g. meta-qcom, meta-raspberrypi)
> > Is there an elegant way to handle this situation?
> Can you rdpends on a kernel version ?
>

Interesting, I hadn't noticed versioned RDEPENDS before.

I'm not sure what I'd use as the package. linux? linux-image? I've tried a
bunch of variations on the following incantation, but nothing seems to
trigger (testing specifically with rpi):

RDEPENDS_${PN} = "kernel-image-zimage (>= 4.15)"

