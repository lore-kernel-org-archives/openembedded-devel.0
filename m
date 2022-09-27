Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8749C6FA86
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 09:11:32 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.8830.1664269891033296274
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 02:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FfVNrD5R;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1664269889; i=@fujitsu.com;
	bh=CqCwPv4JRbwtXQHjw+RuJKiZB/qXtvdKEMy/8ruQSMM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=FfVNrD5RnTvT04CRBwx7OBOH5zgxrJyH8F9d76YBywQZgizaJghTZFYUxT5nDZmib
	 dajgzkdswdQOyH9FoghXQogVLdVGw1ieNchDdgFYNPW9F8FsJYL59ZoIq2iS0sTp4a
	 XcxnARulyhHIKZZihHdVYIYiYxGSp1fZcuzyg1YP1sukwERujlTbYo7YUBuUNapwLE
	 N62t9JcvOpViV5eK3W+BxQ5IvECPziBDpzCQxw0cZ/idtw5snO8tuV3hY8FZhIcFE1
	 Jn7WSg3VkCt5otlmCxEONysrhSuCKfTF1iTWbwVKSUPOcKL6ucRQ1pLjclzaIgoVcZ
	 G3us3SYN1RAsw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRWlGSWpSXmKPExsViZ8OxWddhn1G
  ywbXL+hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bjHUsZC/ZwV+w7foSxgXEaVxcjF4eQwANG
  ib9zZrJBOFeYJL5PvMQO4exhlPjytJmxi5GTg01ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBD4n9h76AxVkEVCX+HvoNFucVcJS4vHAB2BwJAQWJKQ/fg9VwCjhJnLlymgnEFgKq+X
  SiBapeUOLkzCcsEPMlJA6+eMEM0asoMftyMwuEXSHROP0QE4StJnH13CbmCYyCs5C0z0LSvoC
  RaRWjTVJRZnpGSW5iZo6uoYGBrqGhqa6lha6RsbFeYpVuol5qqW5eflFJhq6hXmJ5sV5qcbFe
  cWVuck6KXl5qySZGYCinFCe93MF4ft8vvUOMkhxMSqK89ouMkoX4kvJTKjMSizPii0pzUosPM
  cpwcChJ8EruBsoJFqWmp1akZeYA4womLcHBoyTCu24JUJq3uCAxtzgzHSJ1ilGXY+bXtgPMQi
  x5+XmpUuK8pluAigRAijJK8+BGwGL8EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXtM9QFN
  4MvNK4Da9AjqCCegIOz59kCNKEhFSUg1Mc9wvPNtcuu9FbuxrYf9L4kf3HXw55+oh/zPT7zIu
  c3hkk3RYLqLnf0m0edLOI6nSk9VzFy78mL9HZfP/jfGNT8wddiq7pYpOjLm20s1mobft6vKdM
  40ePn3MGWn8eZl+burmNdsYy4TznnOrOrzJtco7suXy+uac8PMnZrm9cml0m7fKevWX/x2zLC
  0mZ1WEpa/q0F/v3r8mPJ3ddGPls8Q0T57r1ZLPc95t3Fza9f/OTlsPr9wyEd4QX86tf9LTTev
  SFc+sljvz22Zrc/bjgB3uCtEen1afiVsfvmLXBdHwVTv5AlUuRzFe37Pkzd8rWas7U1pUp0nO
  rHoW/6Fk49nE09t6LDd9k7W7McG0QomlOCPRUIu5qDgRANH/LMBsAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-732.messagelabs.com!1664269888!389102!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29388 invoked from network); 27 Sep 2022 09:11:28 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-23.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2022 09:11:28 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 35D2E73
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:11:28 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 28BB8142
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:11:28 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 27 Sep 2022 10:11:26 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-ldap: upgrade 3.4.2 -> 3.4.3
Date: Tue, 27 Sep 2022 17:11:01 +0800
Message-ID: <1664269861-2695-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1664269861-2695-1-git-send-email-wangmy@fujitsu.com>
References: <1664269861-2695-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 09:11:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98985

Changelog:
==========
This is a minor release to bring back the removed OPT_X_TLS option.
Please note, it's still a deprecated option and it will be removed in 3.5.0.
The following deprecated option has been brought back:
    OPT_X_TLS

Fixes:
--------
    Sphinx documentation is now successfully built
    pypy3 tests stability was improved
    setup.py deprecation warning is now resolved

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-ldap_3.4.2.bb => python3-ldap_3.4.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-networking/python/{python3-ldap_3.4.2.bb => python3-ldap_3.4.3.bb} (90%)

diff --git a/meta-python/recipes-networking/python/python3-ldap_3.4.2.bb b/meta-python/recipes-networking/python/python3-ldap_3.4.3.bb
similarity index 90%
rename from meta-python/recipes-networking/python/python3-ldap_3.4.2.bb
rename to meta-python/recipes-networking/python/python3-ldap_3.4.3.bb
index 44a3d00d8b..f2c0d2ee13 100644
--- a/meta-python/recipes-networking/python/python3-ldap_3.4.2.bb
+++ b/meta-python/recipes-networking/python/python3-ldap_3.4.3.bb
@@ -13,7 +13,7 @@ PYPI_PACKAGE = "python-ldap"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b16470a0983aaf09a00ffb8f40b69a2446f3d0be639a229256bce381fcb268f7"
+SRC_URI[sha256sum] = "ab26c519a0ef2a443a2a10391fa3c5cb52d7871323399db949ebfaa9f25ee2a0"
 
 do_configure:prepend() {
     sed -i -e 's:^library_dirs =.*::' \
-- 
2.25.1


