Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 64463601C7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 13:19:10 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id q8so1484650pfh.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 05:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Qt1/OBLSVZHLl069TJ3wCy4VRsu/k0DGxLuPUhCj148=;
	b=LevxkDs3+ekMBAc316X/qjjXuzEJvmt3duaDAb2GhR+7dm2VdwkUGoVrbyZiHjtZ2e
	nzXimE0mboJY/69Wgsx47cVnV7a7U7Rle5aAtsNgHGXQ4E4694OjIg9RHxRWbSsLy/+n
	3CIU00URsqA4PLXcfzx084QmP97IXXLMZHE/z643/VYseX93iVlw8r0c/XylWCpPH6XT
	YRdu/DbOo8c5wGj8ogiMvqyh3OVfhYsyqacEERkcJg5uGG6aSsbdV9kx5V0N1H28Szco
	p1qOW1HPg+/9nJG6fSTTSwZJNFMm9wpYQI9t+fP6UcaqpT0okYrPhMxAFug4f3nhUsA0
	DH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Qt1/OBLSVZHLl069TJ3wCy4VRsu/k0DGxLuPUhCj148=;
	b=m2MbBsejapIBU8xLMS0jzrXQD1D7mSrY1NEtbc9oIVtNL2AQ9kj2h3TD5wbSNO+0VI
	SSCEelhsIM+/206mr/2VR0mKdsScvMBnIi1zZKHxlLJAdp82tk6VGpBizufMUE5X1ctC
	JxO2fTgAucM2ixF+JXinwf8jyccsN+OBAy3YZPcvy/GnAqLc0P4YkSrb2kGOp7Tjo7Uy
	T4SeY9mhAB3xm+6vNxlCz2Qg6BK2xOnkwg4V+bq1+5NUGXjU0eLBHjihARbMgT8RlW6A
	bA4ZBrA3Duv0khCTQ1WOwuH07kZVvMa9zhuMAVLbtYfCvul6JawD1/eaSLEkcq673gwT
	3qSQ==
X-Gm-Message-State: APjAAAWVhYMyyngr1tP4V/xtX+Y7VVmheOkGXwja1tkw/j7J5CjcoKk5
	mispWILK9b6bDMMSIiXz0z/ARXnVpL0psBaqY0kgzjfA
X-Google-Smtp-Source: APXvYqwbzhUfq/ufPWJh7+0MawgV9zzKDA5Zoa/SjNPAgqdfg6b55IV72e5F0VDJcgBOECk+37QOI7kXxb1PCmgYnQk=
X-Received: by 2002:a0c:f513:: with SMTP id j19mr3044119qvm.206.1580364883888; 
	Wed, 29 Jan 2020 22:14:43 -0800 (PST)
MIME-Version: 1.0
References: <20200128215353.3594210-1-raj.khem@gmail.com>
	<fc466017-0803-06e9-ebc5-d8c6867a5229@gmail.com>
In-Reply-To: <fc466017-0803-06e9-ebc5-d8c6867a5229@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Jan 2020 22:14:17 -0800
Message-ID: <CAMKF1speJWXaYYMPzTvARDDbAQG=RGv6mRJJ15iO+3acriWR+Q@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 1/3] squid: Link with libatomic on riscv
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 29, 2020 at 9:32 PM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 1/28/20 1:53 PM, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Is this for the same reason as for nodejs Cento7 fix ?
>

pretty much same problem, although a better fix is to detect it
during build but every build system has its own nuance.

> - armin
> > ---
> >  meta-networking/recipes-daemons/squid/squid_4.9.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-networking/recipes-daemons/squid/squid_4.9.bb b/meta-networking/recipes-daemons/squid/squid_4.9.bb
> > index 6f202cf401..19949acd84 100644
> > --- a/meta-networking/recipes-daemons/squid/squid_4.9.bb
> > +++ b/meta-networking/recipes-daemons/squid/squid_4.9.bb
> > @@ -40,6 +40,8 @@ inherit autotools pkgconfig useradd ptest perlnative
> >
> >  LDFLAGS_append_mipsarch = " -latomic"
> >  LDFLAGS_append_powerpc = " -latomic"
> > +LDFLAGS_append_riscv64 = " -latomic"
> > +LDFLAGS_append_riscv32 = " -latomic"
> >
> >  USERADD_PACKAGES = "${PN}"
> >  USERADD_PARAM_${PN} = "--system --no-create-home --home-dir /var/run/squid --shell /bin/false --user-group squid"
>

