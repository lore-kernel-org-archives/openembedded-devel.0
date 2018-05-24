Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 60AE17478E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 14:24:45 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id n9-v6so876132pgq.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 07:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=G0uRICeJ9uLG20J7MWBbCAy+cfhuZRoHS1ccRXvEWHE=;
	b=DXdVx1bnmkAL0DTE1EBRO0kqonVysYJnqxPhFzmk2fOlyNW15gNmw6+IvquPMrgEyv
	m0V7khDjWFynfAAsaUOU4VPl0KR/ojK5xIUc8gIH+Zy9hTZ1/PNDQaM6V/4lladwiiq5
	aYHnB4IHsCzuHNLklTFmzXEUpQO82uwqJo8OkFqArAUv4AQsdlHEIASgGIePc7QXeVxK
	WvoR4gDHqLa7n6AC5ql2pTkugofxLFOClLMMHLlT6iIUsHX2IpfQ+DdPpcfw48cujULn
	SMFWzHmGm+YsSvYek9jIrohBLAmYoDo9LZd6NIQ0qKllgLiH+ZyD+Wrq4JN+OdE/mGKW
	sujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=G0uRICeJ9uLG20J7MWBbCAy+cfhuZRoHS1ccRXvEWHE=;
	b=HVRjo0ZpnLppVz9jEJOPc2pkv1GGkJpSa8L0t39KoyDuyupevECC3s45JnrQu+XdSv
	WiZQJYb7ddEE1i98kY9i4TELwEgX8KFyA8+fOJpvBarhBR63n25756aAGnzH+0RRYP8P
	Uy+w0GcKA61bxh+a3JhCrZx8qLdxrL9GIBPwOJzkjQI+1MSmF0UsezE/wgR8lYHeTeii
	PMJP+Tno5KZeioTXkMVVffC3ZScAAdtoD7wQANxUjYXYuCerm7/Ttjkg8i7GBFwmWpqx
	sWPOCxhZgzgzu1pd76T61CHHjWVauYSEL5ImTANv/i18Y/DPirL65QnPfd/dAPkjyGxF
	njkw==
X-Gm-Message-State: ALKqPwcwMq6AHs5dT3s4F2BoURzJZrFkOuYDMkXsTWPW1dV47VkqcHVf
	PkT3TdXWMSMrfuzklYTM224=
X-Google-Smtp-Source: AB8JxZqvSuXvELWJHVycbvQlkv9cvsNCJ+fsYWplUAFWhCIBLWcnSKv5WVHQST3YvJeqwUXIWbEPNQ==
X-Received: by 2002:a62:a65c:: with SMTP id
	t89-v6mr7522778pfe.27.1527171886180; 
	Thu, 24 May 2018 07:24:46 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:3941:ab27:d0c6:acbf?
	([2601:202:4000:1184:3941:ab27:d0c6:acbf])
	by smtp.gmail.com with ESMTPSA id
	m11-v6sm26807392pgv.48.2018.05.24.07.24.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 May 2018 07:24:45 -0700 (PDT)
To: Krzysztof Kozlowski <krzk@kernel.org>,
	openembedded-devel@lists.openembedded.org
References: <1527152611-13882-1-git-send-email-krzk@kernel.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <b4b95eef-f72e-9ee4-3fdb-09b5e5ff71c1@gmail.com>
Date: Thu, 24 May 2018 07:24:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1527152611-13882-1-git-send-email-krzk@kernel.org>
Subject: Re: [meta-networking][rocko][PATCH v3] civetweb: Add new recipe with git-based version
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
X-List-Received-Date: Thu, 24 May 2018 14:24:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 05/24/2018 02:03 AM, Krzysztof Kozlowski wrote:
> Add recipe for CivetWeb: easy to use, powerful, C/C++ embeddable web
> server with optional CGI, SSL and Lua support, under MIT license.
>
> CivetWeb provides C and C++ libraries and a standalone server binary.
>
> Choose specific post-v1.10 git revision b8148afe8fa4 which has a fixed
> SSL support (depending on OpenSSL v1.0.2).
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Adding new packages to a stable branch is not allowed.=C2=A0 Also I don't=
 see
it in master.

- Armin=C2=A0
>
> ---
>
> Changes since v2:
> 1. Bump to post-v1.10 git revision.
> 2. Add ssl package config.
> 3. Drop cgi, cpp and debug from default package config.
>
> Changes since v1:
> 1. Use SRCREC as suggested by Khem Raj.
> 2. Drop nativesdk class.
> 3. Fix native build with patch.
> 4. Explicitly disable SSL (does not build at v1.10).
> 5. Disable ASAN (not applicable for native builds).
> ---
>  ...ssing-librt-and-libm-during-native-compil.patch | 42 ++++++++++++++=
+++++++
>  .../recipes-connectivity/civetweb/civetweb_git.bb  | 43 ++++++++++++++=
++++++++
>  2 files changed, 85 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/civetweb/civet=
web/0001-Test-Fix-missing-librt-and-libm-during-native-compil.patch
>  create mode 100644 meta-networking/recipes-connectivity/civetweb/civet=
web_git.bb
>
> diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb/000=
1-Test-Fix-missing-librt-and-libm-during-native-compil.patch b/meta-netwo=
rking/recipes-connectivity/civetweb/civetweb/0001-Test-Fix-missing-librt-=
and-libm-during-native-compil.patch
> new file mode 100644
> index 000000000000..401cf39ad8df
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/civetweb/civetweb/0001-Test-=
Fix-missing-librt-and-libm-during-native-compil.patch
> @@ -0,0 +1,42 @@
> +From cd93e2c538cecb3192fd24c0fbd6e834d0c47eec Mon Sep 17 00:00:00 2001=

