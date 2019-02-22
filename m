Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id A5A4A7CC2E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 17:30:10 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id i12so3258630wrw.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 09:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=h7WydmaeUiozgB5yJ+bodiOiNWEi/AIwEhJm2ohG208=;
	b=W1AqX8gLoL9ZBVGP6+obYnSYoQTKp+Fn9rW60WL86vkzP8+UhNiqpKL9kGC4+DM7mL
	a8E2ACPq0pBNvGGT9TGLreBhM3fntxHeNNWpkU22/oK/HBhA7DSLbHtqzdKO8/ENS/BD
	8KwUn1qHET17ATrMWinxf1dM/y8+kZfmSbOkar0vcuEOmOXiI8+xQ9ajsnHujwLh9xX+
	aHbQugx2G+mtp0ltiVPSlCVQey11zVzlZXU3GtYVOFfc0Boevq50w8idLG4mSOd6Wpt/
	zVNFiZ/5UIiJGp4e3aZzEIZ4Ef2R446DdlwHf3wZIl8D9Fuixn53ccK1oXtOKkufW/3C
	KL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=h7WydmaeUiozgB5yJ+bodiOiNWEi/AIwEhJm2ohG208=;
	b=C+qqDL5Hn9vIVEPs+7S0x4LFkzfAEHFdx7BBQL/Y0MbqrLPOdoR4l6nNnk5zGAirJY
	9OV55cnzij+N3hvFj1z3agE3zTDlKNZk0KGbfz7UnU6MJAnQGpRT3p7MGBcR6N582KQC
	eLR2lffdVMlJYvU2jXpaG1EZkRWOKYos++XuR0GmsP4FYN1shsiEZ4/zuangSC3U15ka
	gVMLwah3nV9WrnOROowVejLb4FAjeUzKPt3TEVIpicSPdDW3YksQItthnSlVa7PS5BOg
	Id5isVYM5spZ3y34O1PUyEeMjVV8Mh9QlelDI/zcLoISLcqrzwr/4zMOtMxJRnlOHti6
	J69g==
X-Gm-Message-State: AHQUAuYbQA8uao3o6iTLDBGopH0vPfLQBLhgoYvnNHUb2Gvsk6KXbUNg
	WmcBMSyKMA/rFp+ch8gpColUrRXLPM4Baw==
X-Google-Smtp-Source: AHgI3IY6ZqKl+yxdkecDXKbkbZQcXFy8PmutgxhtR3+RFsIoJDtb/6bRLc/EiPvBRJ6rlR/eh9D0NA==
X-Received: by 2002:adf:afe3:: with SMTP id y35mr3315910wrd.318.1550856611030; 
	Fri, 22 Feb 2019 09:30:11 -0800 (PST)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	q24sm1337597wmq.16.2019.02.22.09.30.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 09:30:09 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Feb 2019 18:29:47 +0100
Message-Id: <20190222172949.3661-3-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190222172949.3661-1-nicolas.dechesne@linaro.org>
References: <20190222172949.3661-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-oe][PATCH 2/4] polkit: add REQUIRED_DISTRO_FEATURES for polkit
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
X-List-Received-Date: Fri, 22 Feb 2019 17:30:11 -0000
Content-Transfer-Encoding: 8bit

After below commits to add polkit as a required
distro feature:
97a1a55 polkit: add polkit as a required distro feature
c049e02 polkit: inherit distro_features_check

All recipes that includes polkit-group-rule.inc will fail to parse
when polkit is not in DISTRO_FEATURE, especially 'world'. e.g.

ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'udisks', 'polkit']

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta-oe/recipes-extended/polkit/polkit-group-rule.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/polkit/polkit-group-rule.inc b/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
index 40e4005423..06ab106420 100644
--- a/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
+++ b/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
@@ -1,6 +1,9 @@
 # polkit must prepare polkitd group
 DEPENDS += "polkit"
 
+inherit distro_features_check
+REQUIRED_DISTRO_FEATURES = "polkit"
+
 inherit useradd
 
 do_install_prepend() {
-- 
2.20.1


