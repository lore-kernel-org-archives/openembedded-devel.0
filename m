Return-Path: <fathi.boudra@linaro.org>
X-Greylist: delayed 329 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 10 May 2014 12:10:35 UTC
Received: from mail-lb0-f169.google.com (unknown [209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6E3B460167
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 May 2014 12:10:35 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id s7so6341572lbd.28
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 May 2014 05:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JS8+HVwD6bo66BE7RdPXsJBLThNP8YC85fI9Dzz/DDk=;
	b=DefZ5cezbMjmhoARAYBZJQ1+zZxRymwChfkA/G1qtv/RjNzcNfLjc/XUBs2O9pHdq+
	lsmmJl1VCxbOQjEzqXfeR+6OiRySZX2Bxun5ZxLudq1s6OVksVw6YclbyjWujuSA2v0W
	jYs4bNJl51gYBKFWYBkoHvLRBBGfUfjRjciq32F9IRhJVko5dDo2cIZQIOQ0kiZ6T+B8
	dF7zjAeavfZ9xbCnFa54dojQzKxSnkJAh9RoSqtLc1ZAuL1ybYkgj+DoNCGwkSgD9PO2
	LJ3Fa+cxbG/C5puRqHxMlR4CVF2Ym9weJhLLFOuAJyilPSKlU2/ZRvsLpnAbsd3It1Nl
	ibMQ==
X-Gm-Message-State: ALoCoQl8tVFg9UBYja2ao9qtNTa7Ce29qROqrm8IvOFMugWtCwinoE8nzMRiqPDxd7o1AWrhJUzt
X-Received: by 10.112.199.234 with SMTP id jn10mr15257472lbc.8.1399723506638; 
	Sat, 10 May 2014 05:05:06 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id r2sm4324728laa.5.2014.05.10.05.05.05
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 10 May 2014 05:05:06 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 10 May 2014 15:04:58 +0300
Message-Id: <1399723498-1326-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] acpica: update to 20140424 release
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
X-List-Received-Date: Sat, 10 May 2014 12:10:37 -0000

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 .../acpica/{acpica_20140325.bb => acpica_20140424.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/acpica/{acpica_20140325.bb => acpica_20140424.bb} (91%)

diff --git a/meta-oe/recipes-extended/acpica/acpica_20140325.bb b/meta-oe/recipes-extended/acpica/acpica_20140424.bb
similarity index 91%
rename from meta-oe/recipes-extended/acpica/acpica_20140325.bb
rename to meta-oe/recipes-extended/acpica/acpica_20140424.bb
index 0210b04..c302d27 100644
--- a/meta-oe/recipes-extended/acpica/acpica_20140325.bb
+++ b/meta-oe/recipes-extended/acpica/acpica_20140424.bb
@@ -14,8 +14,8 @@ DEPENDS = "bison flex"
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
     file://no-werror.patch \
     "
-SRC_URI[md5sum] = "08efe232bca06a7c54462695bbc2f87c"
-SRC_URI[sha256sum] = "12a7a3c9f2d81e46b0c7095bb7c268ec4bf231178fcbe54ff0c30cd83d2ac38c"
+SRC_URI[md5sum] = "733532f005fba5d1c5344440651b13d1"
+SRC_URI[sha256sum] = "72ece982bbbdfb1b17418f1feb3a9daaa01803d0d41dcf00e19d702cdf751bbc"
 
 S = "${WORKDIR}/acpica-unix2-${PV}"
 
-- 
1.9.3


