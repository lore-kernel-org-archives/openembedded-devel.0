Return-Path: <yannick.gicquel@iot.bzh>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id A13CE71D9E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jan 2017 14:01:10 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id r126so66429914wmr.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jan 2017 06:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/2kFR/l0FzJYcDd6Gohd7qE5Jkk8n3zpzDcB+U0HqCc=;
	b=QVgowHM7YmBTwJTND1CfiPWYPrE/5UKRbb7f9CO6o/GdAZuU5o7CNVmr7Ta26e3UOn
	uDjioPQiDCrAm7W79rkbi/UTkyE04uGoLPDU/ZvtbDI0piwAC8DjO/d3HAn2FDzvnQ5Y
	6/XHbsqd6I+OzRWwCddEkQGkazwqqWEI7F4pyyyz3fa6x8uKFqSp8sddo8wL81ii75xW
	CyBabZtzuuE/B/CfigNKtmU4b8BjPVjpFFsOuQvtQI1YmVT27/fKTXH8FZxS46H2q8pc
	uDCFssR0L6OOTec7Ag641zbeGKxrz6DfoxH/rT5BtQfTNdgdS8wVfaLQ8IT6j03ol21i
	uSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/2kFR/l0FzJYcDd6Gohd7qE5Jkk8n3zpzDcB+U0HqCc=;
	b=q2mcgTaqAWIih4ZV6JYEZSjS0AHAl0ZJx7SWXBgKyT2ABbZ/RXZbv6JKpLmk96oWNA
	EAln5yx2JVyDpAj+ccgdxDC5SHzWFWJ6wj6/Y4ZbNRJaDUwmjIRMaVbxoLln+WP9ywvI
	PaXGSc2+170pP9v0nbX21rfrhrRkNc8a2L4S1SPTtLtWrrCf6W7bM8fkfUyJs7wZyosQ
	pcJHB9/cW3zCjjkDlj6FhBvDU3NPnoGJzjxwQ0bK2Ql0X40IufBymI8kTOcs7Xgf9NBz
	EJI4PbWlBp0jQq7rgPhdVdmRR0tKi/KVEV1lA1uGE/Gujzru1EfrK6iiX3cZqaFW+PGP
	RCGg==
X-Gm-Message-State: AIkVDXLH67bdi5caWIlZpsUKaEigPgcmC/PE7g1CwDgxNGzjW2BPgXSi0IV86mGg6CjkHw==
X-Received: by 10.28.149.71 with SMTP id x68mr2331338wmd.105.1484316070398;
	Fri, 13 Jan 2017 06:01:10 -0800 (PST)
Received: from pollux.vannes.iot (lns-bzn-38-82-253-123-24.adsl.proxad.net.
	[82.253.123.24]) by smtp.gmail.com with ESMTPSA id
	d29sm4470296wmi.19.2017.01.13.06.01.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Jan 2017 06:01:09 -0800 (PST)
From: Yannick Gicquel <yannick.gicquel@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jan 2017 15:00:51 +0100
Message-Id: <1484316051-25329-2-git-send-email-yannick.gicquel@iot.bzh>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1484316051-25329-1-git-send-email-yannick.gicquel@iot.bzh>
References: <1484316051-25329-1-git-send-email-yannick.gicquel@iot.bzh>
Subject: [meta-oe][PATCH 2/2] cmake.bbclass: enable usage of ccache
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
X-List-Received-Date: Fri, 13 Jan 2017 14:01:10 -0000

This allows ccache usage for recipes which inherit cmake.bbclass.
Since cmake v3.4, it can be enabled using some "-D" options.

Here below are some metrics while using it for webkitgtk recipe.
(machine is a 4x core i7 @ 3.4GHz)

$ bitbake -c fetchall webkitgtk
$ time bitbake webkitgtk
<snip>
real	56m25.191s
user	359m32.003s
sys	34m49.356s

$ bitbake -c clean webkitgtk
$ bitbake -c cleansstate webkitgtk
$ time bitbake webkitgtk
<snip>
real	25m19.298s
user	17m57.861s
sys	6m20.157s

Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
---
 meta/classes/cmake.bbclass | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 9e74599..737a4e0 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -4,12 +4,9 @@ OECMAKE_SOURCEPATH ?= "${S}"
 DEPENDS_prepend = "cmake-native "
 B = "${WORKDIR}/build"
 
-# We need to unset CCACHE otherwise cmake gets too confused
-CCACHE = ""
-
 # C/C++ Compiler (without cpu arch/tune arguments)
-OECMAKE_C_COMPILER ?= "`echo ${CC} | sed 's/^\([^ ]*\).*/\1/'`"
-OECMAKE_CXX_COMPILER ?= "`echo ${CXX} | sed 's/^\([^ ]*\).*/\1/'`"
+OECMAKE_C_COMPILER ?= "${@'${CC}'.replace('${CCACHE}','',1).split(' ')[0]}"
+OECMAKE_CXX_COMPILER ?= "${@'${CXX}'.replace('${CCACHE}','',1).split(' ')[0]}"
 OECMAKE_AR ?= "${AR}"
 
 # Compiler flags
@@ -108,9 +105,16 @@ cmake_do_configure() {
 		OECMAKE_SITEFILE=""
 	fi
 
+	if [ -n "${CCACHE}" ]; then
+		OECMAKE_CCACHE="-DCMAKE_C_COMPILER_LAUNCHER=${CCACHE} -DCMAKE_CXX_COMPILER_LAUNCHER=${CCACHE}"
+	else
+		OECMAKE_CCACHE=""
+	fi
+
 	cmake \
 	  ${OECMAKE_SITEFILE} \
 	  ${OECMAKE_SOURCEPATH} \
+	  ${OECMAKE_CCACHE} \
 	  -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
 	  -DCMAKE_INSTALL_BINDIR:PATH=${@os.path.relpath(d.getVar('bindir'), d.getVar('prefix'))} \
 	  -DCMAKE_INSTALL_SBINDIR:PATH=${@os.path.relpath(d.getVar('sbindir'), d.getVar('prefix'))} \
-- 
1.9.1


