Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4CB5665CED
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 12:39:12 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id f15so8423416lbj.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 04:39:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zYSLWZ7vQqJHCJRCCNZNb5cqsqk5uDmV+sOp5tYXrso=;
	b=aj/D811rUg1Bdi4IEYbTkrY1FI8RnW0DGoaB/jh4/MvgZnMdTEdUWG/9xyYNtpMRdS
	O5rtPvXhsQdGkNXHEA8DjabMxYr1pHpFeRDQik9I+qgIgJUnkX5djcWy21UKOBnBo4Wd
	z81NTXvb+EGYoiLdF9sDs59nl1bPTBINMFylorJCXHzrCtfYw92XATK7teA64L99Ygm3
	93s5DRo52ZONl3NWBQ1+FuHK5PYcvMYcl7g/mplPMv9ZHeHtMcbwFV3r8CqSoPIPjbdY
	shqpY3YsA2CjZXfiwmbDCKOb9kTOpmH14n4Tvqi0p6p2w3k7xrF9TCdn0nFU12n2WMMI
	ymXA==
X-Gm-Message-State: ALoCoQmWWwzCQLTq8F59Q/l8XqRUNfv/ZgFXE0J9yOrsBfiB3uvKN0Wn3SIIecG+Vq4IpqgnehAD
X-Received: by 10.112.133.138 with SMTP id pc10mr36156065lbb.48.1415709552921; 
	Tue, 11 Nov 2014 04:39:12 -0800 (PST)
Received: from localhost.localdomain (a91-152-81-141.elisa-laajakaista.fi.
	[91.152.81.141])
	by mx.google.com with ESMTPSA id c7sm451132lae.49.2014.11.11.04.39.11
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Nov 2014 04:39:12 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Nov 2014 14:39:02 +0200
Message-Id: <1415709542-14122-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.1.3
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] fwts: update to 14.09.00 release
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Nov 2014 12:39:14 -0000

* bump PV and matching SRCREV
* add glib-2.0 to DEPENDS, introduced in 14.09.00 with logind support

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta-oe/recipes-extended/fwts/fwts_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/fwts/fwts_git.bb b/meta-oe/recipes-extended/fwts/fwts_git.bb
index 4fa1d6b..8b0e61b 100644
--- a/meta-oe/recipes-extended/fwts/fwts_git.bb
+++ b/meta-oe/recipes-extended/fwts/fwts_git.bb
@@ -5,14 +5,14 @@ HOMEPAGE = "https://wiki.ubuntu.com/Kernel/Reference/fwts"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=16;md5=deb8af5388e838d133eaa036f4d1496f"
 
-PV = "14.05.00"
+PV = "14.09.00"
 
-SRCREV = "fb5385fec1f3468b479e87c0bba38ab76f60915b"
+SRCREV = "cf14f3b4bab716dea95de772ad52786c1cbe862a"
 SRC_URI = "git://kernel.ubuntu.com/hwe/fwts.git"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "libpcre json-c"
+DEPENDS = "libpcre json-c glib-2.0"
 
 inherit autotools-brokensep
 
-- 
2.1.3


