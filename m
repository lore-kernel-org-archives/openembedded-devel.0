Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QFb7n-0005b7-3D
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Apr 2011 01:59:59 +0200
Received: by pvc30 with SMTP id 30so2138514pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2011 16:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=N2gELWUQO8EL+BcfzE8ruw/dLwFAf+quZRdID86N4yA=;
	b=rt/uS6jcAqV+KEU8v26QbcuptkzBvyb8rT7fTqe2bhKmV1hgP4e8wmC2Ed9lbi0Mgt
	4ByuS8NCEhe7AKMk2rgelcCAM00Y5O+AUSzx3mWp8ZclSy7WqbKfA4wa34fPQaPDKSWg
	+uCA1GIsn1opmr2b7BXuxeaSiJDZxioT6NUeA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Z6BKS24Q5z0d5LpEkoZs8ed4X/7de8w+a+OOAhReqchT2NUCz0tj9To7k3aurURPXS
	+pBs/cFY5zboWB2l7DnZ6N5i+cM9oJ1023d3TdimrgDdVI8D8LmdWEIuIzUFPqDLOwye
	XodPl/vyzvc37QolpfQIabTZWw6PPCToGdGAo=
Received: by 10.142.204.20 with SMTP id b20mr1398744wfg.217.1304035045602;
	Thu, 28 Apr 2011 16:57:25 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id k7sm2440301wfa.14.2011.04.28.16.57.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Apr 2011 16:57:24 -0700 (PDT)
From: raj.khem@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Apr 2011 16:57:16 -0700
Message-Id: <1304035036-10111-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [meta-oe][PATCH] tzdata, tzcode: Update 2011e -> 2011g
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
X-List-Received-Date: Thu, 28 Apr 2011 23:59:59 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...code-native_2011e.bb => tzcode-native_2011g.bb} |   11 ++++++-----
 .../tzdata/{tzdata_2011e.bb => tzdata_2011g.bb}    |    5 ++---
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-extended/tzcode/{tzcode-native_2011e.bb => tzcode-native_2011g.bb} (56%)
 rename meta-oe/recipes-extended/tzdata/{tzdata_2011e.bb => tzdata_2011g.bb} (71%)

diff --git a/meta-oe/recipes-extended/tzcode/tzcode-native_2011e.bb b/meta-oe/recipes-extended/tzcode/tzcode-native_2011g.bb
similarity index 56%
rename from meta-oe/recipes-extended/tzcode/tzcode-native_2011e.bb
rename to meta-oe/recipes-extended/tzcode/tzcode-native_2011g.bb
index 280840c..d32ee33 100644
--- a/meta-oe/recipes-extended/tzcode/tzcode-native_2011e.bb
+++ b/meta-oe/recipes-extended/tzcode/tzcode-native_2011g.bb
@@ -9,11 +9,12 @@ LIC_FILES_CHKSUM = "file://README;md5=3ae8198f82258417ce29066d3b034035"
 # Also, tzdata (and it is needed to build tzcode) version can differ from
 # tzcode version, thus this variable
 
-TZDATA_PV = "2011e"
+TZDATA_PV = "${PV}"
 
 PR = "${INC_PR}.0"
 
-SRC_URI[tzcode-2011e.md5sum] = "fbfc05dbf9ebcfe7c4bba18549870173"
-SRC_URI[tzcode-2011e.sha256sum] = "8fb00f8763aa51d83d6f3190d144124bb7176ca829fc08823d6205297bf0426b"
-SRC_URI[tzdata-2011e.md5sum] = "044a07072300a0ee72b046e5a9a4ec90"
-SRC_URI[tzdata-2011e.sha256sum] = "44fef01de4589a4979eb6b5fdbbfd21a3b135852af1ecbfb9e0368ae47392c79"
+SRC_URI[tzcode-2011g.md5sum] = "ecb564279b28c5b184421c525d997d6c"
+SRC_URI[tzcode-2011g.sha256sum] = "636c735d8df1276cc8ab88bc31bb36a21f91ed34e26d181303ecd8fe48021bc2"
+SRC_URI[tzdata-2011g.md5sum] = "a068c27e7e426fdb12ab0c88506df20d"
+SRC_URI[tzdata-2011g.sha256sum] = "01a2a189eeda63baacc5e68e6c13afffc7edce182102fffc53acbf35e8703d3c"
+
diff --git a/meta-oe/recipes-extended/tzdata/tzdata_2011e.bb b/meta-oe/recipes-extended/tzdata/tzdata_2011g.bb
similarity index 71%
rename from meta-oe/recipes-extended/tzdata/tzdata_2011e.bb
rename to meta-oe/recipes-extended/tzdata/tzdata_2011g.bb
index c0f5291..6863b5a 100644
--- a/meta-oe/recipes-extended/tzdata/tzdata_2011e.bb
+++ b/meta-oe/recipes-extended/tzdata/tzdata_2011g.bb
@@ -8,6 +8,5 @@ LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=06468c0e84ef4d4c97045a
 # just bump it to the latest available version, removing the old one
 
 PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "044a07072300a0ee72b046e5a9a4ec90"
-SRC_URI[sha256sum] = "44fef01de4589a4979eb6b5fdbbfd21a3b135852af1ecbfb9e0368ae47392c79"
+SRC_URI[md5sum] = "a068c27e7e426fdb12ab0c88506df20d"
+SRC_URI[sha256sum] = "01a2a189eeda63baacc5e68e6c13afffc7edce182102fffc53acbf35e8703d3c"
-- 
1.7.4.1



