Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 25EDF60720
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Jan 2017 15:32:41 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id 75so45944693ite.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Jan 2017 07:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=H1Gy/Hti23QCRQfzeRjk+qca7u8X+f4kUFOVLQheH2Y=;
	b=WzkQDx6gp7JzpKGEnh1AwmCXZSzqRp4wB7aoab0o0dqbExwuEdz1I1wIf6HSsJV11N
	k18kRMvP3n/Xc9nrmcXiEo1NBJ0SVW1C1+nl66d5aPeNlH45+bOBAvJIu6dmvO7eOqp8
	7Y6rPBxwhy7peqJGQbpxnCgr2YiNoBV6Y9pLhcGvfuktdQupJuatFRWaLvPTCc+zqUGQ
	7hY4au3rEZEbaEV1qMRZtp3tSclmYNro3YmHOa5YlbJag/9lD0XxWCJ32bjo5CgeXzRQ
	45IQhYsyeiJN/LkhtZ/zflKmP4HAnyzUmgjcaqEo5czWuL2ONq/GArZEyX8o9/LgVp5P
	t6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=H1Gy/Hti23QCRQfzeRjk+qca7u8X+f4kUFOVLQheH2Y=;
	b=V5GEADU/5OOElzPc5i91vVlnFwNdT1yClymclRqVuKBOiVMpKgVSstwSq63jmb4jXY
	xlkpeh6HS7TYMXuHGwGGplJptLI/oQossjZEA1iatIfMwiXPbTRrgjUSfwb1mxiObNoD
	ZhgGzBvTjFGJtUaMAjvHLAhydZbVP5dAHfoEk0C5YjHkUj5I9Wf5NkxT32dWlzSxa/ex
	c/wx0rMw6w+48+JXFsuBx68oGWQdjx8l7QTz08temGW+4Xjyli68hl6EKT7WEekqShiP
	OGGGwvPmDe97ROoS+fTKOUu9BnUhRAU9O5xI8CkFy/vz3U2R8U5tcRnFGXdZ8F5GHBWD
	rpzA==
X-Gm-Message-State: AIkVDXLd7IeondXpwH4EiGehV7/DK7UVe0mU+In/410+c/u69WcjIPN4C0NkeJv2Ixa3oQ==
X-Received: by 10.36.7.85 with SMTP id f82mr42208263itf.10.1483284761563;
	Sun, 01 Jan 2017 07:32:41 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	o1sm7036790itg.4.2017.01.01.07.32.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 01 Jan 2017 07:32:40 -0800 (PST)
Date: Sun, 1 Jan 2017 10:32:38 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170101153238.GA8876@openSUSE-i7.site>
References: <20161230181124.3531-1-twoerner@gmail.com>
	<CAMKF1so+SskdmYtW_p9E_5CJQPeZ+45V_+1O6WQSM7E9pwNhjA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1so+SskdmYtW_p9E_5CJQPeZ+45V_+1O6WQSM7E9pwNhjA@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: Re: [PATCH][meta-browser] chromium: add i586 (qemux86) support
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
X-List-Received-Date: Sun, 01 Jan 2017 15:32:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2016-12-31 @ 10:32:47 AM, Khem Raj wrote:
> On Fri, Dec 30, 2016 at 10:11 AM, Trevor Woerner <twoerner@gmail.com> wro=
te:
> > Build and run tested on qemux86 (i586) and turbot (x86-64).
> >
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> >  recipes-browser/chromium/chromium_52.0.2743.76.bb |  2 ++
> >  recipes-browser/chromium/files/i586/x86-m32.patch | 42 +++++++++++++++=
++++++++
> >  2 files changed, 44 insertions(+)
> >  create mode 100644 recipes-browser/chromium/files/i586/x86-m32.patch
> >
> > diff --git a/recipes-browser/chromium/chromium_52.0.2743.76.bb b/recipe=
s-browser/chromium/chromium_52.0.2743.76.bb
> > index 5be3c32..bba1549 100644
> > --- a/recipes-browser/chromium/chromium_52.0.2743.76.bb
> > +++ b/recipes-browser/chromium/chromium_52.0.2743.76.bb
> > @@ -14,6 +14,8 @@ SRC_URI +=3D "\
> >          ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', '=
file://0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', d)=
} \
> >  "
> >
> > +SRC_URI_append_i586 =3D "file://x86-m32.patch"
> > +
>=20
> it this 32bit x86 specific or i586 specific ? If its former then using
> x86 override would be more
> appropriate.

I don't have any 32-bit x86 hardware on which to test so I built and tested
this for qemux86. qemux86 uses i586 for its tuning, so I targeted the append
for this configuration.

