Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 42902611E1
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2020 01:50:03 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id v15so3016051qto.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2020 17:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xBnyE6NNTpWr7bw/oGMcBsCZKLyPhmR8cVCDRrbT8IQ=;
	b=IQvT6ZPIRPShNZh7U/JfG4bxgT42XkBHLDrxo1JSLFDECnkp9A3THd+DPQVb2CLJNm
	jMRp9nPs8sKQuK9sjAGzGtC9l8tTihmfm4yIOiTIn39do1RgoAZipeQWUh3e2R3fdwNP
	f7OgFR50uRkFmDa0ucP88fJxs2tKFXgoMyuCb5aDcax2rHmLeB2PdnATHS5sRjTUFR0m
	gu6ARgsh7zM3/9mmfXVcsMOzJBxUBnAcfIMC/QfSK2j6uMH8uot/fQmu9aXLjP7s8jAo
	TXjsvBJRqajxtK3CpXqQZBxdCeLFQ0ntjc6/jORfKYAbsajbKr+HgxLhJzGzi2j1wuox
	D6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xBnyE6NNTpWr7bw/oGMcBsCZKLyPhmR8cVCDRrbT8IQ=;
	b=dIzO93dVnJHprHDXllq2s0qiWuIShceVysL0EvostaNJioK771ovUio/CScypcIZWq
	Zsq1lfaD7t7qJe9MMMIVVzedN7zR2XL0B8Rxs325DmS8/nMbITQeS+7veIlhSaCnr7AD
	/8GTmffzRMFLc77iAVEPAiY+3F/47zM4XL+vuT7uNjdQY5+EPyfbxqNzdyZ3M00bghsq
	jchHH1dbDsU3tZaABX+Hycy0fddlE5l8Q4P9sCmSsH3BMfxUtNZUJGiCteQ72LmdntL+
	TvBDvKuObgjifTEeWXyx8Akz6mhRZUXkjuaMBU6o7rM5dM0GFwRdm2yYbOw4LxLrV4tF
	v2wA==
X-Gm-Message-State: ANhLgQ1YS1ZH1lcmoJxcJNPX9BMmKYHI8y1rQQ3YFqiULZEvvrRnsjbQ
	GhuCErB9DKB9qtzZ4qsTd62+A81eNgWt3G9X7jI=
X-Google-Smtp-Source: ADFU+vtNFuXVpPxF4PWdtKqffcLyJ72M3aPzRYU+tkwn9JxN7ukFqkLL4ZgEOA3vE9qs2Zx7dPD38edkXswLIanzW+Y=
X-Received: by 2002:ac8:6754:: with SMTP id n20mr5025592qtp.293.1583373003950; 
	Wed, 04 Mar 2020 17:50:03 -0800 (PST)
MIME-Version: 1.0
References: <20200304122811.16655-1-leo.yan@linaro.org>
	<alpine.LFD.2.21.2003041103340.29352@godzilla.spiteful.org>
	<a7ae7094-c8b4-f0cc-357f-c6cce1231e49@gmail.com>
	<20200305014347.GA5761@leoy-ThinkPad-X240s>
In-Reply-To: <20200305014347.GA5761@leoy-ThinkPad-X240s>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Mar 2020 17:49:37 -0800
Message-ID: <CAMKF1sqP3hVvMdi-itWH6VmHQX6Ri5Cj-=0nQyyacDW2tCFBWg@mail.gmail.com>
To: Leo Yan <leo.yan@linaro.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Mike Leach <mike.leach@linaro.org>
Subject: Re: [PATCH v1] OpenCSD: Support for Arm CoreSight decode lib
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
X-List-Received-Date: Thu, 05 Mar 2020 01:50:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 4, 2020 at 5:43 PM Leo Yan <leo.yan@linaro.org> wrote:
>
> Hi all,
>
> On Wed, Mar 04, 2020 at 11:19:37AM -0800, Khem Raj wrote:
> >
> >
> > On 3/4/20 8:05 AM, Scott Murray wrote:
> > > On Wed, 4 Mar 2020, Leo Yan wrote:
> > >
> > > > This recipe is to support OpenCSD, which is an open source
> > > > CoreSight trace decode library and utility.
> > >
> > > Just a thought, this seems like the kind of thing that might make sense
> > > for the new meta-arm layer that Jon has been working up?
>
> Thanks for the suggestion, Scott.
>
> To be honest, I didn't know meta-arm layer before; seems to me it makes
> sense to integrate this recipe into meta-arm rather than
> meta-openembedded.  Will explain more for Khem's question.
>
> > it also says x86_64 in COMPATIBLE_HOST, while coresight seems to be arm
> > specific is this not supposed to be so ?
>
> OpenCSD lib is dedicated to be used for Arm CoreSight IP, but it can
> be built both for x86_64's and Arm64's distro.
>
> The main usage case is to enable OpenCSD lib for Arm64 building, and the
> users can decode the trace data with Perf/OpenCSD in the same distro.
> Though I set COMPATIBLE_HOST for x86_64, it would be seldom to do cross
> analysis (e.g. capture trace data in OE/Arm64 and copy the perf data to
> OE/x86_64 for analysis).
>
> For this reason, it's good to maintain this recipe in meta-arm.  If no
> objection, I will prepare patch for meta-arm.

Makes sense in meta-arm

>
> Thanks,
> Leo

