Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.561.1600894022034559924
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2020 13:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: randy.macleod@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 08NKktfi000516
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2020 13:46:56 -0700 (PDT)
Received: from [172.25.44.2] (172.25.44.2) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 23 Sep
 2020 13:46:55 -0700
Subject: Re: [oe] [meta-oe][PATCH] libssh2: enable ptest
To: Sakib Sajal <sakib.sajal@windriver.com>,
        <openembedded-devel@lists.openembedded.org>
References: <20200922160751.26050-1-sakib.sajal@windriver.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <72f2910a-99c3-2e65-bcf6-ae6b7d2c708e@windriver.com>
Date: Wed, 23 Sep 2020 16:46:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200922160751.26050-1-sakib.sajal@windriver.com>
X-Originating-IP: [172.25.44.2]
Content-Type: multipart/alternative;
	boundary="------------881C70B17CCDFD711630C93A"
Content-Language: en-CA

--------------881C70B17CCDFD711630C93A
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2020-09-22 12:07 p.m., Sakib Sajal wrote:
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>   meta-oe/recipes-support/libssh2/files/run-ptest |  7 +++++++
>   .../recipes-support/libssh2/libssh2_1.9.0.bb    | 17 ++++++++++++++++-
>   2 files changed, 23 insertions(+), 1 deletion(-)
>   create mode 100644 meta-oe/recipes-support/libssh2/files/run-ptest
>
> diff --git a/meta-oe/recipes-support/libssh2/files/run-ptest b/meta-oe/recipes-support/libssh2/files/run-ptest
> new file mode 100644
> index 000000000..2a7922f1a
> --- /dev/null
> +++ b/meta-oe/recipes-support/libssh2/files/run-ptest
> @@ -0,0 +1,7 @@
> +#!/bin/sh
> +
> +ptestdir=$(dirname "$(readlink -f "$0")")
> +for test in $(ls $ptestdir/tests)
> +do
> +	./test-driver --test-name $test --log-file $test.log --trs-file $test.trs --color-tests no --enable-hard-errors yes --expect-failure no -- ./tests/$test
> +done
> diff --git a/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb b/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
> index c1f337a44..a1d85617a 100644
> --- a/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
> +++ b/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
> @@ -9,11 +9,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c5cf34fc0acb44b082ef50ef5e4354ca"
>   
>   SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
>              file://CVE-2019-17498.patch \
> +           file://run-ptest \
>   "
>   SRC_URI[md5sum] = "1beefafe8963982adc84b408b2959927"
>   SRC_URI[sha256sum] = "d5fb8bd563305fd1074dda90bd053fb2d29fc4bce048d182f96eaa466dfadafd"
>   
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig ptest
>   
>   EXTRA_OECONF += "\
>                    --with-libz \
> @@ -26,3 +27,17 @@ PACKAGECONFIG[openssl] = "--with-crypto=openssl --with-libssl-prefix=${STAGING_L
>   PACKAGECONFIG[gcrypt] = "--with-crypto=libgcrypt --with-libgcrypt-prefix=${STAGING_EXECPREFIXDIR}, , libgcrypt"
>   
>   BBCLASSEXTEND = "native nativesdk"
> +
> +RDEPENDS_${PN}-ptest = "bash"


Your long log should explain why you need bash specifically rather
than any old shell?

Have you tried to fix the shell script(s) to make it work with any /bin/sh?

Also, there were some useful examples that we talked about
packaging up, can you do that as a follow-up commit?

../Randy

> +
> +do_compile_ptest() {
> +	sed -i "/\$(MAKE) \$(AM_MAKEFLAGS) check-TESTS/d" tests/Makefile
> +	oe_runmake check
> +}
> +
> +do_install_ptest() {
> +	install -d ${D}${PTEST_PATH}/tests
> +	install -m 0755 ${B}/tests/.libs/simple ${D}${PTEST_PATH}/tests/
> +	install -m 0755 ${S}/tests/mansyntax.sh ${D}${PTEST_PATH}/tests/
> +	install -m 0755 ${S}/test-driver ${D}${PTEST_PATH}/
> +}
>
> 
>

-- 
# Randy MacLeod
# Wind River Linux


--------------881C70B17CCDFD711630C93A
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2020-09-22 12:07 p.m., Sakib Sajal
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200922160751.26050-1-sakib.sajal@windriver.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Sakib Sajal <a class="moz-txt-link-rfc2396E" href="mailto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a>
---
 meta-oe/recipes-support/libssh2/files/run-ptest |  7 +++++++
 .../recipes-support/libssh2/libssh2_1.9.0.bb    | 17 ++++++++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libssh2/files/run-ptest

diff --git a/meta-oe/recipes-support/libssh2/files/run-ptest b/meta-oe/recipes-support/libssh2/files/run-ptest
new file mode 100644
index 000000000..2a7922f1a
--- /dev/null
+++ b/meta-oe/recipes-support/libssh2/files/run-ptest
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+ptestdir=$(dirname "$(readlink -f "$0")")
+for test in $(ls $ptestdir/tests)
+do
+	./test-driver --test-name $test --log-file $test.log --trs-file $test.trs --color-tests no --enable-hard-errors yes --expect-failure no -- ./tests/$test
+done
diff --git a/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb b/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
index c1f337a44..a1d85617a 100644
--- a/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
+++ b/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
@@ -9,11 +9,12 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=c5cf34fc0acb44b082ef50ef5e4354ca">"file://COPYING;md5=c5cf34fc0acb44b082ef50ef5e4354ca"</a>
 
 SRC_URI = <a class="moz-txt-link-rfc2396E" href="http://www.libssh2.org/download/${BP}.tar.gz\file://CVE-2019-17498.patch\+file://run-ptest\">"http://www.libssh2.org/download/${BP}.tar.gz \
            file://CVE-2019-17498.patch \
+           file://run-ptest \
 "</a>
 SRC_URI[md5sum] = "1beefafe8963982adc84b408b2959927"
 SRC_URI[sha256sum] = "d5fb8bd563305fd1074dda90bd053fb2d29fc4bce048d182f96eaa466dfadafd"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest
 
 EXTRA_OECONF += "\
                  --with-libz \
@@ -26,3 +27,17 @@ PACKAGECONFIG[openssl] = "--with-crypto=openssl --with-libssl-prefix=${STAGING_L
 PACKAGECONFIG[gcrypt] = "--with-crypto=libgcrypt --with-libgcrypt-prefix=${STAGING_EXECPREFIXDIR}, , libgcrypt"
 
 BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS_${PN}-ptest = "bash"</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Your long log should explain why you need bash specifically
      rather <br>
      than any old shell?</p>
    <p>Have you tried to fix the shell script(s) to make it work with
      any /bin/sh?</p>
    <p>Also, there were some useful examples that we talked about <br>
      packaging up, can you do that as a follow-up commit?<br>
    </p>
    <p>../Randy<br>
    </p>
    <blockquote type="cite"
      cite="mid:20200922160751.26050-1-sakib.sajal@windriver.com">
      <pre class="moz-quote-pre" wrap="">
+
+do_compile_ptest() {
+	sed -i "/\$(MAKE) \$(AM_MAKEFLAGS) check-TESTS/d" tests/Makefile
+	oe_runmake check
+}
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	install -m 0755 ${B}/tests/.libs/simple ${D}${PTEST_PATH}/tests/
+	install -m 0755 ${S}/tests/mansyntax.sh ${D}${PTEST_PATH}/tests/
+	install -m 0755 ${S}/test-driver ${D}${PTEST_PATH}/
+}
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------881C70B17CCDFD711630C93A--
