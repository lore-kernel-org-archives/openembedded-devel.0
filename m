Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QCRif-0007JP-4p
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 09:21:01 +0200
Received: by mail-ey0-f175.google.com with SMTP id 27so129283eye.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 00:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=7KqhFFNGMS783AuxgMcj+VIDoyTndYZ4XLluqsPJGHM=;
	b=hn89kDmnIqSv8gwHuubIERY2p1mGgCKw8kyj8La0MQJxVQhHrDYzwqWriWFE7lCdmT
	4QcWRh+5/p2ZUsZqEb6As1yo7WIe9YVqr1vYqg6vJiXk+0rpFdMj9bYFYT/DyJpTQ/Lx
	L/sE6aqJOQE+zasQZzHdMYEgBgK5AZs6zTdUc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=e9MPy2fY9t/nxePNgvz41OBJNrfjczwHY3UZ0yVNKcd6NCRoRDGJ89EDPxvKqlnLIH
	3OlsoIOzG7GIib3O96RQlW2PXc+o//SvDw0s7Q7wvsT6XCB6GfSCodzDF7G2psU2qwXu
	xp9U0oQMJbHPLrrK7bxy6asnVeBtvEpEcFhYI=
Received: by 10.213.0.202 with SMTP id 10mr2860482ebc.79.1303283920584;
	Wed, 20 Apr 2011 00:18:40 -0700 (PDT)
Received: from localhost.localdomain ([62.218.44.194])
	by mx.google.com with ESMTPS id y7sm451338eeh.7.2011.04.20.00.18.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Apr 2011 00:18:39 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Apr 2011 09:18:31 +0200
Message-Id: <12f5ec3eb914530ef9a14ce31a21500bc25cd2c7.1303283391.git.michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1303283391.git.michael.lippautz@gmail.com>
References: <cover.1303283391.git.michael.lippautz@gmail.com>
Subject: [meta-oe 3/6] eventlog: Clean recipe and upgrade to 0.2.12
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
X-List-Received-Date: Wed, 20 Apr 2011 07:21:01 -0000

* Added LIC_FILES_CHKSUM
* Move to version 0.2.12

Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 .../recipes-support/eventlog/eventlog_0.2.12.bb    |   11 +++++++++++
 meta-oe/recipes-support/eventlog/eventlog_0.2.5.bb |   10 ----------
 2 files changed, 11 insertions(+), 10 deletions(-)
 create mode 100644 meta-oe/recipes-support/eventlog/eventlog_0.2.12.bb
 delete mode 100644 meta-oe/recipes-support/eventlog/eventlog_0.2.5.bb

diff --git a/meta-oe/recipes-support/eventlog/eventlog_0.2.12.bb b/meta-oe/recipes-support/eventlog/eventlog_0.2.12.bb
new file mode 100644
index 0000000..3683901
--- /dev/null
+++ b/meta-oe/recipes-support/eventlog/eventlog_0.2.12.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Replacement syslog API"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b8ba8e77bcda9a53fac0fe39fe957767"
+PR = "r1"
+
+SRC_URI = "http://www.balabit.com/downloads/files/syslog-ng/sources/3.2.2/source/${PN}_${PV}.tar.gz"
+
+inherit autotools pkgconfig
+
+SRC_URI[md5sum] = "f9c32814f78ea2629850f0440de5ff34"
+SRC_URI[sha256sum] = "f78c218faa6b6b378f25c640a5d1188b1ecbd57d3a527432263fd44b17bbd1c9"
diff --git a/meta-oe/recipes-support/eventlog/eventlog_0.2.5.bb b/meta-oe/recipes-support/eventlog/eventlog_0.2.5.bb
deleted file mode 100644
index 9dfa402..0000000
--- a/meta-oe/recipes-support/eventlog/eventlog_0.2.5.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "Replacement syslog API"
-LICENSE = "BSD"
-PR = "r1"
-
-SRC_URI = "http://www.balabit.com/downloads/files/eventlog/0.2/${P}.tar.gz"
-
-inherit autotools pkgconfig
-
-SRC_URI[md5sum] = "a6bdba91f88540cc69b398fd138d86cd"
-SRC_URI[sha256sum] = "914319726bcd01a4055b1c5e09671085875af6de2b0d8589841916139574ee11"
-- 
1.7.3.4



