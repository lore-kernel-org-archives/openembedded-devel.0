Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
	[209.85.222.170])
	by mail.openembedded.org (Postfix) with ESMTP id 15BD27D6A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 01:17:01 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id e66so619897qkf.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 18:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TXVo2PWfKMv454XHPcpboU9uL5kfK58gJ9TEC149oF0=;
	b=IDfVO7fCWHKdEGxIO9WR78dD582NMPXrAquNJ4jla2mlGeZy4cFMLQCOOrRbvLVDIg
	HS0Tv5raUrrSo+Qv1zs8/5H0vuVa/149kMQrYOxdnChuklbi6aXVhOTDOUvwXzLeoQL6
	DJOo9RjqVS108sm7N97chSEB75DwR+4eUetTbwqm7fcFwHXPf3ASJEP9oK7JxzOlhtJR
	Ip9ktQEZocTejty/99y2P0DDi7rv0WI6h3pt4ChpbR1+z981w1WqiLiV9fxDOnH7f4Tr
	OUgKt+3fgCA9Oq5EJ8eTXDE4XvaQSg0DVSaPGZqD0eUIbsmNITBalpZnAeY//vGLF4F1
	tMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TXVo2PWfKMv454XHPcpboU9uL5kfK58gJ9TEC149oF0=;
	b=gR11oYp3sQ2VbQok3zaKCKswUgP2xy4AEpI/XjiAGgYbGZejOUFgOoA+VyI1Q8M0Nc
	Wxqqxy71cHfL6ZZS2J78OdVLo8S88irBT6eJ9GKHLvWqytNCbc7u/XGk7/hIQlf/uIw0
	YLFh43OL7xcG1sbw0ay1v/MXD9CT4sPBDmHYKR23TjlbOxr15YqhQ5PoYsPBjoXsouyH
	I+QGtDgcwm4Pw4jWw7VCzjnK/QW67mBzZ++sTZj1P3RJdbIIVNPuryetTP0dZozyhHji
	E0tKtOVa2w15BY8QFwdbJBoafe8/EfcwGgZyvKZi8ES1NOdfQwjveXjDjXd+PpEfRpGO
	f3LA==
X-Gm-Message-State: APjAAAWKEHuEvbZdSUuSwIIL3SMYhWSUwCYv99Pw1u3uxcTG4/nuYN4i
	enCShVuMZ14gsD6Y+9CoBgt7zLR3+WMul5GL04Q=
X-Google-Smtp-Source: APXvYqxppEGL288RxKQkbIucuA8s5tjze/5PNo1mCFkVWqZzUm+e+hmZd57AzktG6GWsgS3QEXCKgxZ/ihrPukxuK+w=
X-Received: by 2002:a37:b985:: with SMTP id
	j127mr38566775qkf.337.1571188622678; 
	Tue, 15 Oct 2019 18:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <20191014122601.18745-1-urs.fassler@bbv.ch>
In-Reply-To: <20191014122601.18745-1-urs.fassler@bbv.ch>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Oct 2019 18:16:50 -0700
Message-ID: <CAMKF1sqSp_8FSEGXzcd4_Tf5GDQxYTZ=GKUhFo_7B7yjPcZEWg@mail.gmail.com>
To: =?UTF-8?B?VXJzIEbDpHNzbGVy?= <urs.fassler@bbv.ch>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Wed, 16 Oct 2019 01:17:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2019 at 5:56 PM Urs F=C3=A4ssler <urs.fassler@bbv.ch> wrote=
:

> It provides a open source implementation for OPC UA.
> ---
>  .../files/0001-fix_ignored_return_value.patch | 17 ++++++++++
>  .../open62541/open62541_1.0.bb                | 32 +++++++++++++++++++
>  2 files changed, 49 insertions(+)
>  create mode 100644
> meta-networking/recipes-connectivity/open62541/files/0001-fix_ignored_ret=
urn_value.patch
>  create mode 100644 meta-networking/recipes-connectivity/open62541/
> open62541_1.0.bb
>
> diff --git
> a/meta-networking/recipes-connectivity/open62541/files/0001-fix_ignored_r=
eturn_value.patch
> b/meta-networking/recipes-connectivity/open62541/files/0001-fix_ignored_r=
eturn_value.patch
> new file mode 100644
> index 000000000..3a8377ec5
> --- /dev/null
> +++
> b/meta-networking/recipes-connectivity/open62541/files/0001-fix_ignored_r=
eturn_value.patch
> @@ -0,0 +1,17 @@
> +diff --git a/plugins/ua_pki_default.c b/plugins/ua_pki_default.c
> +index 79331bc9..b20ad95c 100644
> +--- a/plugins/ua_pki_default.c
> ++++ b/plugins/ua_pki_default.c
> +@@ -89,7 +89,11 @@ fileNamesFromFolder(const UA_String *folder, size_t
> *pathsSize, UA_String **path
> +
> +     struct dirent *ent;
> +     char buf2[PATH_MAX + 1];
> +-    realpath(buf, buf2);
> ++    char *res =3D realpath(buf, buf2);
> ++    if(res =3D=3D NULL) {
> ++        closedir(dir);
> ++        return UA_STATUSCODE_BADINTERNALERROR;
> ++    }
> +     size_t pathlen =3D strlen(buf2);
> +     *pathsSize =3D 0;
> +     while((ent =3D readdir (dir)) !=3D NULL && *pathsSize < 256) {
> diff --git a/meta-networking/recipes-connectivity/open62541/
> open62541_1.0.bb b/meta-networking/recipes-connectivity/open62541/
> open62541_1.0.bb
> new file mode 100644
> index 000000000..c34e70660
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/open62541/open62541_1.0.bb
> @@ -0,0 +1,32 @@
> +HOMEPAGE =3D "http://open62541.org/"
> +SUMMARY =3D "Open source implementation of OPC UA - library"
> +LICENSE =3D "MPL-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D815ca599c9df247a0c7f619bab123=
dad"
> +
> +SRCREV =3D "ce5209d78d3821504d31b3bbdb03f53d6e3f93a7"
> +SRC_URI =3D " \
> +       gitsm://github.com/open62541/open62541.git \
> +       file://0001-fix_ignored_return_value.patch \
> +"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake python3native
> +
> +DEPENDS +=3D " \
> +       python3-six-native \
> +       mbedtls \
> +"
> +
> +EXTRA_OECMAKE =3D " \
> +       -DCMAKE_BUILD_TYPE=3DDebug \


If we used Release build type would be nicer from release point of view
unless only difference is debug info if there are more differences then
maybe add a packageconfig to control this setting and enable it when doing
DEBUG_ENABLED =3D =E2=80=9C1=E2=80=9D builds only

>
> +       -DBUILD_SHARED_LIBS=3DON \
> +       -DUA_NAMESPACE_ZERO=3DREDUCED \
> +       -DUA_ENABLE_ENCRYPTION=3DON \
> +       -DUA_BUILD_EXAMPLES=3DOFF \
> +"
> +
> +FILES_${PN}-dev +=3D "${libdir}/cmake/*"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