To me "i586", "i686", and "x86" are synonymous; they all mean intel/amd 32-=
bit
;-)

> secondly, what does removing -m32 fix ? I thought it would
> just be nop in case of
> 32bit

Like Martin pointed out, having these in are what is causing the builds to
fail. Without this patch the do_compile fails with 5 such similar errors:

	| FAILED: obj.host/third_party/icu/source/common/icuuc.servlk.o
	| g++  -MMD -MF obj.host/third_party/icu/source/common/icuuc.servlk.o.d -D=
U_USING_ICU_NAMESPACE=3D0 -DHAVE_DLOPEN=3D0 -DUCONFIG_ONLY_HTML_CONVERSION=
=3D1 -DU_CHARSET_IS_UTF8=3D1 -DV8_DEPRECATION_WARNINGS -D_FILE_OFFSET_BITS=
=3D64 -DDISABLE_NACL -DU_STATIC_IMPLEMENTATION -DCHROMIUM_BUILD -DUI_COMPOS=
ITOR_IMAGE_TRANSPORT -DUSE_AURA=3D1 -DUSE_PANGO=3D1 -DUSE_CAIRO=3D1 -DUSE_D=
EFAULT_RENDER_THEME=3D1 -DUSE_LIBJPEG_TURBO=3D1 -DUSE_X11=3D1 -DUSE_CLIPBOA=
RD_AURAX11=3D1 -DENABLE_WEBRTC=3D1 -DENABLE_MEDIA_ROUTER=3D1 -DENABLE_PEPPE=
R_CDMS -DENABLE_NOTIFICATIONS -DENABLE_TOPCHROME_MD=3D1 -DUSE_UDEV -DFIELDT=
RIAL_TESTING_ENABLED -DENABLE_TASK_MANAGER=3D1 -DENABLE_EXTENSIONS=3D1 -DEN=
ABLE_PDF=3D1 -DENABLE_PLUGINS=3D1 -DENABLE_SESSION_SERVICE=3D1 -DENABLE_THE=
MES=3D1 -DENABLE_PRINTING=3D1 -DENABLE_BASIC_PRINTING=3D1 -DENABLE_PRINT_PR=
EVIEW=3D1 -DENABLE_SPELLCHECK=3D1 -DENABLE_CAPTIVE_PORTAL_DETECTION=3D1 -DE=
NABLE_SUPERVISED_USERS=3D1 -DENABLE_MDNS=3D1 -DENABLE_SERVICE_DISCOVERY=3D1=
 -DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL -DU_COMM=
ON_IMPLEMENTATION -DU_ICUDATAENTRY_IN_COMMON -DU_ENABLE_DYLOAD=3D0 -DU_NOEX=
CEPT=3D -DUSE_LIBPCI=3D1 -DUSE_GLIB=3D1 -DUSE_NSS_CERTS=3D1 -DNDEBUG -DNVAL=
GRIND -DDYNAMIC_ANNOTATIONS_ENABLED=3D0 -I../../third_party/icu/source/comm=
on -I../../third_party/icu/source/i18n -Igen -fstack-protector --param=3Dss=
p-buffer-size=3D4  -pthread -fno-strict-aliasing -Wno-extra -Wno-unused-par=
ameter -Wno-missing-field-initializers -fvisibility=3Dhidden -pipe -fPIC -W=
no-unused-local-typedefs -Wno-deprecated-declarations -Wno-unused-function =
-m32 -O2 -fno-ident -fdata-sections -ffunction-sections -funwind-tables -fn=
o-exceptions -fno-rtti -fno-threadsafe-statics -fvisibility-inlines-hidden =
-frtti -Wno-deprecated -std=3Dgnu++11 -Wno-narrowing  -c ../../third_party/=
icu/source/common/servlk.cpp -o obj.host/third_party/icu/source/common/icuu=
c.servlk.o
	| In file included from /usr/include/features.h:389:0,
	|                  from /usr/include/stdint.h:25,
	|                  from /usr/lib64/gcc/x86_64-suse-linux/4.8/include/stdin=
t.h:9,
	|                  from ../../third_party/icu/source/common/unicode/ptypes=
=2Eh:66,
	|                  from ../../third_party/icu/source/common/unicode/umachi=
ne.h:44,
	|                  from ../../third_party/icu/source/common/unicode/utypes=
=2Eh:36,
	|                  from ../../third_party/icu/source/common/servlk.cpp:9:
	| /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such file=
 or directory
	|  # include <gnu/stubs-32.h>
	|                            ^
	| compilation terminated.

