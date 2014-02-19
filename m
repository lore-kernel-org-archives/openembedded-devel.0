Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-ve0-f178.google.com (mail-ve0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id BD3726EC7B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2014 16:15:18 +0000 (UTC)
Received: by mail-ve0-f178.google.com with SMTP id oy12so609181veb.37
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2014 08:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=PNVTKi4kB3Qyr8vYGN0AeSeuSpPundTEhf7YnVCKyeI=;
	b=GnVzZTrZmNNxkhgqw1uk1Weqs5Yx3huWoBtm9CVbY5SbPJraS6AeiGqXShUa2KEeEQ
	ODgwryCo851nqk1uLCyO5wH8m9N6n0dJQ//m0MufCBHTMhzIW+3O2Z9msKaOP0VZlySn
	Abwhj7LyBDAw/XZSSoKTT9h3URu996UolaOlYRz2yK9tY45SGcmr06mLEjZutEmHwn7F
	iUTqNrqoOI1MwIIQbVe+yqtUZ0dVw6kT2caP63qrEtsa8z/28Tk5niJHrjP5jTaCjEfZ
	douog3uOsy8nd7Qp8twlHoIQbIPn6EW8OC0aG9+/nyEpkaesH0VAluuTV/dCCwjN5n01
	aB7Q==
MIME-Version: 1.0
X-Received: by 10.52.157.8 with SMTP id wi8mr1550901vdb.46.1392826519538; Wed,
	19 Feb 2014 08:15:19 -0800 (PST)
Received: by 10.52.169.99 with HTTP; Wed, 19 Feb 2014 08:15:19 -0800 (PST)
In-Reply-To: <CALbNGRS6kRODsVKPVunWQzVSBwkKn8cXdSWwpmWTXhJ_chfeSA@mail.gmail.com>
References: <CAFeBWL6zsCSF2Op72zvnaZ=XmHQkXUcH8we=vFDrVo--wb6bdw@mail.gmail.com>
	<CALbNGRS6kRODsVKPVunWQzVSBwkKn8cXdSWwpmWTXhJ_chfeSA@mail.gmail.com>
Date: Wed, 19 Feb 2014 08:15:19 -0800
Message-ID: <CAFeBWL78jHPU1XUvo6PC4=Qy2RFKCphNbq4mH6Y_R0bbTyGMyg@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: GDM alternative?
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
X-List-Received-Date: Wed, 19 Feb 2014 16:15:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Thank you Koen and Andreas. That has been really helped in clearing up my
confusion and setting the path forward.

I think I will try LXDM in meta-misc in meta-oe. Is there any special
configuration that I should be aware of (other then setting it as the
graphical init manager)?

Regards,

Adam

On Wed, Feb 19, 2014 at 2:18 AM, Andreas M=FCller <
schnitzeltony@googlemail.com> wrote:

> On Tue, Feb 18, 2014 at 10:24 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:
> > Hello everyone, I am sure this has been asked before but I haven't foun=
d
> a
> > solution.
> >
> > I am currently integrating GDM to my XFCE image. I was hoping that it's
> as
> > easy as adding GDM as the graphical init manager (in local.conf), but i=
t
> > looks like PolicyKit, Console Kit, PAM, gconf, gconf-sanity (as per
> > meta-angstrom) all need to be correctly configured for GDM to work. Thi=
s
> > integration of multiple frameworks is not what I had in mind. So I am n=
ow
> > searching for alternative - something more lightweight and with less
> > dependency.
> >
> > meta-oe contains another login manager 'slim', except it's no longer
> > maintained and has been moved to nonworking directory within the tree. =
I
> > don't see any other.
> >
> > Thank you,
> >
> > Adam
>
> I am using lxdm for my XFCE-image.
>
> Andreas
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

