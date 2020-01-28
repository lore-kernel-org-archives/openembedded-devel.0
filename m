Return-Path: <prvs=28964afd6=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 0B1C57F79E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 05:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1580188975; x=1611724975;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=+QpFnjgLz/4iXzQoq/QtUucm+7bhByrfkjY0cWDZfdY=;
	b=J+bcphpiPxho8NXPTQS2EKAXBUd2X4huFwSjT7hOow4EzI16TVQpPTZf
	kv1baZad5SQkszqs0BuDefM4tHslbzUsdCLD/5502wQoduReDOf4+X8Bw
	Yo78FMZbSvNUpMxw5KFltisDTWaZmM2LWc9j34HMGi0Aj3KncBxda59RX
	dYiCviaRaDb0XsKx6unf6I29RpjboWbLvlrCzxjoADBTq+3IHIEF2MB2k
	QCDegCfCYMLVpYAUSqtku3/Pt4Jauhe+whou80vtl9l9mLZc8thavEe7e
	QkK6K9AKWNFyn0O+ImB8TwOfqz1x6+eckMIvltWHHOpgWvmH2AbHBbQ5/ g==;
IronPort-SDR: ZUKwLZIisfFc7aDkxYAapEF7UwpK14PprxmrJ+plP0CbBs0L5LjcrvjVL7437TA3TIpFtAbGja
	bQvkPIbXi9Ors918dxqoUZm9zo1d+voDZIADxFMQ0fWjVZ84VJXIlylDDNd/az4zXDYsC7FPAd
	CsmsA24iiXqwQTC66+7h7hOEebXmiplaTPoizGydo3RobEfAA/xQ315bfnXeOaZPktoa+okY7I
	+pz0Um/PtrIcwix+N5kOHnhULq22OgWeBrz9U922HTB+4EA81lhfoXyUJo0YAGoFTDZPZ2yFVY
	2ck=
X-IronPort-AV: E=Sophos;i="5.70,372,1574118000"; 
   d="scan'208";a="2502116"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Jan 2020 06:22:23 +0100
Message-ID: <20200128052225.2455848-3-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200128052225.2455848-1-richard.leitner@skidata.com>
References: <20200128052225.2455848-1-richard.leitner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH v2 2/4] docs: add update8checksums.sh and mention it in UPDATING.md
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
X-List-Received-Date: Tue, 28 Jan 2020 05:22:54 -0000
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


