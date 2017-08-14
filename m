Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 509FD71C75
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 21:51:52 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id u5so55139698pgn.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 14:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=DOIKeL4Fc7nSwQdph3mIF8jJzRVGNA4xVv5j3pN8Bq8=;
	b=A66sPwOB9AL7h7VPDSMCD76jxS79ckBYLGGsNKG7RmWMbi0ApwwE1yZWdrGi7irpnI
	Spo5MPH4XK7VD8Gt+zAQhGREZnIuf7On+bzioN33dywRxeRDDn2op4WeixvM6fpN77vz
	eMRfMj195LfyGFY2uphU+Es8NecaamdV0sSaLAJKVSoLOvK4P9oAEm5I6zvbAS+R4qLz
	h5pND1esqh2WWovmtCuHiRllOmFOejfCtISXxly45HwJqmrOtBpb1yJ+CKxrw8ke+8yr
	CAsduf/zXfdLvHpcg/hsdB6FaesB488naFXGnoiazWuPa2Nm2NW3knbCnyX/QfZMAYKq
	r/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=DOIKeL4Fc7nSwQdph3mIF8jJzRVGNA4xVv5j3pN8Bq8=;
	b=N68HiPboxOfcKcURtCWFAMeeaCVnt3xdmABqVLKIMh6io0k9yfCMy61kTyy9m3/Qg5
	CUt6wlgpEreJ2dUc6wyeqopEFBTJvRRra+Qo43mkBatpT4IzLqBmYBOIr/9lXAelPGJF
	Uv5MATt/3ruyOS3DKRPK8Z2kDbbmDBAgr9dfbF2iMP9OKYYobcJbrhdSDcKMw3i+WPhe
	k9HSRn5abGY3UWWhGlaQl5jt+LOFif7H0btTW5RMShiWyIfK4hE3xVblWwxoquWjHVN5
	26jzDl5iRlLn4+eFuBhZULkKCh7uq6NJYMlT1rCUl2OwXUc1cMPzy69bQucBym4iPyEh
	jKaA==
X-Gm-Message-State: AHYfb5iVQdEhWIV3jL5K2Pn06CNS7IBU0zSyJn/ifxCEhKc5oF268wc8
	Qgj86P8HdNJyNvPnTSndRPQmI6YVtg==
X-Received: by 10.98.156.145 with SMTP id u17mr25787638pfk.136.1502747514341; 
	Mon, 14 Aug 2017 14:51:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Mon, 14 Aug 2017 14:51:23 -0700 (PDT)
In-Reply-To: <CAP9ODKrwUkwdESj-qKrPjsKMN2=W-ZsYBb_+OYhbvrfgcoht2w@mail.gmail.com>
References: <CALbNGRQWNNvf5kLxcWz7EvUK6CO5VMX43vMrPx28yOzCq5NV8g@mail.gmail.com>
	<CAHiDW_GuabOEPc6rgh-vV+f502A5dYi8wFVYhRzqcZBGYHzz9g@mail.gmail.com>
	<CAHiDW_HFgnLbvd64hR8yE107BLtkWcp3eb=mA8towH73pMbUZQ@mail.gmail.com>
	<CALbNGRQBRFeCuz5R10qhBHQGQ3hn7WO9i1SAZ5fV=4BqGepjrQ@mail.gmail.com>
	<CALbNGRT6v530xCdqLp3CRHKOtBZpg8JqYreOsUhFL5u-eV2O2A@mail.gmail.com>
	<CAP9ODKrwUkwdESj-qKrPjsKMN2=W-ZsYBb_+OYhbvrfgcoht2w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Aug 2017 14:51:23 -0700
Message-ID: <CAMKF1srX-DDD9qJEwr0M6hSvWjObZsXJqs0nUPR5YuWOH3fzEQ@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: chromium detected as stripped
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
X-List-Received-Date: Mon, 14 Aug 2017 21:51:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2017 at 12:43 PM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> Hello everyone,
>
> On Mon, Aug 14, 2017 at 4:38 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> On Mon, Aug 14, 2017 at 4:10 PM, Andreas M=C3=BCller
>> <schnitzeltony@googlemail.com> wrote:
>>> On Mon, Aug 14, 2017 at 12:22 PM, Jussi Kukkonen
>>> <jussi.kukkonen@intel.com> wrote:
>>>>
>>>>
>>>> I chatted with rakuco who's done nice work with up to date chromium in
>>>> meta-crosswalk, he's got some relevant commits related to this:
>>>>
>>>> https://github.com/rakuco/meta-crosswalk/commit/5aae1539c3d62b295dba40=
f494397c0797140b0f
>>>> https://github.com/rakuco/meta-crosswalk/commit/c56aa2bf047d3a01e14f4f=
9bfe5f88664b333f36
>>>>
>>>> On a related note, this good work is currently a bit hidden in
>>>> meta-crosswalk -- is there a chance we could get this combined with
>>>> meta-browser (or whatever place makes sense)? I know next to nothing a=
bout
>>>> chromium packaging so CCing Raphael and the meta-browser maintainers f=
or
>>>> comments.
>>>>
>>> That is interesting. If your suspicion is correct, we are very close
>>> to the edge of file working properly or not. With meta-browser
>>> c79cf6c7811afd2cd167e8967e3c29b1e797371e (16 commits behind master) I
>>> get a proper detected and then split chromium. With meta-browser
>>> master head file incorrectly reports that chrome is split already. I
>>> did not check the exact size numbers but my file browser reports 4.3G
>>> for both cases.
>>>
>>> Just to gather further information I think about bisecting meta-browser=
.
>>>
>> After first bisect build I checked size:: 4299018288 bytes / 2^32 is
>> 4294967296 - so no need for further bisecting. Thanks Jussi for the
>> hint.
>>
>> For now I'll choose old version - have not much time to take care.
>
> Indeed it does sound like the proper workaround for now. That said,
> I'd love to receive more help from meta-crosswalk people and avoid
> duplication of work in packaging Chromium so I am adding Raphael on Cc
> here so he can comment about how we can try to work together on this.
>

Please add below to CHROMIUM_EXTRA_ARGS

symbol_level=3D1

Thats enough to create legible stack traces.

and if size is still large then add

remove_webcore_debug_symbols=3Dtrue

blink is the biggest contributor to debug info. I think this should suffise=
.
and there is no need to do it for 32bit and not for 64bit just make it same
for all arches.

