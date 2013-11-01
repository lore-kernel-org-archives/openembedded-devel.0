Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 04A456CCC9
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2013 17:50:33 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id c11so4274981wgh.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Nov 2013 10:50:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=k8b/PgP3k52Z0y/4tCDyoFvG3K8dLwK8TsF474iOCbQ=;
	b=RbW7bKh1i4En2NqYZ+BXQqcCBhfTZHDjXPb98NdTT9vYhq2pS4UmFn2cdkOsR9siJt
	nvNwbW4e8kcXOuVocGsxuaDAZNUiVXPduH20QY3NO2z0nR8guIGtiPMZiB4uYpmNj1qg
	Hnoi2H9irsoE5fCTohKi2wsNmAkcmOHNI7bviIbQHUHzZK06Egi3w17/+hFaUcmvp/UW
	2EbDgtfz2JT6qhgqoNh/AHm5Pu6xJRIaaIqOLC7aG1T4VfnEz+5/kggh2pER+Wv1Bmi/
	fa5RzmIk1exKR+4pouFpdowrSk2dzCn6xMozWwb3mnhZE87H765WN/WyOO2uvLIN0SRo
	4/UA==
X-Gm-Message-State: ALoCoQm1ei3FudWaRNS1kK0oMfpBJF0p+/32aKHenrquIAsZzr4tWZtg93DQH2jPv2uN6LJNsVQ5
X-Received: by 10.180.76.205 with SMTP id m13mr3130076wiw.10.1383328235443;
	Fri, 01 Nov 2013 10:50:35 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id b7sm9573330wiz.8.2013.11.01.10.50.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Nov 2013 10:50:34 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Nov 2013 17:50:10 +0000
Message-Id: <1383328210-2058-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1383328210-2058-1-git-send-email-ross.burton@intel.com>
References: <1383328210-2058-1-git-send-email-ross.burton@intel.com>
Subject: [meta-oe][PATCH 2/2] pinpoint: add gdk-pixbuf loaders to runtime recommendations
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
X-List-Received-Date: Fri, 01 Nov 2013 17:50:34 -0000

A pinpoint that can't load images isn't really useful, so recommend the PNG and
JPEG loaders.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb b/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
index d9bc350..7dc09da 100644
--- a/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
+++ b/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
@@ -18,3 +18,4 @@ PV = "0.1.4+gitr${SRCPV}"
 
 S = "${WORKDIR}/git"
 
+RRECOMMENDS_${PN} = "gdk-pixbuf-loader-jpeg gdk-pixbuf-loader-png"
-- 
1.7.10.4


