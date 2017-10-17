Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 75C35782C5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 17:42:25 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id p87so1867782pfj.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 10:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BusNtSVfh1z3Zo7HIA+W3Hy9ZoEH6IC8nsa+PjvIuew=;
	b=Qnf62rjNQUDr/tYEn9UFNDk/Fn5FgFbGAZryC8F+SInASOQuKJRfe4GdXnrhYe671p
	FmM8eezGcTqo34rqF3hvm0WepfOb6Z8Dd6fQNyLHswpCzFkgZF2Yp08r9+mtdyCqizl+
	6jcbQxWpjK6PcL4w36g9fn5KvrE6Q1f2reps69G/6loFOYA0WJBMnpMLigYhkh499CWY
	PRpD5thbBr5gOvtDyFIqHFS2tEIuNCVBaFbIDXkM6EObOO9mzm2YOX0t5slPQhuu1Y6z
	qMixSlEKbUjLgT7Fw7y3GesTdMrTWcJCuxLSg71WmIjjzYY/Zq2k+ryFiMlB3FhaA6g+
	jKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BusNtSVfh1z3Zo7HIA+W3Hy9ZoEH6IC8nsa+PjvIuew=;
	b=AFB9R1y8N0eBFlrT9HNehZiu5ZzW+UwdbxJ64otiupDavOgU3+vUkM3cH6SjUVYvdB
	WH9Ix3iqUo4kpRbHSJWBZCEJQXZJhH+6kLPw9DVfPCKdcOvG8Qsh7DJ0nwMXSry8rq3M
	RUQTWYoH/OvaEPeEz0WDm3hiqrVB31Thx8hXETEUcNWdT2LVtiTr5DKvZYunHkfV8wJ3
	SaIN6pyYJsNMEabKq4BesFje4FLgWyWoVjW2kgJeP5oRW8hfIMTvuWs/hHfC677/a+qd
	IdKXV3NjEJY6k+1XdlArTp+YkTFl1Lv2mfCBIFcUGg5g+EMK5OkOF5Rz1Jabb7pTso1I
	gbwg==
X-Gm-Message-State: AMCzsaUcNWsNyaJ1uh4Pl3kz9De+bNbKlipJgR+tvoq8usjiNjuBgKXE
	qS51pCmf2i2ceHQ3j2eDADYeU/zq+kzJa5/bxaw=
X-Google-Smtp-Source: AOwi7QAKGkUIKPwqkSBze1J+RmZ6qcDUPyIdS3yXZp3DDP6Y7/hKiCm9NMDEUTqwwOVfrKwtE3mtW95R+Op4A4qCP0s=
X-Received: by 10.99.107.197 with SMTP id g188mr11654953pgc.341.1508262146798; 
	Tue, 17 Oct 2017 10:42:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Tue, 17 Oct 2017 10:41:56 -0700 (PDT)
In-Reply-To: <20171017172327.5aipmv2frrjsszbk@mentor.com>
References: <cover.1507147924.git.paul.eggleton@linux.intel.com>
	<4da0611806ae98b10f6ae00200b3e292a068f940.1507147924.git.paul.eggleton@linux.intel.com>
	<CAMKF1sp6TG-LrCUq-FMp+z_mR6Yh-CiRXT0tDvJXVsYr+97VPg@mail.gmail.com>
	<20171017051134.GC9221@denix.org>
	<CAMKF1sro2nuRcguZzsVOj5B2dNzw6P5KKrkK5dmuzpk_eX8e6g@mail.gmail.com>
	<CA+chaQeZpm=FAXVETU4x9scAECJ3EURrjjo54JhddHeDBzXWkg@mail.gmail.com>
	<CAMKF1sqfVVcvf6Hz9tPF7xobT-P64z16mbTQNQ9+t=-kSwo2-A@mail.gmail.com>
	<20171017172327.5aipmv2frrjsszbk@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Oct 2017 10:41:56 -0700
Message-ID: <CAMKF1sr7gGo3LVcOKsp6f6FJFeNLVZHQCt+0MLwCTRMCz9F1Ww@mail.gmail.com>
To: Joe MacDonald <Joe_MacDonald@mentor.com>
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
X-List-Received-Date: Tue, 17 Oct 2017 17:42:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 17, 2017 at 10:23 AM, Joe MacDonald
<Joe_MacDonald@mentor.com> wrote:
> [Re: [oe] [meta-networking][PATCH 1/1] mdns: move from meta-intel-iot-middleware] On 17.10.17 (Tue 10:01) Khem Raj wrote:
>
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
> I obviously haven't been building with musl either, but if it's not that
> difficult to add to my autobuilder configuration, I'd be happy to.  Is
> https://github.com/kraj/meta-musl/blob/master/README.md the best source
> for how to get started with a musl build?

that layer is not needed anymore since all musl support is in core now
a days. all you need is

TCLIBC="musl" somewhere in your config metadata

>
> --
> -Joe MacDonald.
> :wq

