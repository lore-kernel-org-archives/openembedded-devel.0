Return-Path: <ridishonline@gmail.com>
Received: from mail-yh0-f52.google.com (mail-yh0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 49D506E3BB
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Feb 2014 22:51:17 +0000 (UTC)
Received: by mail-yh0-f52.google.com with SMTP id a41so3831982yho.25
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Feb 2014 14:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=/b3xCt/Nk225aBHvpBltbCQGTMxIzYRtXVrhGuWYMSc=;
	b=BdpebQBbkqolN0ObudSiyBdDFCkOOPnTeLMag/NffxCKNhVw0JhNmdRoOJS/P0b3Mr
	5f6AALEwPAPP1EWyjfGz8OtOcbxJW7UXPt3i3bjp7Kmm+1RmY+nZNhG5UmSS31Ar5ltz
	N4Nm4P9j6MXQ6p3SHImSAItKT5aRcmsoRz8faimi/coT1Vt7Aq8YMc2j7dlmdUIEpVB7
	vGPzou1mwuOagjhNPZX2BAK/OJ/GWCwA3Fdj8YocX5LiFwpzzYzbE3kk3bmfVOFpXNiM
	Sr97YRGfY9SiPxg/YygLeD8RMiKQdIFNQUumEQ/c29XiS7QUqY+Tx+j31pi3xd6Ucbas
	//RQ==
MIME-Version: 1.0
X-Received: by 10.236.91.101 with SMTP id g65mr18681797yhf.35.1391899878058;
	Sat, 08 Feb 2014 14:51:18 -0800 (PST)
Received: by 10.170.157.139 with HTTP; Sat, 8 Feb 2014 14:51:17 -0800 (PST)
Date: Sat, 8 Feb 2014 14:51:17 -0800
Message-ID: <CAMHavcJu66O8Z+-h_cneGJr2_N_KVpah94SDv+w7JydgX0qBKA@mail.gmail.com>
From: Ridish Rema Aravindan <ridishonline@gmail.com>
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org, 
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Packaging issue in rdk-generic-image
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
X-List-Received-Date: Sat, 08 Feb 2014 22:51:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

While compiling for RDK emulator for rdk-generic-image I see that
gst-plugins-good, base and bad are not
installed in the rootfs after I generated the vmdk first time.

So I tried giving FILES_${PN} += " ${libdir}/gstreamer-0.10/*.so" in
bbappend of gst-plugins in meta-rdk but the build failed as below:

| Configuring packagegroup-machine-base.
| Configuring packagegroup-base.
| Configuring packagegroup-base-extended.
| Collected errors:
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies
for packagegroup-rdk-debug:
|  *     gst-plugins-good-debug *         gst-plugins-base-gio *
gst-plugins-base-volume *        gst-plugins-base-audioresample *
gst-plugins-base-videoscale *    gst-plugins-base-typefindfunctions *
gst-plugins-good-autodetect *    gst-plugins-base-audioconvert *
gst-plugins-base-decodebin2 *    gst-plugins-good-souphttpsrc *
gst-plugins-base-decodebin *     gst-plugins-base-alsa *
gst-plugins-base-playbin *       gst-plugins-base-ffmpegcolorspace *
gst-plugins-base-audiotestsrc *  gst-plugins-base-videotestsrc *
|  * opkg_install_cmd: Cannot install package packagegroup-rdk-debug.
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies
for packagegroup-rdk-oss:
|  *     gst-plugins-good-isomp4 *        gst-plugins-good-avi *
gst-plugins-good-matroska *      gst-plugins-base-theora *
gst-plugins-base-vorbis *        gst-plugins-good-wavparse *
gst-plugins-good-flac *  gst-plugins-base-ogg *
|  * opkg_install_cmd: Cannot install package packagegroup-rdk-oss.
| WARNING:
/home/ubuntu/RDK_EMULATOR_DEMO/build-qemux86/tmp/work/qemux86-rdk-linux/rdk-generic-image/1.0-r0/temp/run.do_rootfs.2423:1
exit 255 from
|   opkg-cl ${ipkg_args} install ${package_to_install}
| ERROR: Function failed: do_rootfs (log file is located at
/home/ubuntu/RDK_EMULATOR_DEMO/build-qemux86/tmp/work/qemux86-rdk-linux/rdk-generic-image/1.0-r0/temp/log.do_rootfs.2423)
ERROR: Task 7 (/home/ubuntu/RDK_EMULATOR_DEMO/meta-rdk/recipes-core/images/
rdk-generic-image.bb, do_rootfs) failed with exit code '1'
NOTE: Tasks Summary: Attempted 4129 tasks of which 4009 didn't need to be
rerun and 1 failed.
NOTE: Writing buildhistory
No currently running tasks (4129 of 4134)

Summary: 1 task failed:
  /home/ubuntu/RDK_EMULATOR_DEMO/meta-rdk/recipes-core/images/
rdk-generic-image.bb, do_rootfs
Summary: There was 1 WARNING message shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.
ubuntu@buildvm-2:~/RDK_EMULATOR_DEMO/build-qemux86$

Could you please help how and where to fix it?

Disclaimer: I'm a novice at yocto build system :)

Thanks,
Ridish

