Received: from [209.85.220.220] (helo=mail-fx0-f220.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MAVQI-0005o2-Rt
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 May 2009 22:44:58 +0200
Received: by fxm20 with SMTP id 20so6767332fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 May 2009 13:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ryO8jtI/b4/U7aPUuhpCnHn5HhACWiclbenQ01O14pM=;
	b=xc/t35LlZ/XsfEa0jQDtz9/ew5snVG+TIkjVZpws8siZtaRgQg16XZJ1VaAp+OUDmx
	t6Wg2NHj92M07WiVTkKJf9B2HfeKovyQE/cfy/YZ2x9pzWtPv9BloH02ArD8FERs0Asp
	dIp1ogXCOgcEfpvvWHWpIlKpJq8+0eVzEm60M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=AHvpfH7D2SA7BbDRXMI9E/3abh2hY59qSNL0APMYBiWqcvJr7MPGcUI0IEnq5l3VoW
	AAowc5eloEmrGZwzz3JNZtWb43GHlCqwngycmqeAFtM6UuJp19fa+N2Gs9iIioZ0t9+5
	ydgNYVw/oc2GUyrmLvkbtjdbQud6Dzjl72rbo=
MIME-Version: 1.0
Received: by 10.103.49.12 with SMTP id b12mr2341058muk.51.1243715783541; Sat, 
	30 May 2009 13:36:23 -0700 (PDT)
In-Reply-To: <1243250313-10392-1-git-send-email-ihar.hrachyshka@gmail.com>
References: <1243246822.4869.19.camel@lenovo.internal.reciva.com>
	<1243250313-10392-1-git-send-email-ihar.hrachyshka@gmail.com>
Date: Sat, 30 May 2009 23:36:23 +0300
Message-ID: <fce2a370905301336g13f80d7bhe2c07b72160eea74@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] gnome.bbclass: remove unneeded scrollkeeper stuff from gnome packages.
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
X-List-Received-Date: Sat, 30 May 2009 20:44:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Any chance we can get it in tree? This dependency bug is rather annoying.

On Mon, May 25, 2009 at 2:18 PM, Ihar Hrachyshka
<ihar.hrachyshka@gmail.com> wrote:
> Scrollkeeper generates its XML database for every package when
> installing it. The problem is that while building it sees only specific
> package scrollkeeper stuff so we get wrong scrollkeeper xml file
> generated for every gnome.bbclass package. Including the file into every
> gnome package results in package contents conflicts.
>
> This patch removes a quick hack made by Koen with previous commit.
>
> Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
> ---
> =C2=A0classes/gnome.bbclass | =C2=A0 =C2=A08 +++++---
> =C2=A01 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/classes/gnome.bbclass b/classes/gnome.bbclass
> index d2ca739..da88884 100644
> --- a/classes/gnome.bbclass
> +++ b/classes/gnome.bbclass
> @@ -17,9 +17,11 @@ inherit autotools gtk-icon-cache pkgconfig gconf mime
>
> =C2=A0AUTOTOOLS_STAGE_PKGCONFIG =3D "1"
>
> -PACKAGES =3D+ "${PN}-scrollkeeper-leftovers"
> -FILES_${PN}-scrollkeeper-leftovers =3D "${localstatedir}/lib/scrollkeepe=
r"
> -
> =C2=A0gnome_stage_includes() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0autotools_stage_includes
> =C2=A0}
> +
> +do_install_append() {
> + =C2=A0 =C2=A0 =C2=A0 rm -rf ${D}${localstatedir}/lib/scrollkeeper/*
> +}
> +
> --
> 1.6.3.1
>
>


