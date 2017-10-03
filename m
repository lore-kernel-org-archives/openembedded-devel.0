Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id A2FFF77CF6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 19:58:12 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id f12so751853wra.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Oct 2017 12:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GJDbDZV7npGBNtcJKKOYXvibTTFS6rruf03roiWGmEo=;
	b=nlBiyaM5SJ53fRARK/XlepY1qjq0aUl2+AbyLhRT9RVzcVPP7+E4V9nM0IDP5e8WHy
	wFUJl9uy2wV16FehwxOShMZyTXdPrIbbK9blQ8aNHEiEwFNd+KnVxf0N+7JJkESQzqH6
	MMiYyp3AoHNXRs5mpFH42cwYyclNjutt2m79HVIGsUtUA8q2FfRJ5uSFw6RNWHmMa9Qd
	YOSUaLzerG+D+6hDzHNwBbC5F/Uj98Mm3jHkLqEoAxTqNxiPr665JvgGAe+aFhBArJkc
	kFLLwPozNo0HtbG3vUWM5Fip4KSmzcQ0FWy7Lmk3WGbfkAsk9k+T+1hbLCSmLGaAhURN
	xE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GJDbDZV7npGBNtcJKKOYXvibTTFS6rruf03roiWGmEo=;
	b=sO0FUcrJyCNWJBjdUE7GuzhUefDmT/PVjRNNK6cEdMfM3hgPLZSvAMZikwGspbjJOu
	EIA3lTGeJUrUXgRZA8rYUzcYsgLMpZUI7zf0sf716yrVqYPFQqCHRpWwIi/V5JMrKA37
	pvlE2EoYjfTvlX0btnMe1XV0OZUmq5l2mvXUH2YlDKoA6pZ0E6q3xzos3tB3pST11vKm
	ywhCReBqGf4U+goD+EBKyN9JNmit1DaILLK03YV2L77b/bjEl/vgZSX+EfmEpmE7OCEe
	5YY+QB0RKJB6Q+sPr/I9/4opNQEfe1AiRwRtFD+8F1VROhlezzXAu6y+RSJy7ksofPg3
	/rJA==
X-Gm-Message-State: AHPjjUgqTcdRws7f2LHG3rOVYyl+nCiYK46OKBpuI0xTn5d2lx3E0eN1
	W74seaOQnmBPpTfBemUgjzuOCER/
X-Google-Smtp-Source: AOwi7QDszoAWyFdUqGdVTzuENlipGrfJ1J4kag3ZcTKQvfNJmBqNp3ZXum/O971YcPpy0QUlCDNI1w==
X-Received: by 10.223.156.137 with SMTP id d9mr19797469wre.276.1507060693624; 
	Tue, 03 Oct 2017 12:58:13 -0700 (PDT)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host184-216-dynamic.24-79-r.retail.telecomitalia.it.
	[79.24.216.184]) by smtp.gmail.com with ESMTPSA id
	k126sm25839452wmd.1.2017.10.03.12.58.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Oct 2017 12:58:13 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Oct 2017 21:58:05 +0200
Message-Id: <1507060686-10326-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507060686-10326-1-git-send-email-andrea.adami@gmail.com>
References: <1507060686-10326-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/2] zaurus-installer: replace deprecated license file
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
X-List-Received-Date: Tue, 03 Oct 2017 19:58:12 -0000

    Use '${COMMON_LICENSE_DIR}/MIT' for MIT License.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/zaurus-utils/zaurus-installer.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/zaurus-utils/zaurus-installer.bb b/recipes-bsp/zaurus-utils/zaurus-installer.bb
index d8de3e6..2956f15 100644
--- a/recipes-bsp/zaurus-utils/zaurus-installer.bb
+++ b/recipes-bsp/zaurus-utils/zaurus-installer.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Installkit for kexecboot-kernel"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 DEPENDS = "${@base_conditional('MACHINE', 'collie', 'linux-kexecboot', 'zaurus-updater linux-kexecboot', d)}"
 DEPENDS += "${@base_conditional('MACHINE', 'spitz', 'zaurus-legacy-tar', '', d)}"
 PV = "2017.05"
-- 
2.7.4


