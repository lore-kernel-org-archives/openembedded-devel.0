Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A929C4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 10:00:31 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.8492.1672826430103873497
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Jan 2023 02:00:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=Pmb7qBGR;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=HOHFqZil64yMvtCqJpy/uDMczJC2AQt7ltDwOLOCasU=; b=Pmb7qBGRfg3HowyJwOen2wmT2E
	ZxtHUuXYtUoVnw7tXdTJx9gCFVgPCgDHagL/YTxzR9tOiU77K2+uA4ipZV0G0etOAUDx3zjlYXVrz
	6A8KubVoGK/HAzUm3+gvgVFNlkKb/msiPrhxzpZJc3QHnKVc/Pt4P4QteCgcR6SBvFJhRcCc3lp5C
	RvPZ27O8tTLy15iU+KHLutLTkpdXERrfdvyDianEeZxUXd8FNU/VclOL35w0Pwc4yaKREiKxWempc
	TGSPljALST2v3s0o7PRtDseCpkFt9Zmc/bAANlrWdM1edBHaS8eYXFQPxWSXHLsbK59HWgQgx21gw
	v8QGc5rA==;
Received: from lan.nucleusys.com ([92.247.61.126]:35460 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1pD0a6-000Cd7-TP;
	Wed, 04 Jan 2023 12:00:27 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-coverage: Upgrade 7.0.1 -> 7.0.3
Date: Wed,  4 Jan 2023 12:00:14 +0200
Message-Id: <20230104100016.268755-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 10:00:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100394

Upgrade to release 7.0.3:

- Fix: when using the [run] relative_files = True setting, a
  relative [paths] pattern was still being made absolute. This is
  now fixed.
- Fix: if Python doesn't provide tomllib, then TOML configuration
  files can only be read if coverage.py is installed with the
  [toml] extra. Coverage.py will raise an error if TOML support is
  not installed when it sees your settings are in a .toml file.
  But it didn't understand that [tools.coverage] was a valid
  section header, so the error wasn't reported if you used that
  header, and settings were silently ignored. This is now fixed.
- Fix: adjusted how decorators are traced on PyPy 7.3.10.
- Fix: the coverage lcov report did not properly implement the
  --fail-under=MIN option. This has been fixed.
- Refactor: added many type annotations, including a number of
  refactorings. This should not affect outward behavior, but they
  were a bit invasive in some places, so keep your eyes peeled for
  oddities.
- Refactor: removed the vestigial and long untested support for
  Jython and IronPython.
- Fix: when using pytest-cov or pytest-xdist, or perhaps both, the
  combining step could fail with assert row is not None using
  7.0.2. This was due to a race condition that has always been
  possible and is still possible. In 7.0.1 and before, the error
  was silently swallowed by the combining code. Now it will produce
  a message "Couldn't combine data file" and ignore the data file
  as it used to do before 7.0.2

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-coverage_7.0.1.bb => python3-coverage_7.0.3.bb}  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.0.1.bb => python3-coverage_7.0.3.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.0.1.bb b/meta-python/recipes-devtools/python/python3-coverage_7.0.3.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-coverage_7.0.1.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.0.3.bb
index caf6ba14f..7e9b262d1 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.0.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "a4a574a19eeb67575a5328a5760bbbb737faa685616586a9f9da4281f940109c"
+SRC_URI[sha256sum] = "d5be4e93acce64f516bf4fd239c0e6118fc913c93fa1a3f52d15bdcc60d97b2d"
 
 inherit pypi setuptools3
 
@@ -16,4 +16,6 @@ RDEPENDS:${PN} += " \
 	${PYTHON_PN}-crypt \
 	${PYTHON_PN}-shell \
 	${PYTHON_PN}-io \
+	${PYTHON_PN}-toml \
+	${PYTHON_PN}-multiprocessing \
 "
-- 
2.30.2


