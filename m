Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id CE35C61E6C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2014 12:06:19 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id x55so4391825wes.19
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2014 04:06:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cDnHacTkxyTm7X2iQFwSNQM3cQa+GtkaSE682sZGbls=;
	b=d+5DiEOpv+UbACBP68azmxPaO+56pLY3n0DjaC7FMspRG1pbFor56Dk6N3VGuEraQu
	1OnCINLSbDYv/9zb6UobKJRtDsqg6VBAyABetxpsLktP8N/unBAJTqu8AoY3CeB5kx8l
	m5I4wsRd4oif+NOx+Nw/jSMC2n4eHhSTwuO8cwN1J/5TgK5ne+O24rct/nVd3HCDhgmE
	PySRTPHtHtLQJvQymlQ3sLE7IFD1Tvvi3N2Mb2FR12hfNR9mYpf8O9UJMlEELIYictWI
	8/bmYtT/SnUFrBCNYLMIXo1bUC5mvprKY/Ku3D0uTmfJGMa/0TAeabuOCdwLZE7r9qZz
	h6qA==
X-Gm-Message-State: ALoCoQne3zie1A3FWw1XxYWOeuGxoCmq61TcqvpHva1fNiGfXxmE4DleMkvLcNHFqtzV/gXvFRG1
X-Received: by 10.181.11.201 with SMTP id ek9mr1991667wid.54.1389960380408;
	Fri, 17 Jan 2014 04:06:20 -0800 (PST)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id eh7sm2886777wic.2.2014.01.17.04.06.19
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Jan 2014 04:06:19 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jan 2014 13:06:12 +0100
Message-Id: <1389960374-16694-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.8.4.2
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCHv2 1/3] acpica: update to 20140114 release
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
X-List-Received-Date: Fri, 17 Jan 2014 12:06:20 -0000

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 .../acpica/{acpica_20131115.bb => acpica_20140114.bb}                | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/acpica/{acpica_20131115.bb => acpica_20140114.bb} (91%)

diff --git a/meta-oe/recipes-extended/acpica/acpica_20131115.bb b/meta-oe/recipes-extended/acpica/acpica_20140114.bb
similarity index 91%
rename from meta-oe/recipes-extended/acpica/acpica_20131115.bb
rename to meta-oe/recipes-extended/acpica/acpica_20140114.bb
index 8c9ecd4..5cc2d5a 100644
--- a/meta-oe/recipes-extended/acpica/acpica_20131115.bb
+++ b/meta-oe/recipes-extended/acpica/acpica_20140114.bb
@@ -15,9 +15,8 @@ SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
     file://cross-compile.patch \
     file://no-werror.patch \
     "
-
-SRC_URI[md5sum] = "1bd5b14c4c567ca2a113c05f4b28f29c"
-SRC_URI[sha256sum] = "d699a880b84e04205eda2d5ad048c1c38a57289240caa5f0fb7ebdcd3aac83d2"
+SRC_URI[md5sum] = "fcd4b7304f1bfabc7d4b9cfdecc6b0c6"
+SRC_URI[sha256sum] = "0d5bd32690ab77e21ab143ef25361c314a4ed13c33a5fb3ddd6f5559ab24ebc3"
 
 S = "${WORKDIR}/acpica-unix2-${PV}"
 
-- 
1.8.4.2


