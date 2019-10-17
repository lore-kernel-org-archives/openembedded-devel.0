Return-Path: <h4nn35.work@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7969A6C42C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 05:51:42 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id 21so829047otj.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 22:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=lnnxuA8Ynxuv4RutZrTzzrC6xGncqHuQp465UTmAviA=;
	b=mVdHjD7rFj2oIu32sMvJAp0I3SK8BeV4WpwxZK2xsIctzOERHg0zgRaDxkuVOs26Jb
	+x8k8KGBLmrr2nSyoF9DKALs0VpEh+Has61O3TJ04zUWdRYUYTeVpoGov6SN3BC1r8E3
	CSd2BXRK17Hwd2qJGc8lcsrFAFriudiZpz+oAEDdlM/phHPZ8+MjsqT626FLuJbtHCeq
	DXVdQQsYujE3DGNaKD+eTCNS2wHyQ+jYfZ/6XnWWtzBstP3VdJxL8dS9msQItvAhV7H8
	k/ob88ty5k6BPleYYZCCnEsPt9LVckTonyclZmVx8MD2abdfEuGxFuoOm1eCWvLJm7Gp
	3S5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=lnnxuA8Ynxuv4RutZrTzzrC6xGncqHuQp465UTmAviA=;
	b=pAOWF7mePDfbzkJ9dzFvJqXx1C5U5aHJpmdB6Xq8L+2igpg70/yL90DmSBBSWhSFIH
	jfCSSZhA7QRE670FtYQLgKVvZLRapvvW3MfmlfPcG4LqnYgQMtVGORKCCR7zlg9H6DcR
	MY8u54mLXuajQcg62Q9C7XPyCgLpXMKGUEnN0ZqeyMfmjCdpwgmexHOlQImwdSjGOdYY
	AfDhxf/ROJmB9azL9XVM5pDkSCDvhwQIO2NxQAcqF1GVktLG71cM1i53BdZSxXTyKgLY
	B/DfMqUrh6lAaigwbmTzZiUNPaLCU5qJ+EQY/F3Osmx9RVo7ISxieCumH4R7rDvHtZtW
	0CVg==
X-Gm-Message-State: APjAAAUsN8e8ZFckZiaPaAvlp/THVPNUeckaPYlsEWOoL8muluxmw5Qs
	v7n792zj++C/hEhlazQI0gHVoqgAkqPs3fTFfQ==
X-Google-Smtp-Source: APXvYqyvN37CTwPpU4scYb4zTGBWdtTntulWcjgPmoGyRWlpkrCcXj3d2xT4zXPtCpIrGkEDQ+DZFSEcQ+eGh+ZMVgY=
X-Received: by 2002:a05:6830:14ca:: with SMTP id
	t10mr1493221otq.174.1571291503214; 
	Wed, 16 Oct 2019 22:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191014122601.18745-1-urs.fassler@bbv.ch>
	<CAMKF1sqSp_8FSEGXzcd4_Tf5GDQxYTZ=GKUhFo_7B7yjPcZEWg@mail.gmail.com>
In-Reply-To: <CAMKF1sqSp_8FSEGXzcd4_Tf5GDQxYTZ=GKUhFo_7B7yjPcZEWg@mail.gmail.com>
From: Johannes Pointner <h4nn35.work@gmail.com>
Date: Thu, 17 Oct 2019 07:51:31 +0200
Message-ID: <CAHvQdo3+ad16L9MF0K+y6xGCiNd0L-=OK4Vo1qx7SigRJxD8YQ@mail.gmail.com>
To: =?UTF-8?B?VXJzIEbDpHNzbGVy?= <urs.fassler@bbv.ch>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "denys@ti.com" <denys@ti.com>
Subject: Re: [meta-networking][PATCH] open62541: add new recipe
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
X-List-Received-Date: Thu, 17 Oct 2019 05:51:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Urs,

