Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 401C378307
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 19:06:24 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id y7so2166619pgb.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 12:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SKsqkpSfBK0T53Qu+yzXGlqvSTc1/h1HpdZR+sM0g3A=;
	b=pcaHvmGFBYk52B8BwJCMCcGJvr3/DDlXve2HSh8fHTtwH84Szs1sIyOX9LDZkzsJEo
	APCZzHGws9mjWPpDd+FRCS7yFzBucb2TfxXDtTsZ0iP3X7wMxj7Zt4sPKlVwMHoRDVlC
	vLIYkOkqlAjIYvOqN+EFAoIqI2FDxv3l1TDdj6VIH2t3WqJio8AnPP1YyZ7/8MwScVBO
	IyzDQNNRQf5CMW86/KdPVwgetYqy/1ABMIP1Pz5cjI4m7n6G3W2ewQR3OOV7jeIS3dBL
	BEWlj6zRyy55JK5Er9FErlk1D1R14Emyy7tAoq1qx26nenkbmfAD92JBYWRCUz1a/wpz
	DBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SKsqkpSfBK0T53Qu+yzXGlqvSTc1/h1HpdZR+sM0g3A=;
	b=PnsuhfkAnLD5cSfimnq9RvKrRNzPlfGID1asqHBc+B+nIY2sP49jkIdgfGQg3Z32lE
	My9QW/NjVlmkAGQYdjmSk0ciLmthqqrAPARD625Kfb5l5nI5Ecfan0+r7UnaNCdXjMck
	sg0gEBfU76mt1ePqSH/+9FlO5hLockABiil2yicHn1++210DfqYvQq2ptWPYFf5LSQky
	liz8anGyICQoygipjGSIGTY8YrbdO6C+Wd4+6oUsqOirdf5fYz+yuCJcTgIIMbZyHtQe
	/QgnzrS1gBKoCVjouFFLMbgNxwR1sT4LwGzB9VopMzLL4TPGBUBDg9tkKshjL8TSrDEr
	ghsA==
X-Gm-Message-State: AMCzsaXST7m90QYkYCJdlqKb66hjfv37MKMuTBnzQX5nep2GzzBRvJfl
	ZaqwH3K7oyBlOiPnfJJJJi4rPPniTKu08C0ueDw=
X-Google-Smtp-Source: AOwi7QDdq1KkUcXahXLAzfOFKnnThaadC8d8p6mVrmhQbOhf6qtu5KWDRN8jzLwsh0fUIbseizpxGUjDx1BpVf2DKB0=
X-Received: by 10.99.51.72 with SMTP id z69mr12021613pgz.317.1508267186350;
	Tue, 17 Oct 2017 12:06:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Tue, 17 Oct 2017 12:05:55 -0700 (PDT)
In-Reply-To: <20171017180932.GF9221@denix.org>
References: <cover.1507147924.git.paul.eggleton@linux.intel.com>
	<4da0611806ae98b10f6ae00200b3e292a068f940.1507147924.git.paul.eggleton@linux.intel.com>
	<CAMKF1sp6TG-LrCUq-FMp+z_mR6Yh-CiRXT0tDvJXVsYr+97VPg@mail.gmail.com>
	<20171017051134.GC9221@denix.org>
	<CAMKF1sro2nuRcguZzsVOj5B2dNzw6P5KKrkK5dmuzpk_eX8e6g@mail.gmail.com>
	<CA+chaQeZpm=FAXVETU4x9scAECJ3EURrjjo54JhddHeDBzXWkg@mail.gmail.com>
	<CAMKF1sqfVVcvf6Hz9tPF7xobT-P64z16mbTQNQ9+t=-kSwo2-A@mail.gmail.com>
	<20171017180932.GF9221@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Oct 2017 12:05:55 -0700
Message-ID: <CAMKF1sqgSSvfZYY8VwtJduZJNogFddrjv4LUeX1K6FfQFp1+1A@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
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
X-List-Received-Date: Tue, 17 Oct 2017 19:06:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 17, 2017 at 11:09 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Tue, Oct 17, 2017 at 10:01:13AM -0700, Khem Raj wrote:
>> On Tue, Oct 17, 2017 at 9:58 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > I agree with Khem, I've merged oprofile even when it fails with musl,
>> > because that was the main reason for moving it from oe-core to meta-oe, but
>> > we don't want to burden Khem with more new musl issues when they are
>> > detected soon enough (my world builds don't use musl, so I depend on Khem to
>> > provide feedback when he can) .
>> >
>> > On Tue, Oct 17, 2017 at 6:23 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> >>
>> >> On Mon, Oct 16, 2017 at 10:11 PM, Denys Dmytriyenko <denis@denix.org>
>> >> wrote:
>> >> > On Mon, Oct 16, 2017 at 09:19:25PM -0700, Khem Raj wrote:
>> >> >> On Wed, Oct 4, 2017 at 1:20 PM, Paul Eggleton
>> >> >> <paul.eggleton@linux.intel.com> wrote:
>> >> >> > The following improvements have been made over the recipe that was in
>> >> >> > meta-intel-iot-middleware (a layer which is no longer actively
>> >> >> > maintained):
>> >> >> >
>> >> >> > * Upgrade to latest upstream version (765.50.9)
>> >> >> > * Fix compilation failures by passing CC and LD
>> >> >> > * Fix "no GNU hash in the ELF binary" issue
>> >> >> > * Point S at the correct source subdirectory so that "make clean"
>> >> >> > works
>> >> >> > * Fix lack of soname on libdns_sd.so leading to missing RDEPENDS QA
>> >> >> > error
>> >> >> > * Add SUMMARY
>> >> >> >
>> >> >>
>> >> >>
>> >> >> This has been accepted into master but it fails to build with musl
>> >> >
>> >> > Is musl a requirement for meta-oe?
>> >>
>> >> We have fixed it to a point where we have around 10-12 recipes which
>> >> don't compile
>> >> with musl, and it would be better to keep this level as such and
>> >> especially when we
>> >> know its failing. its a requirement for oe-core
>>
>> I do world builds on master-next with musl on qemumips and rpi3
>> continuously, with a known set of failures, if a new one shows up
>> I tend to report.
>
> Ok, no problem, it's just demanding someone new, submitting a patch/recipe, to
> go fix musl, which they probably never heard of, would result in never hearing
> from them again. :)

I think, its fair to expect some responsibility from submitters. I do
not encourage
shoot and scoot approach. Eventually it feels like dumping ground.
I myself have fixed plenty of recipes which were added and
left as it is, orphaned. I had to fix them to work with musl or clang,
realizing that
given package has had several releases ever since it was added to OE, but we
never update the recipe. We probably should pay attention towards such orphaned
packages closely.

>
> Anyway, I'll look into getting some musl coverage for my submission as well...
>
> --
> Denys

