Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot0-f196.google.com (mail-ot0-f196.google.com
	[74.125.82.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2207D744C1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 20:20:41 +0000 (UTC)
Received: by mail-ot0-f196.google.com with SMTP id w13-v6so19987855ote.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 13:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=03DQu3doYbT3XD/kjRvkG/rXkCQxeq7VoN2CxwCqdUE=;
	b=DaZmpeYGTBpUEeQM88wwzyZjLVLDhaDpxlTU57l7M6BFXNrZpAXnDVgvHKpU1vOTDS
	WEi48jBrqOvl67vCpb0h0tr6iM6pqswSogPlO1JHA2L0PnT/Js88EmRMUsIlWWLFuHxz
	sq16/jXR4eSvAb7At70Q8qrKPyCGhM0CI1HeeCYbNJipoZw20prftevdc/ovQHueWDgo
	DENp0Y95z66Hh9RRI1T+2FbJ3OhRYz1/ogK38zZ55fx16CCq7E1PHMpfw5cZMe8NU1YD
	K0eY1h4xciF3E79a3KhRuEZ59La7FEoqVYup8FPz7UMOx4koXovMcHSXfCaAyMmS2I5A
	yZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=03DQu3doYbT3XD/kjRvkG/rXkCQxeq7VoN2CxwCqdUE=;
	b=EGGrcGzJEroGjQipnn78vCVr55U90mSX2O8bYUle2RIN4gFMEtegx9LW2mTAbU/M43
	VFq4bxjQpliVWuJfcssrquT8ItEXBguXnuGT/vBbyBk1qP8O/bDL+UrEANDEWxbfoqYh
	qs3bnqboNgMoV/FVcl/M8MyGnhL8nSjg4BUNSpH3YXvK9spNuHQyMr745GwmfMQW6dMo
	lIsiA//yhCpUc6Y2ogs8YD7h615q5FwsQ0REaR/8uKB6foYs4q96usbImHxhuxlPO3YP
	ow5HjqsngjIkUyVLcWwRIZllHP7xurMAcxcATIRx0Zjtv6E7jI9HdhNwjBW7CBBWSVQN
	DDwQ==
X-Gm-Message-State: APt69E33Rx/0IDDX3aZdu7LFa+Uo8Act7np33G53DM2NpvMEXtiQE0LJ
	/PMVzkzvIH8wCRUwl3tYI3aGiCB7t+X0I51cShE=
X-Google-Smtp-Source: ADUXVKJggUN3a4lAR/ErkmpYJQs4LNbnGcbIkx35fMnLZSl5kd+SEdcT3LNmmLLnzv6CWB39hLWx4aft84kALtgj1Qw=
X-Received: by 2002:a9d:c43:: with SMTP id 61-v6mr9365970otr.352.1529353243020;
	Mon, 18 Jun 2018 13:20:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:4916:0:0:0:0:0 with HTTP; Mon, 18 Jun 2018 13:20:42
	-0700 (PDT)
In-Reply-To: <CAMKF1sp3Hhh3c3_xLkZ3EJHbS=fhOLk4EY+6BMzSGP+ZPHECNA@mail.gmail.com>
References: <1529340661-6337-1-git-send-email-mark.asselstine@windriver.com>
	<CAMKF1sowdJaFO3CH8d7wRtgPKxoc5PEYESQU3w0oHYAVOsq4og@mail.gmail.com>
	<CAPuovELz+L+8keBVWYCjFnWPSGPoTf5_X_TZpyKuGdf9bea1fg@mail.gmail.com>
	<CAMKF1sp3Hhh3c3_xLkZ3EJHbS=fhOLk4EY+6BMzSGP+ZPHECNA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 18 Jun 2018 22:20:42 +0200
Message-ID: <CALbNGRQej6Mf1WA-4FTBom_LJBj1St8Dxe4Cb+JL0CJu1copvw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Mark Asselstine <mark.asselstine@windriver.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] thunar: fix QA issue 'installed-vs-shipped'
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
X-List-Received-Date: Mon, 18 Jun 2018 20:20:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 18, 2018 at 8:39 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Jun 18, 2018 at 11:03 AM Mark Asselstine
> <mark.asselstine@windriver.com> wrote:
>>
>> On Mon, Jun 18, 2018 at 1:51 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> > On Mon, Jun 18, 2018 at 9:51 AM Mark Asselstine
>> > <mark.asselstine@windriver.com> wrote:
>> >>
>> >> Since commit eb0fe21c1535 [thunar: upgrade 1.6.15 -> 1.8.0] we see a
>> >> QA Error/Warning regarding files 'installed-vs-shipped':
>> >>
>> >>     ERROR: QA Issue: thunar: Files/directories were installed but not
>> >>     shipped in any package:
>> >>       /usr/lib
>> >>       /usr/lib/systemd
>> >>       /usr/lib/systemd/user
>> >>       /usr/lib/systemd/user/thunar.service
>> >>
>> >
>> > perhaps this should be moved to /lib/systemd/system
>>
>> Possibly but really I had to go under the assumption that the folks
>> that came before me and created the recipe and completed version bumps
>> have tested it in its current location (which is a valid location for
>> systemd service files by the way). So my intention was to address the
>> QA issue and not change the overall behavior of the recipe.
>>
>
> Thats fine.  Let me wait on Andreas to validate this approach.
>
>> MarkA
>>
>> >
Strange I have build/run tested this patch for master and sumo without
issues. Must have missed something. Will check on my other machine
tomorrow what went wrong.

Whatever the result is: Move seems wrong: All other user units I found
on my system are at /usr/lib/systemd/user/

Andreas

