Return-Path: <joe@deserted.net>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 60D907745B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 16:04:53 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id n68so5898450itn.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 08:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5tjYA+ObZrLEJGhLS3fISSiQXVWFwYz1+RJF48Ubi1s=;
	b=jnMdZ+Gm/Sk8xDF/cbwwQ8V6xq8IqZa/2fmVjQASoMHAosMOryuytSi1QO6DdYgXcP
	UJsa2nH8PQWMLkh3Mc0DokfEvctDRbynrjwwDD61snh8P7Z++SO9j1Mq/lKgE161qVBi
	tfqp8f0NTTn9tYH5Ths9IGoXxwXb2+6JJJm27gij+sGUVvkllb/QkL3ehrvPiJI3gnbV
	fuIKsxGA0qy3hOjsBKDVF3+7iS8soA1lNPTqWXhBtDxiqxgv3Myf7fT/Meq5a9m22+LQ
	FZ9lBjiQEeseZEgUepgv7TfiKsiiSopbUkAtfNm9GnUIrZv18+yrwzXzQDTRkC4AYRzS
	AQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=5tjYA+ObZrLEJGhLS3fISSiQXVWFwYz1+RJF48Ubi1s=;
	b=MMwtphD5HoQ9A4TpR8a6afB5dRpWT6fPTDH0jWnJZK/MOFe/O5W3SHU2bnUXvF6Ztd
	/3AabsGBRYalGumz3r7UCX8uPtZov7GqaaqlV+X55q15ABUBljfCn5nw8WZTg058TyOO
	GCn2oiuQ/vBQOPhQ8FTcI7LZEV+UoSwkCsy/Gzd702uSlv3ms53b2jXVLNbOjnvpp1hV
	dFxuKhuPB2NKW39jwt6Peym59obLPPi345WzhNEOewKEM24ReOp9Tp/wVK8cRRrQz8Wb
	upZ/qHCTVllQp6M9A1XHMjO9/cieesXiIlQ40WHzihLuyGHkoxNfcuKb3m0NotNumvgx
	4toA==
X-Gm-Message-State: AKaTC007dyj5J0kSFjZyBGfSh5SVegj8BEZZ5tkP2GxuswnSFHAyAoAJbpE2834lchPjSA==
X-Received: by 10.36.204.9 with SMTP id x9mr9434246itf.123.1481990695384;
	Sat, 17 Dec 2016 08:04:55 -0800 (PST)
Received: from mir.deserted.net (23-233-31-74.cpe.pppoe.ca. [23.233.31.74])
	by smtp.gmail.com with ESMTPSA id
	c36sm3371303itd.18.2016.12.17.08.04.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 17 Dec 2016 08:04:54 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Dec 2016 11:04:56 -0500
Message-Id: <1481990698-15962-9-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1481990698-15962-1-git-send-email-joe_macdonald@mentor.com>
References: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
	<1481990698-15962-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 08/10] samba: move /etc/sysconfig to more common /etc/default, package tmpfiles.d in samba-common
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
X-List-Received-Date: Sat, 17 Dec 2016 16:04:54 -0000

From: Andreas Oberritter <obi@opendreambox.org>

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index b8d7141..76f97cf 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -109,7 +109,9 @@ do_install_append() {
 
     install -d ${D}${systemd_system_unitdir}
     install -m 0644 packaging/systemd/*.service ${D}${systemd_system_unitdir}
-    sed -i 's,\(ExecReload=\).*\(/kill\),\1${base_bindir}\2,' ${D}${systemd_system_unitdir}/*.service
+    sed -e 's,\(ExecReload=\).*\(/kill\),\1${base_bindir}\2,' \
+        -e 's,/etc/sysconfig/samba,${sysconfdir}/default/samba,' \
+        -i ${D}${systemd_system_unitdir}/*.service
 
     install -d ${D}${sysconfdir}/tmpfiles.d
     install -m644 packaging/systemd/samba.conf.tmp ${D}${sysconfdir}/tmpfiles.d/samba.conf
@@ -134,8 +136,8 @@ do_install_append() {
     install -m644 packaging/LSB/smb.conf ${D}${sysconfdir}/samba/smb.conf
     install -D -m 644 ${WORKDIR}/volatiles.03_samba ${D}${sysconfdir}/default/volatiles/03_samba
 
-    install -d ${D}${sysconfdir}/sysconfig/
-    install -m644 packaging/systemd/samba.sysconfig ${D}${sysconfdir}/sysconfig/samba
+    install -d ${D}${sysconfdir}/default
+    install -m644 packaging/systemd/samba.sysconfig ${D}${sysconfdir}/default/samba
 
     # install ctdb config file and test cases
     install -D -m 0644 ${S}/ctdb/tests/onnode/nodes ${D}${sysconfdir}/ctdb/nodes
@@ -203,6 +205,7 @@ FILES_${PN}-ctdb-tests = "${bindir}/ctdb_run_tests \
 
 FILES_${BPN}-common = "${sysconfdir}/default \
                        ${sysconfdir}/samba \
+                       ${sysconfdir}/tmpfiles.d \
 "
 
 FILES_${PN} += "${libdir}/vfs/*.so \
-- 
1.9.1


