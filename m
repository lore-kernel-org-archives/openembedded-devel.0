Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4E05073F56
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 19:51:28 +0000 (UTC)
Received: by wgin8 with SMTP id n8so139833487wgi.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 12:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=nM7o5klwcBtu9JoU5g2euzNrCbE9CqtkjTtdERzFJrQ=;
	b=ntFElXFaeGtRrZ8uTR6fchRKJWo/OYswwIwZz+iQ23ABw+zhhjWr7XlBHV2wCneUJF
	W5hTN9/MMG8SjGlTUTL6G+Hv8DEw1Vozq7NLO11+3tPgD6j03KI7FKA0AvDpBoPRewnp
	Gj45k25VY6NLap4XalX86pU51FHqFgB3k4Ve95gMhImYBivjgClzwKkdhLsxKbjYvJAE
	En9jjCbdu2q0Q5MZhCsb2Hlf6ssIdx/+oZMvKo3vspHsEWN2IZotcegwetw4T/9Bt0z4
	JfLccj+MKHBWZyHHT/eZqUOXErIZSDpOgGWWzZ1jHD/AtT9iW9lUUNWK20OAN2w7lS9g
	TnHg==
X-Received: by 10.181.13.170 with SMTP id ez10mr22433034wid.72.1431373889830; 
	Mon, 11 May 2015 12:51:29 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id bh7sm24309373wjb.8.2015.05.11.12.51.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 May 2015 12:51:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 11 May 2015 21:52:00 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150511195200.GM2400@jama>
References: <1430795900-25986-1-git-send-email-akuster808@gmail.com>
	<20150511090952.GF2400@jama>
	<CAMKF1sp5Vg3U6kWfRfJgCZki-EKpmSmYCJiizS6K5GnkzSKb5g@mail.gmail.com>
	<20150511190027.GK2400@jama>
	<CAMKF1srdavBqMeeuu-FThmD27WsA-Xiirf8KGi24rCMA-J1vgw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srdavBqMeeuu-FThmD27WsA-Xiirf8KGi24rCMA-J1vgw@mail.gmail.com>
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
X-List-Received-Date: Mon, 11 May 2015 19:51:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2015 at 12:43:41PM -0700, Khem Raj wrote:
> On Mon, May 11, 2015 at 12:00 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> >
> > RDEPENDS adds dependency only between do_package tasks for build time
> > dependency you need do_configure depending on do_populate_sysroot
>=20
> its do_build which will depend on do_package_write task in case of RDEPEN=
DS
> and do_package_write task will then recurse further to build it.

        <section id=3D'build-dependencies'>
            <title>Build Dependencies</title>

            <para>
                BitBake uses the
                <link linkend=3D'var-DEPENDS'><filename>DEPENDS</filename><=
/link>
                variable to manage build time dependencies.
                The "deptask" varflag for tasks signifies the task of each
                item listed in <filename>DEPENDS</filename> that must
                complete before that task can be executed.
                Here is an example:
                <literallayout class=3D'monospaced'>
     do_configure[deptask] =3D "do_populate_sysroot"
                </literallayout>
                In this example, the <filename>do_populate_sysroot</filenam=
e>
                task of each item in <filename>DEPENDS</filename> must comp=
lete before
                <filename>do_configure</filename> can execute.
            </para>
        </section>


        <section id=3D'runtime-dependencies'>
            <title>Runtime Dependencies</title>

            <para>
                BitBake uses the
                <link linkend=3D'var-PACKAGES'><filename>PACKAGES</filename=
></link>,
                <link linkend=3D'var-RDEPENDS'><filename>RDEPENDS</filename=
></link>, and
                <link linkend=3D'var-RRECOMMENDS'><filename>RRECOMMENDS</fi=
lename></link>
                variables to manage runtime dependencies.
            </para>

            <para>
                The <filename>PACKAGES</filename> variable lists runtime
                packages.
                Each of those packages can have <filename>RDEPENDS</filenam=
e> and
                <filename>RRECOMMENDS</filename> runtime dependencies.
                The "rdeptask" flag for tasks is used to signify the task o=
f each
                item runtime dependency which must have completed before th=
at
                task can be executed.
                <literallayout class=3D'monospaced'>
     do_package_qa[rdeptask] =3D "do_packagedata"
                </literallayout>
                In the previous example, the <filename>do_packagedata</file=
name>
                task of each item in <filename>RDEPENDS</filename> must have
                completed before <filename>do_package_qa</filename> can exe=
cute.
            </para>
        </section>


so again, RDEPENDS isn't good enough for build time dependencies

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

