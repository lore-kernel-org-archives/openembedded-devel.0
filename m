Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 98A066E831
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2014 16:30:15 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id uy17so9443370igb.4
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2014 08:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=Lb4qskr6ewESEHhpRMl9F8UXdO7ph5n/0Yx/yJKc9NA=;
	b=mxzc5EO+HJJeAWwKCQmcjScMnMF2mMiSTFVoFjRvpT/fgbH4yzWnYKmOTCOwN/M30K
	mPTeLiPX47MHKEZ9jQ5GolnnK+6zaz3zqDRdsBS74NwLyVGqBopQ9iG3C23lmCY0lHQ9
	/RTmjbKznxrWmTxbbLHaRTU04KkfyE2BuVrOBxJ+KJj2hlIQG5dlj29mG/gPuJx0YOtq
	I9ZfNmo/3AY2Vc7j6k8qE5O8qr6PYr2Zm6scZchr5zJNCV7GsYOEBvkuak8f6FAk0qL/
	pX8CFSPnxgDt4Bd+PbIh2lU5meHmWfOjdE/RSke1vYCubh9Fzz28Z5+bafbJG+eHbjzR
	ep1A==
X-Received: by 10.42.85.140 with SMTP id q12mr1980785icl.51.1390840214490;
	Mon, 27 Jan 2014 08:30:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.8.137 with HTTP; Mon, 27 Jan 2014 08:29:44 -0800 (PST)
In-Reply-To: <52E686D4.4040906@dresearch-fe.de>
References: <52E686D4.4040906@dresearch-fe.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Jan 2014 08:29:44 -0800
Message-ID: <CAMKF1srbr9PCgJSbmXLFTPcMxsEwno7EUAKqc-ADzbiO1DU6kw@mail.gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: opencv QA issue
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
X-List-Received-Date: Mon, 27 Jan 2014 16:30:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Steffen

On Mon, Jan 27, 2014 at 8:18 AM, Steffen Sledz <sledz@dresearch-fe.de> wrot=
e:
> After the latest update of our build host (Fedora-18) the opencv build fa=
ils with an QA issue.
>
> -------------> snip <-------------
> ERROR: QA Issue: non debug package contains .debug directory: opencv-apps=
 path /work/cortexa9hf-vfp-neon-angstrom-linux-gnueabi/opencv/2.4.6+gitAUTO=
INC+c5afaa4e8d-r0/packages-split/opencv-apps/usr/share/OpenCV/java/.debug/l=
ibopencv_java246.so
> WARNING: QA Issue: opencv-apps: found library in wrong location: /usr/sha=
re/OpenCV/java/libopencv_java246.so
> opencv-apps: found library in wrong location: /usr/share/OpenCV/java/.deb=
ug/libopencv_java246.so
> ERROR: QA run found fatal errors. Please consider fixing them.
> ERROR: Function failed: do_package_qa
> ERROR: Logfile of failure stored in: /CACHE/jenkins-workspace/hipos-dfe-c=
losed/build-closed/tmp-eglibc/work/cortexa9hf-vfp-neon-angstrom-linux-gnuea=
bi/opencv/2.4.6+gitAUTOINC+c5afaa4e8d-r0/temp/log.do_package.15005
> NOTE: recipe opencv-2.4.6+gitAUTOINC+c5afaa4e8d-r0: task do_package: Fail=
ed
> ERROR: Task 502 (/CACHE/jenkins-workspace/hipos-dfe-closed/meta-openembed=
ded/meta-oe/recipes-support/opencv/opencv_2.4.bb, do_package) failed with e=
xit code '1'
> -------------> snap <-------------
>
> After some research we found that the libopencv_java246.so wasn't build b=
efore the mentioned build host update. I'm not a cmake guru, so i can't det=
ermine why it is build after this update.
>
> But it seems to be clear that the path /usr/share/OpenCV/java/.debug/libo=
pencv_java246.so is not covered by the package-split definition in meta-oe/=
recipes-support/opencv/opencv_2.4.bb:
>
> -------------> snip <-------------
> FILES_${PN} =3D ""
> FILES_${PN}-apps =3D "${bindir}/* ${datadir}/OpenCV"
> FILES_${PN}-dbg +=3D "${libdir}/.debug"

it should be added like something below

FILES_${PN}-dbg +=3D "${datadir}/OpenCV/java/.debug"

can you try it out if it fixes the problem.

> FILES_${PN}-dev =3D "${includedir} ${libdir}/pkgconfig"
> FILES_${PN}-doc =3D "${datadir}/OpenCV/doc"
> -------------> snap <-------------
>
> Can someone of the maintainers please have a look at that!
>
> Thx,
> Steffen
>
> --
> DResearch Fahrzeugelektronik GmbH
> Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
> Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
> Fax: +49 30 515932-299
> Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
> Amtsgericht Berlin Charlottenburg; HRB 130120 B;
> Ust.-IDNr. DE273952058

