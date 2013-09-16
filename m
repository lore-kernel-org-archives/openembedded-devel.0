Return-Path: <akini@synapticon.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5464160648
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 12:32:56 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id ev20so2983943lab.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 05:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=M0h8qlKj/YD1HVZpcUgP5SherOuX1T8qL+HhMSDPPmA=;
	b=E0/kD9jrYTJMAK3JP1wESED/oRJxZut1Yiw7FBiychroL5XgL8ZH5tfBH7XOFUS3U8
	aahjumg9iIQHZpap4io5jHPRd7tFEd8O7SpIqe58ctwQRNxLf8uyGqbubNk75BxOMEhd
	oW3jtYKpAurZbyiZTJs96fPI6IKHwN2Ws8qjlQ+QunOspXZ5th1yB5c6Py7bBC7JaiL3
	EEgzQ5dswyH+XkOckQJKXZ+HPE0ds5ebm9PI9VByx351YExKSu9IZ8iesf7RpEFReuyR
	rX+cmwpATmQPXl7HjrlYmqvfaDUpq8tNggm//czZ6OSrm3MRAUDxuHVPvpjaQD02Ix91
	nCIg==
X-Gm-Message-State: ALoCoQmQt+AZ4R3FP8JpCrgbaBPtUN7KbDYrmhyXdWqbDUpzQ1ouLxAElK3SQ9g0cgjNIDnknkk+
MIME-Version: 1.0
X-Received: by 10.152.37.166 with SMTP id z6mr2118436laj.25.1379334777575;
	Mon, 16 Sep 2013 05:32:57 -0700 (PDT)
Received: by 10.114.3.8 with HTTP; Mon, 16 Sep 2013 05:32:57 -0700 (PDT)
In-Reply-To: <02f901ceb2d2$d93db7e0$8bb927a0$@oss.bmw-carit.de>
References: <CAKS01onp9CcPLNOybKbTh9bsp4QwuLJtJABrU7_zDe=Px0t6Nw@mail.gmail.com>
	<02f901ceb2d2$d93db7e0$8bb927a0$@oss.bmw-carit.de>
Date: Mon, 16 Sep 2013 14:32:57 +0200
Message-ID: <CAKS01ondqDK+WSxXaFSSk6_gBp5V9A6=Qh7g_TQz8WWUAaoHhQ@mail.gmail.com>
From: Anup Kini <akini@synapticon.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: using deb as source while building image.
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
X-List-Received-Date: Mon, 16 Sep 2013 12:32:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Lukas,

I have included meta-ros and was able to successfully build it. Thank You
for the meta-ros layer.

I am trying to understand how deb packages can be used to build the image.
Since, i need to install a few pre-built application.
let me know if you have any pointers on how to proceed with this.




On 16 September 2013 13:49, Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>w=
rote:

> Hello Anup,
>
> if you are trying to compile the Point Cloud Library for the ZYNQ board,
> you
> do not require the VTK library (as long as you do not need the
> visualization
> part).
> You can find a preliminary recipe for the Point Cloud Library at
>
>
> https://github.com/bulwahn/meta-ros/commit/2c1fb8dbc46f8bc3f3fe58fbdfb7b2=
c8f
> 244431a
>
> Hope this helps.
>
> Lukas
>
> > -----Urspr=FCngliche Nachricht-----
> > Von: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] Im
> > Auftrag von Anup Kini
> > Gesendet: Montag, 16. September 2013 12:58
> > An: openembedded-devel@lists.openembedded.org
> > Betreff: [oe] using deb as source while building image.
> >
> > Hi All,
> >
> > I am trying to build a core image minimal for the ZYNQ board.
> >
> > I am trying to include VTK library available as deb in the following
> location
> > http://ports.ubuntu.com/pool/universe/v/vtk/libvtk5.8_5.8.0-5_armhf.deb=
,
> > since its already compiled for ARM platform.
> >
> > When i try to use the recipe mentioned below, nothing gets installed.
> > Let me know if it is possible to use the deb as a source to install My
> recipe
> > looks like below:
> >
>
> -------------------------------------------------------------------------=
---
> ------------------
> > -------------------------------------
> > DESCRIPTION =3D "The Visualisation Toolkit"
> > HOMEPAGE =3D "http://www.vtk.org"
> >
> > LICENSE =3D "BSD"
> >
> > SRC_URI =3D "
> > http://ports.ubuntu.com/pool/universe/v/vtk/libvtk5.8_5.8.0-5_armhf.deb=
"
> >
> > SRC_URI[md5sum] =3D "14945458a1e80d2990a4005c5163e01c"
> >
> > # Skip the unwanted steps
> > do_compile[noexec] =3D "1"
> >
> > # Install the files to ${D}
> > bin_package_do_install () {
> >     # Do it carefully
> >     [ -d "${S}" ] || exit 1
> >     cd ${S} || exit 1
> >     tar --no-same-owner --exclude=3D'./patches' --exclude=3D'./.pc'
> > --exclude=3D'./control.tar.gz' -cpf - . \
> >         | tar --no-same-owner -xpf - -C ${D} }
> >
> > FILES_${PN} =3D "/"
> >
> > EXPORT_FUNCTIONS do_install
> >
>
> -------------------------------------------------------------------------=
---
> ------------------
> > --------------------------------------------
> >
> > Let me know if there is already a reference recipe that uses such a deb
> > source.
> >
> >
> >
> > --
> >
> > *Anup Kini
> > *Systems Engineer****
> > *
> > ------------------------------
> > *
> >
> > *Synapticon** * |  Cyber-Physical System Solutions ****
> >
> > Mobile:
> >
> > Direct:
> >
> > +49 151 / 638 646 73
> >
> > +49 7335 / 186 999 21
> >
> > Fax:****
> > +49 7335 / 186 999 1
> >
> >
> >  **
> >
> >  ****
> >
> > synapticon.com <http://www.synapticon.com/>  |
> > @synapticon_co<https://twitter.com/#!/synapticon_co>
> > ****
> >
> > Synapticon GmbH  |  Hohlbachweg 2  |  73344 Gruibingen, DE Secretary +4=
9
> > 7335 / 186 999 0  |  General Manager: Nikolai Ensslen Registry Court Ul=
m
> HRB
> > 725114  |  USt-ID DE271647127****
> >
> > This message and any files transmitted with it are confidential and
> intended
> > solely for the use of the individual or entity to whom they are
> addressed.
> > Please notify the sender immediately if you have received this e-mail b=
y
> > mistake and delete it from your system.
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



--=20

*Anup Kini
*Systems Engineer****
*
------------------------------
*

*Synapticon** * |  Cyber-Physical System Solutions ****

Mobile:

Direct:

+49 151 / 638 646 73

+49 7335 / 186 999 21

Fax:****
+49 7335 / 186 999 1


 **

 ****

synapticon.com <http://www.synapticon.com/>  |
@synapticon_co<https://twitter.com/#!/synapticon_co>
****

Synapticon GmbH  |  Hohlbachweg 2  |  73344 Gruibingen, DE
Secretary +49 7335 / 186 999 0  |  General Manager: Nikolai Ensslen
Registry Court Ulm HRB 725114  |  USt-ID DE271647127****

This message and any files transmitted with it are confidential and
intended
solely for the use of the individual or entity to whom they are addressed.
Please notify the sender immediately if you have received this e-mail by
mistake and delete it from your system.

