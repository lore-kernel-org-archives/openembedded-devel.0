Return-Path: <marek.bykowski@gmail.com>
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
	[209.85.167.173])
	by mail.openembedded.org (Postfix) with ESMTP id 52C7D60EB7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2020 14:41:30 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id q81so13007944oig.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2020 06:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8+r+k2v4ODGk5IKbnSDugTA8bqP60F6CnOVy8K4sbEM=;
	b=AGlM4q8l0OUgWBEsXCfw/OGaLuDsoLsy3HIG6Rt0pv4JKGtfQ7ngsno6oxdcZ9OAAY
	N/RF4oiB92w40D/Zsl35L1/28sn+sue6ZJXQ0sbgbpmHt5WPfy2amevf+l+L9kOb/k7F
	PfeitFfzE7Bj0LmGLtMi/HmJoBNe2R2OJq43JhMS4DWpkzuOZTop6I59PuMBXZvA7Nl9
	7/Kj+cka0tt4xnaI1Rz1IIr4x1TKzhUCTS8cWUWMWWS8jTS5sXVaKcO/xZD9dfV/sPLD
	UtaZqNx9kqFqZuL04fWhajDIi0AjmgnHzY5EPdmV4YNmRiVJ9ruwmxOfQ8rrQ61eHUZQ
	MgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8+r+k2v4ODGk5IKbnSDugTA8bqP60F6CnOVy8K4sbEM=;
	b=n9gGmdO5NvZUEHrWrYvmc1NwTv0aioACvZ/PxcnoyF38YDobF10BpqkHD2g024xg4D
	xhB7D7VnhYigtTeF1AuDlokbj0DDsIi/E8z1zGhR/TkLCd+8GKn0lSxMMWkNKw4BgB0x
	8rLoB0z1KDjGk7oS4QfF8wEfscRL5yJY7QcsJrW6ll7SkeGnHPdUK4fBy3rDzHmgR7oC
	94O4de4A2on9Q8355QX2Pcv/EK338OjShIPmNfxi23eBhnTTFwUaR7cHZVFAHRu+h0q8
	SoP/COerNeCSGOoMuyhmelkcIAmUXnJt5yVa9wSdhlM5OLVwFbS+P5a+iamklWot8bjD
	tA0w==
X-Gm-Message-State: APjAAAUFdYmVjncGwh0zRqMihC41SPuPK9Zb6ret2+1c+KmMQ71Nl//y
	yKepH9pnCleERZblYRNSKt0SDrNwLRTH9la/4VI=
X-Google-Smtp-Source: APXvYqwrMvdAw7dPxaoR61j0309xvi7nmjEBCccProV1d8xzyqwIqVwgN9k+VGMdqbxHoZKwDTR5Dd+poARX9Rx6Cq4=
X-Received: by 2002:a05:6808:658:: with SMTP id
	z24mr3125617oih.91.1581432091182; 
	Tue, 11 Feb 2020 06:41:31 -0800 (PST)
MIME-Version: 1.0
References: <1571141621-20235-1-git-send-email-marek.bykowski@gmail.com>
	<20191016104557.GA7998@localhost> <20191016142112.10a645d2@gmail.com>
	<CAMKF1srjpre+zbi6Q2==McOEvV8njBdzqOf8nGxor9NN5tMoig@mail.gmail.com>
	<20191018134224.62ca6095@gmail.com>
	<83e0f896-8ec4-df4f-d14c-256cb70774c1@windriver.com>
	<20191021113018.3c684d51@gmail.com>
	<0411e8da-91a7-f586-2d65-490e8c327c2d@windriver.com>
	<20191022091523.60d5434a@gmail.com> <20191022120320.71fb6436@gmail.com>
	<CAHw2UgAT_sL39YBSRJ2D7EKA28=4aL3OHJX7LW2Y4CVw_6STwg@mail.gmail.com>
	<CAMKF1srcG7HP18wyYMK8Sn4uLbzyr+ePTGCLUZXvyecVj6nBoQ@mail.gmail.com>
	<CAHw2UgAUh82RGjtbCk05xDpeETD8m74mvMQCeMdcMJHGTUcAGg@mail.gmail.com>
In-Reply-To: <CAHw2UgAUh82RGjtbCk05xDpeETD8m74mvMQCeMdcMJHGTUcAGg@mail.gmail.com>
From: Marek <marek.bykowski@gmail.com>
Date: Tue, 11 Feb 2020 15:41:20 +0100
Message-ID: <CAHw2UgCELL_TacC=wueYvuqGunkQH4UVUkxo8gxwQB80F_rtQQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Adrian Bunk <bunk@stusta.de>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCHv3] lmbench: Fix/clean-up the build for lmbench
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
X-List-Received-Date: Tue, 11 Feb 2020 14:41:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Any updates if it is going to be taken in?
Thanks,
Marek

On Thu, 19 Dec 2019 at 13:34, Marek <marek.bykowski@gmail.com> wrote:

> I don't think Intel is interested in the pull request (
> https://github.com/intel/lmbench/pull/9). With that are you still
> planning on taking the change in?
>
> Thanks,
> Marek
>
> On Fri, 8 Nov 2019 at 18:13, Khem Raj <raj.khem@gmail.com> wrote:
>
>> Hi Marek
>>
>> I thought there are some feedbacks to be addressed, so I was hoping to
>> get a v3
>>
>> On Fri, Nov 8, 2019 at 5:24 AM Marek <marek.bykowski@gmail.com> wrote:
>> >
>> > Any thoughts if this is going to be included in the upstream?
>> > Thanks,
>> > Marek
>> >
>> > On Tue, 22 Oct 2019 at 12:03, marek.bykowski@gmail.com
>> > <marek.bykowski@gmail.com> wrote:
>> > >
>> > > On Tue, 22 Oct 2019 09:15:23 +0200
>> > > "marek.bykowski@gmail.com" <marek.bykowski@gmail.com> wrote:
>> > >
>> > > > On Mon, 21 Oct 2019 19:42:45 -0400
>> > > > Randy MacLeod <randy.macleod@windriver.com> wrote:
>> > > >
>> > > > > We have had Intel employees working on oe-core / meta-openembedd=
ed
>> > > > > for years so I hope that you will send the commit to that repo o=
n
>> > > > > github and indicate the
>> > > > > upstream-status in the patch what we integrate into meta-oe.
>> > > >
>> > > > Hi Randy,
>> > > >
>> > > > I'm Intel (actually a subcontractor to them) working on occasion
>> with
>> > > > Daniel Drogomir, Charlie Paul, and Chantale Ouimet from Windriver.=
 I
>> > > > have put the names as chances they may be your colleagues. Even
>> > > > though I'm Intel I didn't know of lmbench Intel repo on github -
>> this
>> > > > must a totally different team. Sure I'll send the patch onto that
>> > > > repo indicating these are the changes integration planned into
>> > > > meta-oe.
>> > > >
>> > > > Regards,
>> > > > Marek
>> > >
>> > > Done https://github.com/intel/lmbench/pull/9
>> >
>> >
>> >
>> > --
>> > Sl=C3=A1n,
>> > Marek
>>
>
>
> --
> Sl=C3=A1n,
> Marek
>


--=20
Sl=C3=A1n,
Marek

