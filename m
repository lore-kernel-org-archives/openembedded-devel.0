Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id B8A6C7476C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2018 16:20:05 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id a20-v6so2316643pfo.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2018 09:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=w3mc56WAChc9qDcKb3HncQuXgY+qPSvpi8E33Y4KA+w=;
	b=LP1BilhYHvEHQ+KFnlwb3dxBfaa24HDqK/dgsaXcUaFvDyzzTFZ6t9mL8iyTatTEEv
	twvSS9N1MT2hOZ3LN0MD2y5RA9lmoZsIFAxV0GX3zV7Dl03ogwIRKnXY+QTxzdfzn7gi
	aesiqei6pvXAjcCb52D/T/mjgv2XipRJXXZNZzTDj82ILhPU7A2Fheo+d5turdEc/Smd
	E7/f3q7O+fBrkBo+jHHamMZUHJ2Bcqsp3FlzQjuukZBjywLtHC0bCd8AoaJsI+J3hhfn
	6VKk4KlO7Wh90VT6nnqjxmtxBAtZW0FxX4JOF61u/2qWvFrf9Uao8MbCX+m9iEbhvGaM
	yCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=w3mc56WAChc9qDcKb3HncQuXgY+qPSvpi8E33Y4KA+w=;
	b=mcCpr6rvVPw3PcpyaY2of/lflxIPug2ed0iF3bJA6ellqEwEjP0tFVK9pIGyot2weq
	oZVUax0OKuyZ2lYZYuBY9yB7VQ0kaMzdisyRLGwrhEwZHI3YJmHjNekmM7fdfKZZ04V7
	gJsbwEUChvI7DBmzzpo/9MS+Y0eVyrppWTxsMUaVjOgMqK5NcqlCw9E+J25TLs1By4wa
	O8F5QxaP6r5KWxBjHh6TNRviayHkPlzbL+lI2Hpb/zPmr7/kRTQsCkmF6JFJmkVViI2D
	sCgYqQgddCcjBYJNncWaITtmrh3rU/ajtJabDJoEDzEW3WnXUKwxOJP+VF1hDOd4bQ5y
	Hixg==
X-Gm-Message-State: ALKqPwcqqdgcShGUkbfb9ZM/m4vUyqSyyMQ/JyhmsOwiNlnLqoKbRMo2
	Awq6p+HOqczv9MpZhrwWCRdfhvs3Vag0SQTSb30=
X-Google-Smtp-Source: AB8JxZojx5JPoNZa4KasMwgqYZz0XunZbb7fYEr6+D/Rw3P6OSoFW1kE8mOKUbj6b0SSiZmWef16Mh50Y54OHisUEBI=
X-Received: by 2002:a62:828c:: with SMTP id
	w134-v6mr11121664pfd.138.1526314806470; 
	Mon, 14 May 2018 09:20:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:8b91:0:0:0:0 with HTTP; Mon, 14 May 2018 09:19:36
	-0700 (PDT)
In-Reply-To: <20180514131928.32664-1-pascal.bach@siemens.com>
References: <20180514131928.32664-1-pascal.bach@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 May 2018 09:19:36 -0700
Message-ID: <CAMKF1sr_XRWyPtTBOeG+hz2c8hssWyGdHP3X5cQWCS47C5YwCw@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] poco: update to 1.9.0
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
X-List-Received-Date: Mon, 14 May 2018 16:20:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 14, 2018 at 6:19 AM, Pascal Bach <pascal.bach@siemens.com> wrote:
> Enable the new Encodings and Redis packages by default
>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  meta-oe/recipes-support/poco/poco_1.9.0.bb | 108 +++++++++++++++++++++++++++++
>  1 file changed, 108 insertions(+)
>  create mode 100644 meta-oe/recipes-support/poco/poco_1.9.0.bb
>

We should remove the old recipe at the same time if there is no reason
to keep it.

