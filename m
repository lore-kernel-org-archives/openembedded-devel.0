Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-vc0-f182.google.com (mail-vc0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 77D7860D0E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 21:31:03 +0000 (UTC)
Received: by mail-vc0-f182.google.com with SMTP id ks9so1684514vcb.41
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 14:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=YOKUW7UOHigY/bEdrbeXq+UdS1Bh1W3mOyj9HsOildk=;
	b=uiQAdkjK0RDHO/0a/gJDq+4DF9mVcbIIJ1NPvPe+76ldnatyz+kSrndpBn1jU/SVtd
	Go2EPQjN79oVn9yYZ6ynikv7sZNwyVj9S2oJdRl0A23OBItnSEQ6uROIoCVXhoOSb9gu
	mdHL5u6e/+JyhwRpqcYgczfDKtvN2nzDrNGue36mvxZVkM3dK/ul0stmS+iqBq/dhMer
	RYqZdasPOPQuK3yUp2Bvt/YD4HNoZEU3rgTNgXiljbCrMlBHIqcLLme7Xpa9yur2m3o1
	JwGAa/LPGBuUkOnAdpa+FyBHmwLeCdvKVm6HEz7EqhWTp9PwI0L3CXp9PdGOOL92SrNt
	X4CA==
MIME-Version: 1.0
X-Received: by 10.52.90.37 with SMTP id bt5mr2466456vdb.7.1395351064378; Thu,
	20 Mar 2014 14:31:04 -0700 (PDT)
Received: by 10.52.85.67 with HTTP; Thu, 20 Mar 2014 14:31:04 -0700 (PDT)
In-Reply-To: <CAFeBWL4=C3dWdGNX2UgGUJGu1EGdpodocwJ5hbJLDWowa-OePw@mail.gmail.com>
References: <CAFeBWL4=C3dWdGNX2UgGUJGu1EGdpodocwJ5hbJLDWowa-OePw@mail.gmail.com>
Date: Thu, 20 Mar 2014 14:31:04 -0700
Message-ID: <CAFeBWL6UtD8ZYtVmLLKe05qtkzn_OgDKsKAgk1jX262E5GH9Hg@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: libxfce4ui build fail on master branch
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
X-List-Received-Date: Thu, 20 Mar 2014 21:31:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

Weird, when I bitbaked the package individually, it built ok. Now my xfce
image is also happily building.


On Thu, Mar 20, 2014 at 2:11 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:

> Hello everyone, I am building my dora bsp layers with OE/poky master to
> prepare for 1.6 release.
> My console image built just fine, but I am getting this error while
> building xfce image.
>
> NOTE: Executing intltoolize --copy --force --automake
>
> NOTE: Executing ACLOCAL="aclocal --system-acdir=/media/Build/Post-Dora/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/libxfce4ui/4.10.0+gitAUTOINC+530b72f50f-r0/git/aclocal-copy/" autoreconf --verbose --install --force --exclude=autopoint
>
> autoreconf: Entering directory `.'
>
> autoreconf: configure.ac: not using Gettext
>
> autoreconf: running: aclocal --system-acdir=/media/Build/Post-Dora/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/libxfce4ui/4.10.0+gitAUTOINC+530b72f50f-r0/git/aclocal-copy/ --force
>
> aclocal: error: couldn't open directory '/media/Build/Post-Dora/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/libxfce4ui/4.10.0+gitAUTOINC+530b72f50f-r0/git/aclocal-copy/': No such file or directory
>
> autoreconf: aclocal failed with exit status: 1
>
> ERROR: autoreconf execution failed.
>
> WARNING: exit code 1 from a shell command.
>
> ERROR: Function failed: do_configure (log file is located at /media/Build/Post-Dora/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/libxfce4ui/4.10.0+gitAUTOINC+530b72f50f-r0/temp/log.do_configure.2388)
>
>
> This
> <https://github.com/gumstix/Gumstix-YoctoProject-Repo/blob/dev/default.xml>is
> my manifest just in case.
>
> Thank you for your help!
>
> Adam
>

