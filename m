Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.12706.1599135962713175338
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2020 05:26:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45678 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kDoJT-0007Jp-TL; Thu, 03 Sep 2020 15:26:00 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 1/3] nano: Upgrade 5.1 -> 5.2
Date: Thu,  3 Sep 2020 15:25:50 +0300
Message-Id: <20200903122552.14524-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 5.2 "Ranrapalca":

- Making certain replacements after a large paste does not crash.
- Hitting a toggle at the Search prompt does not clear the answer.
- Using --positionlog does not complain at the first start.
- A macro containing a Search command will not sometimes fail.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-oe/recipes-support/nano/{nano_5.1.bb => nano_5.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nano/{nano_5.1.bb => nano_5.2.bb} (87%)

diff --git a/meta-oe/recipes-support/nano/nano_5.1.bb b/meta-oe/recipes-support/nano/nano_5.2.bb
similarity index 87%
rename from meta-oe/recipes-support/nano/nano_5.1.bb
rename to meta-oe/recipes-support/nano/nano_5.2.bb
index 216ad594f..f2cd2909c 100644
--- a/meta-oe/recipes-support/nano/nano_5.1.bb
+++ b/meta-oe/recipes-support/nano/nano_5.2.bb
@@ -12,7 +12,7 @@ RDEPENDS_${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[sha256sum] = "9efc46f341404d60095d16fc4f0419fc84b6e4eaeaf6ebce605d0465d92a6ee6"
+SRC_URI[sha256sum] = "32c2da43e1ae9a5e43437d8c6e1ec0388af870c7762c479e5bffb5f292bda7e1"
 
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
 
-- 
2.17.1

