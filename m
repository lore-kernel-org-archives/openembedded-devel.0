Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
	[209.85.166.47])
	by mail.openembedded.org (Postfix) with ESMTP id AF9067E3C2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:44:27 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id f22so3318905iol.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 16:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=t01f8pDpIjVUDFjqE8Fq2Y1HEw3hCwz6pja5a1xeqF0=;
	b=j2e3os6iq9e1S5kLp76FzizVGJ7YfTdaacSQyfkiy1ygLiNMOxmFDHwq5oAWELE4+7
	FpDE+2Q2bsEEJ6GNlh1nETOGdyCsFb9j2mv+Yh0Fyep5QmutvBBm4HupeDSjQ40kYIZg
	1ZaZcNZJ7oNnz2h1ve0zR/ZRrF2bHbImMk2IK6fN7QRxrA8Ur8oQ6YQ9hNHdpPIlnvE5
	Sr7o3tdpuDOquQFe2///Sq6e9ugncVJV/93EeEYqUQIqZbmT3sbTBGO4I20HP7VUQEt8
	6K4GoP7ziE+rXsEo0FjhA1BawtstQMTn/m+xB5w3OBBz3fZ+mGr+9EFCICnPmpidDQZZ
	hyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=t01f8pDpIjVUDFjqE8Fq2Y1HEw3hCwz6pja5a1xeqF0=;
	b=YZWXctGengxSGok8S2HbmPOt0FGCJ34UFfRzRnLpe0byAT01Qp2NlOr1mewtlaf54c
	ZZg1q+CN+KCUOxvVGgAo5bdTALzMV56nK1eh6H7TiIyfEL1P6g/Gj3/hydUVA8PPyfa/
	bljH3GAQemj4Kif6Reu7QGvK3SjsxQleLoUOyu02m4wvK/XfldbFCjG7zfFLXSTOyI1c
	T9ZgOfLJ8FQiMqea+H/xWPUn9OTnCPMFVR83Tv0JoPS/JAkj9XBKj365ylST5MKgYco9
	o0uab2M0CowNIng112EKuhzFwcDusod4cVFTSsEovjZNg0xhYKM1Oja68pRh2V7QLYd7
	9CtQ==
X-Gm-Message-State: APjAAAWKArvBGfAhTCl2MDx9addlDI28EuTxMgnNOiVobf6I/+uYLP5H
	SDa+9c55LAVEPpT6jSIP7opH0SmUNn4b3QuKnWE=
X-Google-Smtp-Source: APXvYqyuP8tP5/Hplgb2Xcr3ap/FmpHYQIMxk+twjYBFAfjTaByxvmV+QJYJDHX8isL03MVL/TPaLXwrg0DzB2xgNQk=
X-Received: by 2002:a5d:9a11:: with SMTP id s17mr26823100iol.267.1558568668703;
	Wed, 22 May 2019 16:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <155854019588.26288.10003174813774515795@git.openembedded.org>
	<20190522154956.6750B23534D@git.openembedded.org>
	<CALbNGRS52_LUD8pDuE-cXt5PK8Pqf-TZbFyQdcgGxQanZNx3vg@mail.gmail.com>
	<CAMKF1sqMxN5ic=X8n5yVPct_8DmUCPDCoKxmy9kMVbvYdBQWGg@mail.gmail.com>
	<CALbNGRR97eVuCgmrn06eSB6BM3tGHhaNDzMnTtbLAGd+HQMdtQ@mail.gmail.com>
	<CAMKF1sq_N0buByYD9N3Xx4kox99yLmMdJX8N=8iLAM8TSbTS0Q@mail.gmail.com>
In-Reply-To: <CAMKF1sq_N0buByYD9N3Xx4kox99yLmMdJX8N=8iLAM8TSbTS0Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 23 May 2019 01:44:16 +0200
Message-ID: <CALbNGRRzQHZhFJc=HAORCoVx7KaioZbkh+Tc-eBJK5-1sgriNA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe-commits] [meta-openembedded] 02/09: mozjs: Upgrade to version 60.x
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
X-List-Received-Date: Wed, 22 May 2019 23:44:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2019 at 11:34 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, May 22, 2019 at 2:29 PM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
> >
> > On Wed, May 22, 2019 at 10:14 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Wed, May 22, 2019 at 12:06 PM Andreas M=C3=BCller <schnitzeltony@g=
mail.com> wrote:
> > > >
> > > > On Wed, May 22, 2019 at 5:50 PM <git@git.openembedded.org> wrote:
> > > > >
> > > > > This is an automated email from the git hooks/post-receive script=
.
> > > > >
> > > > > khem pushed a commit to branch master-next
> > > > > in repository meta-openembedded.
> > > > >
> > > > > commit 8587370567e7f2f398ae1efa77989b1110d15a77
> > > > > Author: Khem Raj <raj.khem@gmail.com>
> > > > > AuthorDate: Tue May 21 23:27:16 2019 -0700
> > > > >
> > > > >     mozjs: Upgrade to version 60.x
> > > > >
> > > > Haven't found this on mailing list so:
> > > >
> > > > I ve done similar here and I saw that
> > > >
> > > > * musl patch can go (tested)
> > > > * polkit needs update - current version requires mozjs 52.x (shall =
I
> > > > send the patch I have already?)
> > > >
> > >
> > > Please do. I am currently trying to upgrade polkit to 0.116 which
> > > should work with
> > > spidermonkey 60.x so if you have patches please send, I would be happ=
y
> > > to give them a shot.
> > >
> > That might take till weekend: am sitting on 60+ patches not quite
> > ready for the wild. So I have to rebase (and test).
> >
> > Ahh  - and after staring python2 crusade accidentally: If you give me
> > a bit more time I would create a patch to move mozjs build to python3.
> > Found a patch which is a good base to steel from.
> >
>
> OK. I have it compiling and working on rpi3 and qemux86-64
> see top 4 patches
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dyoe/mut
>
> Let me know what you think
>
Seems you chose same way as I did: add necessary python dependencies.
Now after recent discussion about python2 I don't like this way. E.g
python-which has seen last release in 2010 [1] and does not build for
python3.

By looking into the python3 patch for mozjs [2] I found that mozjs
ships the python scripts required (and I think much more). Seems we do
not set it up properly so that it cannot find them.

My target for mozjs is:
Use the python-scripts found in mozjs 'third_party' folder, patch them
for python3 and don't add python-native recipes.

Suggestion:
* If you are under pressure for this issue for other recipes: Take
your patches - I can make those modifications on top later.
* If there is no pressure just give me a bit of time

And finally: Maybe we do same in parallel. To avoid double efforts: My
WIP is at [3] As said it is not ready to send: Have not seen
gnome-desktop yet and would like to add =C5=9Bome more as gdm / eog...

Time for zzz

Andreas

[1] https://pypi.org/project/which/
[2] https://code.foxkit.us/adelie/packages/blob/f2b5773da19ab397fbe64fd32da=
cc383cfe4cd77/user/mozjs/python3.patch
[3] https://github.com/schnitzeltony/meta-openembedded/tree/work-2019-05

