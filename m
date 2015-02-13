Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f47.google.com (mail-yh0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id B4A0060556
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 16:52:24 +0000 (UTC)
Received: by mail-yh0-f47.google.com with SMTP id b6so8682651yha.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 08:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=+IugxK4tDdSKqtin5QFmezrGApPlON2CIybZ5kEUX2I=;
	b=hfMZ58lD6Kwjk+CJe+TYyYe0WWdpox7LPg6f5pf4J1vVujHGCkhaSsAGZ/HzZUa4we
	h2fbnlC3nvudrt+AasM5ffgo4xoS0vABn+hLwWUi9H4DjDWYOnl9PDQPJAhkITu5DaBt
	iy1IkMWenFjkzfXoeZixQR2gDVcX1HyvQQxkVa5t0EynOHXy175rSgynDvF/KQFrsXFi
	pi8DPqwIk2sHoDsJa+8A0+jw8mC8TMZZrYl87/bpUtexhChjhYl5S8hb5S1SPNm3vkmQ
	ISw3kCFbHapYX5Wsepf7UFw3ZCGe2T/cbEbAQy5OvQLfSKNALcLVjhpyvR9j3p9sb66I
	2xww==
MIME-Version: 1.0
X-Received: by 10.236.229.200 with SMTP id h68mr9736324yhq.90.1423846345238;
	Fri, 13 Feb 2015 08:52:25 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Fri, 13 Feb 2015 08:52:25 -0800 (PST)
In-Reply-To: <CAEGpDubcHDv+PYTukYV=N+va3837GwvioesHMgKO7nCenQSDiQ@mail.gmail.com>
References: <1423649212-5156-1-git-send-email-pau.espin@aweurope.be>
	<CAP9ODKpzYyVB+K6XZ=oQtYZ_TSce19D0r=_bk5RPxxtvVUgxhw@mail.gmail.com>
	<CAEGpDubcHDv+PYTukYV=N+va3837GwvioesHMgKO7nCenQSDiQ@mail.gmail.com>
Date: Fri, 13 Feb 2015 14:52:25 -0200
X-Google-Sender-Auth: L5AOKLaqE-QDigOti3R3sBxqp1k
Message-ID: <CAP9ODKrKwMssePUwAePe3UavCXv2gdRU3KSj7=ZEo1VgMm_GJQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [meta-qt5][PATCH] qtmultimedia: Enable building of package qtmultimedia-examples
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
X-List-Received-Date: Fri, 13 Feb 2015 16:52:28 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 13, 2015 at 10:47 AM, Pau Espin Pedrol
<pespin.shar@gmail.com> wrote:
...
> In packages-split directory I get these dirs but they are empty:
> qtmultimedia-examples
> qtmultimedia-examples-dbg
> qtmultimedia-examples-dev
> qtmultimedia-examples-staticdev
>
> I will try to let you know if the problem persists for me when we
> upgrade to newer meta-qt.
...

I have built qtmultimedia before your patch and after, with
buildhistory enabled. The number of packages generated was the same.

Checking the content of the examples package I got:

Package: qtmultimedia-examples
Version: 5.4.0-r0.29
Description: qtmultimedia version 5.4.0-r0
 qtmultimedia version 5.4.0-r0.
Section: base
Priority: optional
Maintainer: O.S. Systems Software LTDA. <contato@ossystems.com.br>
License: GFDL-1.3 & LGPL-2.1 | LGPL-3.0 | GPL-2.0
Architecture: cortexa9hf-vfp-neon
OE: qtmultimedia
Depends: libgcc1 (>= 4.9.1), qtmultimedia (>= 5.4.0), libstdc++6 (>=
4.9.1), qtdeclarative (>= 5.4.0), libc6 (>= 2.20), qtbase (>= 5.4.0)
Source: http://download.qt-project.org/official_releases/qt/5.4/5.4.0/submodules/qtmultimedia-opensource-src-5.4.0.tar.xz
file://0001-Initial-porting-effort-to-GStreamer-1.0.patch
/home/otavio/src/customers/redcell/build-fb/tmp/deploy/ipk/cortexa9hf-vfp-neon/qtmultimedia-examples_5.4.0-r0.29_cortexa9hf-vfp-neon.ipk

and:

./
./usr/
./usr/share/
./usr/share/qt5/
./usr/share/qt5/examples/
./usr/share/qt5/examples/multimedia/
./usr/share/qt5/examples/multimedia/audiorecorder/
./usr/share/qt5/examples/multimedia/audiorecorder/audiorecorder
./usr/share/qt5/examples/multimedia/declarative-camera/
./usr/share/qt5/examples/multimedia/declarative-camera/declarative-camera
./usr/share/qt5/examples/multimedia/declarative-radio/
./usr/share/qt5/examples/multimedia/declarative-radio/declarative-radio
./usr/share/qt5/examples/multimedia/video/
./usr/share/qt5/examples/multimedia/video/qmlvideo/
./usr/share/qt5/examples/multimedia/video/qmlvideo/qmlvideo
./usr/share/qt5/examples/multimedia/video/qmlvideofx/
./usr/share/qt5/examples/multimedia/video/qmlvideofx/qmlvideofx
./usr/share/qt5/examples/multimedia/audiodevices/
./usr/share/qt5/examples/multimedia/audiodevices/audiodevices
./usr/share/qt5/examples/multimedia/audiooutput/
./usr/share/qt5/examples/multimedia/audiooutput/audiooutput
./usr/share/qt5/examples/multimedia/audioinput/
./usr/share/qt5/examples/multimedia/audioinput/audioinput
./usr/share/qt5/examples/multimedia/radio/
./usr/share/qt5/examples/multimedia/radio/radio
./usr/share/qt5/examples/multimedia/audiodecoder/
./usr/share/qt5/examples/multimedia/audiodecoder/audiodecoder
./usr/share/qt5/examples/multimedia/spectrum/
./usr/share/qt5/examples/multimedia/spectrum/libfftreal.so.1 ->
libfftreal.so.1.0.0
./usr/share/qt5/examples/multimedia/spectrum/libfftreal.so.1.0.0
./usr/share/qt5/examples/multimedia/spectrum/libfftreal.so.1.0 ->
libfftreal.so.1.0.0
./usr/share/qt5/examples/multimedia/spectrum/libfftreal.prl
./usr/share/qt5/examples/multimedia/spectrum/spectrum
./usr/share/qt5/examples/multimediawidgets/
./usr/share/qt5/examples/multimediawidgets/camera/
./usr/share/qt5/examples/multimediawidgets/camera/camera
./usr/share/qt5/examples/multimediawidgets/videographicsitem/
./usr/share/qt5/examples/multimediawidgets/videographicsitem/videographicsitem
./usr/share/qt5/examples/multimediawidgets/customvideosurface/
./usr/share/qt5/examples/multimediawidgets/customvideosurface/customvideoitem/
./usr/share/qt5/examples/multimediawidgets/customvideosurface/customvideoitem/customvideoitem
./usr/share/qt5/examples/multimediawidgets/customvideosurface/customvideowidget/
./usr/share/qt5/examples/multimediawidgets/customvideosurface/customvideowidget/customvideowidget
./usr/share/qt5/examples/multimediawidgets/player/
./usr/share/qt5/examples/multimediawidgets/player/player
./usr/share/qt5/examples/multimediawidgets/videowidget/
./usr/share/qt5/examples/multimediawidgets/videowidget/videowidget

So I think this patch can be skipped in meanwhile. Martin?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

