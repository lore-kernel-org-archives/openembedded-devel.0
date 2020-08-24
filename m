Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.196535.1598280619647901154
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2020 07:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39680 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kADne-0006gX-Du; Mon, 24 Aug 2020 17:50:19 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 7/7] python3-msm: Upgrade 0.8.7 -> 0.8.8
Date: Mon, 24 Aug 2020 17:50:04 +0300
Message-Id: <20200824145004.12568-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200824145004.12568-1-leon.anavi@konsulko.com>
References: <20200824145004.12568-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 0.8.8:

- increment mycroft-skills repo branch
- Make sure readme is included in pip package
- Add license to MANIFEST.in
- Remove exec flag from LICENSE
- Handle PermissionsError when creating skills repo
- Concatenate list and not a string
- Install Python packages in the exact order as specified
  in the manifest file

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-msm_0.8.7.bb => python3-msm_0.8.8.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-msm_0.8.7.bb => python3-msm_0.8.8.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-msm_0.8.7.bb b/meta-python/recipes-devtools/python/python3-msm_0.8.8.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-msm_0.8.7.bb
rename to meta-python/recipes-devtools/python/python3-msm_0.8.8.bb
index de930f934..f5e3f59cd 100644
--- a/meta-python/recipes-devtools/python/python3-msm_0.8.7.bb
+++ b/meta-python/recipes-devtools/python/python3-msm_0.8.8.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/MycroftAI/mycroft-skills-manager"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa"
 
-SRC_URI[md5sum] = "16f755ea554c332cdb666dfc1109f7f2"
-SRC_URI[sha256sum] = "9878eecbf7255d4907637700ecfeeacb9fe586409ee3ae05d406683ad18d7e5e"
+SRC_URI[md5sum] = "cf1fc0d1d86af68003cae53c71ec6288"
+SRC_URI[sha256sum] = "a502aee54917cd394217b31c977a1ba3d9541a0120e0a045c49fd77b328e4a29"
 
 inherit pypi setuptools3
 
-- 
2.17.1

