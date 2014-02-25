Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 95B106ED65
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 17:17:03 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id d49so1674289eek.31
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 09:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=7wYyirJTQou6ZY6wGhjYc2zyBRweCjsc69pRsQlUMvk=;
	b=Z09Cx91KcviJ/VmG+lEt3KJzt/BXvpwvOuKYzbFUB8JJd7E7JlddbVHHSOtXNWVnC4
	DdRv3IRPzeC8DOTLrG8t++GYMZZMc4PQNojTLi+G1kiE7JKnS8sJW78RtE40sUhHpk2j
	kpFjq2yJcjkS2G1kDoOfYhLvSHc/kEPUMXB8sI71xZ53XZUMlJqqXrRsfug8fZYoTzDf
	osqqHHBmotW6ZAtDvWIAfHvAXMJm3vlYF7GUx6ssTzgWHOoAedJjAAGx6RV8z4XpFJT5
	znKSzuuto3bTSbBtfIWFwHuEMUnYwGQUWBpdmtm/r+iH7F7R9r6hBFV6OlTnD9h0Jkkh
	qKKg==
X-Received: by 10.14.98.66 with SMTP id u42mr1175658eef.18.1393348624813;
	Tue, 25 Feb 2014 09:17:04 -0800 (PST)
Received: from localhost.localdomain (ip-109-91-251-124.unitymediagroup.de.
	[109.91.251.124])
	by mx.google.com with ESMTPSA id q44sm78400530eez.1.2014.02.25.09.17.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Feb 2014 09:17:04 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Feb 2014 18:16:54 +0100
Message-Id: <1393348614-15618-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1393348614-15618-1-git-send-email-schnitzeltony@googlemail.com>
References: <1393348614-15618-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-qt5][jansa/qt5-5.2.1] qtbase.inc: set virtual/mesa and virtual/egl as dependency in PACKAGECONFIG[kms]
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
X-List-Received-Date: Tue, 25 Feb 2014 17:17:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* there is no kms around
* mesa is the default implementation for (lib)gbm (see config.tests/qpa/kms)
* in configure we find:
  | if [ "$CFG_KMS" = "yes" ]; then
  |     if [ "$CFG_EGL" = "no" ]; then
  |         echo "The KMS plugin requires EGL support and cannot be built"
  |         exit 101
  |     fi
  | fi

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtbase.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 116c86f..6c6ec5a 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -108,7 +108,7 @@ PACKAGECONFIG[gtkstyle] = "-gtkstyle,-no-gtkstyle,gtk+"
 PACKAGECONFIG[directfb] = "-directfb,-no-directfb,directfb"
 PACKAGECONFIG[linuxfb] = "-linuxfb,-no-linuxfb"
 PACKAGECONFIG[mitshm] = "-mitshm,-no-mitshm,mitshm"
-PACKAGECONFIG[kms] = "-kms,-no-kms,kms"
+PACKAGECONFIG[kms] = "-kms,-no-kms,virtual/mesa virtual/egl"
 # needed for qtdeclarative (qtdeclarative.do_configure fails to find quick module without)
 PACKAGECONFIG[icu] = "-icu,-no-icu,${ICU}"
 PACKAGECONFIG[udev] = "-libudev,-no-libudev,udev"
-- 
1.8.3.1