On Wed, Oct 16, 2019 at 3:17 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Oct 14, 2019 at 5:56 PM Urs F=C3=A4ssler <urs.fassler@bbv.ch> wro=
te:
>
> > It provides a open source implementation for OPC UA.
> > ---
> >  .../files/0001-fix_ignored_return_value.patch | 17 ++++++++++
> >  .../open62541/open62541_1.0.bb                | 32 +++++++++++++++++++
> >  2 files changed, 49 insertions(+)
> >  create mode 100644
> > meta-networking/recipes-connectivity/open62541/files/0001-fix_ignored_r=
eturn_value.patch
> >  create mode 100644 meta-networking/recipes-connectivity/open62541/
> > open62541_1.0.bb
> >
> > diff --git
> > a/meta-networking/recipes-connectivity/open62541/files/0001-fix_ignored=
_return_value.patch
> > b/meta-networking/recipes-connectivity/open62541/files/0001-fix_ignored=
_return_value.patch
> > new file mode 100644
> > index 000000000..3a8377ec5
> > --- /dev/null
> > +++
> > b/meta-networking/recipes-connectivity/open62541/files/0001-fix_ignored=
_return_value.patch
> > @@ -0,0 +1,17 @@
> > +diff --git a/plugins/ua_pki_default.c b/plugins/ua_pki_default.c
> > +index 79331bc9..b20ad95c 100644
> > +--- a/plugins/ua_pki_default.c
> > ++++ b/plugins/ua_pki_default.c
> > +@@ -89,7 +89,11 @@ fileNamesFromFolder(const UA_String *folder, size_t
> > *pathsSize, UA_String **path
> > +
> > +     struct dirent *ent;
> > +     char buf2[PATH_MAX + 1];
> > +-    realpath(buf, buf2);
> > ++    char *res =3D realpath(buf, buf2);
> > ++    if(res =3D=3D NULL) {
> > ++        closedir(dir);
> > ++        return UA_STATUSCODE_BADINTERNALERROR;
> > ++    }
> > +     size_t pathlen =3D strlen(buf2);
> > +     *pathsSize =3D 0;
> > +     while((ent =3D readdir (dir)) !=3D NULL && *pathsSize < 256) {
> > diff --git a/meta-networking/recipes-connectivity/open62541/
> > open62541_1.0.bb b/meta-networking/recipes-connectivity/open62541/
> > open62541_1.0.bb
> > new file mode 100644
> > index 000000000..c34e70660
> > --- /dev/null
> > +++ b/meta-networking/recipes-connectivity/open62541/open62541_1.0.bb
> > @@ -0,0 +1,32 @@
> > +HOMEPAGE =3D "http://open62541.org/"
> > +SUMMARY =3D "Open source implementation of OPC UA - library"
> > +LICENSE =3D "MPL-2.0"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D815ca599c9df247a0c7f619bab1=
23dad"
> > +
> > +SRCREV =3D "ce5209d78d3821504d31b3bbdb03f53d6e3f93a7"
> > +SRC_URI =3D " \
> > +       gitsm://github.com/open62541/open62541.git \
> > +       file://0001-fix_ignored_return_value.patch \
> > +"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit cmake python3native
> > +
> > +DEPENDS +=3D " \
> > +       python3-six-native \
> > +       mbedtls \
> > +"
> > +
> > +EXTRA_OECMAKE =3D " \
> > +       -DCMAKE_BUILD_TYPE=3DDebug \
>
>
> If we used Release build type would be nicer from release point of view
> unless only difference is debug info if there are more differences then
> maybe add a packageconfig to control this setting and enable it when doin=
g
> DEBUG_ENABLED =3D =E2=80=9C1=E2=80=9D builds only
>
> >
> > +       -DBUILD_SHARED_LIBS=3DON \
> > +       -DUA_NAMESPACE_ZERO=3DREDUCED \
> > +       -DUA_ENABLE_ENCRYPTION=3DON \
> > +       -DUA_BUILD_EXAMPLES=3DOFF \
> > +"
It would maybe make sense to use PACKAGECONFIG for these settings so
it would much easier to customize the library e.g. enable examples,
use a different UA_NAMESPACE,...
> > +
> > +FILES_${PN}-dev +=3D "${libdir}/cmake/*"
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > +
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

