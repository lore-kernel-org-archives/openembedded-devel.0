Received: from mail-da0-f44.google.com ([209.85.210.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UCVif-00007j-Ac
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Mar 2013 14:46:26 +0100
Received: by mail-da0-f44.google.com with SMTP id z20so2548699dae.17
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Mar 2013 05:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=RTeWurYi7kzrJOFmwLKWxCP4twOgGDTGQ/vMxLNfyIs=;
	b=vwJQ6KIRAhHRT6qxiLG6RVOLfgjC/qKQ8YGuYQ9j/dTXhcsAP4pQ9w5gxuqo+5uIQw
	Ke/8XN629b3tm3Xr75U2yP4IqpKKbtOAuJhnLIsidC3mt5W0qTIqkl0mcvHALExQ7S+8
	OA4fZ7zwEEmXy2MYZVirSMyH1ApNyqrhNb/pwKXm7bLqHjHbg8BgImr21xjkXWov3K7s
	PDJXPZ6zzLnm16o9jL1coKFKujjejtt6OTfQnCnw4Ulij1c46oUzlXM7h8oAqq2fa7ME
	dS/jDfHfrJsdP/eQHqj72V7U7aJ99Isy6lawqot55o/PDgdcO5L9F70hdSrdJgG1Jhyu
	kSRQ==
X-Received: by 10.66.120.200 with SMTP id le8mr32470124pab.23.1362403792885;
	Mon, 04 Mar 2013 05:29:52 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id hp7sm22350001pbc.8.2013.03.04.05.29.48
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Mar 2013 05:29:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Mar 2013 14:29:39 +0100
Message-Id: <1362403779-1653-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH] meta-systemd: restore wpa-supplicant bbappend
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Mar 2013 13:46:27 -0000

* systemd support in oe-core does not work for everybody
---
 .../wpa-supplicant/wpa-supplicant_2.0.bbappend            | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend

diff --git a/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend
new file mode 100644
index 0000000..609a1f3
--- /dev/null
+++ b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bbappend
@@ -0,0 +1,15 @@
+PRINC := "${@int(PRINC) + 2}"
+
+inherit systemd
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "wpa_supplicant.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
+do_install_append () {
+    install -d ${D}${systemd_unitdir}/system
+    install -m 644 ${S}/systemd/*.service ${D}${systemd_unitdir}/system
+}
+
+# systemd.bbclass does not catch all multiple-instance-service-files
+FILES_${PN}-systemd += "${systemd_unitdir}/system/"
-- 
1.8.1.5