> +From: Krzysztof Kozlowski <krzk@kernel.org>
> +Date: Wed, 18 Apr 2018 14:11:52 +0200
> +Subject: [PATCH] Unittest: Fix missing librt and libm during native co=
mpilation
> +
> +civetweb looks for librt and libm in weird places and for native build=

> +this fails:
> +
> +    | ../third_party/lib/libcheck.a(check.c.o): In function `tcase_cre=
ate':
> +    | build/tmp/work/x86_64-linux/civetweb-native/1.10-r0/build/third_=
party/src/check-unit-test-framework/src/check.c:145: undefined reference =
to `floor'
> +    | build/tmp/work/x86_64-linux/civetweb-native/1.10-r0/build/third_=
party/src/check-unit-test-framework/src/check.c:148: undefined reference =
to `floor'
> +
> +These are needed dependencies so try regular system linkage in such
> +case.
> +
> +Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> +---
> + unittest/CMakeLists.txt | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/unittest/CMakeLists.txt b/unittest/CMakeLists.txt
> +index f34b2e0e4ce4..05d25702178c 100644
> +--- a/unittest/CMakeLists.txt
> ++++ b/unittest/CMakeLists.txt
> +@@ -60,10 +60,14 @@ endif()
> + find_package(LibM)
> + if (LIBM_FOUND)
> +   set(CHECK_LIBRARIES "${CHECK_LIBRARIES};LIBM::LIBM")
> ++else()
> ++  set(CHECK_LIBRARIES "${CHECK_LIBRARIES};-lm")
> + endif()
> + find_package(LibRt)
> + if (LIBRT_FOUND)
> +   set(CHECK_LIBRARIES "${CHECK_LIBRARIES};LIBRT::LIBRT")
> ++else()
> ++  set(CHECK_LIBRARIES "${CHECK_LIBRARIES};-lrt")
> + endif()
> +=20
> + # Build the C unit tests
> +--=20
> +2.7.4
> +
> diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_git=
=2Ebb b/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
> new file mode 100644
> index 000000000000..ffe7282b73c9
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
> @@ -0,0 +1,43 @@
> +SUMMARY =3D "Civetweb embedded web server"
> +HOMEPAGE =3D "https://github.com/civetweb/civetweb"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D6f28fdcba0dda735eed62bac=
6a397562"
> +
> +SRCREV =3D "b8148afe8fa44c64f75e69655c4fdc9095565568"
> +PV =3D "1.10+git${SRCPV}"
> +SRC_URI =3D "git://github.com/civetweb/civetweb.git"
> +SRC_URI_append_class-native =3D " \
> +    file://0001-Test-Fix-missing-librt-and-libm-during-native-compil.p=
atch \
> +"
> +S =3D "${WORKDIR}/git"
> +
> +# civetweb supports building with make or cmake (although cmake lacks =
few features)
> +inherit cmake
> +
> +# Disable Lua and Duktape because they do not compile from CMake (as o=
f v1.8, v1.9 and v1.10).
> +# Disable ASAN as it is included only in Debug build.
> +EXTRA_OECMAKE =3D " \
> +    -DBUILD_SHARED_LIBS=3DON \
> +    -DCIVETWEB_ENABLE_DUKTAPE=3DOFF \
> +    -DCIVETWEB_ENABLE_LUA=3DOFF \
> +    -DCIVETWEB_ENABLE_ASAN=3DOFF \
> +"
> +EXTRA_OECMAKE_class-native =3D " \
> +    -DBUILD_SHARED_LIBS=3DON \
> +    -DCIVETWEB_ENABLE_DUKTAPE=3DOFF \
> +    -DCIVETWEB_ENABLE_LUA=3DOFF \
> +    -DCIVETWEB_ENABLE_ASAN=3DOFF \
> +"
> +
> +PACKAGECONFIG ??=3D "caching ipv6 server ssl websockets"
> +PACKAGECONFIG[caching] =3D "-DCIVETWEB_DISABLE_CACHING=3DOFF,-DCIVETWE=
B_DISABLE_CACHING=3DON,"
> +PACKAGECONFIG[cgi] =3D "-DCIVETWEB_DISABLE_CGI=3DOFF,-DCIVETWEB_DISABL=
E_CGI=3DON,"
> +PACKAGECONFIG[cpp] =3D "-DCIVETWEB_ENABLE_CXX=3DON,-DCIVETWEB_ENABLE_C=
XX=3DOFF,"
> +PACKAGECONFIG[debug] =3D "-DCIVETWEB_ENABLE_MEMORY_DEBUGGING=3DON,-DCI=
VETWEB_ENABLE_MEMORY_DEBUGGING=3DOFF,"
> +PACKAGECONFIG[ipv6] =3D "-DCIVETWEB_ENABLE_IPV6=3DON,-DCIVETWEB_ENABLE=
_IPV6=3DOFF,"
> +PACKAGECONFIG[server] =3D "-DCIVETWEB_INSTALL_EXECUTABLE=3DON,-DCIVETW=
EB_INSTALL_EXECUTABLE=3DOFF,"
> +PACKAGECONFIG[ssl] =3D "-DCIVETWEB_ENABLE_SSL=3DON -DCIVETWEB_SSL_OPEN=
SSL_API_1_1=3DOFF -DCIVETWEB_ENABLE_SSL_DYNAMIC_LOADING=3DOFF,-DCIVETWEB_=
ENABLE_SSL=3DOFF,openssl (=3D1.0.2%),"
> +PACKAGECONFIG[websockets] =3D "-DCIVETWEB_ENABLE_WEBSOCKETS=3DON,-DCIV=
ETWEB_ENABLE_WEBSOCKETS=3DOFF,"
> +
> +BBCLASSEXTEND =3D "native"



