Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tcy2v-0003zz-DV
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 13:44:21 +0100
Received: from mail-bk0-f69.google.com ([209.85.214.69])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 26 Nov 2012 04:29:11 -0800
Received: by mail-bk0-f69.google.com with SMTP id jg9so5961208bkc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2012 04:29:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=Cy2WNSFPp1NS3HEg2jpF4om1z3pHvxgEM47qrFfT/3Y=;
	b=QcaPr0VMW88KKps3dNhb/j8UfkUD0wm27PcUrFXOHMAfGTwxqO+Qa9LWmoK6IwA+R1
	M+6Ttqj+NO+A/OSRXeyK1bEWeXSNN0h9ngsFFKLW7PFtNqg/z0YmLMBfhistzsDeVfS1
	Vl0+m01T9xip2M08k9Q7Zie7N1YacnQf/lpcMRhow7Fm1lHzHUDiJjWpSRYWbXZCMJw/
	d1QjivdtqBXe51PTlHWner0iPLjdENtggO+CkSM9CSoEq7LAK1+OjzIEVflMkLLB10DA
	EOHTXDF/LxZJuo+zUsEyf5F3hyCwx21VHqM8VAiGjRRnvm27WY/u06qEDmtgAkjOIhU9
	vAMA==
Received: by 10.216.30.3 with SMTP id j3mr4235862wea.112.1353932991346;
	Mon, 26 Nov 2012 04:29:51 -0800 (PST)
Received: by 10.216.30.3 with SMTP id j3mr4235858wea.112.1353932991260;
	Mon, 26 Nov 2012 04:29:51 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fh10sm23573570wib.3.2012.11.26.04.29.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Nov 2012 04:29:50 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Nov 2012 12:28:19 +0000
Message-Id: <1353932899-16796-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1353932899-16796-1-git-send-email-ross.burton@intel.com>
References: <1353932899-16796-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnA6EMPRQnsj66EoKoKZJnf7fdyKHhL4PVS+9W64CutRqFSDDEDxJ5AGVYMXpXWfS5vCZeO6DkGvPLUcoW7itri9MMtBbfxZi6u8DJzIRW4RxHnpJkpB0G/eH/sCEnNwk/EI2dkImxsDLmPgfWF4BjsZvi4lUVudZkM4uRnm9x1LV9AT50MA2kL0nY4/sAOdTB6PBpb
Subject: [PATCH 2/2] python-numpy: add missing runtime dependencies
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Nov 2012 12:44:21 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
index 031d1cf..e0d9790 100644
--- a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
+++ b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
@@ -37,4 +37,6 @@ FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.a"
 RDEPENDS_${PN} = "python-unittest \
                   python-difflib \
                   python-pprint \
+                  python-pickle \
+                  python-shell \
                  "
-- 
1.7.10



