Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9311A65F77
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2014 08:19:31 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id b13so427247wgh.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Oct 2014 01:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=SNljZxvc30TZeA4IuYi98WAKqC6MBfUahyA9Aad8f6I=;
	b=BIZ+s5FX2KQ+nfXsrhD7ZggTG+B6Yr6GCHwXvQKvqYlp3dFa2tNZbDoDNM2AF/wSWB
	2D0IE3Pcf4+45zIE/TypELpIT0Ef3L0Ln8cS3QqgZ0o/s4oqGRZeR8H0lRu5zPeD3db5
	ISqUdZ/K8n+KU6O4vUYWS4k5uE1VUg26Nbig1I6n22/F7baks3G4CZp/RMyi/SVloi6z
	GuYjo2YxWeXfngRZRXbUZ44OvABS/KsjJjiPdPDByDZPKTjLp4FMaLkY1lp+0MebMlIo
	Krao38iSbFzaheRUJz4Z+hCG+0BtHTfMNOCxczx0t3Ml1Cup8jAKmlsPKWfuIThxZkv4
	W/yA==
X-Received: by 10.180.83.103 with SMTP id p7mr12084308wiy.67.1412151572583;
	Wed, 01 Oct 2014 01:19:32 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-251.hsi05.unitymediagroup.de. [176.198.252.251])
	by mx.google.com with ESMTPSA id kx2sm340789wjb.6.2014.10.01.01.19.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Oct 2014 01:19:32 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Oct 2014 10:19:09 +0200
Message-Id: <1412151555-19865-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
References: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe 09/15] packagegroup-xfce-extended: don't blacklist - xfce4-power-manager is up again
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
X-List-Received-Date: Wed, 01 Oct 2014 08:19:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index 0eab1cc..2c47384 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d
 
 PR = "r10"
 
-PNBLACKLIST[packagegroup-xfce-extended] = "BROKEN: rdepends on broken xfce4-power-manager -> networkmanager"
-
 inherit packagegroup
 
 # mandatory
-- 
1.8.3.1


