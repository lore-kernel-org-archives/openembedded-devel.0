Return-Path: <shantanu@senic.com>
Received: from mail-pg0-f46.google.com (mail-pg0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id E3C2371B57
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Sep 2017 18:38:37 +0000 (UTC)
Received: by mail-pg0-f46.google.com with SMTP id k193so4471865pgc.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Sep 2017 11:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=senic-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=AYBFJDgieuuXWeQ/gDOzwnpj2z4KCG1PYX5p+XuW+jk=;
	b=mYIsVTJm2l8hu969a6BfKOaIQ+U6DMX7x2x9cdHturVvPTjq0NABwpsP7IDdzhwhdm
	leRZG1YBVxNQaD2evFKWKPA+uzNsf4/owPwC3USt8nPTeNjOEC5U4k3wAT7ixFyh8fvx
	+5Fd0dF/1aos3llGFeQ2Adm+f7m9WygKF7GEsf9N1uNxAwK8wFtuYLU2TL1udWAhCu6Y
	9OQ9pf6jhA4oohnRCFhHEF9dBMUfAy/gjQ/oC/np4hgrF6oKGXYaSPL3W0vfGGMUAZDe
	WcZFiPzTDLSnxnk8VpWAaWzvGOec85tA6obinN1tjpXjGrjnHfnWoTphH0DzMtc3Lms1
	C9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AYBFJDgieuuXWeQ/gDOzwnpj2z4KCG1PYX5p+XuW+jk=;
	b=B9wrk7u61v4YQoHaWV2BKFIcU9N0zCbx0QJmGkkr8tvwdL0Hp61hin5qydAEm8CYEB
	Rjh69nOH/7fbn0S7CAotOjLaAtnDNo4shmVsfK2RFSvKg+m4C/IRoGjMLRhoru4ogJKD
	cHVaRjw6lelem5dNAh042t+ODe5dWlmsuH7c89ryyHFYu65nhTZ/DZhNSYwUP7RH75l4
	9ibnkCKadokLA3dLoWI1LDmw2sFDB+n8QYLOFC7Vnk228fZZVkb5sooAqDjVB3JN30yA
	V79hwI/Qi6mip8mCXjRc51XonQTXSh+Teile7XQpqwPOrMmprJzYdV2gFrzmQxEr4b+X
	TKig==
X-Gm-Message-State: AHPjjUjzoOP4gYmRZqNaQFegNO5VJXszERm5L86LdvU+KTOQj0D0g+cm
	piyD9E4JQpjNSdoWLb9v6nCGpbvK
X-Google-Smtp-Source: AOwi7QDo8ZSEsxd9C+OWBIkUapbVtj+34nTPoYH4GgirLe76mEx2wBAWJDsHFRMOveEzulp138tkvg==
X-Received: by 10.98.213.201 with SMTP id d192mr8514145pfg.210.1506364718477; 
	Mon, 25 Sep 2017 11:38:38 -0700 (PDT)
Received: from k-bhumi.domain.name ([45.126.64.155])
	by smtp.gmail.com with ESMTPSA id
	a7sm11890715pgc.40.2017.09.25.11.38.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Sep 2017 11:38:37 -0700 (PDT)
From: baali <shantanu@senic.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Sep 2017 00:08:05 +0530
Message-Id: <1506364685-32767-1-git-send-email-shantanu@senic.com>
X-Mailer: git-send-email 2.7.4
Cc: baali <baali@muse-amuse.in>
Subject: [PATCH] curl: option to enable http2 protocol support.
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
X-List-Received-Date: Mon, 25 Sep 2017 18:38:38 -0000

From: baali <baali@muse-amuse.in>

With default --without-nghttp2 flag set there was no way to get
http2 protocol support using nghttp2 library. Instead moved it to
PACKAGECONFIG options.

Signed-off-by: baali <baali@muse-amuse.in>
---
 meta/recipes-support/curl/curl_7.54.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_7.54.1.bb b/meta/recipes-support/curl/curl_7.54.1.bb
index 54f3b66..c22c827 100644
--- a/meta/recipes-support/curl/curl_7.54.1.bb
+++ b/meta/recipes-support/curl/curl_7.54.1.bb
@@ -48,13 +48,13 @@ PACKAGECONFIG[tftp] = "--enable-tftp,--disable-tftp,"
 PACKAGECONFIG[threaded-resolver] = "--enable-threaded-resolver,--disable-threaded-resolver"
 PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
 PACKAGECONFIG[krb5] = "--with-gssapi,--without-gssapi,krb5"
+PACKAGECONFIG[nghttp2] = "--with-nghttp2,--without-nghttp2"
 
 EXTRA_OECONF = " \
     --enable-crypto-auth \
     --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
     --without-libmetalink \
     --without-libpsl \
-    --without-nghttp2 \
 "
 
 do_install_append() {
-- 
2.7.4


