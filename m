Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id C027A6BD84
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:12 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so344024eek.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=u/WR2gIByWk9milXhcVhAbCI7fic7hGDmYLsZW7ED6I=;
	b=I4ew8MZp1Akxz2TExRQG4M4cqmBxYi6j+55vnrf6JSwz1D3pZnXZnEWlA92IeKivdQ
	nbgzkPt5oMf3zSYCMWAOzZncKvN3M/P2ELaOXvYCwj6RqlRYsYBm60SsUzXEPS2hz5bk
	KSk31NMdyC1zS2aNC1+yvgBUVFiPN+HBXCMRgs80YIP2/BQ2YjSCQ2tFCPl3F8ITkv4z
	CclTYEMx9BlMsCDa64Q230UKMF48iDlLEPMJjZGuyqwJFJcmstobEgzJEov/u+jp6AsI
	dVsWU2POWLufdL/XeiLTGT01jTEdZt7kj0XR+9QQ7oJS31i4G227bm3G7JdmC76fHeqb
	yV1Q==
X-Received: by 10.15.109.138 with SMTP id cf10mr4293215eeb.73.1377791473188;
	Thu, 29 Aug 2013 08:51:13 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b45sm47153762eef.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:11 +0200
Message-Id: <930915241fe85b6a1d1596e144c839883b385640.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 18/66] libetpan: Add dependency on curl
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:13 -0000

* configure doesn't allow to disable it explicitly

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/libetpan/libetpan_0.57.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libetpan/libetpan_0.57.bb b/meta-oe/recipes-support/libetpan/libetpan_0.57.bb
index e9a755e..0dbd782 100644
--- a/meta-oe/recipes-support/libetpan/libetpan_0.57.bb
+++ b/meta-oe/recipes-support/libetpan/libetpan_0.57.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "libetpan is a library for communicating with mail and news server
 It supports the protocols SMTP, POP3, IMAP and NNTP."
 HOMEPAGE = "http://www.etpan.org"
 SECTION = "libs"
-DEPENDS = "gnutls liblockfile"
+DEPENDS = "gnutls liblockfile curl"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f18ebe7e452708c26f83954f81062ba7"
 
-- 
1.8.3.2


