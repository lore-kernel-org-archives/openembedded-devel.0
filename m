Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1DFC37404A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 12:36:32 +0000 (UTC)
Received: by wicnd19 with SMTP id nd19so162758196wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 05:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=/AlRVeynBAWb0FuFk9YaeBMHieW8XUUzAAbx22AQyRA=;
	b=NMBuPD/AaJ9ZRpMOgg5CBs1eRsKCL9SUm0XpvlcbiHwZvlngzl+GZOPtYqyqvdaumn
	7OywVPSWm4viLfCoWM9V3eIhWw6B8A+m9II5IGQADKuZ50e8D5Vioow3C6Rzi9XB3FHC
	6w0VuaJoaGmyAKMaqeXyzFA7Bm5QvmBqN+Ik47/fPJ2Bm+dcowXGMAVu7s6tpQZpqmP2
	cjTNzheN2NBPI86pyNAMvpkhkMRHipuWuQIzamFZjTNqWU8oJWCq64GuSFXhvS54sYQV
	V4iNQskn8nc+IsOMPDTRYILQkolSD8KxQ2f/+eYXufm9Lrkikk3nnNzc9PFurQPOz2JD
	oRdQ==
X-Received: by 10.180.106.73 with SMTP id gs9mr5291886wib.1.1435235793675;
	Thu, 25 Jun 2015 05:36:33 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-55.hsi15.unitymediagroup.de. [95.222.156.55])
	by mx.google.com with ESMTPSA id
	pg1sm45655780wjb.39.2015.06.25.05.36.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Jun 2015 05:36:32 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Jun 2015 14:35:52 +0200
Message-Id: <1435235754-7339-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1435235754-7339-1-git-send-email-schnitzeltony@googlemail.com>
References: <1435235754-7339-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] xfce4-session: ensure ip for machine is found by adding to hosts
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
X-List-Received-Date: Thu, 25 Jun 2015 12:36:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This fixes very ugly behaviour: Starting applications e.g xfce4-terminal
can delay for minutes in case network is connected.

There was a similar approach implemented for xfce4-session but this was removed
in

commit f54d3a506fef603d8d0c538d1d69a6597152c169
Author: Ash Charles <ashcharles@gmail.com>
Date:   Mon Feb 23 08:40:53 2015 -0800

    xfce4-session: Remove unneeded pkg_postinst

    The pkg_postinst inherited from previous versions of this recipe no
    longer seems necessary; no error message seen at runtime in a quick
    test.  As it made the generated packages unnecessarily
    machine-specific, remove this post-install step. Based on the ensuring
    discussion, this supersedes the original patch [1].

    [1] http://lists.openembedded.org/pipermail/openembedded-devel/2015-February/100454.html

    Signed-off-by: Ash Charles <ashcharles@gmail.com>
    Tested-by: Andreas Müller <schnitzeltony@googlemail.com>
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Unfortuantely my tests for that patch only checked for the messagebox:

| Could not look up internet address for <hostname>
| This will prevent Xfce from operating correctly.
| It may be possible to correct the problem by adding
| <hostname> to the file /etc/hosts on your system.

For unknown reasons this messagebox is not created but the hint is still
extremely valid.

To avoid making 'xfce4-session' machine specific an extra meta-recipe
'machine-host' was created on which 'xfce4-session' rdepends.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/xfce4-session/machine-host.bb    | 17 +++++++++++++++++
 .../recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb  |  2 ++
 2 files changed, 19 insertions(+)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-session/machine-host.bb

diff --git a/meta-xfce/recipes-xfce/xfce4-session/machine-host.bb b/meta-xfce/recipes-xfce/xfce4-session/machine-host.bb
new file mode 100644
index 0000000..03bd205
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-session/machine-host.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Meta package adding machine name to known hosts"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+
+ALLOW_EMPTY_${PN} = "1"
+
+LOCALHOSTMACHINE = "127.0.0.1    ${MACHINE}"
+
+# on some machines starting applications as xfce4-terminal take ages without
+# machine name in hosts
+pkg_postinst_${PN} () {
+if ! grep -q '${LOCALHOSTMACHINE}' $D/etc/hosts ; then
+    echo '${LOCALHOSTMACHINE}' >> $D/etc/hosts
+fi
+}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb
index 81c56cc..215aec3 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb
@@ -26,3 +26,5 @@ FILES_${PN} += " \
 "
 
 FILES_${PN}-dbg += "${libdir}/xfce4/*/*/.debug"
+
+RDEPENDS_${PN} += "machine-host"
-- 
1.9.3


