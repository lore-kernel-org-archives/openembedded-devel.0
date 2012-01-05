Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rirtt-0005La-Ka
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jan 2012 19:18:53 +0100
Received: by lami14 with SMTP id i14so246390lam.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jan 2012 10:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=vSfTjF0uxpETkb1bP0LbH0tESc3RU86EZK5vK0snKEc=;
	b=E9TnzMadm4OiQwqvZJvaPz2iHLHto1Dvk+6Y1+tJ3MGrf25isOkH3eqq+h88YNQiW4
	SBW2rmrDCEd+OJiID/T6hsgsc+ZUP6A7ql+2K56D3AELmUHe3fO6jILaIeUWgvMNaUyl
	o6/+vdLCCgfW8h8sOdtjdgfy6qtTQgD9WjS1A=
Received: by 10.112.43.41 with SMTP id t9mr588936lbl.93.1325787086171; Thu, 05
	Jan 2012 10:11:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.115.1 with HTTP; Thu, 5 Jan 2012 10:10:54 -0800 (PST)
In-Reply-To: <1325767804.22038.3.camel@localhost.localdomain>
References: <1325767804.22038.3.camel@localhost.localdomain>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Jan 2012 10:10:54 -0800
Message-ID: <CAMKF1srGgA7030KJaZWrNog=wRTX0hA-MxiB=k_qT85sHQNg5w@mail.gmail.com>
To: philby john <pjohn@mvista.com>
Cc: koen@openembedded.org, mwester@dls.net,
	openembedded-devel@lists.openembedded.org, hrw@openembedded.org
Subject: Re: [PATCH] Fix typo in ctcs that causes build failure
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jan 2012 18:18:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 5, 2012 at 4:50 AM, philby john <pjohn@mvista.com> wrote:
> From 19e675f8b24ae482b8c281ef8c32ef192894e4a1 Mon Sep 17 00:00:00 2001
> From: Philby John <pjohn@mvista.com>
> Date: Thu, 5 Jan 2012 18:01:11 +0530
> Subject: [PATCH] Fix typo in ctcs that causes build failure
>
> RDEPENDS includes a line perl-module-tcntl, which is
> clearly a typo for perl-module-fcntl, without which
> you get a build failure.
>
> Signed-off-by: Philby John <pjohn@mvista.com>

can you submit this as a pull request against 2011.03 maintenance branch ?

> ---
> =C2=A0recipes/ctorrent/ctcs_1.4.1.bb | =C2=A0 =C2=A03 ++-
> =C2=A01 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/ctorrent/ctcs_1.4.1.bb b/recipes/ctorrent/ctcs_1.4.1=
.bb
> index afaee6f..8680b0c 100644
> --- a/recipes/ctorrent/ctcs_1.4.1.bb
> +++ b/recipes/ctorrent/ctcs_1.4.1.bb
> @@ -1,10 +1,11 @@
> =C2=A0require ctorrent.inc
>
> =C2=A0DESCRIPTION +=3D "This is the controller of the enhanced version"
> -RDEPENDS_${PN} =3D "perl perl-module-strict perl-module-socket perl-modu=
le-tcntl \
> +RDEPENDS_${PN} =3D "perl perl-module-strict perl-module-socket perl-modu=
le-fcntl \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perl-module-errno perl-module-s=
ys-hostname"
>
> =C2=A0SRC_URI =3D "${SOURCEFORGE_MIRROR}/dtorrent/ctcs-${PV}.tar.gz"
> +PR=3D"r1"
>
> =C2=A0do_install () {
> =C2=A0 install -d ${D}/usr/bin
> --
> 1.6.3.3.338.ge89ce
>
>
>


