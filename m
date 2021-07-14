Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web12.4467.1626255240327011407
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jul 2021 02:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=o+Aa9h9s;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1626255237; i=@fujitsu.com;
	bh=ym7cI6H1XpAXGtHiIwaJmuOj/gcXUM7QO3LEc8M4pNA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=o+Aa9h9s7zIf0AK73/M69LOc7IwXICwShyWy53Mh+Kp2H3cGx6SBDDHhawxtXb3gj
	 AUA2cAjmXT7qOZHhalmzYupd47ZvDGR1kxGmlfx/6ZXvQTrwioQjUa9EiOdefuYSfa
	 5xZtj4eqwweKIucSpJiShE4vHAeRihc4/nPjhJjNTt+GJw0L0ZYvCeW6lznMpe2/2k
	 XxxDKDXqmx1cijxgxo/Di5m0aumtnX9rhs9+kocLJVxPxKfyf0E4rvl1+BAG++Tvf2
	 0UJ1t8h2dxw0egxxDs4E2fRB6quPH6b3Ns37qnjH3tocAv95BNpygFpa9ce0hXpJgi
	 Lr59SIe6d57vA==
Received: from [100.113.4.179] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id 4D/32-07224-58FAEE06; Wed, 14 Jul 2021 09:33:57 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+GYotuy/l2
  CwaYH+hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a+f1PYCjZyVSxYsIq9gXEnZxcjF4eQwDYm
  iRt7bzFDOCcZJR6tWcTUxcjJwSagI9HxopsFxBYR0JdYOnsPM4gtLOAlMWfZVHYQm0VAVeLfo
  x9gcV4BN4nvE54xgtgSAgoSUx6+h4oLSpyc+QRsDrOAhMTBFy+YIWoUJbbvPMMCYVdK7JnVzz
  SBkWcWkpZZSFoWMDKtYrRIKspMzyjJTczM0TU0MNA1NDTWNQOy9BKrdJP0Ukt1k1PzSooSgZJ
  6ieXFesWVuck5KXp5qSWbGIGBlFLIxrWD8enrD3qHGCU5mJREeW/4vE0Q4kvKT6nMSCzOiC8q
  zUktPsQow8GhJMHLuPZdgpBgUWp6akVaZg4wqGHSEhw8SiK87iBp3uKCxNzizHSI1ClGRSlxX
  u91QAkBkERGaR5cGyySLjHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5j0LMp4nM68EbvoroM
  VMQIu117wFWVySiJCSamCafrj4n+EZ/VtHb17ufHcyOn7zvYJL73OV+SZo6bEt+nhw8uaK+QV
  5LMaGJddjDlzK+WtzXahAqtGDUYrZ/8AhTo0Z6yfJe144/uNChfT5p+mZrtYRi+Q4k/nS/O51
  mnh+CzUM2XNbTee5t+6bMMGP7Ylaty/5Rb7xnRIl9PWBj+PtGafkmjqVz91dUt2ut619n9JB1
  8rJR/M+xa6rWvL8Jmu6hpLau6yXN7Yc8t/pWpQXf2/D/EmHy59UfckzNZjw60jNfIeVdxUP5B
  j6tvjmf/L7l3O94uMP8e9/XJ9/viyaaOh4uarGZ9akvx8Uph5/fUbZ6IKVBd+c6rVtW0I6HLb
  OatFJtY53/Ke0s+q4EktxRqKhFnNRcSIAtRkWjR8DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-248.messagelabs.com!1626255236!121836!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20283 invoked from network); 14 Jul 2021 09:33:56 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-3.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Jul 2021 09:33:56 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16E9Xljh030568
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jul 2021 10:33:56 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 14 Jul 2021 10:33:45 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-cffi: upgrade 1.14.5 -> 1.14.6
Date: Thu, 15 Jul 2021 05:33:37 +0800
Message-ID: <1626298417-4428-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Test fixes for CPython 3.10.0b3
Support for sys.unraisablehook() on Python >= 3.8
Fix two minor memory leaks (thanks Sebastian!)
Like many projects that had an IRC channel on freenode, we moved it to irc.libera.chat.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../python/{python3-cffi_1.14.5.bb => python3-cffi_1.14.6.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cffi_1.14.5.bb => python3-cffi_1.14.6.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.14.5.bb b/meta-python/recipes-devtools/python/python3-cffi_1.14.6.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-cffi_1.14.5.bb
rename to meta-python/recipes-devtools/python/python3-cffi_1.14.6.bb
index 16928f0dbc..bcd185d899 100644
--- a/meta-python/recipes-devtools/python/python3-cffi_1.14.5.bb
+++ b/meta-python/recipes-devtools/python/python3-cffi_1.14.6.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS += "libffi ${PYTHON_PN}-pycparser"
 
-SRC_URI[sha256sum] = "fd78e5fee591709f32ef6edb9a015b4aa1a5022598e36227500c8f4e02328d9c"
+SRC_URI[sha256sum] = "c9a875ce9d7fe32887784274dd533c57909b7b1dcadcc128a2ac21331a9765dd"
 
 inherit pypi setuptools3
 
-- 
2.25.1

