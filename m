Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1BA486E70E
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Feb 2014 18:55:24 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id tp5so2998970ieb.35
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2014 10:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=7i9PADqGiz3h1/mXJHy+auJwUDRm7uJiyx6Fv+VZkkg=;
	b=YjSJJUFouF24xwhIQEgKZZZAaFuazPrT4dagcCDeSb6jUQkbd5dlzldCjSyCBoveY4
	+3A8PD1p7zH/QeWsYrlNyXF3F1g/bmVGnyjvVxARmoEI/wWzfMTN+KDtX6vobl+hYVAQ
	rcoDCXr0NKslmyla8Z1dLfe4MaulA6+V3hXNjGlm9n8Z5Qj0096oOCNJS3jOdtu4SUyI
	+m0ohxvaKtSFrDpgFKTR36WuNbx+Ar2fKGRHl0owjD8lux9qd3XvmUF+D0I2egw/5HEj
	+pz0uH8VXw8qtNZ56xc/XPmeXv73Ouk7vova2+nv9pyx2W/qmjmLQs89EoQz3jy4feqh
	IyzQ==
X-Received: by 10.50.29.9 with SMTP id f9mr10712353igh.2.1391972124871; Sun,
	09 Feb 2014 10:55:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.8.137 with HTTP; Sun, 9 Feb 2014 10:54:54 -0800 (PST)
In-Reply-To: <CAMHavcJu66O8Z+-h_cneGJr2_N_KVpah94SDv+w7JydgX0qBKA@mail.gmail.com>
References: <CAMHavcJu66O8Z+-h_cneGJr2_N_KVpah94SDv+w7JydgX0qBKA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 9 Feb 2014 18:54:54 +0000
Message-ID: <CAMKF1spr0iPpMsBfA5BwSvxkUWCEO5MpLY9iGiPBRDyOh3-73g@mail.gmail.com>
To: Ridish Rema Aravindan <ridishonline@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Packaging issue in rdk-generic-image
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
X-List-Received-Date: Sun, 09 Feb 2014 18:55:25 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Feb 8, 2014 at 10:51 PM, Ridish Rema Aravindan
<ridishonline@gmail.com> wrote:
> Hello,
>
> While compiling for RDK emulator for rdk-generic-image I see that
> gst-plugins-good, base and bad are not
> installed in the rootfs after I generated the vmdk first time.
>
> So I tried giving FILES_${PN} += " ${libdir}/gstreamer-0.10/*.so" in
> bbappend of gst-plugins in meta-rdk but the build failed as below:

if you do not see packages  in your images then you should add the
packages to IMAGE_INSTALL either via packagegroups or individual
package names.

If they were unpackaged in gst-plugins-* recipes then above change
will be good however the regexp is greedy. Usually *.so.* go into
packages and system should already take care of packaging *.so into
-dev packages

You should also include the changes you are making as well as your
image/packagegroups recipes and any other information like it compiled
fine on arm but not on x86 etc. to help you out better.

>
> | Configuring packagegroup-machine-base.
> | Configuring packagegroup-base.
> | Configuring packagegroup-base-extended.
> | Collected errors:
> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies for
> packagegroup-rdk-debug:
> |  *     gst-plugins-good-debug *         gst-plugins-base-gio *
> gst-plugins-base-volume *        gst-plugins-base-audioresample *
> gst-plugins-base-videoscale *    gst-plugins-base-typefindfunctions *
> gst-plugins-good-autodetect *    gst-plugins-base-audioconvert *
> gst-plugins-base-decodebin2 *    gst-plugins-good-souphttpsrc *
> gst-plugins-base-decodebin *     gst-plugins-base-alsa *
> gst-plugins-base-playbin *       gst-plugins-base-ffmpegcolorspace *
> gst-plugins-base-audiotestsrc *  gst-plugins-base-videotestsrc *
> |  * opkg_install_cmd: Cannot install package packagegroup-rdk-debug.
> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies for
> packagegroup-rdk-oss:
> |  *     gst-plugins-good-isomp4 *        gst-plugins-good-avi *
> gst-plugins-good-matroska *      gst-plugins-base-theora *
> gst-plugins-base-vorbis *        gst-plugins-good-wavparse *
> gst-plugins-good-flac *  gst-plugins-base-ogg *
> |  * opkg_install_cmd: Cannot install package packagegroup-rdk-oss.
> | WARNING:
> /home/ubuntu/RDK_EMULATOR_DEMO/build-qemux86/tmp/work/qemux86-rdk-linux/rdk-generic-image/1.0-r0/temp/run.do_rootfs.2423:1
> exit 255 from
> |   opkg-cl ${ipkg_args} install ${package_to_install}
> | ERROR: Function failed: do_rootfs (log file is located at
> /home/ubuntu/RDK_EMULATOR_DEMO/build-qemux86/tmp/work/qemux86-rdk-linux/rdk-generic-image/1.0-r0/temp/log.do_rootfs.2423)
> ERROR: Task 7
> (/home/ubuntu/RDK_EMULATOR_DEMO/meta-rdk/recipes-core/images/rdk-generic-image.bb,
> do_rootfs) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 4129 tasks of which 4009 didn't need to be
> rerun and 1 failed.
> NOTE: Writing buildhistory
> No currently running tasks (4129 of 4134)
>
> Summary: 1 task failed:
>
> /home/ubuntu/RDK_EMULATOR_DEMO/meta-rdk/recipes-core/images/rdk-generic-image.bb,
> do_rootfs
> Summary: There was 1 WARNING message shown.
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> ubuntu@buildvm-2:~/RDK_EMULATOR_DEMO/build-qemux86$
>
> Could you please help how and where to fix it?
>
> Disclaimer: I'm a novice at yocto build system :)
>
> Thanks,
> Ridish
>

