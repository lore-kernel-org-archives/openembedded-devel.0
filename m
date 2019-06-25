Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 63D7B7DE38
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 07:52:55 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id w13so25762377eds.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 00:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fNM6evOrPfXr7hXm4VeJ5FhAvggwnW7YopB9wxsvKu0=;
	b=VnOIB+j5AnftjmOt2MRc4XqthmZ2xXXJ0YWSlXVohgbZcBLorPo/y17hqSkbu2aqgi
	337CbMnNULT1cWNF7Z7/T9f1vN7QM5fc8o318hm9j9oOyody/ip0l/wJINK9mJmC6jFj
	WPc62WDAK8apxL5WFCG3vpcMAVeTrAyXsQURgMS4zzIMXMi9E33C9y/rNk+Hlt6JDYkD
	AqSklpNHlLhoVwDsMvKGUuH6Tu/OC4Q4YBwbW+/3ItiDw5ORano3llpR+gD9ZSWGSqr6
	zx5JSDe5APLfAlc9ZJkT6pgR817tlQ4PyXeBJjb3rVjIQydhknKdr3HW7rFWTX+hUe2k
	5oIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=fNM6evOrPfXr7hXm4VeJ5FhAvggwnW7YopB9wxsvKu0=;
	b=Q2EjgC6VsfJ4wwUz3zvtPmWDKJuE6aX70XTNXhcMK+1xKEtAvPvdFowg874/SxYzWU
	FW14HMTopsunWQHdiRQcGrMCnED3OqduR86brVyk3kKizABR5Y5XN3NspniL3I8og7+q
	gW1G5PJ2198SzEN/leO7nl/RG6h1fPDA3Xa2dNYWYXEVbx0UnfqCIVAkNbAnnVAJyZAW
	pLdZek9hmHQYma3q0jWzLASMI/4JUGScq+Y5asbiGz69U+GwzEXCYEBRwuipz/8Lsq3a
	FlYfNHj/gLab3chxOV2DHTAvDUyxV0gqLpDSk2IpPY1VA1uCrGu8ggEaIPVN+E9GIf08
	37fw==
X-Gm-Message-State: APjAAAVQkfjdermWT/A6MeTip1C855svMsMwRswCd7aF7NuZFxsDaKTY
	llTwKBj1u8lRYRAu7fALtIqOmmc3h5Y=
X-Google-Smtp-Source: APXvYqyU+zrp4uKNAVAKxVGa3WCLB7jpqX+OYx5e2pSekisOL3JkZE2zA2eIx+3b+ObGipuMtF+2WA==
X-Received: by 2002:a50:ad01:: with SMTP id y1mr145726254edc.180.1561449175858;
	Tue, 25 Jun 2019 00:52:55 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	y22sm4308640edw.94.2019.06.25.00.52.54
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 25 Jun 2019 00:52:54 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Jun 2019 09:52:21 +0200
Message-Id: <20190625075223.13585-22-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625075223.13585-1-ricardo@ribalda.com>
References: <20190625075223.13585-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH 21/23] xom: Allow re-running do_compile
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
X-List-Received-Date: Tue, 25 Jun 2019 07:52:55 -0000
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
 recipes-core/xml-commons/xom_1.2.10.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/recipes-core/xml-commons/xom_1.2.10.bb b/recipes-core/xml-commons/xom_1.2.10.bb
index 8755ddc..621a5e1 100644
--- a/recipes-core/xml-commons/xom_1.2.10.bb
+++ b/recipes-core/xml-commons/xom_1.2.10.bb
@@ -34,8 +34,11 @@ do_compile() {
     oe_makeclasspath cp -s xercesImpl xalan2
     cp=build:$cp
 
-    mv ${WORKDIR}/git/jaxen ${WORKDIR}/jaxen-${PV_jaxen}
-    rm -rf ${WORKDIR}/git
+    if [ -d ${WORKDIR}/git ] ; then
+        mv ${WORKDIR}/git/jaxen ${WORKDIR}/jaxen-${PV_jaxen}
+        rm -rf ${WORKDIR}/git
+    fi
+
     scp="${WORKDIR}/jaxen-${PV_jaxen}/src/java/main"
 
     javac -sourcepath src:$scp -cp $cp -d build `find src -name "*.java" -and -not \( -wholename "*tests*" -or -wholename "*samples*" -or -wholename "*tools*" \)`
-- 
2.20.1


