Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
	[209.85.208.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9D4D97ED52
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2019 11:19:11 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id s49so7968581edb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jul 2019 04:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fHFjh5f8FmxgvIZ7PXmmmltYW7fiIzgcty7BAWvcX68=;
	b=VQCWK3RfoB7kaBXVQ2Q2+WbPl+2PErDQc415kZRTjPzJltK4WstoAD+fYkRgm2kXkB
	xFmy6Au2CWSodfbbBtlpFVFnUhJYX0YqiB5TRbJFm4DQzmdTt5F9HLLvt34oi+nP0zXL
	Gu8L9tHVCWdCiAW2L01QNRZn9N/n3QixBATNz1hOjT+HX3nQhlyzR1+nMUg1D981edx8
	blag6O9ACjuTc+/ZbbYbi/uRSZ281pN+WCRlTyGsQ0nyVLv4fL7x5Bxxf5MsE4BcNgmf
	ggInKdLBXuS1jxV1WFJwZg6rWSlX9eYtolsZJqRA9iNHoqnyWxmpMZdceWTnR/s/P+R3
	aCGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=fHFjh5f8FmxgvIZ7PXmmmltYW7fiIzgcty7BAWvcX68=;
	b=ZCy3jNunsAj6e0IIh+NRjm5RxBGB6NjpPMR9vH5hK6AR8SkoNKvwv63pGaCj2WxkLQ
	mszLb0afiUglvLnRSzvyCSNdIF67+mhtlB0YxWBQW3PRdahgIr5KoxIgGfEnAqv4MVAI
	oKf0OZ7r+Ln2Ozt0pL6UadxqrNblKE2RgcDPGL7RHTtP8wErePctHXpSIpqg48IK/ofz
	zG44Tq0iWMKyvCoP3I8PL8uXLXDjjwX0M+v289RgTIsoYNKCgLTcyEalKD/qSotiNx35
	p0Yzo3nSNTLHoQyiaL1LUWNXXZJ8iHnA915H40xy2TaijX3qx9uAjW1kvuV/mGR+5QsE
	x4ug==
X-Gm-Message-State: APjAAAW6iPRLz7vuSDABSkPnIV6gzZxO8Y0pZJbDU3/xByrD1voYFeee
	MDo2klcJycEvlwFQSV5fAZ8HT0w5tbI=
X-Google-Smtp-Source: APXvYqwrURbUQAz12rtP+/B3O587S/51eBnCj84BT7Y8+LG7HchSUCNE9gIriWE8+rnd+kCKe0K5GQ==
X-Received: by 2002:a17:906:edd7:: with SMTP id
	sb23mr2967536ejb.309.1562325552128; 
	Fri, 05 Jul 2019 04:19:12 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id h10sm136604edh.64.2019.07.05.04.19.10
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 05 Jul 2019 04:19:11 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Jul 2019 13:18:22 +0200
Message-Id: <20190705111824.22255-22-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705111824.22255-1-ricardo@ribalda.com>
References: <20190705111824.22255-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH v4 21/23] xom: Allow re-running do_compile
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
X-List-Received-Date: Fri, 05 Jul 2019 11:19:12 -0000
Content-Transfer-Encoding: 8bit

do_compile modified the source directory destructively (mv and rm),
avoiding its re-run.

Fixes:
ERROR: xom-1.2.10-r0 do_compile: Function failed: do_compile (log file is located at /workdir/build/tmp/work/dbfp4-poky-linux/xom/1.2.10-r0/temp/log.do_compile.1523)
ERROR: Logfile of failure stored in: /workdir/build/tmp/work/dbfp4-poky-linux/xom/1.2.10-r0/temp/log.do_compile.1523
Log data follows:
| DEBUG: Executing shell function do_compile
| mv: cannot stat '/workdir/build/tmp/work/dbfp4-poky-linux/xom/1.2.10-r0/git/jaxen': No such file or directory
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /workdir/build/tmp/work/dbfp4-poky-linux/xom/1.2.10-r0/temp/log.do_compile.1523)
NOTE: recipe xom-1.2.10-r0: task do_compile: Failed
ERROR: Task (/workdir/repo/poky/../meta-java/recipes-core/xml-commons/xom_1.2.10.bb:do_compile) failed with exit code '1'
ERROR: mc:inteli7:xom-1.2.10-r0 do_compile: Function failed: do_compile (log file is located at /workdir/build/tmp/work/corei7-64-poky-linux/xom/1.2.10-r0/temp/log.do_compile.1522)

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 recipes-core/xml-commons/xom_1.2.10.bb | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/recipes-core/xml-commons/xom_1.2.10.bb b/recipes-core/xml-commons/xom_1.2.10.bb
index 8755ddc..8b43c39 100644
--- a/recipes-core/xml-commons/xom_1.2.10.bb
+++ b/recipes-core/xml-commons/xom_1.2.10.bb
@@ -28,14 +28,22 @@ inherit java-library
 
 DEPENDS = "fastjar-native virtual/javac-native xerces-j xalan-j"
 
+do_move_jaxen() {
+    if [ -d ${WORKDIR}/git ] ; then
+        mv ${WORKDIR}/git/jaxen ${WORKDIR}/jaxen-${PV_jaxen}
+        rm -rf ${WORKDIR}/git
+    fi
+
+}
+
+addtask move_jaxen after do_removebinaries before do_patch
+
 do_compile() {
     mkdir -p build
 
     oe_makeclasspath cp -s xercesImpl xalan2
     cp=build:$cp
 
-    mv ${WORKDIR}/git/jaxen ${WORKDIR}/jaxen-${PV_jaxen}
-    rm -rf ${WORKDIR}/git
     scp="${WORKDIR}/jaxen-${PV_jaxen}/src/java/main"
 
     javac -sourcepath src:$scp -cp $cp -d build `find src -name "*.java" -and -not \( -wholename "*tests*" -or -wholename "*samples*" -or -wholename "*tools*" \)`
-- 
2.20.1


