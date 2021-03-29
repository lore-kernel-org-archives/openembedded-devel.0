Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.19131.1617009639381351026
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Mar 2021 02:20:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43130 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lQo4b-0002Gp-9S; Mon, 29 Mar 2021 12:20:37 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/7] python3-ipython: Upgrade 7.21.0 -> 7.22.0
Date: Mon, 29 Mar 2021 12:20:23 +0300
Message-Id: <20210329092024.11922-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210329092024.11922-1-leon.anavi@konsulko.com>
References: <20210329092024.11922-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade to release 7.22.0:

- Fix some sys.excepthook shenanigan when embedding with qt,
  recommended if you – for example – use napari
- Fix bug when using the new ipdb %context magic
- Couples of deprecation cleanup
- Update for new dpast.com api if you use the %pastbin magic
- Remove support for numpy before 1.16

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-ipython_7.21.0.bb => python3-ipython_7.22.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_7.21.0.bb => python3-ipython_7.22.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_7.21.0.bb b/meta-python/recipes-devtools/python/python3-ipython_7.22.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-ipython_7.21.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_7.22.0.bb
index 31ea244e3..7bc0d1d00 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_7.21.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_7.22.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "04323f72d5b85b606330b6d7e2dc8d2683ad46c3905e955aa96ecc7a99388e70"
+SRC_URI[sha256sum] = "9c900332d4c5a6de534b4befeeb7de44ad0cc42e8327fa41b7685abde58cec74"
 
 RDEPENDS_${PN} = "\
     ${PYTHON_PN}-setuptools \
-- 
2.17.1

