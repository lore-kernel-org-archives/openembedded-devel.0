Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4F1C360125
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 12:18:22 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id bi2so63623300igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 05:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Yzj0rl7myPw5yzQI6tLRW5ph3CqoNeOPaCQuDXLn9Ao=;
	b=lUkDE9lvXfLE0qnhbj5oqKAY1fEje+f8/bgT3r2vZlV8vSu8FuNsQ5VCeTCPfmUw64
	3yDpgID4sYGRHHJPEeW8YDkgGsSm9ja5XVDgmf4Q0of6Bpwy8hb9YxWdxkbHh3xJvuWd
	my0EwZ+p/v20dpesY9JRHDpcv3sxd21ut3RedJgs2r04McuSElFW0umqMJgzWtdn8JZ0
	IrxG0ZoD7BUH/JTtScX79fJKurMXqi2wppFejOlQ86cDf0XvAIrT7T5TP6nYFZntjotG
	nEfJH9IWWu6v1lDDwHD8cxpUVeQyd7wYC9h717RKH1+aBHRgQpicu1uhJwT2/+5oHEGT
	lWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Yzj0rl7myPw5yzQI6tLRW5ph3CqoNeOPaCQuDXLn9Ao=;
	b=RQCebs0h3kxgBIiGMq/EvhBfgjiq0Dg49EPiT+ZGuW5Lqv0GJizPFPXHPyTQDKZVHC
	Q9mk4gtbsC3NkEhKh2s68qbsPkb4g3s8zMz3mMDRLgv16aQHVRy1TRvAfpCVXou6EYcm
	kY9jS0n9p7eyD7G5T2qrLsxQ+o4cml49IW9PQiPewr07wYXZMcja1S5JWWjnJH5Bo047
	yp3RbtwExlzwrB68hmriSwAfG6h00UyAHxH1hmSFU4shFQjjXwPffDr4iVODfzC+SrsF
	7i6D1lSviLNT8fMuYH265yyXUkNMsKICbOXiiv5x4+xByfPfM7YXrS6C5UPHXCSXRTm+
	RAug==
X-Gm-Message-State: AOPr4FXAo6V0El8EbT/F0j2ISLUKWix2puqzuFSF4gTIvG8tz5E0BvT1yLbpaJ24T5aHHNbfjWwhidUHXZiBmzp7
X-Received: by 10.50.150.1 with SMTP id ue1mr11753092igb.52.1461586702808;
	Mon, 25 Apr 2016 05:18:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.106 with HTTP; Mon, 25 Apr 2016 05:18:03 -0700 (PDT)
In-Reply-To: <1461576912-2943-1-git-send-email-daicy.fnst@cn.fujitsu.com>
References: <570B676B.1080905@mlbassoc.com>
	<1461576912-2943-1-git-send-email-daicy.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Apr 2016 13:18:03 +0100
Message-ID: <CAJTo0LYJ=9m9z4-4pE6dD2mRZNGVzGte5ktCYEWP4Bw58qAd6w@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH v2] hwdata: add new recipe
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
X-List-Received-Date: Mon, 25 Apr 2016 12:18:24 -0000
Content-Type: text/plain; charset=UTF-8

On 25 April 2016 at 10:35, Dai Caiyun <daicy.fnst@cn.fujitsu.com> wrote:

> +do_compile() {
> +}
> +
> +do_install() {
> +    install -m 0744 -d ${D}${sysconfdir}/modprobe.d
> +    install -m 0644 -p ${S}/blacklist.conf ${D}/${sysconfdir}/modprobe.d
> +    install -m 0744 -d ${D}${datadir}/${PN}
> +    install -m 0644 -p ${S}/*.ids ${D}${datadir}/${PN}
> +    install -m 0644 -p ${S}/oui.txt ${D}${datadir}/${PN}
> +}
>

So upstream ships a hand-coded configure script that writes a Makefile.inc
that the hand-crafted (but sane) Makefile then reads.  I'd do this:

do_configure() {
  ${S}/configure --datadir=${datadir} --libdir=${libdir}
}

do_install() {
  oe_runmake install DESTDIR=${D}
}

This is untested, but should work and use the makefile that upstream
provides, instead of replicating the install logic.

Ross

