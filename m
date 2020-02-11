Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id E1F8C60B1F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2020 16:31:44 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id l21so7658433qtr.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2020 08:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=cMBClijUg8AaasHxJW+RdJQCxhxhezXepWn5G1KfA8k=;
	b=V5R48+38V4l8N54W+kf1uBi+mmYD5rdfiGhTmA2S8RVH4DyhfF3BbSQZnhqTm5Rh+q
	oocM7/Hmv9NcRBWaJRNW5YSnSaEDxE1lhSgkUsS7tY6pA5IQ4VGLyvPs7LJaeLIa+DPV
	i1rLIYq5xldL5GG7wDKR9zOfdyhdz5vyPbrb1ZjWxliGsu/nv0y56JQ6zoKPpgbTHbnd
	b9ic9SRNeWD+kB82UokDFwUpVSNFooqG9ImV7StI2kPPA+C+82KBvB2qUhL7/k+z8GoW
	FixE/k3oYMJuoRWm9MHcviBGB8blW+7leJtnFdzWGN0y0WYBEslsTXa0TplK/sBODo0F
	PC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=cMBClijUg8AaasHxJW+RdJQCxhxhezXepWn5G1KfA8k=;
	b=nGCfbp5RxeBuWVrbfFtEYs7ymOqzYD32XvLPwelW/FvvN0bYEf73svtwPSy/JcLCQY
	urifetIpca4Fs2LatbQVaBqModTyPZF5pNQ9CyCoErMGUIBmD1z948c5cVWx5fBPkenc
	0X01ErViw956XWiOu3bpYvFqRs0rjp/ibmr3WmmVk3hvT5yGZ6TVCJAOiOHgSo/ASs1N
	ZB9TuQkZzvFSMtn+4JwLb0INkbA79aFt77ZHU6XOv5mQH4RQq5B/HQLg3Ksxf0gEuXQ9
	Bq+GYZPF9PU3SBfgr2DZhFMYBgeNW4+7GOX/L0cL87F3lVxuMFMjUgUdpdhPdk1Ab8Fy
	ASyg==
X-Gm-Message-State: APjAAAWda0JOO2s8do5uqQeAJDjmTJmziUpU07mUVLRx+uN0VX3xAkLx
	F/EMiTD1zs78kLWIYLav7aJm7aLPcdiyQrjJJEg=
X-Google-Smtp-Source: APXvYqwOatyMcyxtxYiTYPZY0ggMMloWS1eNArmvjOzYURsP5sNIlD3EUNeSNbPIHp+t/wYMVmpMXz/wYJooSmHt0VM=
X-Received: by 2002:ac8:60c8:: with SMTP id i8mr3241610qtm.53.1581438705255;
	Tue, 11 Feb 2020 08:31:45 -0800 (PST)
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
	<CAHw2UgCELL_TacC=wueYvuqGunkQH4UVUkxo8gxwQB80F_rtQQ@mail.gmail.com>
In-Reply-To: <CAHw2UgCELL_TacC=wueYvuqGunkQH4UVUkxo8gxwQB80F_rtQQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Feb 2020 08:31:18 -0800
Message-ID: <CAMKF1sotjMmuMQLi44OUqV-1UNj9SyyF3C-L+b1iDLJ0jte0HQ@mail.gmail.com>
To: Marek <marek.bykowski@gmail.com>
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
X-List-Received-Date: Tue, 11 Feb 2020 16:31:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2020 at 6:41 AM Marek <marek.bykowski@gmail.com> wrote:
>
> Any updates if it is going to be taken in?

Can you resend the latest patch once again? with all feedbacks addressed

> Thanks,
> Marek
>
> On Thu, 19 Dec 2019 at 13:34, Marek <marek.bykowski@gmail.com> wrote:
>>
>> I don't think Intel is interested in the pull request (https://github.co=
m/intel/lmbench/pull/9). With that are you still planning on taking the cha=
nge in?
>>
>> Thanks,
>> Marek
>>
>> On Fri, 8 Nov 2019 at 18:13, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> Hi Marek
>>>
>>> I thought there are some feedbacks to be addressed, so I was hoping to =
get a v3
>>>
>>> On Fri, Nov 8, 2019 at 5:24 AM Marek <marek.bykowski@gmail.com> wrote:
>>> >
>>> > Any thoughts if this is going to be included in the upstream?
>>> > Thanks,
>>> > Marek
>>> >
>>> > On Tue, 22 Oct 2019 at 12:03, marek.bykowski@gmail.com
>>> > <marek.bykowski@gmail.com> wrote:
>>> > >
>>> > > On Tue, 22 Oct 2019 09:15:23 +0200
>>> > > "marek.bykowski@gmail.com" <marek.bykowski@gmail.com> wrote:
>>> > >
>>> > > > On Mon, 21 Oct 2019 19:42:45 -0400
>>> > > > Randy MacLeod <randy.macleod@windriver.com> wrote:
>>> > > >
>>> > > > > We have had Intel employees working on oe-core / meta-openembed=
ded
>>> > > > > for years so I hope that you will send the commit to that repo =
on
>>> > > > > github and indicate the
>>> > > > > upstream-status in the patch what we integrate into meta-oe.
>>> > > >
>>> > > > Hi Randy,
>>> > > >
>>> > > > I'm Intel (actually a subcontractor to them) working on occasion =
with
>>> > > > Daniel Drogomir, Charlie Paul, and Chantale Ouimet from Windriver=
. I
>>> > > > have put the names as chances they may be your colleagues. Even
>>> > > > though I'm Intel I didn't know of lmbench Intel repo on github - =
this
>>> > > > must a totally different team. Sure I'll send the patch onto that
>>> > > > repo indicating these are the changes integration planned into
>>> > > > meta-oe.
>>> > > >
>>> > > > Regards,
>>> > > > Marek
>>> > >
>>> > > Done https://github.com/intel/lmbench/pull/9
>>> >
>>> >
>>> >
>>> > --
>>> > Sl=C3=A1n,
>>> > Marek
>>
>>
>>
>> --
>> Sl=C3=A1n,
>> Marek
>
>
>
> --
> Sl=C3=A1n,
> Marek

