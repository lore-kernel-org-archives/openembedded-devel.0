Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 29C027FCA4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 17:32:28 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id 3so7505255pfb.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Nov 2019 10:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=d5rr+Ie0j1fnfaUpA0RwBRRqxPUb+6oDcvyz9TYFvdw=;
	b=i4KrmZL+7rdkzZ6ro8xOUgnPlML8sYfvarAhSLNRwFMvXVfKWZwuusnSkB3haKoyJ1
	GYLTxLSW8NQzz6KaCqAz6aoQ3/hbDyqiQLztRCnoEbvFnAaGhiISJJQ6T/D8kPmGPbsg
	Ea0CDJP9lNnmri0C54qRsMbYbuRwpzyWVMjJgz4pkTUabvqQJXTE+ABy16UhSWmt/cNs
	BUiHXCIfUb+Eg1v0Op0XaPl8MWIiHJd75RRzidplzQshylfBreGcQ1icL5XhY4W/6u5Q
	V5lV7/4VP2tBOy5YwDKsL5zP6dnPeZobhqlnzalLdORAnff+Tp9CApgHiHEv6W4tevaA
	49Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=d5rr+Ie0j1fnfaUpA0RwBRRqxPUb+6oDcvyz9TYFvdw=;
	b=kpKwRQkM2s/rqR8t224lIg0sJ7BNaHgFO5ppht2m44gKxf2JiLDFd0ltN60Vmh4DnL
	Y9k7i1+ad17sNj8lxqogZjqYAeHgjIeTxS+q13JlGTCnw3ROKYastroYSCYBxC9gl9Dw
	aSDORrLVI1XiqcxsQ7ygszil3KHOhAbKxGZ+uxN4cEwwMihuMYOuk9Qr2VGaqvAKFV6M
	aVq1lQvnol1mk2xM/EmgGa9aOsDQChqGZBKOKUeTnvoFmWUf7f7eYhqNUUx1iuWxTr+t
	yU8tDTvSeSO2qq5szI5PxU3tRLcOXG21w7Qi0diotTRSW7vu+s2cdpj8dTjEq7UJ3olm
	ALGw==
X-Gm-Message-State: APjAAAX467HDQtFDDzYpdhiT0NvZ4rrJ8BPlPWpie57h7L/QkXMLyoEe
	2KhgGr0c6Hx/evaG5tR3DzYSDWKxvZc=
X-Google-Smtp-Source: APXvYqy5GPdE/OGMbBMnVnWrhKVWlzP1LoKMHqXedN32xy5kl6+7FMETzd5aCbZkl1RfeofhOk+QPA==
X-Received: by 2002:a62:fb0f:: with SMTP id x15mr15150087pfm.59.1572629548294; 
	Fri, 01 Nov 2019 10:32:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::f974])
	by smtp.gmail.com with ESMTPSA id q1sm2042261pgr.92.2019.11.01.10.32.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 01 Nov 2019 10:32:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Nov 2019 10:32:12 -0700
Message-Id: <20191101173212.1184403-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] miniupnpd: Update to 2.1.20191006
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
X-List-Received-Date: Fri, 01 Nov 2019 17:32:28 -0000
Content-Transfer-Encoding: 8bit

Forward port the patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Add-OpenEmbedded-cross-compile-case.patch   | 12 +++++-------
 ...npd_2.1.20190630.bb => miniupnpd_2.1.20191006.bb} |  4 ++--
 2 files changed, 7 insertions(+), 9 deletions(-)
 rename meta-networking/recipes-connectivity/miniupnpd/{miniupnpd_2.1.20190630.bb => miniupnpd_2.1.20191006.bb} (92%)

diff --git a/meta-networking/recipes-connectivity/miniupnpd/files/0001-Add-OpenEmbedded-cross-compile-case.patch b/meta-networking/recipes-connectivity/miniupnpd/files/0001-Add-OpenEmbedded-cross-compile-case.patch
index cd4291d91b..e33d8eac1d 100644
--- a/meta-networking/recipes-connectivity/miniupnpd/files/0001-Add-OpenEmbedded-cross-compile-case.patch
+++ b/meta-networking/recipes-connectivity/miniupnpd/files/0001-Add-OpenEmbedded-cross-compile-case.patch
@@ -3,17 +3,15 @@ From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 22 Dec 2018 18:47:45 -0800
 Subject: [PATCH] Add OpenEmbedded cross compile case
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/miniupnp/miniupnp/pull/410]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  genconfig.sh | 11 +++++++++++
  1 file changed, 11 insertions(+)
 
-diff --git a/genconfig.sh b/genconfig.sh
-index dc42462..59922e9 100755
 --- a/genconfig.sh
 +++ b/genconfig.sh
-@@ -98,6 +98,12 @@ if [ -f ../shared/tomato_version ]; then
+@@ -103,6 +103,12 @@ if [ -f ../shared/tomato_version ]; then
  	OS_VERSION="Tomato $TOMATO_VER"
  fi
  
@@ -26,14 +24,14 @@ index dc42462..59922e9 100755
  ${RM} ${CONFIGFILE}
  
  echo "/* MiniUPnP Project" >> ${CONFIGFILE}
-@@ -318,6 +324,11 @@ case $OS_NAME in
+@@ -346,6 +352,11 @@ case $OS_NAME in
  		echo "#define USE_IFACEWATCHER 1" >> ${CONFIGFILE}
- 		FW=netfilter
+ 		FW=iptables
  		;;
 +	OpenEmbedded)
 +		OS_URL=http://www.openembedded.org/
 +		echo "#define USE_IFACEWATCHER 1" >> ${CONFIGFILE}
-+		FW=netfilter
++		FW=iptables
 +		;;
  	AstLinux)
  		OS_URL=http://www.astlinux.org/
diff --git a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20190630.bb b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20191006.bb
similarity index 92%
rename from meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20190630.bb
rename to meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20191006.bb
index 6b8fdca4c3..595e211ea5 100644
--- a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20190630.bb
+++ b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20191006.bb
@@ -15,8 +15,8 @@ SRC_URI = "http://miniupnp.tuxfamily.org/files/download.php?file=${BP}.tar.gz;do
            file://miniupnpd.service \
            file://0001-Add-OpenEmbedded-cross-compile-case.patch \
            "
-SRC_URI[md5sum] = "394e676f555d8047be69730d9c4d23a5"
-SRC_URI[sha256sum] = "29f49fe6868597d041ee29f511fa7b65781b9e4e85ef2569a2381c2079e1743e"
+SRC_URI[md5sum] = "340789edd49c113afe37834cc901a1e8"
+SRC_URI[sha256sum] = "218fad7af31f3c22fb4c9db28a55a2a8b5067d41f5b38f52008a057a00d2206d"
 
 IPV6 = "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '--ipv6', '', d)}"
 
-- 
2.23.0


