Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2D4C077BDA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Mar 2017 16:22:55 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id p189so1154774pfp.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Mar 2017 09:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=iCWeDMWMvjekWWavMqjzkafkEFBdZkB5329uwKa8Nco=;
	b=YNdED1rdOc3rObSsx1w4Dy+MiEGGc+Wcd6qwRfIHPcQG3RIGRlyDqcvQxNVH4vwBmv
	tPU/+9zrCBf/GRSO1JhdJo7RENN75x438qZyzugzO+fXV4PbcpSxe0Cfogg/dTXhTdR9
	pWFEj+j0Kpw1XQYKSwZDVfwj9SWI7GTfrUCqdEtiaGi66xndyFlmvqzk91YhNDcQNpV7
	oJWIxboE+wUriE4jCPHXY3UaWfbIE9iykVCduaZFZXV7+VaN6edmJ+K6EtvAVcv+4Am5
	CcKemiXnHtiFSGBEHVpyc0Ifaq2NwUxyGIqQRnJEX9k/D7o3qwMqVSmBgnCb5CwmK2oW
	USoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=iCWeDMWMvjekWWavMqjzkafkEFBdZkB5329uwKa8Nco=;
	b=BucM0+kjxZKf2J+x6y9YPaqcuyGwyRz/odCE59G3WNxQwXn7LuQWN+S+3j8jA+YhIh
	0Mwf+Ljlr6lYjSHn9kjbby60fU/fXedHEt0I5Lg4KoOlxzkGtu2BZDJ0pvxhZdd8+Yex
	9IFgR9qvebPtpIPEtHWf8eebY1BN34ROGPbJvnbeqU57qmhXNN9Z825alAlcsIkFLRov
	2ten48lDk+C4hcwanD/rLk+uHigbdxB8w04N3pxznB3LO0xkn97ZX50OqCB8tt178M2B
	sn8Kz8Qt6XCqSh3qoDxZIs9iX0xM/7EhPdYnMBfsvXWqrsi0SXvoJgFsrXITwI7I9Ir6
	UELw==
X-Gm-Message-State: AFeK/H0zZkQ+NbH1X2sdAjfkL3mNZnZbWpBHyZ/AzAH55nA8uiVuPn5sGFCWPTiw1GWlpg==
X-Received: by 10.99.124.26 with SMTP id x26mr9812672pgc.81.1490372577334;
	Fri, 24 Mar 2017 09:22:57 -0700 (PDT)
Received: from akuster-ThinkPad-X240.mvista.com
	([2601:202:4001:9ea0:e3df:bf0a:9f90:498e])
	by smtp.gmail.com with ESMTPSA id
	o189sm5652384pga.12.2017.03.24.09.22.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Mar 2017 09:22:56 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 24 Mar 2017 09:22:55 -0700
Message-Id: <1490372575-16202-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] ntp: update to 4.2.8.p10
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Mar 2017 16:22:56 -0000

From: Armin Kuster <akuster@mvista.com>

LICENSE_FILE md5 changed do to copyright date change.

NTF's NTP Project is releasing ntp-4.2.8p10, which addresses:

    6 MEDIUM severity vulnerabilities (1 is about the Windows PPSAPI DLL)
    5 LOW severity vulnerabilities (2 are in the Windows Installer)
    4 Informational-level vulnerabilities

    15 other non-security fixes and improvements

All of the security issues in this release are listed in VU#633849.

ntp-4.2.8p10 was released on 21 March 2017.

Sec 3389 / CVE-2017-6464 / VU#325339: NTP-01-016 NTP: Denial of Service via Malformed Config (Pentest report 01.2017)
Sec 3388 / CVE-2017-6462 / VU#325339: NTP-01-014 NTP: Buffer Overflow in DPTS Clock (Pentest report 01.2017)
Sec 3387 / CVE-2017-6463 / VU#325339: NTP-01-012 NTP: Authenticated DoS via Malicious Config Option (Pentest report 01.2017)
Sec 3386: NTP-01-011 NTP: ntpq_stripquotes() returns incorrect Value (Pentest report 01.2017)
Sec 3385: NTP-01-010 NTP: ereallocarray()/eallocarray() underused (Pentest report 01.2017)
Sec 3384 / CVE-2017-6455 / VU#325339: NTP-01-009 NTP: Windows: Privileged execution of User Library code (Pentest report 01.2017)
Sec 3383 / CVE-2017-6452 / VU#325339: NTP-01-008 NTP: Windows Installer: Stack Buffer Overflow from Command Line (Pentest report 01.2017)
Sec 3382 / CVE-2017-6459 / VU#325339: NTP-01-007 NTP: Windows Installer: Data Structure terminated insufficiently (Pentest report 01.2017)
Sec 3381: NTP-01-006 NTP: Copious amounts of Unused Code (Pentest report 01.2017)
Sec 3380: NTP-01-005 NTP: Off-by-one in Oncore GPS Receiver (Pentest report 01.2017)
Sec 3379 / CVE-2017-6458 / VU#325339: NTP-01-004 NTP: Potential Overflows in ctl_put() functions (Pentest report 01.2017)
Sec 3378 / CVE-2017-6451 / VU#325339: NTP-01-003 Improper use of snprintf() in mx4200_send() (Pentest report 01.2017)
Sec 3377 / CVE-2017-6460 / VU#325339: NTP-01-002 Buffer Overflow in ntpq when fetching reslist (Pentest report 01.2017)
Sec 3376: NTP-01-001 Makefile does not enforce Security Flags (Pentest report 01.2017)
Sec 3361 / CVE-2016-9042 / VU#325339: 0rigin

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-support/ntp/{ntp_4.2.8p9.bb => ntp_4.2.8p10.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/ntp/{ntp_4.2.8p9.bb => ntp_4.2.8p10.bb} (96%)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p9.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p10.bb
similarity index 96%
rename from meta-networking/recipes-support/ntp/ntp_4.2.8p9.bb
rename to meta-networking/recipes-support/ntp/ntp_4.2.8p10.bb
index 58b31c5..719c60b 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p9.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p10.bb
@@ -6,7 +6,7 @@ or satellite receiver or modem."
 HOMEPAGE = "http://support.ntp.org"
 SECTION = "net"
 LICENSE = "NTP"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f41fedb22dffefcbfafecc85b0f79cfa"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=e877a1d567a6a58996d2b66e3e387003"
 
 DEPENDS = "libevent"
 
@@ -23,8 +23,8 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://ntpd.list \
 "
 
-SRC_URI[md5sum] = "857452b05f5f2e033786f77ade1974ed"
-SRC_URI[sha256sum] = "b724287778e1bac625b447327c9851eedef020517a3545625e9f652a90f30b72"
+SRC_URI[md5sum] = "745384ed0dedb3f66b33fe84d66466f9"
+SRC_URI[sha256sum] = "ddd2366e64219b9efa0f7438e06800d0db394ac5c88e13c17b70d0dcdf99b99f"
 
 inherit autotools update-rc.d useradd systemd pkgconfig
 
-- 
2.7.4


