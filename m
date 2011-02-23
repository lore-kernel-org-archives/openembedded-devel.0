Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PsETZ-0000tE-D3
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 14:09:53 +0100
Received: by gxk1 with SMTP id 1so3198453gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 05:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=3XAQ2kge9C87Za4KqB/1XkkxNcoMQtnnKsFeANGPZf8=;
	b=iD1isjwhPERM9opTGdClL722EujXOQ6VCOG8J+l+oh2MRaMAovUxjn3YtIQvuCWbWf
	0aHxYuAZLoV14JgPbWDTUsBBYIKhqi9mHD7SXVusBiYYzGJVHqKG3BZDxTscriSkZi3n
	PE0R58Xj3dXqEp1pwgN5rPQ4HOIpeSaz1X98Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=w2cTaBJRQzylRQ6jCy1V4877pRaHVJCLXWlZLlS4bMEbIbohUtYNphBiaEAxRXhZWQ
	n1URmz1BiCetRNl+LP/i2ZBkn3QYgielY1o6M1OpD/OQgIF5CiDSn3L4uAhYwGugGMKj
	8+F5QRGs7jJRuFCDVJkmOK5DssXmM6LPgNRFk=
Received: by 10.150.144.14 with SMTP id r14mr154ybd.28.1298466513557;
	Wed, 23 Feb 2011 05:08:33 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n10sm2276929yhb.38.2011.02.23.05.08.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Feb 2011 05:08:32 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Feb 2011 13:07:23 +0000
Message-Id: <1298466445-16486-13-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1298466445-16486-12-git-send-email-otavio@ossystems.com.br>
References: <1298466445-16486-1-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-2-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-3-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-4-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-5-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-6-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-7-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-8-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-9-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-10-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-11-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-12-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 12/14] libinih: readd without AUTOREV
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
X-List-Received-Date: Wed, 23 Feb 2011 13:09:53 -0000

This provides a C and C++ INI library that can be statically linked
into projects.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/libinih/libinih_git.bb |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libinih/libinih_git.bb

diff --git a/recipes/libinih/libinih_git.bb b/recipes/libinih/libinih_git.bb
new file mode 100644
index 0000000..3296471
--- /dev/null
+++ b/recipes/libinih/libinih_git.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "C and C++ INI Library"
+PRIORITY = "optional"
+PV = "0.0+gitr${SRCPV}"
+PKGV = "${GITPKGVTAG}"
+PR = "r1"
+LICENSE = "BSD"
+RDEPENDS_${PN}-dev = ""
+
+SRCREV = "53c81b2d5641551070947bd69ce4c23f17685804"
+SRC_URI = "git://projetos.ossystems.com.br/git/libinih.git;protocol=git"
+
+S = "${WORKDIR}/git"
+
+inherit gitpkgv cmake
-- 
1.7.2.3



