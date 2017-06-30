Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5BFE578240
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 09:07:25 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id t72so9560551lff.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 02:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=0hTeZY06dTrq2E+m0oHQMOA/o00vgLiO4nBFGi7DY+c=;
	b=BMGVn2y8LLMXGe1jNrh1/of2qpmS2LP2L8a3/LHr+Y/OHyUnE9pggDGBi3wMm+8iin
	SsNi8d4hCte+AeeRAHqxYHGA+dleH/czTLpPn+g2Of0IxbkwXeiTj0R+882CcVuGMN3/
	HE9x9HFJynVTG8TfojM7OktCbyW7TvwnskxYutPWUu1CUg7GFtp46wiPeb7PLMwvwBqq
	P+dm8PM/67h0vIKKLRk/2jIlYrQt5DGrLxJ+xUQNocx8IM2zdLH7R4nR9y3f+5mtkkEq
	CyViaFXAomMOMXmvTd22XQqtWzmjeHjYZfo6KbpbVduZ2ByIDIhJrfbBXcH8DM9iha4H
	fwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0hTeZY06dTrq2E+m0oHQMOA/o00vgLiO4nBFGi7DY+c=;
	b=jKfqmoJ2hHDOlLaGm81l8Mj60voWMM7eCfBT0f5SNbGKUN3XWoUnCrgFbWaTY5By3X
	SPtmkDOr1JLv3IFPPj8X1COFMFA0GsD5GJMbsmwJfGsrR5620gR0fOJUSvezdcyWkZwE
	v55DkWHJs/O5DeT3EWVnUN7c3vpQIoQozmIwqT8aybnSJDNTJBtcKC2kO9uj9UYCLFPv
	yVwqe7rKnijXvNuqZ+8A1BmecxVkl5w7XWrie2zFVuhClSpVOrvEOe6uO2cofhDShh9h
	tf4fZ5QiDOXR4omMh1TUo0pRzsi8+Vcyq1P8RewipVNnyx1wlD5C2MZpniohtAKcbGhE
	3ZSA==
X-Gm-Message-State: AKS2vOx1s8YcXquZ7U1i4a4DXtoKiqApFx8lEo8rTFB61ax14PrsNbSj
	ieFUJ4OItyNoS9JjTdU=
X-Received: by 10.46.71.21 with SMTP id u21mr3807213lja.115.1498813646014;
	Fri, 30 Jun 2017 02:07:26 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id s6sm1504614ljd.27.2017.06.30.02.07.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 02:07:25 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jun 2017 11:07:22 +0200
Message-Id: <20170630090722.18037-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-java][PATCH] java-library: Fix build with sysroot-components
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
X-List-Received-Date: Fri, 30 Jun 2017 09:07:27 -0000

Now each recipes has its own sysroot under its WORKDIR, it we ease the
jar files after prepare_recipe_sysroot we will erase the classpath.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 classes/java-library.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/java-library.bbclass b/classes/java-library.bbclass
index 58d5a4041a9f..e21e667b7ac6 100644
--- a/classes/java-library.bbclass
+++ b/classes/java-library.bbclass
@@ -54,7 +54,7 @@ do_removebinaries() {
   find ${WORKDIR} -name "*.class" -exec rm {} \;
 }
 
-addtask removebinaries after do_unpack before do_patch
+addtask removebinaries after do_unpack before prepare_recipe_sysroot
 
 do_install_append() {
   oe_jarinstall ${JARFILENAME} ${ALTJARFILENAMES}
-- 
2.11.0


