Return-Path: <alex.kiernan@gmail.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id A89617F325
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Aug 2019 12:29:21 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id n5so103555749otk.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Aug 2019 05:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=K53bVpz9XXliELRGfUC6ZelNPGIeAOP2x6kH3m2ODHA=;
	b=BtCnTMmVf0NmacXCtJ5ZhzUeNom1F940Rp1NAhDJ73fbTnEylwsu+dz0T1i+k62/JM
	PSa/YhAXnXRLq6W39cefEk4FQaHEMKSX6UA9gAaJrHzdF5c9ykAEjBVOiZpmVMZ9G+IN
	GMPJprYWnnMZt0hzEkSdcmj+aztvHdNluHOu5gWQ4Q07gvkkpwu/YUOUQOsH/uxvpW06
	YEJwvaKcfv5xaoaj3P4Nl4/nN2lBpl5PMvxrDyplSKaWnHdpRKTqkKPKMEQu7cF1Aimg
	DWDR7lp/FHOqiVCvaFkS7GO9pduc7LY3N25XiYSR3+FAmbzZYQ50XGgtDpSPMjyECxrg
	j8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=K53bVpz9XXliELRGfUC6ZelNPGIeAOP2x6kH3m2ODHA=;
	b=nyCHz3IO7Z2wdCQ6v35V+M+/Ig8eSkWR7Qjr+qQKwf0w+gb+jb8gnlKh02ziNgtU83
	jQZLqqjwW2PkmPclOVEnixnHcNJ+QYy7Mrn6OvpTsD8hqd+OzxBlPpYin6DXwc1Z4Jdw
	qvSj/EIZ5twsjZNuBeWO5thPoR4+ds2YobL/mXzWA3BfeChZ6XaqszxIvMl53mx3e2UM
	BZOmZ9nmRKPQ4o5EZViab5RegmNHQnvU0JAWJgANfyVmgWg//5fSSomCYfq3D+6FSDUD
	Mak4Z9Cwm+lvIJWkjL4s7tAq0q+SM9/OR3TZUFVOgW1xAaJTN4/jjShBv6LOl3s7BlQb
	J/Tg==
X-Gm-Message-State: APjAAAVUxvrNLY4oMInnkX+7GGdDubXgp0mAcZ+9chJVwy8YtuTtZ7Ie
	Z7Q3Vp1vAW795SQnmFP0uyWuZzNBJFXKocVVOdU=
X-Google-Smtp-Source: APXvYqzF74jcGBdVy6WiyqY7ipKpN6FFcUaCAtoJGpCvnDjHqrRmJHYOUWDhZzgnbb+4Xv9nPvbFuAkRhJX4OPl0nIU=
X-Received: by 2002:a5e:de0d:: with SMTP id e13mr7797925iok.144.1565180962138; 
	Wed, 07 Aug 2019 05:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <1564038304-372775-1-git-send-email-mingli.yu@windriver.com>
	<CADkTA4NafYpQLV2VgTgb4BajL=-KH1gQLU2_rk3ur7b3aqOjSA@mail.gmail.com>
	<CAMKF1sqi9aRud1UQQCFsOakEQ1qKbfRhBSKFeEbwPxQChh45_A@mail.gmail.com>
	<5D3ABBD8.2050107@windriver.com>
	<0263423f4903ea25247352460c6a906b@agner.ch>
	<CAO5Uq5R=bCUcr83yvZwd54Ya61wmxsO9rZ2zztRXfz2VyzQyhg@mail.gmail.com>
In-Reply-To: <CAO5Uq5R=bCUcr83yvZwd54Ya61wmxsO9rZ2zztRXfz2VyzQyhg@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 7 Aug 2019 13:29:11 +0100
Message-ID: <CAO5Uq5Q6aib4QMbaRknPeU6==Y_Q88e87YDL-qgvVmDV3aFEAQ@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	liu.ming50@gmail.com
Subject: Re: [meta-filesystems][PATCH] ostree: import from meta-overc
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
X-List-Received-Date: Wed, 07 Aug 2019 12:29:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 6, 2019 at 2:48 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> On Tue, Aug 6, 2019 at 2:26 PM Stefan Agner <stefan@agner.ch> wrote:
> >
> > On 2019-07-26 10:37, Yu, Mingli wrote:
> > > On 2019=E5=B9=B407=E6=9C=8825=E6=97=A5 21:58, Khem Raj wrote:
> > >> On Thu, Jul 25, 2019 at 6:42 AM Bruce Ashfield <bruce.ashfield@gmail=
.com> wrote:
> > >>>
> > >>> On Thu, Jul 25, 2019 at 3:05 AM <mingli.yu@windriver.com> wrote:
> > >>>>
> > >>>> From: Mingli Yu <Mingli.Yu@windriver.com>
> > >>>
> > >>> This doesn't make any sense to "import from meta-overc". meta-overc=
,
> > >>> was never the authoritative upstream for ostree. That layer has to
> > >>> carry a specific version to meet the requirements of some of the
> > >>> container libraries, etc, that it requires.
> > >>>
> > >>> You need to have a look at the latest ostree, the various layers th=
at
> > >>> are currently maintaining it, and pick the right version if you wan=
t
> > >>> to consolidate things here. I'm very doubtful that the right choice=
 is
> > >>> the one from meta-overc.
> > >>
> > >> Yes agreed and this version fails on musl e.g.
> > >
> > > Make sense, please ignore this patch.
> >
> > What layers are you considering?
> >
> > We use OSTree integration of meta-updater and would welcome having a
> > common upstream implementation which works for everyone:
> >
> > https://github.com/advancedtelematic/meta-updater
> >
>
> My current one is here:
>
> https://github.com/akiernan/meta-ostree-core/tree/master/recipes-ostree/o=
stree
>
> Which started off in life from the Intel IoT refkit.
>
> And the sidebranch folks have one here:
>
> https://github.com/sidebranch/meta-ostree/tree/sumo/recipes-ostree/ostree
>
> Getting just a common ostree recipe in meta-oe(?) would be good.
>

How does this look... fixing MUSL, removing the hack for MIRRORS and
(I expect) fixing how it interacts with grub are things I think I've
not picked from these other layers:

https://github.com/akiernan/meta-ostree-core/blob/master/recipes-ostree/ost=
ree/ostree.inc

--=20
Alex Kiernan

