Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id C5EAC7FCB0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2019 21:03:34 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y11so21031368wrt.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2019 13:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ae9+Vm5txGQET0ARn7hHi13UuFo36NaUv/XlRVkNXqw=;
	b=J/SNf3uJrqbSt0DbPVhwrWhHqfgyR60+Xr5jotz+52Wo1gGh1RlCXL5XO6d7Z6hY1N
	nD7sfZdOH6YaMrzfQAo7XAPYu1fN/LrPk9tKv+uqk8yUHJItgoy6HiI3761ujuccTmI2
	mrG75wvjxhKTgKR7myEy/koYt3FU72Qp6NhCuumMrFFq/agikBff+jskn/tQN7w/4SY+
	oWLUASNoiBjINy+9LMHdWAa49GoG2Izh/BYfK8x6pdniuMb01cJ+/VVIXX+LNEjjzwsV
	ish7uaOkrvJVHrq6vNKWMIjveYIcwpAafDgDPQXv4F/2r+wEVuTtb8qOuQzILh+ROlwX
	WruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ae9+Vm5txGQET0ARn7hHi13UuFo36NaUv/XlRVkNXqw=;
	b=QNmvG/VLaWpf1DcjnUh++nV8odTMZOawWJ+zhGT5xQqCMgNv1LrFgY74QOVJifc7C8
	dnABXI3yM14tl5bDoE41mZAUc9PwC1l6e8mbTn88ekXF2s7Zqdl5OWrKux7CJfMqCI31
	tAixLl2RDA5kbjbewXXxKuEi/aHpLEzVuPFIrGK25gjEbHlGKTW7eETJy6BeIZdor60o
	2+kELdJ4bQtnMAuDJR4WUVfCA5d8kPs3ZrdGDZQJG//cKB00eZx80uH3wCRGbuaQ7OM8
	ElQTKalP7gYLoM/9I+6Lr7ckA4YqBSWY8eV9QfqjQUl236Zz2pqbkjgOCGsJN+lXxpx0
	J1eA==
X-Gm-Message-State: APjAAAVck0ZLzCkjwa+5WTyy+8nsG4f50089Xs9JknJ9ytrbV30TbcF9
	m/LZQsWGz1aTeOwA/51urtGXtIp76l0=
X-Google-Smtp-Source: APXvYqxJn8Rn+CoOb3y0Zc/9z9bypui1J8+AIxg+NbuFpGl4GotyzGm9jGTafNYu+HqPv0UKA7iQSQ==
X-Received: by 2002:a5d:534b:: with SMTP id t11mr1062451wrv.120.1574802215149; 
	Tue, 26 Nov 2019 13:03:35 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id f1sm15550478wru.6.2019.11.26.13.03.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 26 Nov 2019 13:03:34 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Nov 2019 21:03:32 +0000
Message-Id: <20191126210332.15738-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] jack: upgrade to 1.19.14
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
X-List-Received-Date: Tue, 26 Nov 2019 21:03:35 -0000
Content-Transfer-Encoding: 8bit

Notable because it uses Python 3 for the Waf scripts.

Delete jack_control if DBus isn't enabled, as this tool uses DBus to communicate
with the server and shouldn't be installed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../jack/{jack_git.bb => jack_1.19.14.bb}            | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-multimedia/jack/{jack_git.bb => jack_1.19.14.bb} (87%)

diff --git a/meta-oe/recipes-multimedia/jack/jack_git.bb b/meta-oe/recipes-multimedia/jack/jack_1.19.14.bb
similarity index 87%
rename from meta-oe/recipes-multimedia/jack/jack_git.bb
rename to meta-oe/recipes-multimedia/jack/jack_1.19.14.bb
index 9f7d5b0b61..cebc952661 100644
--- a/meta-oe/recipes-multimedia/jack/jack_git.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_1.19.14.bb
@@ -15,8 +15,8 @@ LIC_FILES_CHKSUM = " \
 DEPENDS = "libsamplerate0 libsndfile1 readline"
 
 SRC_URI = "git://github.com/jackaudio/jack2.git"
-SRCREV = "37250ff470277f9947fbf3ba738f943053e30525"
-PV = "1.9.13"
+SRCREV = "b54a09bf7ef760d81fdb8544ad10e45575394624"
+
 S = "${WORKDIR}/git"
 
 inherit waf pkgconfig
@@ -30,6 +30,12 @@ PACKAGECONFIG[opus] = "--opus=yes,--opus=no,libopus"
 # portaudio is for windows builds only
 EXTRA_OECONF = "--portaudio=no"
 
+do_install_append() {
+	if ! ${@bb.utils.contains('PACKAGECONFIG', 'dbus', True, False, d)}; then
+		rm -f ${D}${bindir}/jack_control
+	fi
+}
+
 PACKAGES =+ "libjack jack-server jack-utils"
 
 RDEPENDS_jack-dev_remove = "${PN} (= ${EXTENDPKGV})"
@@ -42,4 +48,4 @@ FILES_jack-server = " \
 "
 FILES_jack-utils = "${bindir}/*"
 
-FILES_${PN}-doc += " ${datadir}/jack-audio-connection-kit/reference/html/* "
+FILES_${PN}-doc += " ${datadir}/jack-audio-connection-kit/reference/html/*"
-- 
2.20.1


