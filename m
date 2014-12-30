Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id A500F72544
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Dec 2014 13:54:41 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id n3so24085915wiv.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Dec 2014 05:54:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1584saf3OdfUraCFzBoSuGRfAwx0cKZjXU2gUc73n74=;
	b=YzgvskAhm9f8XyllLNwdzMOImSZQV3YUZWs9uuVsUveogHpiCffImXmjzxjMJR3fyR
	NyJ8bxubxSw9F0Sh+tsIPQZshkr+jVANGqcs+iHGWS1u8IxcPxTEfgRaEShLPSlnwXQf
	BOoPCVgajkar+E9oZFN+VTdezNZrk7vARstEUnxDPwd8vsntLjc+nzLN7r6wHmX4uzyz
	Y71Kn+ThgQDwiZPCSXTgx4c79dbq+JL8cirqJelFFccTTRgC1dcP/VD7yZOoKSPAtlzA
	wBzHAwOrEkFGUHqBJvH3WRkNeN6gF/XbwdpFNGSVKwViw5Aa8zcQbLb5mgFFP0QG1a+D
	5SkQ==
X-Gm-Message-State: ALoCoQmjtC7qiXF64Ci894jIEnVcg4NtH1mqh0YYS5u+yd2skZFdn6OGx2YivkK0ZjMIfo3PMDzi
X-Received: by 10.194.185.243 with SMTP id
	ff19mr117570049wjc.126.1419947681701; 
	Tue, 30 Dec 2014 05:54:41 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	gb10sm28759925wjb.21.2014.12.30.05.54.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Dec 2014 05:54:40 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Dec 2014 13:53:32 +0000
Message-Id: <1419947615-27947-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1419947615-27947-1-git-send-email-ross.burton@intel.com>
References: <1419947615-27947-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/5] telepathy-glib: add (moving from oe-core)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Dec 2014 13:54:48 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../telepathy/telepathy-glib_0.24.0.bb                 |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.0.bb

diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.0.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.0.bb
new file mode 100644
index 0000000..6b8c20c
--- /dev/null
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Telepathy Framework glib-base helper library"
+DESCRIPTION = "Telepathy Framework: GLib-based helper library for connection managers"
+HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
+DEPENDS = "glib-2.0 dbus python-native-runtime dbus-native dbus-glib libxslt-native"
+LICENSE = "LGPLv2.1+"
+
+SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BP}.tar.gz"
+SRC_URI[md5sum] = "93c429e37750b25dcf8de86bb514664f"
+SRC_URI[sha256sum] = "ae0002134991217f42e503c43dea7817853afc18863b913744d51ffa029818cf"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
+
+inherit autotools pkgconfig gettext
+
+FILES_${PN} += "${datadir}/telepathy \
+                ${datadir}/dbus-1"
-- 
1.7.10.4


