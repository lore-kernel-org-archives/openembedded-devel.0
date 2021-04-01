Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web12.2149.1617244207232220241
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Mar 2021 19:30:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TDhtdd/u;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617244205; i=@fujitsu.com;
	bh=rL0hMiCKvAW7nnOpwtAkMcHKbNGHVEfnOqf+2Bf0gUk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=TDhtdd/unFgbhCKL7fGN/DhDTQUm1LOnt1GYsNVouuEOxqCxEdJlFFk2PeHb4KX2T
	 Jpdg8PrB/ghC9lLBeApmRnDYQiZqUlbCinWdjr+yNpWoyLrZ4RzvHD7iPJ85iq6CLM
	 dbijosEWtt0sb9rjk/0AbN9JV5pBDy52MAhtSDCTuqElM2Jvh/3xA/q7pXPxXLo/o+
	 8K3H31OO7VyBP/DyXhbI2Rc4HRY/rMvozwYgYlgHwwBuStS5vJFdmsaREY2mWME+lk
	 3W0MdRkzneZh4OSuYfsr3+VO4pNbpZmHkCfYJNdERl+kZUvZgmYZDglh/zY24NAG3e
	 UoTcgsbYvdN3A==
Received: from [100.113.6.195] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id EE/81-23163-D2035606; Thu, 01 Apr 2021 02:30:05 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+EI1dU1SE0
  wuDCV0eLi4aXMDowe5zauYAxgjGLNzEvKr0hgzbj1mrtgDWdF+9PDjA2Mhzi6GDk5hAS2Mklc
  3lfXxcgFZB9nlFj9YAcjSIJNQEei40U3C4gtIqAvsXT2HmYQW1jATuLVtH1sIDaLgIrEltvdQ
  HEODl4Bd4m/70JBwhICChJTHr4HK+cVEJQ4OfMJ2BhmAQmJgy9eMEPUKEps33mGBcKukjg7+w
  vTBEaeWUhaZiFpWcDItIrRIqkoMz2jJDcxM0fX0MBA19DQWNcMyNJLrNJN0kst1U1OzSspSgR
  K6iWWF+sVV+Ym56To5aWWbGIEhlBKIRvXDsanrz/oHWKU5GBSEuWdMi0lQYgvKT+lMiOxOCO+
  qDQntfgQowwHh5IEr4t+aoKQYFFqempFWmYOMJxh0hIcPEoivDYaQGne4oLE3OLMdIjUKUZFK
  XFeLj2ghABIIqM0D64NFkOXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzyoBM4cnMK4Gb/g
  poMRPQ4iuPEkEWlyQipKQamKw3TV36r15hwt6/Jt08cavLHin3m9/837vdd+fOj+rTdpqbXw/
  kexv0dEv4gSe7zTWFd8Vv+pJykmnj5MUxK2VFbx1T3dS8U26FWIZBg4VG0czrcy2nC899wBlw
  ar9A3XcZj5wnP96/KxAx7NuUcv39qcIAQQEr97VXihW3T2PdyG1Rpv6bdU9NRFTAg+1dsW92X
  HncwiPwySGRNaBmUeCML/NMNVy5c/bO+MOx5AtjRfvqZVHtnvfaLCymbLz38ltC6OYj4vvPHH
  n4cclCddetJ0TvmGTO0M59H2eflmuYYLykZmnomU8R37kCFX+dil6d/H+LHjsPS5xC68fTU7e
  Ht2zi4ZglLa4RGD316A8lluKMREMt5qLiRAAmTyFeHAMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-248.messagelabs.com!1617244204!47636!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32485 invoked from network); 1 Apr 2021 02:30:04 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-11.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Apr 2021 02:30:04 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1312U4uj006518
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Apr 2021 03:30:04 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 1 Apr 2021 03:30:02 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] zabbix: upgrade 5.2.5 -> 5.2.6
Date: Thu, 1 Apr 2021 10:29:56 +0800
Message-ID: <1617244196-92121-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../zabbix/{zabbix_5.2.5.bb => zabbix_5.2.6.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_5.2.5.bb => zabbix_5.2.6.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_5.2.5.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_5.2.6.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_5.2.5.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_5.2.6.bb
index 2bbfec9dc..37bb9a282 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_5.2.5.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_5.2.6.bb
@@ -28,8 +28,8 @@ SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/5.2/${BPN}-${PV}.tar.gz
     file://zabbix-agent.service \
 "
 
-SRC_URI[md5sum] = "e90822716c5c241890f6fed1588b5451"
-SRC_URI[sha256sum] = "ce0d9745a8b9154e87d6906edd0fce7b7ec298acd34a0543ea53d1a5f2f14bc5"
+SRC_URI[md5sum] = "31dab3535a1fa212f5724902727f6d4d"
+SRC_URI[sha256sum] = "76cb704f2a04fbc87bb3eff44fa71339c355d467f7bbd8fb53f8927c760e1680"
 
 inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
 
-- 
2.25.1

