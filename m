Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 46182745CD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 04:22:17 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id q41-v6so28520497qtq.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2018 21:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=f36pCZYK2B4fQpLwLAInfAdvfmObpJWmf3KgLTW/Rig=;
	b=e8dkeedPp1OhtM0duN4c0HVjtinq+7XCarrEDdsj2i4EXB/KKFBAdEXpkBI1UiLG7r
	Zmyk0uHFpKYRqt+CYKQFyFdqIEm8Z6yB1JC0pVhsKHtbmdD5ujIgQm5a5znG5/wkj3FQ
	BVnDynhcxLBhheuaRjEO6+EK2F5txZLwWOC3RqZOFFohaOXHZaNd5ywn5sU6MKGXgwO1
	u347BqTYkzNYocTccA/RUUVQ8BW4gpWiEEWZZTG998RyQUOZ4d16w3ufZCz4KWor8Ums
	8ZatLpH5kpVRvplTje4AqxlrWfKPDRvyFO1IW3bMqtyDna99RA1rYaY7/LU+YgVpcMSM
	LreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=f36pCZYK2B4fQpLwLAInfAdvfmObpJWmf3KgLTW/Rig=;
	b=RKqnGchx+WcHW6h7cRyYQL+ao7OonJKM265tW02+ZI6KJlH7WH/ATQ2n2nC6wg3PJ2
	YP2ZtkAqb1IcmyodL2FSU8SGDm9HIUfn4PPUVbDQjAnSY/pltlZluhTlZagcaRgmkfTx
	ibFC/y28ll/kQjpkYE/vDuzhW4yJewXkQzZrts86rcY/BTjMpgsA3h+sXm/cQvfWZZ8M
	DwAoAeQ9IQFvlqo0tBJMftWiWjKbQCb6UuS3t0RO2o1u5/2Wkjh7Sxlw1vVcYlgLgdXP
	pE/yY+/tXBsJN2zfQ50EO9KB3yg9DT7S9Hh1lekPou825hrvxdFcrCrjF4yH7cf7suYX
	NWDg==
X-Gm-Message-State: ABuFfoi94HSqQi3r0ghyaBjuu/0W8ZJeYR0FkgTpNVNgJ+ezExjkIqwu
	G5+iOFF+ryK3DsIn4BUwmY+vaKR4wgZMFDk3/go=
X-Google-Smtp-Source: ACcGV60uIXwOeE5vzD472EU9tuRnVSl5vqJZ5F7FZ2iUOEJq5zo0M56fatsV0cQ7qq9DDBtXCG5GPqJxfY6LyB1RgvM=
X-Received: by 2002:ac8:689a:: with SMTP id
	m26-v6mr22699160qtq.254.1539750137835; 
	Tue, 16 Oct 2018 21:22:17 -0700 (PDT)
MIME-Version: 1.0
References: <1539610432-25870-1-git-send-email-ankit.tarot@gmail.com>
	<CAM_RqkNk9aFPGRN=2oWS+xHoLxZLm7Ht9Zcrc1VytV+xNqaSTw@mail.gmail.com>
In-Reply-To: <CAM_RqkNk9aFPGRN=2oWS+xHoLxZLm7Ht9Zcrc1VytV+xNqaSTw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Oct 2018 21:21:51 -0700
Message-ID: <CAMKF1srutY0nkvewSKGk=S5hg91oHL-9TYP3SmcVxMNfpu1Piw@mail.gmail.com>
To: Ankit Navik <ankit.tarot@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2] opencl-icd-loader: Initial recipe for OpenCL ICD loader
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
X-List-Received-Date: Wed, 17 Oct 2018 04:22:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 16, 2018 at 9:04 PM Ankit Navik <ankit.tarot@gmail.com> wrote:
>
> Soft reminder

always check patchwork for patch status before sending pings.

https://patchwork.openembedded.org/project/oe/patches/

If the patch is still in original "New" state and it has passed week+
then its possible I might have forgotten it.

> On Mon, Oct 15, 2018 at 7:07 PM Ankit Navik <ankit.tarot@gmail.com> wrote:
> >
> > This patch provides ICD loader library, ICD loader test binary
> > and some helper library for test.
> >
> > Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> > ---
> >  .../opencl-icd-loader/opencl-icd-loader_git.bb     | 45 ++++++++++++++++++++++
> >  1 file changed, 45 insertions(+)
> >  create mode 100644 meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb
> >
> > diff --git a/meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb b/meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb
> > new file mode 100644
> > index 0000000..7c49c8d
> > --- /dev/null
> > +++ b/meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb
> > @@ -0,0 +1,45 @@
> > +SUMMARY  = "OpenCL ICD Loader"
> > +DESCRIPTION = "OpenCL compute ICD Loader from Khronos Group"
> > +LICENSE  = "Khronos"
> > +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ec724732ce73269486574c718ef0c79b"
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
> > +       install -m 0755 ${B}/bin/icd_loader_test ${D}${bindir}/
> > +       chrpath -d ${D}${bindir}/icd_loader_test
> > +       install -d ${D}${libdir}
> > +       install -m 0644 ${B}/lib/libIcdLog.so ${D}${libdir}/
> > +       install -m 0644 ${B}/lib/libOpenCLDriverStub.so ${D}${libdir}/
> > +       chrpath -d ${D}${libdir}/libOpenCLDriverStub.so
> > +       install -m 0644 ${B}/lib/libOpenCL.so.1.2 ${D}${libdir}/
> > +       cd ${D}${libdir}
> > +       ln -s libOpenCL.so.1.2 libOpenCL.so.1
> > +       ln -s libOpenCL.so.1 libOpenCL.so
> > +}
> > +
> > +PACKAGES = "opencl-icd-loader opencl-icd-loader-dev"
> > +PACKAGES += "libicdlog libicdlog-dbg"
> > +PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
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
> > +FILES_libicdlog-dbg = "${libdir}/.debug/libIcdLog.so"
> > +
> > +DEPENDS = "opencl-headers"
> > +RDEPENDS_${PN} = "libicdlog"
> > --
> > 1.9.1
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

