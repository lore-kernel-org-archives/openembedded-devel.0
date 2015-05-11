Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2E05C6013D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 19:46:44 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so78989174igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 12:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=qOKicccYkrIjWICdFqYVzHXeH0btpW5RQENcBWlQ4GA=;
	b=tCF0QgojOb8cj8JMjPqDPas5ka8KR7N1FORvqJWTNkNz0D+zy2OfPXu+T5ycmFHS20
	qJ22sbEq0kjuJaVqYFjEzikhjD5fNtgCzQeJSBW5Nzu7bpe/UhaeYF6bgZZeQhXE+QqV
	DVudiBtiMKhol5b7uK1+j8tiZYC3VkpEHdZlwYhn+JoUQj3ZscGWE6HnbS5+pixYxLOM
	mbroGSOgSCABMqlK+TS1wfIHkb+Zw5Qi9Qqmw+aqHAch76VM/xIp6CMf2RNwgn9cO/zA
	FZSQASFk5Wz3ECpSo5fMuuDO5u5ZOZPQmN7SueX+rCMZ47zG3OOCJkyeT8Ntl1uqFQrh
	lB2A==
X-Received: by 10.42.164.7 with SMTP id e7mr12579578icy.70.1431373604078; Mon,
	11 May 2015 12:46:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.112.34 with HTTP; Mon, 11 May 2015 12:46:13 -0700 (PDT)
In-Reply-To: <CAMKF1srdavBqMeeuu-FThmD27WsA-Xiirf8KGi24rCMA-J1vgw@mail.gmail.com>
References: <1430795900-25986-1-git-send-email-akuster808@gmail.com>
	<20150511090952.GF2400@jama>
	<CAMKF1sp5Vg3U6kWfRfJgCZki-EKpmSmYCJiizS6K5GnkzSKb5g@mail.gmail.com>
	<20150511190027.GK2400@jama>
	<CAMKF1srdavBqMeeuu-FThmD27WsA-Xiirf8KGi24rCMA-J1vgw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 May 2015 12:46:13 -0700
Message-ID: <CAMKF1sr2r0mH+Oxp9K+nuBa4vrwYQn4ib_M2--AHgLAZidt1fQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] networkingmanager: QA warning for rdepends on polkit
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
X-List-Received-Date: Mon, 11 May 2015 19:46:45 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 11, 2015 at 12:43 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, May 11, 2015 at 12:00 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>> RDEPENDS adds dependency only between do_package tasks for build time
>> dependency you need do_configure depending on do_populate_sysroot
>
> its do_build which will depend on do_package_write task in case of RDEPENDS
> and do_package_write task will then recurse further to build it.

backtracking on warning

WARNING: QA Issue: networkmanager rdepends on polkit, but it isn't a
build dependency? [build-deps]

its confusing to me. It says 'rdepends' but then expects it in
build-dependency and not build-rdep or somesuch

but lets say it depends on buildtime then I agree adding it to third
place is needed and may be adding to 4th place too
if shlib is not detecting it.

