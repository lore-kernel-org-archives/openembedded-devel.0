Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ECC1C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 20:20:18 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.1959.1645129217475780991
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Feb 2022 12:20:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UYUFzfxv;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id v4so6686044pjh.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Feb 2022 12:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VJJxcZopui2VXjBayAcH193nc76lCInDP65ZqNY6alo=;
        b=UYUFzfxvhPfNLRW8TI78vHwZnHzygGXWoL8AFPJDI2DBzpa2tJjTBBSbz6AdBwUbp2
         Q0cwNMQzJlgC4e1SQYbwbb4Xj7n8JY82eJcB8qwXK8i2UtH2FKvnE9CA9QOKl3XyWtuR
         gs/QbEw5Pb4Wn+AoKJ3QlmhhA3G+2lXa3WjXPgaoLIhd0PPaDaEyoKRzZMRSiR9nkUPd
         d/t7t4XliHO6h5y30ic9HxaLhazrz0bBOIXLIeLOroQb9gKEa911O8yIiSSy8X9ZEQ0q
         UTyl8AhfLiS5V4Z0CRJ6Z4FXnp9L93H/il6mwahlZ777KE7he0hq7aQtUEw+vG30TnGI
         /9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VJJxcZopui2VXjBayAcH193nc76lCInDP65ZqNY6alo=;
        b=7peWgLc658jtFBDUlTUKIjW9MgP+98T+RzLIV/Awvbxc6NX7MUWEUXMDAtEC6xFQqd
         zqGpHDvN1vi3FK+xFeqob8R75qDsh2xy+qwUGoG/ekP52sEbEwZHXm4Qyh6tfZqADk/q
         1pHwXcLhE9yDKNTWL21al3BN+alkrYl635E91ju1DrnMAQcxMMlWW+Ond+yp4XKgSY38
         deeNYLQhqyHjtdSdy4/bpe83x9wAcKULZYRImlZPlPPlSHPn/s0TpzUoXQH99x+Sgx9a
         puPQ9ncad6CubI1VG+YejNSZzQEhLJRZr3InxiT1qRty8nBOONvXL4vgN716qX6ZAxN8
         wiGQ==
X-Gm-Message-State: AOAM531nY1PqS2XCZlkPlZeynjbmmB2bjok+XoejdTdXWJCgoEx14U6t
	e6bTwOi+qPW+f8cvFn1AwfcHJt9Qg68cTw==
X-Google-Smtp-Source: 
 ABdhPJziVlSZYtZHK3khHzK+ZRWqqeopAFjgQOe2iFWgDZ/rE0uJHmha59Ybh+JYSxG1r01iZkQKHg==
X-Received: by 2002:a17:902:bd45:b0:14d:98e5:9899 with SMTP id
 b5-20020a170902bd4500b0014d98e59899mr4306091plx.79.1645129216663;
        Thu, 17 Feb 2022 12:20:16 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 e16sm390171pfd.214.2022.02.17.12.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 12:20:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] recipe: Use new CVE_CHECK_IGNORE variable
Date: Thu, 17 Feb 2022 12:20:13 -0800
Message-Id: <20220217202013.2490806-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Feb 2022 20:20:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95361

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-initramfs/recipes-devtools/dracut/dracut_055.bb            | 2 +-
 meta-networking/recipes-connectivity/samba/samba_4.14.12.bb     | 2 +-
 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb | 2 +-
 meta-networking/recipes-protocols/mdns/mdns_1310.140.1.bb       | 2 +-
 meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb       | 2 +-
 meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb             | 2 +-
 meta-networking/recipes-support/openvpn/openvpn_2.5.5.bb        | 2 +-
 meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb       | 2 +-
 meta-oe/recipes-support/nss/nss_3.74.bb                         | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_055.bb b/meta-initramfs/recipes-devtools/dracut/dracut_055.bb
index 91514b8409..3eee6669a3 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_055.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_055.bb
@@ -67,4 +67,4 @@ RRECOMMENDS:${PN} = " \
                     "
 
 # CVE-2010-4176 affects only Fedora
-CVE_CHECK_WHITELIST += "CVE-2010-4176"
+CVE_CHECK_IGNORE += "CVE-2010-4176"
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.12.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.12.bb
index 5be4d2d51e..1fd30ad8af 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.12.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.12.bb
@@ -38,7 +38,7 @@ UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.14(\.\d+)+).tar.gz"
 inherit systemd waf-samba cpan-base perlnative update-rc.d perl-version pkgconfig
 
 # CVE-2011-2411 is valnerble only on HP NonStop Servers.
