Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9050F7F62C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 12:52:37 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id u40so3314841qth.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 05:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=acTvT7jQlf3rE6UJuKLIJKWrjlNEDhzdQkfABhQVCi0=;
	b=uZYlCz1LXmOuqRi+xDE7SdybAD1JhpZT3v4nbRmJc8ZQHwEvCkydO1fEmFyLXhUTet
	WxbAPKTUsO6zS0IfzC2VBETjISX7f+lUnW4/RSflvNRasAJRbiZd5RhxXb2waF5JJEbz
	XpfCBFjemVz4fwMSlHIi9RjtlGBwdcNofWsYB1eUo59XPPWgOV5N2f4QTlYv95F+DYyV
	HxLNkgv2jYZetvnrFUOGQ7UaTiTSN2AVcKKNJBiLkloWPxLUUQYG2BgxBslkfpDrYOEc
	UJsqEGWWLTmsxL1mQthAxG4pQWgkRsusIx31uvR3aoSbeVpS/r33+/dytL9T6cTgBhzi
	n4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=acTvT7jQlf3rE6UJuKLIJKWrjlNEDhzdQkfABhQVCi0=;
	b=s3eL6FaEEfIY6gR0k6N5VudftIhLUvKcDU/hmbMJD8X20SVSY3C+FFLN8L/SFLKuKd
	Ev6F4w1zF5r6DtgwUP8rYg6k/EivOj4Dq9hynnxi4S1/Vht+/9cfWvV9SkaYcONXeyoz
	yaxP9dStSAY3zRtU79KAE3lc1p4r07rrL8Mo55vAQDolU5iWd7cEULXyuY4ZyOcB/TSk
	WXqBGVj97tQZsIck9/zchJ3KgIHZl7/b7lF9xkJMeP9xVZZV27U0dzZuxO+Wa3TGVleF
	2g9Tsv8JFC/aC1t30NXUs1QAIkzWnpG0DBCT0nWawB35vwOtLMG+1x1FzTSqNR1+lq9+
	ATpA==
X-Gm-Message-State: APjAAAW7uGGOJ/0ASimf/BREWGkQ7rQz4yzLrZuz8p4TdTxNSedeMfoK
	koryHeKqIoPMKFPbZVsoJNBJeYPx7JIfLqFdWqY=
X-Google-Smtp-Source: APXvYqz9MPlcUj3DTiXpCnhou3MbLURggqL3wepXHdwH3yxPoiLavIE0XP17o3BRp+4TsmViDvl0EpM1WBo6N95vAr0=
X-Received: by 2002:ac8:356e:: with SMTP id z43mr3619265qtb.88.1571316758162; 
	Thu, 17 Oct 2019 05:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <20191017111939.1469-1-urs.fassler@bbv.ch>
In-Reply-To: <20191017111939.1469-1-urs.fassler@bbv.ch>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Oct 2019 05:52:11 -0700
Message-ID: <CAMKF1srswaPiMrh136r=VOnH6VmPwHUERZm-i6qKeeNs4hZrAw@mail.gmail.com>
To: =?UTF-8?B?VXJzIEbDpHNzbGVy?= <urs.fassler@bbv.ch>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2] open62541: add new recipe
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
X-List-Received-Date: Thu, 17 Oct 2019 12:52:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fails to compile

https://errors.yoctoproject.org/Errors/Details/273943/

On Thu, Oct 17, 2019 at 4:19 AM Urs F=C3=A4ssler <urs.fassler@bbv.ch> wrote=
:
>
> It provides a open source implementation for OPC UA.
> ---
>  .../files/0001-fix_ignored_return_value.patch | 17 ++++++++++
>  .../open62541/open62541_1.0.bb                | 31 +++++++++++++++++++
>  2 files changed, 48 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/open62541/files/=
0001-fix_ignored_return_value.patch
>  create mode 100644 meta-networking/recipes-connectivity/open62541/open62=
541_1.0.bb
>
> diff --git a/meta-networking/recipes-connectivity/open62541/files/0001-fi=
x_ignored_return_value.patch b/meta-networking/recipes-connectivity/open625=
41/files/0001-fix_ignored_return_value.patch
> new file mode 100644
> index 000000000..3a8377ec5
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/open62541/files/0001-fix_ignor=
ed_return_value.patch
> @@ -0,0 +1,17 @@
> +diff --git a/plugins/ua_pki_default.c b/plugins/ua_pki_default.c
> +index 79331bc9..b20ad95c 100644
> +--- a/plugins/ua_pki_default.c
> ++++ b/plugins/ua_pki_default.c
> +@@ -89,7 +89,11 @@ fileNamesFromFolder(const UA_String *folder, size_t *=
pathsSize, UA_String **path
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
> diff --git a/meta-networking/recipes-connectivity/open62541/open62541_1.0=
.bb b/meta-networking/recipes-connectivity/open62541/open62541_1.0.bb
> new file mode 100644
> index 000000000..b7a4f14b9
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/open62541/open62541_1.0.bb
> @@ -0,0 +1,31 @@
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
> +"
> +
> +PACKAGECONFIG[sharedlibs] =3D "-DBUILD_SHARED_LIBS=3DON,-DBUILD_SHARED_L=
IBS=3DOFF,,"
> +PACKAGECONFIG[encryption] =3D "-DUA_ENABLE_ENCRYPTION=3DON,-DUA_ENABLE_E=
NCRYPTION=3DOFF,mbedtls,"
> +PACKAGECONFIG[fullnszero] =3D "-DUA_NAMESPACE_ZERO=3DFULL,-DUA_NAMESPACE=
_ZERO=3DREDUCED,,"
> +
> +EXTRA_OECMAKE =3D " \
> +       -DCMAKE_BUILD_TYPE=3DRelWithDebInfo \
> +"
> +
> +FILES_${PN}-dev +=3D "${libdir}/cmake/*"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> --
> 2.20.1
>

