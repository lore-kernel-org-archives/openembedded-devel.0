Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9311077968
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 14:10:22 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id l37so93363373wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 07:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VXlJB20941ulk9tqJtlVUBFmfvl/fapMESTT0pwJ3z8=;
	b=cR45HU+B5QUgKRvIsLq1NJBDglnb1AH4GLj0Dzco+Wp38ipMmKWg6cZ87q0dHnX/M7
	buD3z5VIgc2HDvrXKcfbS7vzCg+epf7XFleEZnjDTvXRV/tPjbJuKY+OFxBXPGQWHCDe
	+XdCIVPDJopxjzOx3gl6UdkTdp26aw1/aIc/j68uqWYAh8gE0l9wlLkS0vvpNF+cwtTC
	fY+A91gHNg77OYYE8g5ydMmBGAmfHGo4qqzhzIzjpufp1NDwdiQpLWVZFhyYWwL02aSX
	WzLmn07nhBaMWEsAnnuY7LoBP+6TiXGwVvHja6MT0DcHn1Qi2zwZAKTW69IwrJMyi4Q2
	qGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VXlJB20941ulk9tqJtlVUBFmfvl/fapMESTT0pwJ3z8=;
	b=YsKQOpESPlf6LkhV2DwsUhSJ+y/W1yMjmvO0Zw//Zvcv+D+ykPmew0dlxgrEuUe/BJ
	VnjSC/QGt+ygcX+SlbWK/tSpebcN9hDjIhQ0ZNjKVbDp9sJpO03FklCt+DUcJsDXTfU4
	dbSKj+OVYQruvtExkuqemIV9Nc+mJRxkj+6GB6mzp2j/wnIkDnkCVngYtWTswZGj1Tr2
	sIF1LMdTVOblefBupTnBWOlNDSbPGnPiooI36vbLBWaEPl5rg0+IxfOLsrLZ6X7CZjKO
	X0bXSzzCd26t3xmUR6CItGhG7r+DVb8rZURLw4fz2Dybn0satuM6U99yf7h3yFATYLAF
	02QA==
X-Gm-Message-State: AFeK/H0DNkToJBO64I+Ss4scwBK/1BkslmmUAUL8U78CVPHv/vaOBFo6OVmxPnnw+QlEDglNoXs50SYxs+62Vg==
X-Received: by 10.223.154.149 with SMTP id a21mr24926213wrc.145.1490019023245; 
	Mon, 20 Mar 2017 07:10:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Mon, 20 Mar 2017 07:10:22 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1703201002240.20418@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703200753460.9821@uk63952.mitel.com>
	<CALbNGRSQiaNCD4gjkxAO0FXY5Y7ZZmo0aQ9u6TZQ4uFusR2ugQ@mail.gmail.com>
	<CA+chaQeVXMSEXuCF7F2jRG4-TBzFWkGMWv=Gz=ksD6Z=tC4C1Q@mail.gmail.com>
	<alpine.LFD.2.20.1703201002240.20418@uk63952.mitel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 20 Mar 2017 15:10:22 +0100
Message-ID: <CA+chaQe7Rj2zH_E5gjO-BCrVUgT6DZD-Ohfp0f2n17z=bu2wgQ@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: Re: blacklisted accel-ppp (under binutils-2.27) seems to compile under binutils-2.28
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
X-List-Received-Date: Mon, 20 Mar 2017 14:10:22 -0000
Content-Type: text/plain; charset=UTF-8

Without "_pn-binutils".

On Mon, Mar 20, 2017 at 3:05 PM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

> On Mon, 20 Mar 2017, Martin Jansa wrote:
>
> > Yes, sending a patch is OK, but you might want to test it with gold
> > enabled, most linking errors are usually reproducible only when gold
> > is enabled.
>
>   just to be clear, need i add just this line to my local.conf?
>
> DISTRO_FEATURES_append_pn-binutils = " ld-is-gold"
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
>

