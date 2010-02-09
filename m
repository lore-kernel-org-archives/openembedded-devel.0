Received: from mail-yw0-f204.google.com ([209.85.211.204])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msundius@sundius.com>) id 1NevB5-0006DB-IV
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 19:51:18 +0100
Received: by ywh42 with SMTP id 42so6270613ywh.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Feb 2010 10:48:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.143.154.11 with SMTP id g11mr1642729wfo.271.1265741317372; 
	Tue, 09 Feb 2010 10:48:37 -0800 (PST)
In-Reply-To: <ee0a1e451002091036i9ff6334r46624c99884d0e6c@mail.gmail.com>
References: <89CD81306A03F24FAEA2177A341C2C613B8764@XMB-RCD-209.cisco.com>
	<18e217241002091006t1482a491o93c3a5dfa8a3ab83@mail.gmail.com>
	<ee0a1e451002091036i9ff6334r46624c99884d0e6c@mail.gmail.com>
Date: Tue, 9 Feb 2010 10:48:37 -0800
Message-ID: <18e217241002091048m1eae018cp5ad19bdf71af51f4@mail.gmail.com>
From: C Michael Sundius <msundius@sundius.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.204
X-SA-Exim-Mail-From: msundius@sundius.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: initramfs image with secondary cramfs inside
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
X-List-Received-Date: Tue, 09 Feb 2010 18:51:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

ah we do the combining of the two images in a postprocess step after the 2nd
image...

but I wonder if we are to make a dummy preprocess step that will make a
difference...
not sure why that would work.

we'll give it a try.. which version of bitbake are you using?


On Tue, Feb 9, 2010 at 10:36 AM, Cedric GESTES <goctaf@gmail.com> wrote:

> Yes we succeeded but this is far from being optimal in our case.
>
> We have two recipes: opennao-image and nao-initramfs-image.
>
> In opennao-image.bb:
>
> DEPENDS                         = "nao-initramfs-image"
> IMAGE_PREPROCESS_COMMAND       += "do_copy_initrd"
>
> do_copy_initrd() {
>  install -d  ${IMAGE_ROOTFS}/boot
>  install -m  0644 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME_RD}
> ${IMAGE_ROOTFS}/boot/initrd
> }
>
>
> This will do ther trick.
>
> On Tue, Feb 9, 2010 at 7:06 PM, C Michael Sundius <msundius@sundius.com>
> wrote:
> > In otherwords has anyone had any success with making one image depend
> upon a
> > 2nd image?
> >
> > if you what did you do to make that work.
> > mike
> >
> >
> > On Mon, Feb 8, 2010 at 4:37 PM, John Van Horne (vanhorj)
> > <vanhorj@cisco.com>wrote:
> >
> >> The system I'm working on boots up with an initramfs image which
> >> contains a very minimal file system. During the boot process, a second
> >> file system image, in cramfs format, is mounted and used as the root
> >> file system. Does anyone have any experience using OE to build such an
> >> image? My approach to this was to have a recipe for the cramfs image and
> >> a recipe for the initramfs image, and to list the cramfs image as a
> >> dependency of the initramfs recipe. Both of these recipes inherit the
> >> image class. However, running bitbake on the initramfs recipe fails
> >> because the cramfs do_rootfs and do_deploy_to tasks have not run. After
> >> running bitbake with debug info turned on, it seems that the initramfs
> >> recipe depends upon the do_populate_stage task of cramfs, but not
> >> do_rootfs and do_deploy_to. Could anyone offer any insight into why this
> >> is?
> >>
> >>
> >>
> >> Thanks
> >>
> >> -John
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >>
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

