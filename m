Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0016073EFD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 19:55:30 +0000 (UTC)
Received: by wgbhc8 with SMTP id hc8so39641729wgb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 12:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=puHBynVEDFMhEYh/O84sDb7MuZQKZMygVycdL1Ts0UU=;
	b=GKaSirCCMnbSxbhJQjGwQ44JMipiMsNZiQbbUed9/rTp/UZcImYXuoCI9mmbDFZPkt
	UpdSFybX6zTwBV8mFMFCT836pssXI75zwr7QqQhSTkIVKCyvZyP8cuoXoYl48DaVKGKg
	Wj9C4t9x1n+q6qCw0gYxXHcECzk7Q+hvExTvbnrzRZ1prAhwBxVwru9D94rzrm8iF1kJ
	PNtWTyTQEiDMNWGRHRRm9Iok6m0Pk91CYbfmUmiCF1LIBSgD0UQIEeokHC8IQtXw/cDH
	1InhqfCHiWXPx9e0ryF0Ur1vUA7ZxYL8DCKS9XtuVVYQZ8vRaHI1EIYqaR5D94Q0kIWJ
	1IAg==
X-Received: by 10.180.230.199 with SMTP id ta7mr8250658wic.1.1431374131212;
	Mon, 11 May 2015 12:55:31 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id v3sm1271643wix.8.2015.05.11.12.55.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 May 2015 12:55:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 11 May 2015 21:56:02 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150511195602.GN2400@jama>
References: <1430795900-25986-1-git-send-email-akuster808@gmail.com>
	<20150511090952.GF2400@jama>
	<CAMKF1sp5Vg3U6kWfRfJgCZki-EKpmSmYCJiizS6K5GnkzSKb5g@mail.gmail.com>
	<20150511190027.GK2400@jama>
	<CAMKF1srdavBqMeeuu-FThmD27WsA-Xiirf8KGi24rCMA-J1vgw@mail.gmail.com>
	<CAMKF1sr2r0mH+Oxp9K+nuBa4vrwYQn4ib_M2--AHgLAZidt1fQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr2r0mH+Oxp9K+nuBa4vrwYQn4ib_M2--AHgLAZidt1fQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] networkingmanager: QA warning for rdepends on polkit
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 May 2015 19:55:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2015 at 12:46:13PM -0700, Khem Raj wrote:
> On Mon, May 11, 2015 at 12:43 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Mon, May 11, 2015 at 12:00 PM, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
> >>
> >> RDEPENDS adds dependency only between do_package tasks for build time
> >> dependency you need do_configure depending on do_populate_sysroot
> >
> > its do_build which will depend on do_package_write task in case of RDEP=
ENDS
> > and do_package_write task will then recurse further to build it.
>=20
> backtracking on warning
>=20
> WARNING: QA Issue: networkmanager rdepends on polkit, but it isn't a
> build dependency? [build-deps]
>=20
> its confusing to me. It says 'rdepends' but then expects it in
> build-dependency and not build-rdep or somesuch

It says "rdepends" because that dependency was added by shlib providers
code to RDEPENDS. But that means that some binary is linked against
library provided by polkit -> it's build time dependency autodetected in
do_configure -> needs polkit in DEPENDS.

> but lets say it depends on buildtime then I agree adding it to third
> place is needed and may be adding to 4th place too
> if shlib is not detecting it.

It needs it only in 3rd, because shlib code works correctly, otherwise you
wouldn't see this QA warning.

In other words the QA check warns about runtime dependencies being added
by shlibs code without having their providers in build time dependencies.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

