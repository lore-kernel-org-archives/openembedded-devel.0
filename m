Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.5654.1593171000607599938
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 04:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=48362 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jomYQ-000568-UV; Fri, 26 Jun 2020 14:29:59 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/12] python3-msm: Upgrade 0.8.3 -> 0.8.7
Date: Fri, 26 Jun 2020 14:29:41 +0300
Message-Id: <20200626112944.25569-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200626112944.25569-1-leon.anavi@konsulko.com>
References: <20200626112944.25569-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.8.7:

- Handle git:// urls more gracefully
- Add final rstrip
- Add another rstrip for checking if it is Github url
- Convert Paths to str for python 3.5 compatibility

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-msm_0.8.3.bb => python3-msm_0.8.7.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-msm_0.8.3.bb => python3-msm_0.8.7.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-msm_0.8.3.bb b/meta-python/recipes-devtools/python/python3-msm_0.8.7.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-msm_0.8.3.bb
rename to meta-python/recipes-devtools/python/python3-msm_0.8.7.bb
index 24e1ccb3b..de930f934 100644
--- a/meta-python/recipes-devtools/python/python3-msm_0.8.3.bb
+++ b/meta-python/recipes-devtools/python/python3-msm_0.8.7.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/MycroftAI/mycroft-skills-manager"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa"
 
-SRC_URI[md5sum] = "d5f580c58389b337f5577cb92f36e788"
-SRC_URI[sha256sum] = "c201785997f3b766ec376a89bbb3367889ac542183ca26733ffe002bb94917b4"
+SRC_URI[md5sum] = "16f755ea554c332cdb666dfc1109f7f2"
+SRC_URI[sha256sum] = "9878eecbf7255d4907637700ecfeeacb9fe586409ee3ae05d406683ad18d7e5e"
 
 inherit pypi setuptools3
 
-- 
2.17.1

