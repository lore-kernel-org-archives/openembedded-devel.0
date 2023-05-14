Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF6BFC77B7F
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 13:06:45 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.66069.1684069603090916185
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 May 2023 06:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yI5dlKeO;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1684069601; i=@fujitsu.com;
	bh=h1QIwX0tDL2QqSoF8PQxyjHbcX6EFOEyaKlCm47pzS0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=yI5dlKeOnayr+zIpuhWnXdSyxA6h3LYVk4h+wyRCTFnuB+YRjXXg5/WMLEMNZT8zl
	 xYJCbDv7P/Z5+pF/X+mHqsCULR7pwjwR0PEc3sPnbjNYrYnyPD7r4hZDTqEvFXSH6M
	 6MdUo7o2ZxOqQnmX1TsxyXeITNLv1HHqhWT0/sdTxIbc4e3BKMTTk9EO6pi3A8ER6o
	 Gb7P8K6x1Nno9P6nTV208pUE5J25HGpeZLZ2Zm7AU7RSlbnm8c2rl85PPT+PpG0z3x
	 dS2BvqunR0SYmMAN6xdJ0hoLn6AJo63vxgAHXPK678lMgJio5JoSTqPFTi868UDzDV
	 LYvBrOWVO4B1A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrALMWRWlGSWpSXmKPExsViZ8ORpPvgTkK
  KwemHUhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aFQ58YC34IV+zf8JKtgfG6YBcjF4eQwEZG
  ia9zJzN3MXICOVOZJJo3R4LYbAISEtP3nmQHsUUEdCU+fpjLCGIzC6hIzJh8hAnEFhbwlHjaP
  RGshkVAVWLalwdgNbwCThLX5u0Gi0sIKEhMefgebD6ngLPExg/vGSF2OUksubEGqkZN4uq5Tc
  wTGHkWMDKsYjQtTi0qSy3SNdJLKspMzyjJTczM0Uus0k3USy3VLU8tLgHKJJYX66UWF+sVV+Y
  m56To5aWWbGIEBkRKsRLDDsYDO//qHWKU5GBSEuW9VhKXIsSXlJ9SmZFYnBFfVJqTWnyIUYaD
  Q0mCV+dmQoqQYFFqempFWmYOMDhh0hIcPEoivHFXgdK8xQWJucWZ6RCpU4yKUuK8B0D6BEASG
  aV5cG2wiLjEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZiX5wbQFJ7MvBK46a+AFjMBLb61Jx
  5kcUkiQkqqgSlJZK/BslyN/vDg+iW99s827hV/uuzc8uvNXK6PFs0oVQr5WSC3MilOdb+VkId
  Be66TfPCzPTvsYrSlpX50XtV9reyknrhtLZ/PQr5FF488lF/WOFdrR+CkiK3RmTvlquadibnV
  8oj77td1bvrsn0LZVs7Kk2et05aaGW4TxmuX6ft1utbdG4zrRUWulD2u0BZmSulfZOMX0VMZ6
  9ixzIIr4OE0kazTL7jfftc1EDZPXtVRVJGnpNXRt+JiJ6fOldgLrgXOVy5X1VpONZh7jjn8QP
  dD/rmvj3C/+R+6714MS8nEG3MmhQRnSF5fs2ExQ4iNkumnuDtN3m5sa6I2J1+W64iQm3rvwc2
  qLC9+JZbijERDLeai4kQAUpITawMDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-548.messagelabs.com!1684069600!196149!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10602 invoked from network); 14 May 2023 13:06:40 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-10.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2023 13:06:40 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 27BA21AE;
	Sun, 14 May 2023 14:06:40 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 4E7B17B;
	Sun, 14 May 2023 14:06:39 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyjwt: upgrade 2.6.0 -> 2.7.0
Date: Sun, 14 May 2023 21:06:20 +0800
Message-Id: <1684069583-12337-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684069583-12337-1-git-send-email-wangmy@fujitsu.com>
References: <1684069583-12337-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 13:06:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102577

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Add classifier for Python 3.11 
Add Algorithm.compute_hash_digest and use it to implement at_hash validation example 
fix: use datetime.datetime.timestamp function to have a milliseconds 
[pre-commit.ci] pre-commit autoupdate 
Custom header configuration in jwk client 
[pre-commit.ci] pre-commit autoupdate 
[pre-commit.ci] pre-commit autoupdate 
[pre-commit.ci] pre-commit autoupdate 
Add PyJWT._{de,en}code_payload hooks 
Add sort_headers parameter to api_jwt.encode 
Make mypy configuration stricter and improve typing 
Bump actions/stale from 6 to 7 
[pre-commit.ci] pre-commit autoupdate 
Add more types 
Differentiate between two errors 
Fix _validate_iat validation 
Improve error messages when cryptography isn't installed 
[pre-commit.ci] pre-commit autoupdate 
[pre-commit.ci] pre-commit autoupdate 
[pre-commit.ci] pre-commit autoupdate 
Make Algorithm an abstract base class 
docs: correct mistake in the changelog about verify param 
[pre-commit.ci] pre-commit autoupdate 
Bump actions/stale from 7 to 8 
[pre-commit.ci] pre-commit autoupdate 
Add a timeout for PyJWKClient requests 
Add client connection error exception 
Add complete types to take all allowed keys into account 
[pre-commit.ci] pre-commit autoupdate 
Build and upload PyPI package 
Fix for issue #862 - ignore invalid keys in a jwks. 
Add as_dict option to Algorithm.to_jwk 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyjwt_2.6.0.bb => python3-pyjwt_2.7.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyjwt_2.6.0.bb => python3-pyjwt_2.7.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.6.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.7.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pyjwt_2.6.0.bb
rename to meta-python/recipes-devtools/python/python3-pyjwt_2.7.0.bb
index d6ca242c58..e1e3358695 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.7.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4b56d2c9973d8cf54655555be06e551"
 
-SRC_URI[sha256sum] = "69285c7e31fc44f68a1feb309e948e0df53259d579295e6cfe2b1792329f05fd"
+SRC_URI[sha256sum] = "bd6ca4a3c4285c1a2d4349e5a035fdf8fb94e04ccd0fcbe6ba289dae9cc3e074"
 
 PYPI_PACKAGE = "PyJWT"
 inherit pypi setuptools3
-- 
2.34.1


