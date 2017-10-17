Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 43AFD78310
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 17:01:41 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id p87so1785562pfj.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 10:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SSOrZiKfwJ0Mvu0gzCu0kN5H64Hq9H5l0OAQLdwhbe4=;
	b=fzUTK7h4AO70H471Vmlm7d9SFjRayBlU1qTPuOtIdRNOrAV/rvybVFJAgKhnI44Y26
	VO49rdGFUnSbIoqhx9o1hSQhcVJR4xoXDfnO25iG7wcKKfmCn42ETRgvsytT0jvs/7r1
	/6YMmDgDBg1lnbBwwezOXNsBoFtqeBeUb03dcvgFHSb/ALDPkFb8qxOy/fQ+dM9aE2Ca
	09YOL0j0sMMpn80RKIvwsvJt7/bB4hr5TMFl/zzXMz4JJlsJIp5TIHs5HIDFaVrvituI
	Fas0GQ5CU2fLhuVHwgtlhvO4xIRwhMnwajrXyZ1cz8QVV/wqiYGLVFC6pbGF7jH8xz1O
	nEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SSOrZiKfwJ0Mvu0gzCu0kN5H64Hq9H5l0OAQLdwhbe4=;
	b=SGfjCW/BwOckfCArb+Zaa7hVEUh5e6NM6PQ3KjStpA0xyjyi4dJybShvhf0SKPIDeg
	pmH0MTtEC89xRra1MthdfN8fmtZ6z9OfvTU6YLklLABctxBkdWznXahQhSaZT2A+owBg
	FceMzypb0F69JxgoSbcVK1OVHBGf4dPNInLodchMO+aqeqqtO+1Yyd8xzGdrawvYgUbi
	Q3M8B3nIhAtEeDBnTxcuJHr+6QXzzRooOZmGmF3ai8/fhJ6QfFXpAR5wOaE0G+WA7HO2
	Pf3GNtTtmSEJX1azbbLu09++c9LifHuxI4dfv0QYJ2TTJBilZLGF6JKkQAsD6kbfgLoH
	LEJA==
X-Gm-Message-State: AMCzsaVoAMJbpFCaqbrDQEOcH+NhIgJyOSmdYeUt/CePDsa49ZQpGDk1
	n01aBMtOmr4DgYfFw9boouvSzNdoV+aAOVi9l2A=
X-Google-Smtp-Source: AOwi7QCpari+BRbfKprWLpC1sK156c3sdllR5Zk263n9/z3KHgSC3QH9lXU8X/l1IqgVpfYyDJ+KPNKla5enExlyNYs=
X-Received: by 10.99.51.72 with SMTP id z69mr11774231pgz.317.1508259703460;
	Tue, 17 Oct 2017 10:01:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Tue, 17 Oct 2017 10:01:13 -0700 (PDT)
In-Reply-To: <CA+chaQeZpm=FAXVETU4x9scAECJ3EURrjjo54JhddHeDBzXWkg@mail.gmail.com>
References: <cover.1507147924.git.paul.eggleton@linux.intel.com>
	<4da0611806ae98b10f6ae00200b3e292a068f940.1507147924.git.paul.eggleton@linux.intel.com>
	<CAMKF1sp6TG-LrCUq-FMp+z_mR6Yh-CiRXT0tDvJXVsYr+97VPg@mail.gmail.com>
	<20171017051134.GC9221@denix.org>
	<CAMKF1sro2nuRcguZzsVOj5B2dNzw6P5KKrkK5dmuzpk_eX8e6g@mail.gmail.com>
	<CA+chaQeZpm=FAXVETU4x9scAECJ3EURrjjo54JhddHeDBzXWkg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Oct 2017 10:01:13 -0700
Message-ID: <CAMKF1sqfVVcvf6Hz9tPF7xobT-P64z16mbTQNQ9+t=-kSwo2-A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 1/1] mdns: move from meta-intel-iot-middleware
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
X-List-Received-Date: Tue, 17 Oct 2017 17:01:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 17, 2017 at 9:58 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> I agree with Khem, I've merged oprofile even when it fails with musl,
> because that was the main reason for moving it from oe-core to meta-oe, but
> we don't want to burden Khem with more new musl issues when they are
> detected soon enough (my world builds don't use musl, so I depend on Khem to
> provide feedback when he can) .
>
> On Tue, Oct 17, 2017 at 6:23 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Mon, Oct 16, 2017 at 10:11 PM, Denys Dmytriyenko <denis@denix.org>
>> wrote:
>> > On Mon, Oct 16, 2017 at 09:19:25PM -0700, Khem Raj wrote:
>> >> On Wed, Oct 4, 2017 at 1:20 PM, Paul Eggleton
>> >> <paul.eggleton@linux.intel.com> wrote:
>> >> > The following improvements have been made over the recipe that was in
>> >> > meta-intel-iot-middleware (a layer which is no longer actively
>> >> > maintained):
>> >> >
>> >> > * Upgrade to latest upstream version (765.50.9)
>> >> > * Fix compilation failures by passing CC and LD
>> >> > * Fix "no GNU hash in the ELF binary" issue
>> >> > * Point S at the correct source subdirectory so that "make clean"
>> >> > works
>> >> > * Fix lack of soname on libdns_sd.so leading to missing RDEPENDS QA
>> >> > error
>> >> > * Add SUMMARY
>> >> >
>> >>
>> >>
>> >> This has been accepted into master but it fails to build with musl
>> >
>> > Is musl a requirement for meta-oe?
>>
>> We have fixed it to a point where we have around 10-12 recipes which
>> don't compile
>> with musl, and it would be better to keep this level as such and
>> especially when we
>> know its failing. its a requirement for oe-core

I do world builds on master-next with musl on qemumips and rpi3
continuously, with a known set of failures, if a new one shows up
I tend to report.

