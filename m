Return-Path: <krussell7711@gmail.com>
Received: from mail-yb0-f195.google.com (mail-yb0-f195.google.com
	[209.85.213.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3111760620
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 13:23:18 +0000 (UTC)
Received: by mail-yb0-f195.google.com with SMTP id e31so450796ybi.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 06:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WSXF3/iX28Ip890sOC2zPl3u5YoNGSh9sxkz/g1O+dk=;
	b=zBEoBxTFX3+uN7YeMLdUZLG34ZMgoBuEIKYe6JdxBgXCYvx6w2UelGB42RM7IR6BC0
	LZTQgrw24LsGrHKtxQ/+j14Jx6GQ2G5VDHDXATTLykLXqRnDJoz2AlHG9Be9B56C5MX2
	WH6XvjkfToUzgmSvauiOFPS/arOHC3+LR7x53qPiZWFSO2YjBJ+j7NPl+RdMVBCAi2i0
	vrUXSiSYtaA3IkUXp5EvTUh1ebDn+vE6uvvlh05bK1LeTt4rCRXPem6N8YOQAUMUJnDb
	j7HtKRxQP0pCaEkbnXhOIWEE0dBXBMiKVT4KSml1GCitmBMxuZgYt77BFx1AI46wzv2D
	/Jaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WSXF3/iX28Ip890sOC2zPl3u5YoNGSh9sxkz/g1O+dk=;
	b=HOAdrWQZRJjDAy+Qp9OCRtUv2Jl+rBjz7UM9fdZNleZj9K7jYaay7auWgaxP+fBBCI
	RpdABI9gXX0aFU05+ek27m5dK1e3kGo/orz5ajv9r6K8pdQcLLwNHCcB0Fk6ct0u/hic
	ATc2aI3T+O9C9sNxZ+8kbLfcj3yn3QB1h2N8mWWAfiHLo2Mzd9GjoyKrGlPSp9ptzNRj
	rObggTZ98DlqqWI5meR4XuNV/vPmkKG9ECGeWuDesdrzRMULiOrI4VIDl47e+QvuSVun
	A7aksRQNyGvITNJWggXkDQzkNsjt0YHBuiOOphlczzGhvTNfGEjc/xy3GTPc5kRl3BQz
	GYXA==
X-Gm-Message-State: AEkooutIVaVMrm701FkzvNqCSN6L5ttekhhwS0xuCxdO1EWW4ooHR1H6PrRNy5swlVTi5cOSLJJg8XnXHV5WQg==
X-Received: by 10.37.36.196 with SMTP id k187mr2148032ybk.187.1472044999287;
	Wed, 24 Aug 2016 06:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <1471643882-14235-1-git-send-email-bkylerussell@gmail.com>
	<1471643882-14235-2-git-send-email-bkylerussell@gmail.com>
	<20160824130001.GC13684@mbabyjoh-desk.ger.corp.intel.com>
In-Reply-To: <20160824130001.GC13684@mbabyjoh-desk.ger.corp.intel.com>
From: Kyle Russell <bkylerussell@gmail.com>
Date: Wed, 24 Aug 2016 13:23:08 +0000
Message-ID: <CAFrQVPMzPmdCE-xPZhhW=myuzSBgh01srcC75pygq2xgQFDxvA@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH 2/2] Reimplement helper method for parallelizing JDK builds
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
X-List-Received-Date: Wed, 24 Aug 2016 13:23:19 -0000
Content-Type: text/plain; charset=UTF-8

Sure thing.

On Wed, Aug 24, 2016, 9:00 AM Maxin B. John <maxin.john@intel.com> wrote:

> Hi,
>
> On Fri, Aug 19, 2016 at 05:58:02PM -0400, Kyle Russell wrote:
> > Simplifies duplicated implementation across multiple recipes that all
> > inherited from java.bbclass.
> >
> > Previously implementation was not flexible in supporting other make
> > job-limiting flags (like -l for load) that are typically passed in
> > through PARALLEL_MAKE.  (OpenJDK doesn't know about these other flags
> > that might have gotten tagged on after the value for -j.)
> >
> > Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
> > ---
> >  classes/java.bbclass                      | 17 ++++++++++++++++
> >  recipes-core/icedtea/icedtea7-native.inc  | 23 +---------------------
> >  recipes-core/openjdk/openjdk-7-common.inc | 32
> +------------------------------
> >  recipes-core/openjdk/openjdk-8-common.inc | 21 --------------------
> >  recipes-core/openjdk/openjdk-8-cross.inc  |  6 +++---
> >  recipes-core/openjdk/openjdk-8-native.inc |  2 +-
> >  6 files changed, 23 insertions(+), 78 deletions(-)
>
> Can you please rebase this on the latest master branch and resend?
>
> <snip>
>
> Best Regards,
> Maxin
>

