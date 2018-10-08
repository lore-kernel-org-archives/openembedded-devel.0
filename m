Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8620D79017
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Oct 2018 04:50:49 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id k19-v6so7770560pfi.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Oct 2018 21:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YcGWyTT/1DY8g0QIDkEPhUV6f6BtTvbSMCPR2IGidfE=;
	b=jewjkwATwMA3bCrDFzbGnG0eLEHbS7dsAaMOVRXbTPz4UK46BuMxtfeMSa+SFDeCne
	YB6BlusAehPCfZbRd90TbXwql1XlJdX2N7kfE3r6DinbQQim6CjwnaTssEqaZCVrfuN7
	JWGDI/LtcxuUO9BD8ZBzSunWUF2uebZp+g4YiLcfW29lygAOnBGzAFuVu1ia2+2cYBSh
	m0J94rO0waUCTPNJW8Tucpd8MFOTjweJueugxvobqrvjwHhRoAeQN1tDBL4T9nNMQklV
	NxJoWUa4ggFqT0RdItn093dUwQBUpJ59UlsrS0jQr9rBJwtQ8TYXeyXkFon/21/ueRT9
	TNOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YcGWyTT/1DY8g0QIDkEPhUV6f6BtTvbSMCPR2IGidfE=;
	b=LXwDE5IugY348FURby0TqBj0KvXMrGwF6M7QP14BsW0JCU9xZvXDkAuL+tWnHr+Pnz
	FnJ15mtvxBpvQvg2TW5+YzsWxrcYwjvWwKSduJIUxnOeF/3+Rdp3FIVkHLNnVGjlpjIS
	ICWAVJ6qkPpYBSstHDdRYS4cxm0zbI3E8uzFq5Fop7KKy9UcLm9rddXowXX6bgnwRj3i
	YGIisZfMh6QcBK5JpbdWrQ3lN7YW7ZpIYc/frYLk0HRKoUh8hLg4t5jJeqRC8Vjv4teD
	sEvkwpvncmbKJjfPZ4uD2dk82T9fspUALwafhyxyZC/NMNTJLl+TqYmh+2Vfm8kzjQUH
	E9bQ==
X-Gm-Message-State: ABuFfoiTlSHcEzR/J1bOFpxUT3ylZd7+nje6NXw8zY9dQoFhvMc44RMe
	l8VhNOWXayFF3eljz/GFze7ScjrGtl5RkeJxG9I=
X-Google-Smtp-Source: ACcGV63LNa0WCiIRAI+nF4RHE2+hTssaFws5nhztxMPJI04YqkV7qLC1vX01vtposJDiqrSBFq8ECaSfEu7u41FB9DQ=
X-Received: by 2002:a62:b09:: with SMTP id t9-v6mr23560964pfi.36.1538974250477;
	Sun, 07 Oct 2018 21:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <1538815194-5528-1-git-send-email-ankit.tarot@gmail.com>
	<CAMKF1so2RTBJFS566+VNDMC8276Vd6DSUfMrKh1TPMrhmUsX=w@mail.gmail.com>
In-Reply-To: <CAMKF1so2RTBJFS566+VNDMC8276Vd6DSUfMrKh1TPMrhmUsX=w@mail.gmail.com>
From: Ankit Navik <ankit.tarot@gmail.com>
Date: Mon, 8 Oct 2018 10:20:39 +0530
Message-ID: <CAM_RqkMAuKozLEZ0KzUTuKQgzb-7VyHaXOeB8fNg0cjn7Ms1Tw@mail.gmail.com>
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] opencl-icd-loader: Initial recipe for OpenCL ICD loader
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Oct 2018 04:50:49 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Raj,
On Mon, Oct 8, 2018 at 8:02 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sat, Oct 6, 2018 at 1:43 AM Ankit Navik <ankit.tarot@gmail.com> wrote:
> >
> > This patch provides ICD loader library and ICD loader test binary
> > and some helper library for test.
> >
> > Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> > ---
> >  .../opencl-icd-loader/opencl-icd-loader_git.bb     | 47 ++++++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >  create mode 100644 meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb
> >
> > diff --git a/meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb b/meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb
> > new file mode 100644
> > index 0000000..f6a8fef
> > --- /dev/null
> > +++ b/meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb
> > @@ -0,0 +1,47 @@
> > +SUMMARY  = "OpenCL ICD Loader"
> > +DESCRIPTION = "OpenCL compute ICD Loader from Khronos Group"
> > +LICENSE  = "CLOSED"
>
> this seems to be problematic, usually khronos s/w is under a known open
> source license if its closed source then I would not like to maintain
> it in open OE layers.
> if its wrongly marked at closed please fix it in v2.

I have tried putting Khronos, but it was throwing QA error for license.
Is there any LICENSE type or procedure to keep custom license?
>
> > +LIC_FILES_CHKSUM = "file://icd.h;beginline=1;endline=36;md5=c406ef72ec08f23326801455d7713b07"
> > +SECTION = "base"
> > +
> > +inherit pkgconfig cmake
> > +
> > +S = "${WORKDIR}/git"
> > +SRCREV = "b342ff7b7f70a4b3f2cfc53215af8fa20adc3d86"
> > +SRC_URI = "git://github.com/KhronosGroup/OpenCL-ICD-Loader.git"
> > +
> > +do_install () {
> > +       install -d ${D}${bindir}
> > +       install -m 0755 ${S}/../build/bin/icd_loader_test ${D}${bindir}/
>
> could be use ${B} here

Will incorporate in v2.
>
> > +       chrpath -d ${D}${bindir}/icd_loader_test
> > +       install -d ${D}${libdir}
> > +       install -m 0644 ${S}/../build/lib/libIcdLog.so ${D}${libdir}/
> > +       install -m 0644 ${S}/../build/lib/libOpenCLDriverStub.so ${D}${libdir}/
> > +       chrpath -d ${D}${libdir}/libOpenCLDriverStub.so
> > +       install -m 0644 ${S}/../build/lib/libOpenCL.so.1.2 ${D}${libdir}/
>
> same here.
Will incorporate in v2.
>
> > +       cd ${D}${libdir}
> > +       ln -s libOpenCL.so.1.2 libOpenCL.so.1
> > +       ln -s libOpenCL.so.1 libOpenCL.so
> > +}
> > +
> > +PACKAGES = "opencl-icd-loader opencl-icd-loader-dev"
> > +PACKAGES += "libicdlog libicdlog-dbg"
> > +
> > +FILES_${PN} = " \
> > +       ${bindir}/icd_loader_test \
> > +       ${libdir}/libOpenCLDriverStub.so \
> > +       ${libdir}/libOpenCL.so.1.2 \
> > +"
> > +FILES_${PN}-dev = " \
> > +       ${libdir}/libOpenCL.so \
> > +       ${libdir}/libOpenCL.so.1 \
> > +"
> > +
> > +FILES_libicdlog = "${libdir}/libIcdLog.so"
> > +FILES_libicdlog-dbg = "${libdir}/.debug/libIcdLog.so \
> > +       /usr/src/debug/opencl-icd-loader/git-${PR}/git/test \
> > +       /usr/src/debug/opencl-icd-loader/git-${PR}/git \
> > +"
>
> Please use bitbake variables instead of hardcoding /usr
Will incorporate in v2.
>
> > +
> > +DEPENDS = "opencl-headers"
> > +RDEPENDS_${PN} = "opencl-headers libicdlog"
>
> rdep on a headers package seems wrong  here.
Will incorporate in v2.
>
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

