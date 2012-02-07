Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rumqm-0001JN-C4
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:20:56 +0100
Received: by eekd41 with SMTP id d41so2181069eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=QhBFZ58AwqBgRm/ma/9OuGM0w5CPVSFqBjNOCCKvOl4=;
	b=ugy3oqR34+Uvuw8MwzCEJcm0fcC6Jbc98C2kD3K56G6hE0YVK7EgKtcIanA8LPz8Z3
	lNDJU5o2bKFknlDH9WLzA9d6/QE0r8sHVfN4q42ZQKaZZVJ2I53HrwPH/3izIxMW3cGB
	GGLwGzbgF5RbHjthvbLsxC+tpzJAev0P3ia08=
Received: by 10.14.100.142 with SMTP id z14mr7272599eef.58.1328627574287;
	Tue, 07 Feb 2012 07:12:54 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n58sm1424741een.10.2012.02.07.07.12.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:12:53 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Feb 2012 16:12:28 +0100
Message-Id: <1328627573-5217-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][RFC 02/27] initmanager.bbclass: inital add
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
X-List-Received-Date: Tue, 07 Feb 2012 15:20:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

initmanager_packets(d): returns the required initmanager-packets. The result
is based upon INIT_MANAGER. Currently the values 'systemd' and 'sysvinit' are
supported for INIT_MANAGER.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/classes/initmanager.bbclass |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/classes/initmanager.bbclass

diff --git a/meta-oe/classes/initmanager.bbclass b/meta-oe/classes/initmanager.bbclass
new file mode 100644
index 0000000..2f8e2ce
--- /dev/null
+++ b/meta-oe/classes/initmanager.bbclass
@@ -0,0 +1,10 @@
+# returns the packets initmanager requires in image
+def initmanager_packets(d):
+	init_manager = d.getVar('INIT_MANAGER', 0) or ""
+	# default: just a suggestion - to be discussed?
+	pks_initmanager = 'systemd'
+	if init_manager == 'systemd':
+		pks_initmanager = 'systemd'
+	elif init_manager == 'sysvinit':
+		pks_initmanager = 'sysvinit sysvinit-pidof'
+	return pks_initmanager
-- 
1.7.6.4



