Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id C9AC577E50
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:51 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id g2so18481012pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uaUD7GyFwn1mvA0H3ET8kMrkuDYLbTLxRAAr31ZPXDs=;
	b=ttw0seWFrOlTgc1io2PN1uQGd/2HVeGEuNL8q5AfzCdl6u1E03RRyWFnIAC4lQ2ky+
	cbRdvmAwtRTtvn+DOsaLLqSdi3HIIBTEgacUeu8PTt5o7p2mnGUUmXa5+bd7T9PVDNUs
	SLUvmv9bzHCmzDeGJojDBxgvStUfDWzp9vDus4HUytj9WrqZbAPuwR875MOkgISqOONz
	ZA6ouOlNenCyOtoYaiMMhASeWXN3tGbyjxxpO1sS5fGK+PSsZvuLiJ4Ldh0jTQHdqhSr
	MY9zoIwGtMzuwhSBXk1XhuXaBpQqKj8rE1aDi6YWFEr76oIAIb6dQr1UM6LMPju9u7Zr
	GQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uaUD7GyFwn1mvA0H3ET8kMrkuDYLbTLxRAAr31ZPXDs=;
	b=kbsRAoRMlNNaWBaA46e8zIeIbJ6dvuuAFl7OLun7Nw92zMHnIgkfPV7bCe44T9O4L9
	DRmqGNbHpG+v1t89iz5JwTMgE8+RJL5rgcxNUgAsueDJFlMbowZw5iPUUp4Lrbbwe3s4
	Dp5VFcD4nq3XPC4Sy5dyJ2PP6KbGfNlw+D04evmu+i/yvOG9rLbrUeY64jSgIrdNmppe
	klbKnl/25hTHIALoOgE80lM+lTplv564Y9QNXlKb1hL9Mg4t/fCsbmm6ky9xDd5emnoJ
	glPNJL25mG22OfaD7WObIITN9NY3uG4jVVNPSkAF3nSzstnFsIqo8TXr7wYFiv1m7ToS
	PAgQ==
X-Gm-Message-State: AFeK/H3lhZ+qWni3j6RrwKzlvVX9IyT3f0vqs7fqKbihgVzr9MR20GUGE1Uimj9DPAJx3g==
X-Received: by 10.98.18.66 with SMTP id a63mr3742456pfj.188.1490978632766;
	Fri, 31 Mar 2017 09:43:52 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:43 -0700
Message-Id: <20170331164247.5052-39-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 39/43] libnetfilter-log: Switch to git URI
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:52 -0000

Move to tip of tree which has needed fixes for musl build
add missing dependency on libmnl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-filter/libnetfilter/libnetfilter-log_1.0.1.bb      | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.1.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.1.bb
index 30c9ae6bc..2f627d458 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.1.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.1.bb
@@ -4,12 +4,12 @@ HOMEPAGE = "http://www.netfilter.org/projects/libnetfilter_log/index.html"
 SECTION = "libs"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
-DEPENDS = "libnfnetlink"
+DEPENDS = "libnfnetlink libmnl"
+SRCREV = "ba196a97e810746e5660fe3f57c87c0ed0f2b324"
+PV .= "+git${SRCPV}"
 
-SRC_URI = "http://www.netfilter.org/projects/libnetfilter_log/files/libnetfilter_log-${PV}.tar.bz2;name=tar"
-SRC_URI[tar.md5sum] = "2a4bb0654ae675a52d2e8d1c06090b94"
-SRC_URI[tar.sha256sum] = "74e0fe75753dba3ac114531b5e73240452c789a3f3adccf5c51217da1d933b21"
+SRC_URI = "git://git.netfilter.org/libnetfilter_log"
 
-S = "${WORKDIR}/libnetfilter_log-${PV}"
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
-- 
2.12.1


