Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QMorb-00037i-O3
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 May 2011 00:05:07 +0200
Received: by fxm19 with SMTP id 19so1850159fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 May 2011 15:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=JUj5fM6D3pcH1yxy3aWruBwnNysq8so+EcpS2T3RvnE=;
	b=CXNS6VczhjXy5p6BXEPv21Rd5jI9Zxdg0uhFLs0MmE7Qxm0jc85BNXtEwGJM8jULGF
	SALPsInd8MfKCR78My7jsYhkMtN2jsU/gwMd7ak0DEwBkrEvccCTed/op+g039mVfQd2
	xzXVveNcHJELlo+VufERK2SqpBn7RXL3pDvfY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=o4keriVpReu6ewCy4dVUlDkdzrZ1yh0Mvzpm7eZ2rC0vV2Lt5YW+kxhvamC8ZLSX78
	kXQt6T2fqNr2NiDoYMrpxjNuWV65kyAMIbe8MtG7F6baaX7DUhSVeIYGnhfmCMVG7Exh
	JonzOqvpVLh/aOVSaSBi2ahR5rgTKjjf6TTHY=
Received: by 10.223.159.134 with SMTP id j6mr2969668fax.74.1305756132749;
	Wed, 18 May 2011 15:02:12 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id r10sm807548fah.34.2011.05.18.15.02.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 15:02:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 May 2011 00:02:06 +0200
Message-Id: <fd9505ebad0438d8c73f96cf0896fef9d060a315.1305755919.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <cover.1305755919.git.Martin.Jansa@gmail.com>
References: <cover.1305755919.git.Martin.Jansa@gmail.com>
Subject: [meta-efl 1/2] efl-from-svn.inc: import from meta-shr
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
X-List-Received-Date: Wed, 18 May 2011 22:05:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/conf/distro/include/efl-from-svn.inc |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 meta-efl/conf/distro/include/efl-from-svn.inc

diff --git a/meta-efl/conf/distro/include/efl-from-svn.inc b/meta-efl/conf/distro/include/efl-from-svn.inc
new file mode 100644
index 0000000..1bda8df
--- /dev/null
+++ b/meta-efl/conf/distro/include/efl-from-svn.inc
@@ -0,0 +1,17 @@
+EFL_PREFERRED_VERSION ?= "1.0.999%"
+PREFERRED_VERSION_ecore ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_ecore-native ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_edbus ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_edbus-native ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_edje ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_edje-native ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_eeze ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_eeze-native ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_efreet ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_efreet-native ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_eina ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_eina-native ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_embryo ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_embryo-native ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_evas ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_evas-native ?= "${EFL_PREFERRED_VERSION}"
-- 
1.7.5.rc3



