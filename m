Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.6936.1628159257746135670
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Aug 2021 03:27:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id EC4242000B;
	Thu,  5 Aug 2021 10:27:35 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/2] cve-check: update link to NVD website for CVE details
Date: Thu,  5 Aug 2021 12:27:29 +0200
Message-Id: <20210805102729.32575-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210805102729.32575-1-michael.opdenacker@bootlin.com>
References: <20210805102729.32575-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The old URL schema
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-ID
now redirects to
https://nvd.nist.gov/vuln/detail/CVE-ID

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta/classes/cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index acdf005a72..bf7dd15c73 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -355,7 +355,7 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
     if include_layers and layer not in include_layers:
         return
 
-    nvd_link = "https://web.nvd.nist.gov/view/vuln/detail?vulnId="
+    nvd_link = "https://nvd.nist.gov/vuln/detail/"
     write_string = ""
     unpatched_cves = []
     bb.utils.mkdirhier(os.path.dirname(cve_file))
-- 
2.25.1

