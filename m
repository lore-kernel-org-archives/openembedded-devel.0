Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE04C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 10:44:25 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.4121.1646822664922355392
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 02:44:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZYhfPdrC;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646822663; i=@fujitsu.com;
	bh=zIYG9Oxv9T8+n59aTQ5CjFHX9u19F+bs5+JqolC/A0E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ZYhfPdrCK/MgbLJzdMjkCzGj/JU8bNqTN4kpwAQ134yvOfhG0IeBI6NE1UuXpeI1v
	 v5N7HCJ4D9RnPRjN8HhvuUYY5AxkDoP/6DomsXBHQQHzUmpxRQl7wRCYfbD1KYkwbX
	 EvEAS22t/9W5/XUyZ+DeV3PjFfH0dZdm7oyjz9QnV1YpCOwLS1CzqBPKomm0Y96av8
	 lgkRaqwvGBy31bf7Gwqdnl4q6wVPBDrSVrpoTVK5acelO5HaT+zicWZZFDL/o9w3pb
	 oGLveE0B0VIrMU4MNLszBGe1lum2wkbTWe9L6qeyCzFL1ETcs2tIkh4j7BrWyk/ApS
	 7DQM5Kex44Urg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRWlGSWpSXmKPExsViZ8MRosvWqpF
  ksOS8isXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnFw4g72gtdiFfuObGRpYPwm3MXIySEkMINJ
  orG1pouRC8g+ziix4Ot0JpAEm4CaxPRbN1hBbBEBfYmls/cwg9jMAioSL373sIPYwgI+Evdv3
  wOrZwGK35h0hwXE5hVwkrh9pBcsLiGgIDHl4XtmiLigxMmZT1gg5khIHHzxghmiRlFi9uVmFg
  i7QmLWrDamCYy8s5C0zELSsoCRaRWjdVJRZnpGSW5iZo6uoYGBrqGhqa6xka6hkZleYpVuol5
  qqW55anGJrpFeYnmxXmpxsV5xZW5yTopeXmrJJkZgkKUUK9TtYLy28qfeIUZJDiYlUV6ZYI0k
  Ib6k/JTKjMTijPii0pzU4kOMMhwcShK8nU1AOcGi1PTUirTMHGDAw6QlOHiURHg/1wCleYsLE
  nOLM9MhUqcYdTl2brm8l1mIJS8/L1VKnPdNM1CRAEhRRmke3AhY9F1ilJUS5mVkYGAQ4ilILc
  rNLEGVf8UozsGoJMzL1wI0hSczrwRu0yugI5iAjrAzUgM5oiQRISXVwOR0c+HC5W86T/F5Lsq
  VM72h99OVqZTtSIb6B7NlZ8s/TBbe+UyU77o704eLu7jtNsiJTjjUKNn/S7Fu2cfk1SJLogPY
  Xf+2WTzpyel2D+Dn+ztZ9+wt17U6Hs4+GlWnGq+s+lv54PBxU8Wapc2Z7k7rV+4rsNr9VuWE0
  QlhJaeARZxhS8RUD2xIUwz+sPoQp6+F75mEzfFhwhN+7XJ99u7YeRGfR611GVZ/rM5xuaZZ+V
  2tS3nC21uR9yz85ApH6UiT7tr/jhXv19+W2Vbjlj8/KdDTTlIvNkDvzcON7nbZkgw9LQfuH5S
  SOKj/lfuOvG79p18LixrNQho6Xhg9NPqut3iC0K2d+cHWj26kKrEUZyQaajEXFScCAKgDIBg5
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-565.messagelabs.com!1646822662!2861!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16855 invoked from network); 9 Mar 2022 10:44:22 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-7.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Mar 2022 10:44:22 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 229AiGV6008214
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 9 Mar 2022 10:44:22 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 9 Mar 2022 10:44:14 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-astroid: upgrade 2.9.3 -> 2.10.0
Date: Wed, 9 Mar 2022 18:44:00 +0800
Message-ID: <1646822643-61935-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Mar 2022 10:44:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95898

Changelog:
=========
* Fixed inference of "self" in binary operations in which "self"
  is part of a list or tuple.
* Fixed builtin inference on `property` calls not calling the `postinit` of the new node, which
  resulted in instance arguments missing on these nodes.
* Fixed a crash on "Super.getattr" when the attribute was previously uninferable due to a cache
  limit size. This limit can be hit when the inheritance pattern of a class (and therefore of the
  "__init__" attribute) is very large.
* Inlcude names of keyword-only arguments in "astroid.scoped_nodes.Lambda.argnames".
* Fixed a crash inferring on a "NewType" named with an f-string.
* Add support for [attrs v21.3.0](https://github.com/python-attrs/attrs/releases/tag/21.3.0) which
  added a new `attrs` module alongside the existing `attr`.
* Use the "end_lineno" attribute for the "NodeNG.tolineno" property
  when it is available.
* Add "is_dataclass" attribute to "ClassDef" nodes.
* Use "sysconfig" instead of "distutils" to determine the location of
  python stdlib files and packages.
* Fixed crash with recursion error for inference of class attributes that referenced
  the class itself.
* Fixed crash when trying to infer "items()" on the "__dict__"
  attribute of an imported module.
* Add optional "NodeNG.position" attribute.
  Used for block nodes to highlight position of keyword(s) and name
  in cases where the AST doesn't provide good enough positional information.
  E.g. "nodes.ClassDef", "nodes.FunctionDef".
* Fix "ClassDef.fromlineno". For Python < 3.8 the "lineno" attribute includes decorators.
  "fromlineno" should return the line of the "class" statement itself.
* Performance improvements. Only run expensive decorator functions when
  non-default Deprecation warnings are enabled, eg. during a Pytest run.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_2.9.3.bb => python3-astroid_2.10.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.9.3.bb => python3-astroid_2.10.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.9.3.bb b/meta-python/recipes-devtools/python/python3-astroid_2.10.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.9.3.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.10.0.bb
index 5828c24a23..fc23f17c6b 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.9.3.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.10.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "1efdf4e867d4d8ba4a9f6cf9ce07cd182c4c41de77f23814feb27ca93ca9d877"
+SRC_URI[sha256sum] = "f616b9687a5f4afa673dfd2d684d2b6f38365c8ad7c6f27229dda1ede750c445"
 
 inherit pypi setuptools3
 
-- 
2.25.1


