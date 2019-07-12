Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id D920F7F155
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 20:45:21 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id x22so4629960qtp.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 13:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=TXbtY8C9mZyd+FZO2jVNN3T6xShHGOHEGDsVvOGqrRI=;
	b=p0T9vAlFd38VMAVRoCXeQICsGJbuzxsHrIus9fWAg6QzYq6HYMi1H71u4LdlA0VPjq
	2Q+e1Vlax11uPBpqdW9xeTpQJGL7rkaegSsJVoYz8MHTlLIr+ik9/Jnkojb6OJ68oed2
	2WwD26cr2Cu4JfnCPJyTO9Mo8zQ5LaSOVIvvTSVOLTOC9t206VfTTEqGdaQxW0n2s3L9
	uTgTvC/QAZStFaO2wLR4VLwf6dyTxIbyOzLeJIE3ksRrze/l9RncUF4R3qGMlVGdUDDN
	RwmHBwi+i/7BewYObIldv6mBiqS8Mx1oplYxClT3zQtZfckqyMRZBQNeCLQpiOp8n7LO
	0OsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=TXbtY8C9mZyd+FZO2jVNN3T6xShHGOHEGDsVvOGqrRI=;
	b=JCE7rpryo5lTaRt6mbFpjdEEiP/OSvLxEJLtlj5IjHfeS1CuDhPqekJPu/DwvKIOcY
	KgbO83zK7uDAeUIiTdcSzJznfdXN7QqwJ88MeCZjYht39NrMuTgIew4ZXGISbz37IPLi
	JDWcdqaKqAHCiAgbGUOTrDhrzSlKfK+IGJrcnjZlFx0cTKeNYMMSfbTuje89npLele/f
	+nCqQncHxUnmT2iThxUXagXi4MD4BnD/an0zrw55WlJ4CE+lURxl0T1F35zqobhL3Ycg
	N9sDSKpvaNMabIwT2ITmWjveZIkZP9fyK9ddX0jomjbedMTeV59HWXPCz4OcGFSvsXRS
	pxWw==
X-Gm-Message-State: APjAAAXrj5ihvGLcowLJ+/SE+gPwMs4FyGcHhUqcsmuNWKoPXHwxhkI6
	x6jJG/TivqYc6snG8V0q912dbRyUlEHE0fmY5LI=
X-Google-Smtp-Source: APXvYqym3AqAq4uYZTUBYu/dhAvm0ro+83etaZRWo/f8K3N63ORvwBTflr6ep6om8EABcsz04COV/oROom1tV1vUrZ8=
X-Received: by 2002:aed:36e8:: with SMTP id f95mr8002543qtb.88.1562964322474; 
	Fri, 12 Jul 2019 13:45:22 -0700 (PDT)
MIME-Version: 1.0
References: <1537974727-33976-1-git-send-email-hongxu.jia@windriver.com>
	<576ae4d4-e072-bdcb-ac85-7f3cd14a7352@windriver.com>
	<CAMKF1sqpB=Ymvc1bb=tr+if1+9hkb4fOjNV_1xsHr=SPz6npMg@mail.gmail.com>
	<865340f5-30d3-9110-3799-709babb2cf9b@windriver.com>
	<4f5552c0-730c-46ca-3ea6-88fb2c326cc4@windriver.com>
	<bc95a1eb-ae11-784d-aa37-fa496af7dda2@windriver.com>
In-Reply-To: <bc95a1eb-ae11-784d-aa37-fa496af7dda2@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Jul 2019 13:44:56 -0700
Message-ID: <CAMKF1sqAi0kHOwhstgLJWLfFpm7bWik6y3-OuQq6gRTdb_R-+w@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] php5: 5.6.36 -> 5.6.38
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
X-List-Received-Date: Fri, 12 Jul 2019 20:45:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 12, 2019 at 1:26 PM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 1/30/19 8:26 PM, Hongxu Jia wrote:
> > On 2019/1/31 =E4=B8=8A=E5=8D=8812:43, Randy MacLeod wrote:
> >> On 1/30/19 11:33 AM, Khem Raj wrote:
> >>> Hi Randy
> >>>
> >>> It would better to put it on the list of deprecated packages for a
> >>> release before removing it.
> >>
> >> Khem,
> >>
> >> That works for me.
> >> Where is the list of deprecated packages?
> >> Neither google nor I could find it.
> >>
> >> Hongxu,
> >> Will you update to 5.6.40 sometime please?
> >
> > I am afraid no, the reason why I upgraded it is the compiling failure
> >
> > with new openssl 1.1.x, after fix the build failure, I am no longer to
> >
> > maintain php5.
> >
> > //Hongxu
> >
> >
>
>
> Hongxu,
>     It's time to remove the old version of php.
>
> Khem,
>     I didn't find a list of deprecated packages.

you would add PNBLACKLIST in the related recipe, since we did not do
this for warrior
lets remove the recipe directly, since October would be a year after
EOL so waiting until
then would make it quite stale

>
> --
> # Randy MacLeod
> # Wind River Linux

