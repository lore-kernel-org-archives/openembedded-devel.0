Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yw0-f171.google.com (mail-yw0-f171.google.com
	[209.85.161.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1615B60602
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jan 2017 12:52:49 +0000 (UTC)
Received: by mail-yw0-f171.google.com with SMTP id l75so67679119ywb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jan 2017 04:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H7gAbdp6frbC9MlBgCb8PFCG+rClzfgcdGvFO+SEOww=;
	b=y9JWkQphKV/nAfQEsyOWAnhWJab8GGTO4FzhvckbMIK5Et1ceyzajiLCoxAeYPeFzp
	9+SwyXPGBDf+9+cxsqeONIprxnFnu/btXbKBmTq2qbXKWwJ9YoxChTNzkjpC2ERxQlq4
	5X6dKXVicbfsZweXaE4ino8l8qlzU56TLL9jpXPtKyvVntR4d291dYlkPQwuZ+L2RKYt
	b5koA3bRCybqRI04ktwBSfF+D9QkJ37NfrlMGJzRwmVexXxJgcwBPAV/DB1PyjGiUJqv
	Dn1iibMsY/YZLZ2a2R8iMnM8jVFqN0aRnSreAT7bswqazNs8k9lgtiAoxJJnRIqAnmW/
	Z1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H7gAbdp6frbC9MlBgCb8PFCG+rClzfgcdGvFO+SEOww=;
	b=ptVNlEABgFRDUCass4bzfreVSfqCPPjOsOoIP7jLSFkKxPfmlZiQ0uL7RNh4PrQMIm
	dZJ06Zf8T+hSRX1AOHOBz11OOdCdy7v/LzPPK5xp5qKT7iprrCYMWRbVu5TueYuiGwoW
	OTiW+ixlK+GigRd/qDuUMrzQylgsk6j2nEfhQpQQ5hAcvB9nVenG+axbvSXh4kCqHWkA
	9YzXbxnT8PVYPZUr9Y89t49dfXVnzl1uZISbK+sZ0NCicPopRIVabRRdVXxyBJIet5+3
	2s8OVARZOO0arwSa8hjzMs4kZ1iGGYl+ZsEQAcokYuYTuIi2wbnzy8fnmP5mjyPkNFBf
	lZrw==
X-Gm-Message-State: AIkVDXJS2u8WZsY+6s1GIFHo3b+apbrr12kKsgzj2z/d6V9jzMuJPpyJO92/1LuKP3lgdcZnhIovSI6QSgH5HjNW
X-Received: by 10.129.110.133 with SMTP id j127mr25475373ywc.214.1484571169866;
	Mon, 16 Jan 2017 04:52:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.13.234.11 with HTTP; Mon, 16 Jan 2017 04:52:19 -0800 (PST)
In-Reply-To: <CAMjhiJg64VtLByh0sv2=d+xu7LJ6LHBccP-0A8Y7Q54XGAa91Q@mail.gmail.com>
References: <CAMjhiJiu5isiTgwjrQtigKrvY7NzgdB5bsrn8bbxXu8q7W=bKw@mail.gmail.com>
	<7c171e1a-7151-6e6a-cfb9-7a06b9dec0df@gmail.com>
	<CAMjhiJg64VtLByh0sv2=d+xu7LJ6LHBccP-0A8Y7Q54XGAa91Q@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 16 Jan 2017 14:52:19 +0200
Message-ID: <CAHiDW_F9_OwNakT-Jt=oAP6Pbc0XbZebqRVsEonSEck-Zd9orw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: /usr merge, stateless systems and atomic updates w/ OpenEmbedded?
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
X-List-Received-Date: Mon, 16 Jan 2017 12:52:50 -0000
Content-Type: text/plain; charset=UTF-8

On 15 January 2017 at 01:41, Leon Woestenberg <leon@sidebranch.com> wrote:

> Hello Khem,
>
> I know outside of OE it is more and more common place, such as Project
> Atomic.
>
> Re-reading some of the material I have found, I found that Chen Qi of Wind
> River had something going.
>
> http://lists.openembedded.org/pipermail/openembedded-core/
> 2014-December/099616.html
>
> >* > Several days ago, I tried to do /usr merge in OE (like what Fedora and
> *>* > Arch does). It turned out that we need to patch several packages to
> make
> *>* > things work.
> *>* >
> *>* > (I haven't sent out the patches because it's just some initial
> *>* > investigation and I'm not sure if people want this feature or not.)
> *>* >
> *>* > If you want this feature in OE, please open a bug/enhancement in
> *>* > bugzilla https://bugzilla.yoctoproject.org/
> <https://bugzilla.yoctoproject.org/> to see if the community
> *>* > wants it or not.
> *>* >
> *>* > Regards,
> *>* > Chen Qi*
>
> and in Yocto an enhancement is going for usrmerge:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=7040


Hi Leon,

Me and Amarnath Valluri have been testing "merged /usr" this month: I
expect there will be a oe-core patchset for review later this week -- I'll
CC you when that happens.

The possible approaches seem to be:
 1) Modify $base_bindir (et al) so that all recipes actually install under
/usr/, fix recipes that misbehave
 2) Don't modify $base_bindir (et al), just make sure the symlinks (like
/bin -> /usr/bin) are there when packages are installed on the rootfs

Both approaches have some package management related issues but can be made
to work (we're leaning towards #1 at the moment).

I'm not promising anything about Stateless yet.

Jussi