> diff --git a/meta-oe/recipes-support/poco/poco_1.9.0.bb b/meta-oe/recipes-support/poco/poco_1.9.0.bb
> new file mode 100644
> index 000000000..1a804b1ae
> --- /dev/null
> +++ b/meta-oe/recipes-support/poco/poco_1.9.0.bb
> @@ -0,0 +1,108 @@
> +SUMMARY = "Modern, powerful open source cross-platform C++ class libraries"
> +DESCRIPTION = "Modern, powerful open source C++ class libraries and frameworks for building network- and internet-based applications that run on desktop, server, mobile and embedded systems."
> +SECTION = "libs"
> +HOMEPAGE = "http://pocoproject.org/"
> +LICENSE = "BSL-1.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4267f48fc738f50380cbeeb76f95cebc"
> +
> +# These dependencies are required by Foundation
> +DEPENDS = "libpcre zlib"
> +
> +inherit cmake ptest
> +
> +BBCLASSEXTEND = "native"
> +
> +SRCREV = "94966785a8f9ad0191dffd075ebd67826e6e4b6d"
> +SRC_URI = " \
> +    git://github.com/pocoproject/poco.git \
> +    file://run-ptest \
> +   "
> +
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=RelWithDebInfo -DPOCO_UNBUNDLED=ON \
> +                  -DZLIB_LIBRARY_RELEASE:STRING=z -DPCRE_LIBRARY:STRING=pcre \
> +                 ${@bb.utils.contains('PTEST_ENABLED', '1', '-DENABLE_TESTS=ON ', '', d)}"
> +
> +# For the native build we want to use the bundled version
> +EXTRA_OECMAKE_append_class-native = " -DPOCO_UNBUNDLED=OFF"
> +
> +# do not use rpath
> +EXTRA_OECMAKE_append = " -DCMAKE_SKIP_RPATH=ON"
> +
> +# By default the most commonly used poco components are built
> +# Foundation is built anyway and doesn't need to be listed explicitly
> +# these don't have dependencies outside oe-core
> +PACKAGECONFIG ??= "XML JSON MongoDB PDF Util Net NetSSL Crypto Data DataSQLite Zip Encodings Redis"
> +
> +PACKAGECONFIG[XML] = "-DENABLE_XML=ON -DEXPAT_LIBRARY:STRING=expat,-DENABLE_XML=OFF,expat"
> +PACKAGECONFIG[JSON] = "-DENABLE_JSON=ON,-DENABLE_JSON=OFF"
> +PACKAGECONFIG[MongoDB] = "-DENABLE_MONGODB=ON,-DENABLE_MONGODB=OFF"
> +PACKAGECONFIG[PDF] = "-DENABLE_PDF=ON,-DENABLE_PDF=OFF,zlib"
> +PACKAGECONFIG[Util] = "-DENABLE_UTIL=ON,-DENABLE_UTIL=OFF"
> +PACKAGECONFIG[Net] = "-DENABLE_NET=ON,-DENABLE_NET=OFF"
> +PACKAGECONFIG[NetSSL] = "-DENABLE_NETSSL=ON -DOPENSSL_SSL_LIBRARY:STRING=ssl -DOPENSSL_CRYPTO_LIBRARY:STRING=crypto,-DENABLE_NETSSL=OFF,openssl"
> +PACKAGECONFIG[Crypto] = "-DENABLE_CRYPTO=ON -DOPENSSL_SSL_LIBRARY:STRING=ssl -DOPENSSL_CRYPTO_LIBRARY:STRING=crypto,-DENABLE_CRYPTO=OFF,openssl"
> +PACKAGECONFIG[Data] = "-DENABLE_DATA=ON,-DENABLE_DATA=OFF"
> +PACKAGECONFIG[DataSQLite] = "-DENABLE_DATA_SQLITE=ON -DSQLITE3_LIBRARY:STRING=sqlite3,-DENABLE_DATA_SQLITE=OFF,sqlite3"
> +PACKAGECONFIG[Zip] = "-DENABLE_ZIP=ON,-DENABLE_ZIP=OFF"
> +PACKAGECONFIG[Encodings] = "-DENABLE_ENCODINGS=ON,-DENABLE_ENCODINGS=OFF"
> +PACKAGECONFIG[Redis] = "-DENABLE_REDIS=ON,-DENABLE_REDIS=OFF"
> +
> +# Additional components not build by default,
> +# they might have dependencies not included in oe-core
> +# or they don't work on all architectures
> +PACKAGECONFIG[mod_poco] = "-DENABLE_APACHECONNECTOR=ON,-DENABLE_APACHECONNECTOR=OFF,apr apache2"
> +PACKAGECONFIG[CppParser] = "-DENABLE_CPPPARSER=ON,-DENABLE_CPPPARSER=OFF"
> +PACKAGECONFIG[DataMySQL] = "-DENABLE_DATA_MYSQL=ON -DMYSQL_LIB:STRING=mysqlclient_r,-DENABLE_DATA_MYSQL=OFF,mariadb"
> +PACKAGECONFIG[DataODBC] = "-DENABLE_DATA_ODBC=ON,-DENABLE_DATA_ODBC=OFF,libiodbc"
> +PACKAGECONFIG[PageCompiler] = "-DENABLE_PAGECOMPILER=ON,-DENABLE_PAGECOMPILER=OFF"
> +PACKAGECONFIG[PageCompilerFile2Page] = "-DENABLE_PAGECOMPILER_FILE2PAGE=ON,-DENABLE_PAGECOMPILER_FILE2PAGE=OFF"
> +PACKAGECONFIG[SevenZip] = "-DENABLE_SEVENZIP=ON,-DENABLE_SEVENZIP=OFF"
> +
> +# Make a package for each library
> +PACKAGES = "${PN}-dbg ${POCO_PACKAGES}"
> +python __anonymous () {
> +    packages = []
> +    testrunners = []
> +    components = d.getVar("PACKAGECONFIG").split()
> +    components.append("Foundation")
> +    for lib in components:
> +        pkg = ("poco-%s" % lib.lower()).replace("_","")
> +        packages.append(pkg)
> +        if not d.getVar("FILES_%s" % pkg):
> +            d.setVar("FILES_%s" % pkg, "${libdir}/libPoco%s.so.*" % lib)
> +        testrunners.append("%s" % lib)
> +
> +    d.setVar("POCO_PACKAGES", " ".join(packages))
> +    d.setVar("POCO_TESTRUNNERS", "\n".join(testrunners))
> +}
> +
> +# "poco" is a metapackage which pulls in all Poco components
> +PACKAGES += "${PN}"
> +RRECOMMENDS_${PN} += "${POCO_PACKAGES}"
> +RRECOMMENDS_${PN}_class-native = ""
> +ALLOW_EMPTY_${PN} = "1"
> +
> +# -dev last to pick up the remaining stuff
> +PACKAGES += "${PN}-dev ${PN}-staticdev"
> +FILES_${PN}-dev = "${includedir} ${libdir}/libPoco*.so ${libdir}/cmake"
> +FILES_${PN}-staticdev = "${libdir}/libPoco*.a"
> +
> +# ptest support
> +FILES_${PN}-dbg += "${PTEST_PATH}/bin/.debug"
> +
> +# cppunit is only built if tests are enabled
> +PACKAGES += "${PN}-cppunit"
> +FILES_${PN}-cppunit += "${libdir}/libCppUnit.so*"
> +ALLOW_EMPTY_${PN}-cppunit = "1"
> +
> +RDEPENDS_${PN}-ptest += "${PN}-cppunit"
> +
> +do_install_ptest () {
> +       cp -rf ${B}/bin/ ${D}${PTEST_PATH}
> +       cp -f ${B}/lib/libCppUnit.so* ${D}${libdir}
> +       cp -rf ${B}/*/testsuite/data ${D}${PTEST_PATH}/bin/
> +       find "${D}${PTEST_PATH}" -executable -exec chrpath -d {} \;
> +       echo "${POCO_TESTRUNNERS}" > "${D}${PTEST_PATH}/testrunners"
> +}
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

