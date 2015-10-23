Return-Path: <gurrieristefano@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id CF54465C8A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2015 08:52:28 +0000 (UTC)
Received: by igbhv6 with SMTP id hv6so11594948igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2015 01:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=m2vHULmpfBQy0eywn0kLiBmnPAC/okP2Y1douSiV42M=;
	b=Eb92gTY5olVGYQQoD6/xJYhw6SZVTeGTc3ijOcLIV4ePrS3hfcHOpOQx1uVJYxeQ+n
	HvoN9ezs+uMS6rpCfIF+5F2O5pLVAJJmxc3T4Hea2z/5pwaDVikvQCPrUJkcHdA0L0aQ
	rHKaCeBAG0xriJtmwJeAHi9Vf4ZNEfTkUpV18Jz9tYmF0v7pkjkBLgCVMXZKWcVs8PfK
	E7FfXFAOB3K4/fyMrS8tDWZoCzZfM/AGmTJYmuUfzpVvmA3Pz9YlYErDSssAIp4/xbDg
	D0sE0QnDIBvI5HcgDyXXeLEoJTeq1qs/RnwmH8n9hqSgwbC5R53GUZN41Usxizt7HRFO
	9swA==
MIME-Version: 1.0
X-Received: by 10.50.83.6 with SMTP id m6mr3020350igy.90.1445590348592; Fri,
	23 Oct 2015 01:52:28 -0700 (PDT)
Received: by 10.107.137.228 with HTTP; Fri, 23 Oct 2015 01:52:28 -0700 (PDT)
In-Reply-To: <CAB25Ju4q9v8_WPXbmpj_dAy7oasaiyRM2fhN5Gyrr7ZexgSmxQ@mail.gmail.com>
References: <CAKpvFF1Us5xk3EFTUE1oo5xF14CNZOkJmHN5_uR9o8_CRxSmVQ@mail.gmail.com>
	<CAB25Ju4q9v8_WPXbmpj_dAy7oasaiyRM2fhN5Gyrr7ZexgSmxQ@mail.gmail.com>
Date: Fri, 23 Oct 2015 10:52:28 +0200
Message-ID: <CAKpvFF32BXGy2_qr=xRpxc4tf4EHN2pWS2X7dWWJ4+ebhSGDxQ@mail.gmail.com>
From: Stefano Gurrieri <gurrieristefano@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: qtmultimedia + qt5.3.2 + yocto dizzy
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
X-List-Received-Date: Fri, 23 Oct 2015 08:52:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Stephano,
thanks for your fast reply.

I tried to follow this link, but without success.
Specifically, I tried to add:

PACKAGECONFIG_append_pn-qtmultimedia=3D " gstreamer010" in my local.conf

and I've added this part of code in qtmultimedia.inc recipe:

do_configure_prepend() { # disable openal test if it isn't enabled by
PACKAGECONFIG sed -i 's/^qtCompileTest(openal)/OE_OPENAL_ENABLED:
qtCompileTest(openal)/g' ${S}/qtmultimedia.pro # disable gstreamer-0.10
test if it isn't enabled by PACKAGECONFIG sed -i 's/^\( *\)qtCompileTest(
gstreamer)/\1OE_GSTREAMER010_ENABLED:qtCompileTest(gstreamer) {/g' ${S}
/qtmultimedia.pro}
and removed patches:

SRC_URI +=3D "\
    file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
    file://0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch =
\
"

present in my original qtmultimedia.inc file.

Then I bake my qt5-custom-image successfully. Now, on my target, in
/usr/lib/qt5/plugins/mediaservice, I see:
libgstaudiodecoder.so  libgstcamerabin.so  libgstmediacapture.so
libgstmediaplayer.so

but when I try to run (for example) videowidget application or player
application, I see these error:

GStreamer-CRITICAL **: gst_object_ref_sink: assertion 'G_IS_OBJECT
(object)' failed


Could you help me?
Thanks a lot.
Stefano

2015-10-22 22:47 GMT+02:00 Stephano Cetola <stephanoc@gmail.com>:

> Ciao Stefano,
>
> Take a look at this thread:
>
> https://community.freescale.com/message/391750#391750
>
> You are missing libgstmediaplayer.so. That link should help get you
> the right packages installed.
>
>
>
> On Thu, Oct 22, 2015 at 7:23 AM, Stefano Gurrieri
> <gurrieristefano@gmail.com> wrote:
> > Goodmorning,
> > I tried to compile Qt5.3.2 in my Yocto dizzy successfully etc=E2=80=A6
> > =E2=80=A6 but when I try to run (on my target based on iMX6) a videowid=
get
> > application or player application=E2=80=A6 I always have the same error=
:
> > defaultServiceProvider::requestService(): no service found for -
> > "org.qt-project.qt.mediaplayer"
> > and I can=E2=80=99t to see a video. In /usr/lib/qt5/plugins/mediaservic=
e I=E2=80=99ve
> only
> > libqtmedia_audioengine.so library. Missing gstreamer multimedia service
> > plugins?
> >
> > Could you please help me?
> >
> > Thanks a lot.
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

