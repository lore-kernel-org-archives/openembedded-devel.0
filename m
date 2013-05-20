Received: from mail-gh0-f174.google.com ([209.85.160.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UeUnI-00030E-EJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 May 2013 20:26:56 +0200
Received: by mail-gh0-f174.google.com with SMTP id r17so1582762ghr.19
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2013 11:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=8cITAW5BY7aQr3oWm/QkuXjws7azCWgWfML8SVl3XTs=;
	b=B/e+M+MvmXDTxoGh8fLIuJCH44a1471kyAi2YMWdHKhLqMQfHJ5awvf6ce8bWsr/5j
	AoeTjiJ1HXEtF3fh74SmF9oL3uzCzaDP33+vAmqs/E6ZxaZDaAzUHKRg3OowJryGhp1c
	IiHErhwqJ658iT0v4dKyLwH5PlLsqydLWYH/n7zSIVQ3Q7SPOGDCV8T+nO/d/Vp6WDyY
	Vp0WyF8K6oRZGJvIyP4jpQh5PGntMbGn3rJ/wIG/EPbemfKVa1kt8Igka079ExZCfzhV
	OtIKQHhKDOrbZzWaysW0Gp9Y0XXhQ38LrqkcyYqq8ENDDJPjMTDpy9noJn3CWhz5jXZl
	Clnw==
X-Received: by 10.236.132.196 with SMTP id o44mr35986645yhi.37.1369073307345; 
	Mon, 20 May 2013 11:08:27 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.194.146])
	by mx.google.com with ESMTPSA id b70sm41660606yhm.3.2013.05.20.11.08.25
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 20 May 2013 11:08:26 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 20 May 2013 15:08:06 -0300
Message-Id: <1369073286-30260-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe PATCH v2] bigbuckbunny: Add 480p, 720p and 1080p movies
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
X-List-Received-Date: Mon, 20 May 2013 18:27:25 -0000

This provides a recipe to install the movies in the rootfs; these
allow for people to make demo images which carry the movies for show.

These recipes are based on Angstrom ones. Thanks by their base work.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Changes in v2:
- Move to meta-multimedia
- Use 'sample-content' as place holder directory

 .../sample-content/bigbuckbunny-1080p.bb                 | 16 ++++++++++++++++
 .../sample-content/bigbuckbunny-480p.bb                  | 16 ++++++++++++++++
 .../sample-content/bigbuckbunny-720p.bb                  | 16 ++++++++++++++++
 3 files changed, 48 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
 create mode 100644 meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
 create mode 100644 meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb

diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
new file mode 100644
index 0000000..93a52c0
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Big Buck Bunny movie - 1080P"
+LICENSE = "CC-BY"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/big_buck_bunny_1080p_surround.avi;md5=223991c8b33564eb77988a4c13c1c76a"
+
+SRC_URI = "http://download.blender.org/peach/bigbuckbunny_movies/big_buck_bunny_1080p_surround.avi"
+SRC_URI[md5sum] = "223991c8b33564eb77988a4c13c1c76a"
+SRC_URI[sha256sum] = "69fe2cfe7154a6e752688e3a0d7d6b07b1605bbaf75b56f6470dc7b4c20c06ea"
+
+inherit allarch
+
+do_install() {
+	install -d ${D}${datadir}/movies
+	install -m 0644 ${WORKDIR}/big_buck_bunny_1080p_surround.avi ${D}${datadir}/movies/
+}
+
+FILES_${PN} += "${datadir}/movies"
diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
new file mode 100644
index 0000000..31a90ca
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Big Buck Bunny movie - 480P"
+LICENSE = "CC-BY"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/big_buck_bunny_480p_surround-fix.avi;md5=ed7ed01e9aefba8ddd77c13332cec120"
+
+SRC_URI = "http://download.blender.org/peach/bigbuckbunny_movies/big_buck_bunny_480p_surround-fix.avi"
+SRC_URI[md5sum] = "ed7ed01e9aefba8ddd77c13332cec120"
+SRC_URI[sha256sum] = "40d1cf5bc8e1b0e55dac7bb2e3fbc2aea05b6679444864781299b24db044634f"
+
+inherit allarch
+
+do_install() {
+	install -d ${D}${datadir}/movies
+	install -m 0644 ${WORKDIR}/big_buck_bunny_480p_surround-fix.avi ${D}${datadir}/movies/
+}
+
+FILES_${PN} += "${datadir}/movies"
diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
new file mode 100644
index 0000000..61cdfdc
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Big Buck Bunny movie - 720P"
+LICENSE = "CC-BY"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/big_buck_bunny_720p_surround.avi;md5=0da8fe124595f5b206d64cb1400bbefc"
+
+SRC_URI = "http://download.blender.org/peach/bigbuckbunny_movies/big_buck_bunny_720p_surround.avi"
+SRC_URI[md5sum] = "0da8fe124595f5b206d64cb1400bbefc"
+SRC_URI[sha256sum] = "b957d6e6212638441b52d3b620af157cc8d40c2a0342669294854a06edcd528c"
+
+inherit allarch
+
+do_install() {
+	install -d ${D}${datadir}/movies
+	install -m 0644 ${WORKDIR}/big_buck_bunny_720p_surround.avi ${D}${datadir}/movies/
+}
+
+FILES_${PN} += "${datadir}/movies"
-- 
1.8.1



