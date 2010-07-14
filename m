Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OZ9Dx-0005WM-Hi
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 23:10:39 +0200
Received: by bwz10 with SMTP id 10so247950bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jul 2010 14:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=vyl3B450eBywiUmgTR9adfEE2r2q/dikpFY3s/4LbUU=;
	b=M/MqMAtmXT6U3Sdc1zd8xNWKFYOpABdzooawrkzHnRyy7dadF4a7WWnL+je33kV3kR
	IkHMbXhus/MesWqT8D5Y8eUVTT+q0OPeSr+gzQitK74ON9zprIJ/NbsMtLcXnOKA2yEv
	qe1YW4YyweFy4jAv1cW88zGyPXudTkC8HHHDg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Qahj7qgo9+slgpAEoUwv19Yd3x9LnmBB8YJldna+HAQCCG+owM5b3Xate+eLL8K8Ag
	SYY+UN/9EmR5nL5/FWFUlT4WAoHwZwNalvLf6YDlfec7olLQpyK4Hrj6M/3Hp4DwkEIL
	aEeXplJip1XvEGaQaxIvIYbHcLazrZ3qtS9pw=
MIME-Version: 1.0
Received: by 10.204.135.214 with SMTP id o22mr2883104bkt.56.1279141835749; 
	Wed, 14 Jul 2010 14:10:35 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Wed, 14 Jul 2010 14:10:35 -0700 (PDT)
In-Reply-To: <AANLkTindZSTARjjrX2Kemd8TY5pQBd-DCqmfFbl-wAgi@mail.gmail.com>
References: <1279060140-17856-1-git-send-email-aalonso00@gmail.com>
	<1279060140-17856-3-git-send-email-aalonso00@gmail.com>
	<AANLkTilHurZ2SREbdIUdkZgIQ7yjc5ygtsXnz5Cb3yb1@mail.gmail.com>
	<AANLkTindZSTARjjrX2Kemd8TY5pQBd-DCqmfFbl-wAgi@mail.gmail.com>
Date: Wed, 14 Jul 2010 23:10:35 +0200
Message-ID: <AANLkTimTfrHxmFqCboYlNGA0KldkNGkyqdu_NN_bUJqL@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 3/3 v2] linux-xilinx: new kernel recipe
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
X-List-Received-Date: Wed, 14 Jul 2010 21:10:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/14 Adrian Alonso <aalonso00@gmail.com>

> I don't have commit rights so I need some one to commit for me.
>

I can do that for you after all issues are resolved.
For the glibc and X11 patch I would like to see an ack from someone who is
more knowledgeable than I am in that area.
I suggest you send a fresh set just to be sure that nothing goes wrong.

Frans


>
> Thanks.
>
> On Wed, Jul 14, 2010 at 2:11 AM, Frans Meulenbroeks <
> fransmeulenbroeks@gmail.com> wrote:
>
> > 2010/7/14 Adrian Alonso <aalonso00@gmail.com>
> >
> > > * Kernel recipe for generic xilinx platforms
> > > * Inherits xilinx-bsp.bbclass to pass device
> > >  tree for the final arch
> > >
> > > Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
> > > ---
> > >  recipes/linux/linux-xilinx_git.bb |   35
> > > +++++++++++++++++++++++++++++++++++
> > >  1 files changed, 35 insertions(+), 0 deletions(-)
> > >  create mode 100644 recipes/linux/linux-xilinx_git.bb
> > >
> > > diff --git a/recipes/linux/linux-xilinx_git.bb b/recipes/linux/
> > > linux-xilinx_git.bb
> > > new file mode 100644
> > > index 0000000..2a17c85
> > > --- /dev/null
> > > +++ b/recipes/linux/linux-xilinx_git.bb
> > > @@ -0,0 +1,35 @@
> > > +require linux.inc
> > > +
> > > +DESCRIPTION = "Linux kernel for Xilinx platforms"
> > > +
> > > +COMPATIBLE_MACHINE = "xilinx-virtex4|xilinx-virtex5|xilinx-mb-gen"
> > > +DEFAULT_PREFERENCE = "-1"
> > > +DEFAULT_PREFERENCE_xilinx-virtex4 = "1"
> > > +DEFAULT_PREFERENCE_xilinx-virtex5 = "1"
> > > +DEFAULT_PREFERENCE_xilinx-mb-gen = "1"
> > > +
> > > +PV = "2.6.33+git"
> > > +PR = "r0"
> > > +
> > > +SRCREV = "17431547113100a3ae0a622b9f76ad17fb76eb56"
> > > +SRC_URI = "git://git.xilinx.com/linux-2.6-xlnx.git;protocol=git \
> > > +           file://xilinxfb.c-update-tft-comp.patch \
> > > +                  file://defconfig"
> > > +
> > > +PV_xilinx-mb-gen = "2.6.34+git"
> > > +SRCREV_xilinx-mb-gen = "382e23534109197daddbcbcdf5aae75c674638e7"
> > > +SRC_URI_xilinx-mb-gen = "git://
> > > developer.petalogix.com/linux-2.6-microblaze.git;protocol=git \
> > > +                       file://defconfig"
> > > +
> > > +inherit kernel xilinx-bsp
> > > +
> > > +TARGET_BOARD = "${@map_target(bb.data.getVar('TARGET_ARCH', d, 1),
> d)}"
> > > +KERNEL_DEVICETREE_xilinx-virtex4 =
> > > "arch/${ARCH}/boot/dts/virtex${TARGET_BOARD}.dts"
> > > +KERNEL_DEVICETREE_xilinx-virtex5 =
> > > "arch/${ARCH}/boot/dts/virtex${TARGET_BOARD}.dts"
> > > +KERNEL_DEVICETREE_xilinx-mb-gen =
> > > "arch/${ARCH}/platform/generic/${TARGET_BOARD}.dts"
> > > +
> > > +S = "${WORKDIR}/git"
> > > +
> > > +do_configure_prepend() {
> > > +    install -m 0644 ${WORKDIR}/defconfig ${S}/.config
> > > +}
> > > --
> > > 1.7.1.1
> > >
> > > Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> >
> > BTW: do you have commit rights? Or does someone need to commit for you?
> >
> > Frans
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
>
>
> --
> Saludos
> Adrian Alonso
> http://aalonso.wordpress.com
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

