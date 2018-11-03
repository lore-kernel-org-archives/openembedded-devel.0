Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
	[209.85.222.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8284379D53
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Nov 2018 23:38:12 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id o89so9119890qko.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Nov 2018 16:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=DKI4+LqkBS/938TTg6lYVvwk9k1nmpqyBM5CHZqQJMY=;
	b=bTkF7N1VJTKVC5EnnpcSwrVM/WGcqEjPYXM0wPFTBEj3HC1dRz4Qm2g86hfbrPoqRK
	743bWmqrJ+uDGW99LfgtHpytHcAiu4iN14r6CQsshD8Cwfxa84UiBXFbVdoGt5yNKzDc
	nOkYf4npyybttbvr9rhN7fvhTz60YOrPEdmBYQA2SJljTxvpmXENr6k4JrTEVLdPOBmI
	IVATejwBZKnONiBiQqlgfhILor5Pb9VcyF1LN6bSCtc3NPLEYlGhRngfmnOaV4yNeu6K
	JSrpINgWYLpSTutsmrbWBnafsRhFHWKEvzo4dkYbY7P6a67Bh0xtF0aYNl793RpDINWz
	9fYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=DKI4+LqkBS/938TTg6lYVvwk9k1nmpqyBM5CHZqQJMY=;
	b=GfeM6t7qNHoARBwG38YeHfdF9HIN9Aaqvk08yJJn7U8xPBExloyO2XkneA3odfD8xy
	NKuz8py+lnbBY5vOr78EDgsSUVylKRDaFs9X0FtMOFfuEKSnXB4vXKPuRZvAXB1robhc
	nJ3ylp3bK8W1BYGhj43SLodX5v8I63linaLKuXulY2586KLFWGpHWPPF6o24WIFNhBYv
	ke1Y7xad6nt9FcE47Ao0b7L3eK6uwpEwfGjHT8QLn9cGe/JB0E/GiFJTlc2k/H70m2Tf
	WIRumr213k0/JL13fAL7PIre0GNrNsrufn8kY9N318vqt9n8rg/81io1xvqmHyAaFjXF
	jJYw==
X-Gm-Message-State: AGRZ1gKqQbfRYzO2nZ5R75ocBrGrz1nxXOMRjtqLgtNzv8ETtF/nukG0
	2qzU/DFDgAund6QnRV/ljRT/7wqAGyMfthuLwA0NEhp3QcM=
X-Google-Smtp-Source: AJdET5dkMQm6JeEvcNrmsWoN/4XIICZJT0ElGmi9SolkEuMYicNX1DnPR2+ei6Fgae1FG7cRJVGDABNsirMgKwF5630=
X-Received: by 2002:aed:3024:: with SMTP id
	33-v6mr16245030qte.29.1541288292978; 
	Sat, 03 Nov 2018 16:38:12 -0700 (PDT)
MIME-Version: 1.0
References: <a82232e3-5514-ea37-1d90-30f6a29e0aca@denx.de>
In-Reply-To: <a82232e3-5514-ea37-1d90-30f6a29e0aca@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 3 Nov 2018 16:37:47 -0700
Message-ID: <CAMKF1sp5j5M1pK7LV9r=RWGD6ed7wb-ZLZy=wtLpJ5DYHSFrfg@mail.gmail.com>
To: Parthiban Nallathambi <pn@denx.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [thud] libdevmapper: LVM2.2.02.180.tgz file not found
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
X-List-Received-Date: Sat, 03 Nov 2018 23:38:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://patchwork.openembedded.org/patch/156023/
On Sat, Nov 3, 2018 at 9:00 AM Parthiban Nallathambi <pn@denx.de> wrote:
>
> Hello All,
>
> I am currently facing compilation issue with the libdevmapper. For the co=
mpilation
> logs I understand that the SRC_URI needs to be adjusted.
>
> Current URI: ftp://sources.redhat.com/pub/lvm2/LVM2.2.02.180.tgz
> BUt the file resides in: ftp://sources.redhat.com/pub/lvm2/releases/LVM2.=
2.02.180.tgz
>
> Does this needs to be fixed? Or the source tarball will be moved to paren=
t directory
> in redhat FTP? Or am i missing something?
>
> Log:
> =3D=3D=3D=3D
> --2018-11-03 15:37:47--  ftp://sources.redhat.com/pub/lvm2/LVM2.2.02.180.=
tgz
>            =3D> =E2=80=98/work/downloads/LVM2.2.02.180.tgz=E2=80=99
> Resolving sources.redhat.com (sources.redhat.com)... 209.132.183.64
> Connecting to sources.redhat.com (sources.redhat.com)|209.132.183.64|:21.=
.. connected.
> Logging in as anonymous ... Logged in!
> =3D=3D> SYST ... done.    =3D=3D> PWD ... done.
> =3D=3D> TYPE I ... done.  =3D=3D> CWD (1) /pub/lvm2 ... done.
> =3D=3D> SIZE LVM2.2.02.180.tgz ... done.
>
> =3D=3D> PASV ... done.    =3D=3D> RETR LVM2.2.02.180.tgz ...
> No such file =E2=80=98LVM2.2.02.180.tgz=E2=80=99.
> --
> Thanks,
> Parthiban N
>
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-22 Fax: (+49)-8142-66989-80 Email: pn@denx.de
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

