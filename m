Return-Path: <b.hutchman@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 53016605F4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Apr 2014 13:06:51 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id gq1so783160obb.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Apr 2014 06:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=7LPJRD+mnC2TvtfyIx+oHDFa/FT2MWpZ6LcveC4A6AI=;
	b=1AmDzEjhVV19WOFXE9vD90mJAHrSXHi+9lAYoHewjMYqYwZy4oD5di4G/byQ7SsF2Y
	Jp+Sd5BhUObG0sRkZP4CE62EdZWQVimDIJfD0z5SXL7N40iqwaeQ4CTJufbX63dtjz9L
	eq46X2ac9e5kSLGcZz8JS4/IPAIQZqN4bcX8ekkA93edamznYqrBjqjai9Ep3F5kAb6Z
	FySPJF+sJbbZBhyTTqX6zrbvhn7lC7m75km3JMBJiQDCC8i+5+xXCvDKYKU42c7ThkZl
	6PdrXefVAU8Cx7dXeBDXHyI8XuARUNuOb7mWl9Vwz35OVVYHv22sd2Edj6opwYFz18+U
	plsg==
MIME-Version: 1.0
X-Received: by 10.60.37.99 with SMTP id x3mr1462024oej.2.1397567212164; Tue,
	15 Apr 2014 06:06:52 -0700 (PDT)
Received: by 10.60.73.165 with HTTP; Tue, 15 Apr 2014 06:06:51 -0700 (PDT)
In-Reply-To: <CALYKT1ifSP62Tduyb3mvg-1C0_DqZJfYxKq0poZHZgwYthL_yQ@mail.gmail.com>
References: <CALYKT1ifSP62Tduyb3mvg-1C0_DqZJfYxKq0poZHZgwYthL_yQ@mail.gmail.com>
Date: Tue, 15 Apr 2014 09:06:51 -0400
Message-ID: <CAFZh4h_Uq+9j1U4g5RJHT+R2xf2amFD6aN++JGMAnDqa6LbBCw@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Where can I get a arm cross toolchain for oe-core?
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
X-List-Received-Date: Tue, 15 Apr 2014 13:06:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi again Journeyer,

As always, there are more than one way to do things.  I generate various
platform toolchains for our application engineers by using bitbake to build
the filesystem image and then the sdk for it as in:

bitbake core-image-minimal -c populate-sdk (some of the early versions of
OE don't support the populate-sdk command but if you are using a fairly
recent one it should work).

This will make a shell script that will install the toolchain onto your
host machine.  It is located in your build/tmp/deploy directory (I don't
have access to my build machine at the moment so I can't get too specific).

When you copy over the sdk install script to your host, it will install to
/usr/local/oecore-i686 (name depends on your host) and if you are using
Yocto it will be in /opt/poky/1.x

If your apps are makefile based, all you have to do is source the
environment setup script (source
environment-setup-armv7a-vfp-neon-oe-linux-gnueabi for example) which will
set up the path and environment variables etc., then you should be able to
build your apps against the same libs etc., that are in the target sysroot
because the sdk you just installed on the host has the same sysroot.

So in a nut shell, that's how we do it.  It keeps the apps guys from having
to learn the bitbake/OE/Angstrom/Arago/Yocto world.

If you look at the Yocto Documentation, they have this ADT system for
building apps that is pretty well documented.

If you just google search "-c populate-sdk" I'm sure you will find a bunch
of examples and topics.

Regards,

Brian



On Tue, Apr 15, 2014 at 7:42 AM, Journeyer J. Joh
<oosaprogrammer@gmail.com>wrote:

> Hello,
>
> I use OE for qualcomm's MDM + AP soc system.
> OE is used on AP side.
>
> The build environment is bitbake based and I felt it like a sandbox system.
> I am sorry I don't know about OE, bitbake very well.. almost I know
> nothing..
>
> I can build the target image. Yes.
> But I wonder how I compile any 3rd party applications for my target.
> I did build one by adding the application source code into the whole image
> source tree.
> This way builds the application as a part of the target image. I can find
> it in /usr/bin with other default applications together.
>
> And I did build another by using a general arm cross toolchain like
> arm-none-linux-gnueabi-gcc.
> Using this toolchain is simple and easy. But there is no gurantee that this
> toolchain has identical libc that is used in the target image. It's not
> only the libc, runtime library, and hardware floating point operation
> configurations are not certain, not guranteed.
>
> I believe there should exist one that 100% syncs with OE bitbake compile
> environment.
> I doubt if I can try to use just OE bitbake environment for those 3rd party
> applications.
>
> How am I supposed to go forward?
>
> Sincerely
> Journeyer
>
> ----------------------------------------
> Journeyer J. Joh
> o o s a p r o g r a m m e r
> a t
> g m a i l  d o t  c o m
> ----------------------------------------
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

