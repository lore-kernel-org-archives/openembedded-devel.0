Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id F0E7F77BE2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 14:30:54 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id k6so2253427wre.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 07:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kO+jckMzVks7CDGiQhm5DVcEneNkY7OJr0KmghRyGOM=;
	b=d/nrxkjRf145rvQBLlT3Z7zSm8kbhAcspNSM8iFz+SUNKYBYyy2DyY/4Vq2z5FpEie
	yi8RnTCimfLn1bphEysoO/3nitjCSS8pBqKW/c8Tx13COJogdGdTAD0dSuFz9II7idnE
	G7lHZalv09zcbaoV0QEVhvvG9mO4QqjPFbdD0UpaFLfhNnYjpch33AVE2Omd8eF/GrWu
	9Ux7KvMaYmtc2HtfNEINxeIdURe2OUNRjXwMCIRHxv4bxRZkoBcddSk97ueq7Fj93Lxw
	a8EM3MAI0P1T2Wmu0+TogmNeJUl+tQJ4dgTo5aPHcPhY7z9K2K3tgW6vuZ4Plq1fxzDt
	ZW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kO+jckMzVks7CDGiQhm5DVcEneNkY7OJr0KmghRyGOM=;
	b=R2QL6UdMqCe6/UdJ1FxSMx0yueF4mpJP7CpClnhGDAk8H6YOXdnYxYLxD3+9k1V1I6
	spqBIEIB8F6+yQzcpYqHK3JT9f1LZ2aq4lMU3ELcmezoVpeuiz6NFTe+fimpapo9zZki
	en0FE6ni5VcDSAJn0f/V8aw6GG029/6abIIGOtK+vEJN/PnoNrPica8mmq49qCK36FYN
	xyxZVc84oJ9F8q/+syIpj/xjJzmdeyQERozyFP/ZQN4wrXWLKcEdgwWzn5OajkPsI3Ns
	59egDISh97GJoQTtjeJMZlvWpv0NMtBz0Y6tMCjEX9qLHzlEUXu455sjkjnHN3hYVElz
	l5+Q==
X-Gm-Message-State: AFeK/H1eN5y+IEGOuwqBckD0YDD8K2QWipr9L+CqYvcOZFI6vt8mGyAkXve/8U7oP8tnbhrvWTxImzqN+l1HOg==
X-Received: by 10.28.199.132 with SMTP id x126mr999158wmf.37.1490797855551;
	Wed, 29 Mar 2017 07:30:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Wed, 29 Mar 2017 07:30:24 -0700 (PDT)
In-Reply-To: <20170329142150.GD3298@jama>
References: <20170307071349.16444-1-raj.khem@gmail.com>
	<20170307071349.16444-4-raj.khem@gmail.com>
	<20170329110515.GC3298@jama>
	<CAMKF1sqMeBHPwBdv3CxsDcLEXTiw-stRdJLq0qV+U0sV+fTVsQ@mail.gmail.com>
	<20170329142150.GD3298@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Mar 2017 07:30:24 -0700
Message-ID: <CAMKF1sp=v6p2FhbcoAdZ69-frB_aXBgR4cVMJYX0Q122Ehh4PA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 04/14] gpm: Update to use git src uri
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
X-List-Received-Date: Wed, 29 Mar 2017 14:30:55 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 29, 2017 at 7:21 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Mar 29, 2017 at 07:06:44AM -0700, Khem Raj wrote:
>> >> +do_install_append () {
>> >> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
>> >> +        install -d ${D}${systemd_system_unitdir}
>> >> +        sed 's:@bindir@:${bindir}:' < ${WORKDIR}/gpm.service.in >${D}${systemd_system_unitdir}/gpm.service
>> >
>> > Did you forgot to add gpm.service.in in SRC_URI?
>>
>> I sent a V2 for this patch with another series i sent later. So you can drop it.
>> see
>>
>> https://patchwork.openembedded.org/patch/138243/
>
> I think this is the one I was testing and I still don't see
> gpm.service.in in SRC_URI, so it doesn't get unpacked in WORKDIR and the
> sed call fails.
>

yes drop this for now. I will send a v3 with next pull request.

> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

