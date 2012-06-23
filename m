Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SiE12-0001qN-67
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jun 2012 02:15:52 +0200
Received: by eaal1 with SMTP id l1so745068eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jun 2012 17:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=un0xeKNEqmtng7DSFiOMRYJy2GzuEXk2i3J63PQLbs8=;
	b=IiGRGGpgMMXh/WJuprVsCX4LDzPBEKKGKvwRy+oYHAF/0HkhnnW+MiI7S9jycZ3u9M
	ucJ/MprpZNpA+A7x5JE2k/tB4GGEQlIbBToNTbszmSUOyes1hL0qddxYiomWDY1lK9OV
	FT+8b4BeGmR2vrDkojz8g19YBj1tz4Q1RdFb6LLLmHfUT3BkC+zUkbowk/RJCYIG/QIT
	8P0p9PgrmLni5twqn6fIj5l1/5UUC3ca6AELELyoswhOfGgT2EAk5plBpg8hSCZGGhsk
	ZLWZyTz03vMqqYnMaB9SvcbThwbqn0F9qtG21/dFI2TswvPgrtT9lrQ+w/7HsznROuRi
	v5iQ==
Received: by 10.14.37.132 with SMTP id y4mr752638eea.142.1340409904415; Fri,
	22 Jun 2012 17:05:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.219.71 with HTTP; Fri, 22 Jun 2012 17:04:34 -0700 (PDT)
In-Reply-To: <4FE4DFCA.4090606@se-eng.com>
References: <4FE4DFCA.4090606@se-eng.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Jun 2012 17:04:34 -0700
Message-ID: <CAMKF1spLndPJgVWoHh9Tfs0SRpc=v8PaygUPsoh58ypygi8OvQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: New meta-xen layer
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
X-List-Received-Date: Sat, 23 Jun 2012 00:15:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 22, 2012 at 2:12 PM, Raymond Danks <ray.danks@se-eng.com> wrote=
:
> I have constructed a layer for the purpose of building Xen in OpenEmbedde=
d.
> =C2=A0Xen is a hypervisor and associated tools running on Linux available=
 as a
> package in distributions such as Ubuntu and Fedora. =C2=A0It is also modi=
fied and
> included in the rpm-based Xen Cloud Platform distribution and Citrix
> XenServer.
>
> This layer currently includes recipes and recipe modifications for buildi=
ng
> xen, libvirt, and a minimal xen image that may be used for launching virt=
ual
> machines via the xl command line interface. =C2=A0This currently targets =
the x86
> Xen host (OE target) architecture; development has been done entirely on
> x86_64.
>
> I'm open to receiving feedback, patches and suggestions. =C2=A0Also, I'm =
curious
> if this layer may be published to the OpenEmbedded layer index and by wha=
t
> process that should be achieved?

thanks for doing it and publishing it for community.
looks pretty good from very quick look at the content

 recipes-core/initscripts/ has .swp file committed.
NATIVE_INSTALL_WORKS is probably not needed in recipes
use oe_runmake instead of ${MAKE}
in some recipes you cache ac_cv_* vars you could use
CACHED_CONFIGUREVARS variable to contain them all instead of putting
them into EXTRA_OECONF

One think I am not sure is of is distro/minimal.conf in there. I dont
know if you want to have your own distro or not if you do it would be
nice to separate that out that way other distros can also use this
layer if they want to.

As long as you maintain the layer in good shape and in alignment with
other layers you depend on its should be fine and please add the entry
into LayerIndex on wiki

>
> meta-xen|Xen related software||git://git.se-eng.com/meta-xen.git|
> http://git.se-eng.com/gitweb/?p=3Dmeta-xen.git;a=3Dsummary|
>
> Thanks,
> Ray
>
> Raymond Danks
> Sage Electronic Engineering, LLC
> http://www.se-eng.com
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


