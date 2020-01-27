Return-Path: <prvs=288f39d4d=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id CA60B7FD6C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 11:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1580124326; x=1611660326;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=+QpFnjgLz/4iXzQoq/QtUucm+7bhByrfkjY0cWDZfdY=;
	b=n/HFzJhVTDQnLVeG7lPIGAab4qMPqsm8/wG5eUOU9hq+afXPJb8ZAPjo
	rVEA6YrlIeSH1JJzhRXOWKda12zyQqS85g9f8EB66JRTOl2v39TKMo9n7
	i6T7EwEDGmSJzfzSvmXA8v74ZW8TM/X3QHSLyWzu8dhe9Kl1h0Tpy/nKX
	u2aNxT6Vzc9jaQvOQuWq4h9O2QLSDoTVy5mmtKKT4TCTriIMz8HJq7nCw
	gsHnSNGquOw/n0ZY8UIm3rZ0ftin1TF+dH5XRM0DmWwA+g4WRWX5n3VLD
	GyDXg4NenjcCb6iKtlG6wox51IHIPOwB7PzhdJHlpJMFpS8md54luEFHt A==;
IronPort-SDR: /2bq9OyBNZke0G9Detc/OuHFQ65GuI4ddD7oeqx58X/Dj5W7TNQy5sQI1rtuxiJUcGPv8W5NzF
	4dBqneAInDcWw35oHXhReonu1D2fBLG8MJLJ7Ie2T0I1UjbXKjdZiCba92YJIkP1TsV6NPWwsC
	jWuCGjPg7YLp7HstWJCaB3FJFFJLB2KMSdD/P60UJk0oDzyXlSQbxXkOwofY0GTBL/SUwZJDE9
	vOGFDNqQHATH3X/bbzgU2ZGPCWT0Eqyr/ggrI9Kh7VaW1OHqCvAWGLetItAy7f/p1/31hPacwn
	YEQ=
X-IronPort-AV: E=Sophos;i="5.70,369,1574118000"; d="scan'208";a="22275561"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 27 Jan 2020 12:24:49 +0100
Message-ID: <20200127112451.165555-3-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200127112451.165555-1-richard.leitner@skidata.com>
References: <20200127112451.165555-1-richard.leitner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH 2/4] docs: add update8checksums.sh and mention it in UPDATING.md
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
X-List-Received-Date: Mon, 27 Jan 2020 11:25:25 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The update8checksums.sh script updates the openjdk8 source archive
checksums in the corresponding .inc files.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 docs/UPDATING.md         |  6 ++--
 docs/update8checksums.sh | 64 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+), 4 deletions(-)
 create mode 100755 docs/update8checksums.sh

diff --git a/docs/UPDATING.md b/docs/UPDATING.md
index a08cf02..87d4bf1 100644
--- a/docs/UPDATING.md
+++ b/docs/UPDATING.md
@@ -7,10 +7,8 @@
      curl -s https://hg.openjdk.java.net/aarch32-port/jdk8u/tags | grep "jdk8u.*ga-aarch32-"
 4. Adapt the CHANGESET_ID for aarch64 based on:
      curl -s https://hg.openjdk.java.net/aarch64-port/jdk8u-shenandoah/tags | grep "aarch64-shenandoah-jdk8u.*-"
-5. Adapt checksums in
-   * openjdk-8-release.inc
-   * openjdk-8-release-aarch32.inc
-   * openjdk-8-release-aarch64.inc
+5. Adapt source archive checksums by executing the script
+     ./docs/update8checksums.sh
 6. Check if any patch got upstreamed (and remove if so)
 7. Re-apply all other patches and format them again
     for git: git format-patch --src-prefix=a/y/ --dst-prefix=b/y/ -n --start-number=x jdk8uXXX-ga
diff --git a/docs/update8checksums.sh b/docs/update8checksums.sh
new file mode 100755
index 0000000..476841b
--- /dev/null
+++ b/docs/update8checksums.sh
@@ -0,0 +1,64 @@
+#!/bin/bash
+#
+# quick-hack-script for updating the openjdk 8 source archive checksums
+#
+#set -x
+set -e
+
+function updateChecksums() {
+	echo "updating ${ARCH} checksums..."
+	for repo in ${REPOS}; do
+		repoDL="/${repo}"
+		[ "${repo}" == "openjdk" ] && repoDL=""
+		echo -n "   ${ARCH}/${repo}."
+		wget -q "${BASEURL}${repoDL}/archive/${TAG}.tar.bz2" -O "${tmpfile}"
+		echo -n "."
+		md5="$(md5sum "${tmpfile}" | cut -d " " -f1)"
+		echo -n "."
+		sha="$(sha256sum "${tmpfile}" | cut -d " " -f1)"
+		echo -n "."
+		sed -i "s|^SRC_URI\\[${repo}.md5sum\\].*\$|SRC_URI\\[${repo}.md5sum\\]    = \\\"${md5}\\\"|g" "${INCFILE}"
+		sed -i "s|^SRC_URI\\[${repo}.sha256sum\\].*\$|SRC_URI\\[${repo}.sha256sum\\] = \\\"${sha}\\\"|g" "${INCFILE}"
+		echo " done"
+	done
+}
+
+REPOS="corba hotspot jaxp jaxws jdk langtools nashorn openjdk"
+OPENJDK_UPDATE="$(basename "$(ls -1 recipes-core/openjdk/openjdk-8_*.bb)" | cut -d _ -f2 | cut -d . -f1)"
+
+COMMON_BASEURL="https://hg.openjdk.java.net/jdk8u/jdk8u"
+COMMON_TAG="jdk8u${OPENJDK_UPDATE}-ga"
+
+AARCH32_BASEURL="https://hg.openjdk.java.net/aarch32-port/jdk8u"
+AARCH32_CHANGESET_ID="$(grep "^CHANGESET_ID" recipes-core/openjdk/openjdk-8-release-aarch32.inc | cut -d= -f2 | tr -d \")"
+AARCH32_TAG="jdk8u${OPENJDK_UPDATE}-ga-aarch32-${AARCH32_CHANGESET_ID}"
+
+AARCH64_BASEURL="https://hg.openjdk.java.net/aarch64-port/jdk8u-shenandoah"
+AARCH64_CHANGESET_ID="$(grep "^CHANGESET_ID" recipes-core/openjdk/openjdk-8-release-aarch64.inc | cut -d= -f2 | tr -d \")"
+AARCH64_TAG="aarch64-shenandoah-jdk8u${OPENJDK_UPDATE}-${AARCH64_CHANGESET_ID}"
+
+echo "meta-java openjdk8 source archive checksum update script"
+
+tmpfile="$(mktemp)"
+
+ARCH="common"
+BASEURL="${COMMON_BASEURL}"
+TAG="${COMMON_TAG}"
+INCFILE="recipes-core/openjdk/openjdk-8-release.inc"
+updateChecksums
+
+ARCH="aarch32"
+BASEURL="${AARCH32_BASEURL}"
+TAG="${AARCH32_TAG}"
+INCFILE="recipes-core/openjdk/openjdk-8-release-aarch32.inc"
+updateChecksums
+
+ARCH="aarch64"
+BASEURL="${AARCH64_BASEURL}"
+TAG="${AARCH64_TAG}"
+INCFILE="recipes-core/openjdk/openjdk-8-release-aarch64.inc"
+updateChecksums
+
+rm -f "${tmpfile}"
+
+echo "SUCCESS"
-- 
2.24.1


