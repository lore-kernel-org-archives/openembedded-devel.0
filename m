Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0625B60797
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Aug 2016 03:13:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10308410"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Aug 2016 11:13:28 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 38FFD4334C80
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Aug 2016 11:13:26 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 26 Aug 2016 11:13:26 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 25 Aug 2016 23:13:21 -0400
Message-ID: <1472181201-1921-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: 38FFD4334C80.A4469
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] openvpn: 2.3.8 -> 2.3.9
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
X-List-Received-Date: Fri, 26 Aug 2016 03:13:29 -0000
Content-Type: text/plain

1) Upgrade openvpn from 2.3.8 to 2.3.9.
2) Modify EXTRA_OECONF, Since the Changelog in the new version shows: 
    Remove --enable-password-save option
    Reflect enable-password-save change in documentation
    Also remove second instance of enable-password-save in the man page
3) Fix the Warning:
    WARNING: openvpn-2.3.9-r0 do_configure: QA Issue: openvpn: configure was passed unrecognised options: --enable-password-save [unknown-configure-option]

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../recipes-support/openvpn/{openvpn_2.3.8.bb => openvpn_2.3.9.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.3.8.bb => openvpn_2.3.9.bb} (93%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.3.8.bb b/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb
similarity index 93%
rename from meta-networking/recipes-support/openvpn/openvpn_2.3.8.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb
index de2348e..a3ef765 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.3.8.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/openvpn-${PV}.tar.gz \
            file://openvpn@.service \
            file://openvpn-volatile.conf"
 
-SRC_URI[md5sum] = "51d996f1f1fc30f501ae251a254effeb"
-SRC_URI[sha256sum] = "532435eff61c14b44a583f27b72f93e7864e96c95fe51134ec0ad4b1b1107c51"
+SRC_URI[md5sum] = "265755044ae88f9249d509f6d061f7e5"
+SRC_URI[sha256sum] = "2c12fe9ea641ac1291e70322cc500641c84e5903dd4f40bf2eda7e9f209b2f9c"
 
 SYSTEMD_SERVICE_${PN} += "openvpn@loopback-server.service openvpn@loopback-client.service"
 SYSTEMD_AUTO_ENABLE = "disable"
@@ -21,7 +21,7 @@ SYSTEMD_AUTO_ENABLE = "disable"
 CFLAGS += "-fno-inline"
 
 # I want openvpn to be able to read password from file (hrw)
-EXTRA_OECONF += "--enable-password-save --enable-iproute2"
+EXTRA_OECONF += "--enable-iproute2"
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '', '--disable-plugin-auth-pam', d)}"
 
 # Explicitly specify IPROUTE to bypass the configure-time check for /sbin/ip on the host.
-- 
2.7.4