-CVE_CHECK_WHITELIST += "CVE-2011-2411" 
+CVE_CHECK_IGNORE += "CVE-2011-2411" 
 
 # remove default added RDEPENDS on perl
 RDEPENDS:${PN}:remove = "perl"
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
index 7a6243b10b..43b69f7a21 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
@@ -98,4 +98,4 @@ FILES:${PN}-staticdev += "${libdir}/sasl2/*.a"
 INSANE_SKIP:${PN} += "dev-so"
 
 # CVE-2020-8032 affects only openSUSE
-CVE_CHECK_WHITELIST += "CVE-2020-8032"
+CVE_CHECK_IGNORE += "CVE-2020-8032"
diff --git a/meta-networking/recipes-protocols/mdns/mdns_1310.140.1.bb b/meta-networking/recipes-protocols/mdns/mdns_1310.140.1.bb
index 5c6d220200..205dc929be 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_1310.140.1.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_1310.140.1.bb
@@ -38,7 +38,7 @@ CVE_PRODUCT = "apple:mdnsresponder"
 # https://www.incibe-cert.es/en/early-warning/vulnerabilities/cve-2007-0613
 # https://security-tracker.debian.org/tracker/CVE-2007-0613
 # https://vulmon.com/vulnerabilitydetails?qid=CVE-2007-0613
-CVE_CHECK_WHITELIST += "CVE-2007-0613"
+CVE_CHECK_IGNORE += "CVE-2007-0613"
 
 PARALLEL_MAKE = ""
 
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb b/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
index 464f622502..1017f16add 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
@@ -74,4 +74,4 @@ FILES:${PN}-dev += "${libdir}/dovecot/libdovecot*.so"
 FILES:${PN}-dbg += "${libdir}/dovecot/*/.debug"
 
 # CVE-2016-4983 affects only postinstall script on specific distribution
-CVE_CHECK_WHITELIST += "CVE-2016-4983"
+CVE_CHECK_IGNORE += "CVE-2016-4983"
diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
index 4a719ae9c8..fe2bd0773c 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
@@ -29,7 +29,7 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
 SRC_URI[sha256sum] = "f65840deab68614d5d7ceb2d0bb9304ff70dcdedd09abb79754a87536b849c19"
 
 # CVE-2016-9312 is only for windows.
-CVE_CHECK_WHITELIST += "CVE-2016-9312"
+CVE_CHECK_IGNORE += "CVE-2016-9312"
 
 inherit autotools update-rc.d useradd systemd pkgconfig
 
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.5.5.bb b/meta-networking/recipes-support/openvpn/openvpn_2.5.5.bb
index 2dc3af6bf9..6c4514eb90 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.5.5.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.5.bb
@@ -17,7 +17,7 @@ UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 SRC_URI[sha256sum] = "7500df4734173bce2e95b5039079119dacaff121650b2b6ca76d2dc68bdac1c5"
 
 # CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client, not for openvpn.
-CVE_CHECK_WHITELIST += "CVE-2020-7224 CVE-2020-27569"
+CVE_CHECK_IGNORE += "CVE-2020-7224 CVE-2020-27569"
 
 SYSTEMD_SERVICE:${PN} += "openvpn@loopback-server.service openvpn@loopback-client.service"
 SYSTEMD_AUTO_ENABLE = "disable"
diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
index 06bb971541..bf74f1229f 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
@@ -17,7 +17,7 @@ SRCREV = "a9a295fecf3fbd5a4f571f53b01f63202a3e2113"
 SRC_URI = "git://github.com/google/flatbuffers.git;branch=master;protocol=https"
 S = "${WORKDIR}/git"
 
-CVE_CHECK_WHITELIST += "CVE-2020-35864"
+CVE_CHECK_IGNORE += "CVE-2020-35864"
 
 CXXFLAGS += "-fPIC"
 BUILD_CXXFLAGS += "-fPIC"
diff --git a/meta-oe/recipes-support/nss/nss_3.74.bb b/meta-oe/recipes-support/nss/nss_3.74.bb
index c93f7caeb2..8d40e2c939 100644
--- a/meta-oe/recipes-support/nss/nss_3.74.bb
+++ b/meta-oe/recipes-support/nss/nss_3.74.bb
@@ -281,4 +281,4 @@ RDEPENDS:${PN}-smime = "perl"
 BBCLASSEXTEND = "native nativesdk"
 
 # CVE-2006-5201 affects only Sun Solaris
-CVE_CHECK_WHITELIST += "CVE-2006-5201"
+CVE_CHECK_IGNORE += "CVE-2006-5201"
-- 
2.35.1


