Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9734C606D0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 12:54:25 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id q128so2076635wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 05:54:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=TRVNFrODj+ubyRmiBu0eHXP51SGEUc70lYfHf9WxL5Q=;
	b=Bugxl4kipdyhn4+pqblGeWi4BPLiEt/pk1re1XUHZTQkUjEyVkjfuVE/0MkUXhYKj/
	e+hnzhuKL9KAEzRtMlWjV3PV7DIEUe7Tb24MCyQpdge3a0C4o4kNh3OipXgzlasXR1fR
	ZWhOFSpa5deuHhEVEIyaClMVdFiLDSB/T+JfXSPE5fh04AzrUNgEbDzfy0Ee5zYmbFvm
	xtkjzNU7Re0qcdX1sDt4m+ESaz/iSohItyYIQoUvg0hDAsXYSY87fqZMg7+H9LHNwzp0
	Wu5h8gVbF0Me4TUd6twg4EVxuV997I/VC+cEHtE84Cp7eitUvOWXr21qJDNwZviW3cKk
	B+xA==
X-Gm-Message-State: ALyK8tJacrkLY/18doqt8kOMmGCxU2/S8RjvOeqwDR2Skhl4xjUvN03JCUE7WRQHH/Q3cg==
X-Received: by 10.28.157.214 with SMTP id g205mr4027146wme.34.1468587265355;
	Fri, 15 Jul 2016 05:54:25 -0700 (PDT)
Received: from tfsielt31850.TYCOFS.COM ([185.46.212.59])
	by smtp.gmail.com with ESMTPSA id f4sm59861wmf.8.2016.07.15.05.54.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jul 2016 05:54:24 -0700 (PDT)
From: git@andred.net
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jul 2016 13:54:21 +0100
Message-Id: <1468587261-18160-2-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1468587261-18160-1-git-send-email-git@andred.net>
References: <1468587261-18160-1-git-send-email-git@andred.net>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/2] meta-networking: override SECURITY_CFLAGS for c-ares
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
X-List-Received-Date: Fri, 15 Jul 2016 12:54:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

c-ares doesn't build if the distro has enabled usage of the
security_flags.inc file as it is picky about what is placed
into CPPFLAGS and CFLAGS. It complains and errors out if any
preprocessor options appear in CFLAGS.

Fix this by providing an additional include file that is
require'd from conf/layer.conf.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 .../conf/distro/include/meta_networking_security_flags.inc          | 6 ++++++
 meta-networking/conf/layer.conf                                     | 3 +++
 2 files changed, 9 insertions(+)
 create mode 100644 meta-networking/conf/distro/include/meta_networking_security_flags.inc

diff --git a/meta-networking/conf/distro/include/meta_networking_security_flags.inc b/meta-networking/conf/distro/include/meta_networking_security_flags.inc
new file mode 100644
index 0000000..06802d6
--- /dev/null
+++ b/meta-networking/conf/distro/include/meta_networking_security_flags.inc
@@ -0,0 +1,6 @@
+# configure righteously complains:
+# | configure:3479: using CFLAGS:  -O2 -pipe -g -feliminate-unused-debug-types -fstack-protector-strong -pie -fpie -D_FORTIFY_SOURCE=2
+# | configure:3485: CFLAGS error: CFLAGS may only be used to specify C compiler flags, not macro definitions. Use CPPFLAGS for: -D_FORTIFY_SOURCE=2
+# | configure:3516: error: Can not continue. Fix errors mentioned immediately above this line.
+TARGET_CFLAGS_remove_pn-c-ares = "${lcl_maybe_fortify}"
+TARGET_CPPFLAGS_append_pn-c-ares = "${lcl_maybe_fortify}"
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index 5fd636a..c09ba4a 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -21,3 +21,6 @@ LICENSE_PATH += "${LAYERDIR}/licenses"
 
 # used by waf-samba.bbclass
 WAF_CROSS_ANSWERS_PATH = "${LAYERDIR}/files/waf-cross-answers"
+
+# Override security flags
+require conf/distro/include/meta_networking_security_flags.inc
-- 
2.8.1


