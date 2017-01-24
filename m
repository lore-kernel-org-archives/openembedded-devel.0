Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f53.google.com (mail-pg0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id D541C771EA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jan 2017 14:52:52 +0000 (UTC)
Received: by mail-pg0-f53.google.com with SMTP id 194so55625760pgd.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jan 2017 06:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=V1MWqhirXr42kUkSA3nXCDiGvjwGsBSFOQ9ujtn7TyY=;
	b=uiAXre4QZe72yrrk5l/ak960JTWwLGTCQtrHX5q7LFuBECivLFuPYVk8+XdSHfWIu0
	ZQhIyZZ5SE+tiIGYKNQGnxci8uMvkbn1CM/97wN4xrjDCrufHBLrgdl9fLgl+LwRjOSx
	9Y5vjRMEps2U6Y41mVMyYS4AsYoeNGzTEN/e7VZlPk0jNB+cuXg5yReTm6t45mFAqPb6
	ao+BO3Fz76mgKEs+hJqk5o0zg7olFmVKo9a4LSse19JTOEu0km+iBVeLo92jddERby43
	gxWO2LnIdtEq3HjOy/AsaGo3qFv38cz7mGCLYFKhR/1+rim4xqbvelZfV+lBEO8V1wvn
	M1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=V1MWqhirXr42kUkSA3nXCDiGvjwGsBSFOQ9ujtn7TyY=;
	b=rhMhVp0EKFmAcmTSh7dAXR64ZzFhzr42YP8T+XUoZxUB2dwUc9GD4lXMOfQOdW3Bri
	rvPi885+/o6wI3mkVoakxGiHNkM20px/d8raZaaj2cWkGtiOQ2uw3OfjKA9j6hbUDFiO
	ZXpv/MiRwOL0Ukc8kS8U+35zZIknGEfR0aH0m2RC3kpGoJuwSQ8Kn4ojqhcp7GOGTnTn
	DGpR7b2aVFXMFhVFCefUqJqqN3EW6qSF/CxheP6QF115q8b3TqHQgADrcKDvV2c0zj/Y
	pqjZ7H+1HQhhdq835XqS/5eqg3EQlOKizYQGxEGeoPk3zpPw8ga0UUEsNPOLlT4Pt75Q
	iNfQ==
X-Gm-Message-State: AIkVDXLxmL4rOUwLUXo1sEsY/jX7y4GJjOKrTKFOJ3iquwqL32VSdEngGwWcqt8IzQ4CrQ==
X-Received: by 10.99.253.81 with SMTP id m17mr14661968pgj.78.1485269573200;
	Tue, 24 Jan 2017 06:52:53 -0800 (PST)
Received: from akuster-ThinkPad-X240.mvista.com
	([2601:202:4001:9ea0:ea2a:eaff:fe0e:629e])
	by smtp.gmail.com with ESMTPSA id
	19sm45528331pft.46.2017.01.24.06.52.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Jan 2017 06:52:52 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Tue, 24 Jan 2017 06:52:43 -0800
Message-Id: <1485269563-5634-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] wireshark: update package to 2.2.4
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
X-List-Received-Date: Tue, 24 Jan 2017 14:52:55 -0000

   The following vulnerabilities have been fixed:
     * [1]wnpa-sec-2017-01
       The ASTERIX dissector could go into an infinite loop. ([2]Bug
       13344)
     * [3]wnpa-sec-2017-02
       The DHCPv6 dissector could go into a large loop. ([4]Bug 13345)

see: https://www.wireshark.org/docs/relnotes/wireshark-2.2.4.html

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_2.2.3.bb => wireshark_2.2.4.bb}             | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.3.bb => wireshark_2.2.4.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.3.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.4.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_2.2.3.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.2.4.bb
index 5e7fdfa..11c9389 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.3.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.4.bb
@@ -9,8 +9,9 @@ DEPENDS = "pcre expat glib-2.0"
 SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
 PE = "1"
-SRC_URI[md5sum] = "68e201e06873c67cb7544d27991e79bf"
-SRC_URI[sha256sum] = "97bac89e88892054a5848a9f7e0c36aa399a2008900829b078e29cab0ddd593b"
+
+SRC_URI[md5sum] = "6d0878ba931ea379f6e675d4cba6536b"
+SRC_URI[sha256sum] = "42a7fb35eed5a32478153e24601a284bb50148b7ba919c3e8452652f4c2a3911"
 
 inherit autotools pkgconfig perlnative
 
-- 
2.7.4


