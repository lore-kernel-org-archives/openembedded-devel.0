Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S3gnj-0001KF-H1
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Mar 2012 05:42:35 +0100
Received: by yhjj56 with SMTP id j56so1079680yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Mar 2012 20:34:03 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.236.76.198 as permitted sender) client-ip=10.236.76.198; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.236.76.198 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.236.76.198])
	by 10.236.76.198 with SMTP id b46mr17190311yhe.25.1330749243517
	(num_hops = 1); Fri, 02 Mar 2012 20:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=sj4H3yjj94CpcsPPq69a5v6LP1vWhixu6jD4+QVNodg=;
	b=fyu+WxWlMuApDAr86c9k/ClYc+Lh8QnlIClQz4u6I1JqwQNvCHjwCSdIXpB3rB0OCY
	dI3KyXQh+Pnikk89+Je3I+9BPUHNlgGwizDymcY2peaczzmCu7CnenXMHN5b1ijOSfXT
	7WhLtsjKEXmTYPyuTbJvuQvzTjbU6mCxxIX2doYW8KzVbH5Q02SfzhYHn3/ETaYbldkm
	1wDcXcGK/swg7Cgojh7CucKVLtZ5hzo11YKuAQJTzfGRG4nAnE8l5c3zALGqe5b2B0vi
	PJ5il+Rc6KSHzZFJOlnw9GHeKUXOjIevpdhZCXPkmN59qLGqF4+j/dXznjkOrgAoMm21
	hQBg==
Received: by 10.236.76.198 with SMTP id b46mr13655113yhe.25.1330749243458;
	Fri, 02 Mar 2012 20:34:03 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id 34sm12651999anu.6.2012.03.02.20.34.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Mar 2012 20:34:02 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 Mar 2012 04:33:54 +0000
Message-Id: <405a0c3dbd45bd3877a5a80c2add9b463045c97c.1330749219.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1330749219.git.otavio@ossystems.com.br>
References: <cover.1330749219.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 1/1] atftp: fix atftpd's systemd service
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
X-List-Received-Date: Sat, 03 Mar 2012 04:42:35 -0000

The atftpd do not create the pid file and systemd sends a SIGTERM to
it if the pid file cannot be found.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-extended/atftp/atftp_0.7.bb        |    2 +-
 .../recipes-extended/atftp/files/atftpd.service    |    1 -
 2 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/atftp/atftp_0.7.bb b/meta-oe/recipes-extended/atftp/atftp_0.7.bb
index 6bd44a0..1af4b63 100644
--- a/meta-oe/recipes-extended/atftp/atftp_0.7.bb
+++ b/meta-oe/recipes-extended/atftp/atftp_0.7.bb
@@ -3,7 +3,7 @@ SECTION = "network"
 HOMEPAGE = "http://packages.debian.org/atftp"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94d55d512a9ba36caa9b7df079bae19f"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/a/atftp/atftp_${PV}.dfsg.orig.tar.gz;name=archive \
            ${DEBIAN_MIRROR}/main/a/atftp/atftp_${PV}.dfsg-11.diff.gz;name=patch \
diff --git a/meta-oe/recipes-extended/atftp/files/atftpd.service b/meta-oe/recipes-extended/atftp/files/atftpd.service
index c7aa29c..480bc70 100644
--- a/meta-oe/recipes-extended/atftp/files/atftpd.service
+++ b/meta-oe/recipes-extended/atftp/files/atftpd.service
@@ -4,7 +4,6 @@ After=syslog.target network.target
 
 [Service]
 Type=forking
-PIDFile=/var/run/atftpd.pid
 ExecStart=/usr/sbin/atftpd --daemon --port 69
 
 [Install]
-- 
1.7.2.5



