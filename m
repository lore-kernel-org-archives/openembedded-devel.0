Return-Path: <ricardo@foundries.io>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id E60D579272
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 23:11:13 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id n6-v6so6803219qtl.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 16:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=foundries-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=20WLrirOVIMI01ZCA/rZU0Dn7hRVX1W+Jqi6Ju8juyk=;
	b=GaVsVQu5CQ0VlApOTmWmKXogMMfzRITEhR5RfY0mIGTSgJ9RNN4jfRRr+ctavX5AgY
	vhmmrif7evZFWap3PFBLWJL5+EwL7C8OaB6D+n20vU70rSc0/zShDakdQj/rychHels6
	hpyp99T1/f0Tje9K0B5XZqbgbzkjG2ismyLc1D6g+cuulyof9n+2NInliZ7UDbNvkl4A
	YDLjcPfGCgwCWxhgmvyzrb47o0MgyrAKSUebeoQ+o6+zcUk6fh3dVF/KpHUogHeQZsVW
	sDgw9am+VIQjIB2dPKHXfufCUcerkUcD/c1R1OghSuPDCsPm6L+JhSz6Y8DRNXD63bma
	9hoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=20WLrirOVIMI01ZCA/rZU0Dn7hRVX1W+Jqi6Ju8juyk=;
	b=XDGW3tDQkvQv88siDkbCCwBIgXQJ1Ow1SU45Q1CADEtFN9RSHxOn7gpRsJHHKGgrr6
	UCiw2KNRfEMRGIw4mfBYl4GGMsaFXQmybo/+DD/czludfIQ8r+fkaOEDliCFLW3gN51a
	hVltUYGaqzRT+O0vhwwXZSVX68sS77U2DAwfK58B9Cij0BvxgyjjVhn0FmSF/lzID7Wp
	EUmp5WqF1IY8XJ0SObd5lwpc/iJPGfX8bIWqN0487I8sbA/mRLRc8GrfmuBQy/b4sNlO
	JXXOTq5iHcGrqbfAaVmz95LFyJamxvpeurN59wyRqMDdJLjCMszB9HLWo7v60Nx59Obe
	tgrA==
X-Gm-Message-State: AOUpUlGFKjT5cOu3iZtmo1ehTOcdKU24qgHJe38BLvNqFxbFiaMC857f
	XA1ff7+g1aMCR+UZnyc4MtqDSnVPag==
X-Google-Smtp-Source: AA+uWPwTAc4ZJGZdCgnJWj7P7olsZD3gxnHEmalZrzUm+h8GPhvdkL3/GB+w/lCLYjT6O1dtdO5wLw==
X-Received: by 2002:ac8:19db:: with SMTP id
	s27-v6mr33252381qtk.215.1534461074445; 
	Thu, 16 Aug 2018 16:11:14 -0700 (PDT)
Received: from localhost.localdomain ([189.4.104.186])
	by smtp.gmail.com with ESMTPSA id
	a12-v6sm345267qkg.71.2018.08.16.16.11.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Aug 2018 16:11:13 -0700 (PDT)
From: Ricardo Salveti <ricardo@foundries.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Aug 2018 20:11:07 -0300
Message-Id: <20180816231107.17741-1-ricardo@foundries.io>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] mozjs: disable null pointer optimization with GCC >= 6
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
X-List-Received-Date: Thu, 16 Aug 2018 23:11:14 -0000

Mozjs fails to start on several architectures due broken build
optimizations when built with GCC >= 6.

Set -fno-tree-vrp -fno-strict-aliasing -fno-delete-null-pointer-checks
to both CFLAGS and CXXFLAGS as workaround (flags also used by Firefox
and Fedora).

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb b/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
index fe9698f..626522e 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
@@ -32,6 +32,11 @@ CONFLICT_DISTRO_FEATURES_mipsarchn32 = "ld-is-gold"
 
 DEPENDS += "nspr zlib"
 
+# Disable null pointer optimization in gcc >= 6
+# https://bugzilla.redhat.com/show_bug.cgi?id=1328045
+CFLAGS += "-fno-tree-vrp -fno-strict-aliasing -fno-delete-null-pointer-checks"
+CXXFLAGS += "-fno-tree-vrp -fno-strict-aliasing -fno-delete-null-pointer-checks"
+
 # nspr's package-config is ignored so set libs manually
 EXTRA_OECONF = " \
     --target=${TARGET_SYS} \
-- 
2.7.4


