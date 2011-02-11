Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Po0sd-0003Kz-95
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 22:50:19 +0100
Received: by bwz10 with SMTP id 10so3469035bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 13:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=qqRQkmbC+NEw5nZ5bYpivFubx+IcvKd4blYShyTrZg8=;
	b=Xr/ZI76+9WjIt+gDYnNlpP2aQD16JIIBZ1eKhZohoIXw8qXJ3v2R5Sy+dU60RDFq6w
	qSH5O/KtWW7BM0qkWMu0szySmakBCQzC4pa2Arj8rNqMr06Lh2HeMcvRtCSJSLzez3l3
	nXtWGqNlgaqBjaUXrH4n5vKK29KqlSjHzzJlk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=tY9UWtd0FB2/wl7nA37rSxOv4MfXcO+SoBjIcMq/Jpxc63KG6JLB/pr+knKfRkZ6BR
	8wkEYABbW9qXvy6EgNSBKxe1fd8ajXMV4N9hmKOFmNkEWnIi1UtQKPI35WGiflsIFHya
	gwwydkRQqAvQv8hYhpu9d02UpioUSZ5+NAMSc=
Received: by 10.204.119.75 with SMTP id y11mr950516bkq.18.1297460953257;
	Fri, 11 Feb 2011 13:49:13 -0800 (PST)
Received: from localhost.localdomain ([188.165.206.204])
	by mx.google.com with ESMTPS id v25sm796794bkt.18.2011.02.11.13.49.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Feb 2011 13:49:12 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Feb 2011 22:49:01 +0100
Message-Id: <1297460941-5797-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] dpkg: add perl modules package
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
X-List-Received-Date: Fri, 11 Feb 2011 21:50:19 -0000

dpkg contains of perl modules as well, we need to provide these for
example for update-alternatives.

Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
---
 recipes/dpkg/dpkg.inc |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/recipes/dpkg/dpkg.inc b/recipes/dpkg/dpkg.inc
index 133eff3..06c269a 100644
--- a/recipes/dpkg/dpkg.inc
+++ b/recipes/dpkg/dpkg.inc
@@ -10,7 +10,11 @@ S = "${WORKDIR}/dpkg-${PV}"
 
 DEPENDS_${PN} += "update-alternatives"
 
-RDEPENDS_${PN} += "perl perl-module-base perl-module-carp perl-module-cwd perl-module-english perl-module-exporter perl-module-exporter-heavy perl-module-fcntl perl-module-file-spec-unix perl-module-file-temp perl-module-io perl-module-io-handle perl-module-posix perl-module-strict perl-module-vars perl-module-warnings perl-module-warnings-register perl-module-autoloader perl-module-config perl-module-constant perl-module-errno perl-module-file-basename perl-module-file-path perl-module-file-spec perl-module-overload perl-module-selectsaver perl-module-symbol perl-module-xsloader"
+RDEPENDS_${PN} += "perl perl-module-base perl-module-carp perl-module-cwd perl-module-english perl-module-exporter perl-module-exporter-heavy perl-module-fcntl perl-module-file-spec-unix perl-module-file-temp perl-module-io perl-module-io-handle perl-module-posix perl-module-strict perl-module-vars perl-module-warnings perl-module-warnings-register perl-module-autoloader perl-module-config perl-module-constant perl-module-errno perl-module-file-basename perl-module-file-path perl-module-file-spec perl-module-overload perl-module-selectsaver perl-module-symbol perl-module-xsloader ${PN}-perl"
+
+PACKAGES += "${PN}-perl"
+
+FILES_${PN}-perl = "${libdir}"
 
 PARALLEL_MAKE = ""
 
-- 
1.7.1



