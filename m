Return-Path: <psaavedra@igalia.com>
X-Greylist: delayed 698 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 30 May 2018 22:03:37 UTC
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 0BA9A748AA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 22:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Message-Id:Date:Subject:To:From;
	bh=UZbHbZQy/+7Rn6WopYI8UF2tECjixPAh/R5y0EzULbk=; 
	b=RwA2rOHexFjNRvlIcrsskDvRyi5ng6hA6DeqGnAzsptE14Yg+7wUxiG5ZRcYWPipSdoVzAbxu75Yfq1LLQ1CbP/6ubczoSRxecPv9Cnxc5fJuz0Z3i1ee2Khl2tozXSibN0iKj+IqnS6REUWe3JHKTLeO7I8I2lMvQlMVuoZkw8NM34did+6ih6RIFz4/Ks/qvU55nUx7Qy6ekWHWo6peE1RgqBToyHW1fCxnGVtGMuVktFP5SsAT066lm76YWBkLo+SuXo5ErFLVBbF93dqsvl4gI2qAYoUgtapZj5SdhNJUuU+c6VcH7w/0iK9sYsWvi02oW9byshy5X+JE6GPcw==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim) id 1fO90g-0007OY-Hb
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 23:51:58 +0200
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 May 2018 23:51:50 +0200
Message-Id: <20180530215150.94182-1-psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-networking][PATCH] Fixed an install error in Samba with LSB distros
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
X-List-Received-Date: Wed, 30 May 2018 22:03:38 -0000

An error in the Samba installation occurs with distros LSB:

    install: cannot stat 'packaging/LSB/samba.sh': No such
    file or directory
    exit 1 from 'install -m 0755 packaging/LSB/samba.sh

LSB packaging directory was removed in Samba 4.7:

  commit 0a23cde8efea06f81c6d34227b71dab627cc87b9
  Author: Andreas Schneider <asn@samba.org>
  Date:   Tue May 9 15:48:09 2017 +0200

      packaging: Remove LSB packaging

      This hasn't been touched since 2001.

      Signed-off-by: Andreas Schneider <asn@samba.org>
      Reviewed-by: David Disseldorp <ddiss@samba.org>

This patch removes the conditional 'if' and uses always
compatible sysv script.

Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
---
 .../recipes-connectivity/samba/samba_4.7.6.bb       | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.7.6.bb b/meta-networking/recipes-connectivity/samba/samba_4.7.6.bb
index a8517c541..e711e58d0 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.7.6.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.7.6.bb
@@ -150,19 +150,14 @@ do_install_append() {
     install -m644 packaging/systemd/samba.conf.tmp ${D}${sysconfdir}/tmpfiles.d/samba.conf
     echo "d ${localstatedir}/log/samba 0755 root root -" \
         >> ${D}${sysconfdir}/tmpfiles.d/samba.conf
-    if [ "${LSB}" = "lsb" ]; then
-        install -d ${D}${sysconfdir}/init.d
-        install -m 0755 packaging/LSB/samba.sh ${D}${sysconfdir}/init.d/samba
-    else
-        install -d ${D}${sysconfdir}/init.d
-        install -m 0755 packaging/sysv/samba.init ${D}${sysconfdir}/init.d/samba
-        sed -e 's,/opt/samba/bin,${sbindir},g' \
-            -e 's,/opt/samba/smb.conf,${sysconfdir}/samba/smb.conf,g' \
-            -e 's,/opt/samba/log,${localstatedir}/log/samba,g' \
-            -e 's,/etc/init.d/samba.server,${sysconfdir}/init.d/samba,g' \
-            -e 's,/usr/bin,${base_bindir},g' \
-            -i ${D}${sysconfdir}/init.d/samba
-    fi
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0755 packaging/sysv/samba.init ${D}${sysconfdir}/init.d/samba
+    sed -e 's,/opt/samba/bin,${sbindir},g' \
+        -e 's,/opt/samba/smb.conf,${sysconfdir}/samba/smb.conf,g' \
+        -e 's,/opt/samba/log,${localstatedir}/log/samba,g' \
+        -e 's,/etc/init.d/samba.server,${sysconfdir}/init.d/samba,g' \
+        -e 's,/usr/bin,${base_bindir},g' \
+        -i ${D}${sysconfdir}/init.d/samba
 
     install -d ${D}${sysconfdir}/samba
     echo "127.0.0.1 localhost" > ${D}${sysconfdir}/samba/lmhosts
-- 
2.11.0


