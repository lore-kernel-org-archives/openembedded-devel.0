Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AFEE1606BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Feb 2015 09:36:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t149an1F002778
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 4 Feb 2015 01:36:49 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 4 Feb 2015 01:36:48 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 4 Feb 2015 17:33:32 +0800
Message-ID: <1423042412-17651-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking] iscsi-initiator-utils: fix SELinux label for initiatorname.iscsi
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Feb 2015 09:36:56 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

* /etc/iscsi/initiatorname.iscsi: etc_runtime_t -> etc_t

This config file was created by postinstall or initscript, fix SELinux
label for it to remove:

  avc: denied { read } for pid=6094 comm="iscsid" \
  name="initiatorname.iscsi" dev="sda3" ino=1057846 \
  scontext=system_u:system_r:iscsid_t:s0-s15:c0.c1023 \
  tcontext=system_u:object_r:etc_runtime_t:s0 tclass=file

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../recipes-daemons/iscsi-initiator-utils/files/initd.debian          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/initd.debian b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/initd.debian
index 99a7638..43fb348 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/initd.debian
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/initd.debian
@@ -39,6 +39,10 @@ start() {
 InitiatorName=$INITIATORNAME
 EOF
 	fi
+
+	# Fix label for /etc/iscsi/initiatorname.iscsi if SELinux was enabled
+	test ! -x /sbin/restorecon || /sbin/restorecon -F /etc/iscsi/initiatorname.iscsi
+
 	start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON
 	RETVAL=$?
 	starttargets
-- 
1.9.1


