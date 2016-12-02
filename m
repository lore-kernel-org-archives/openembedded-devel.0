Return-Path: <meerkoetter@googlemail.com>
Received: from mail-wj0-f196.google.com (mail-wj0-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 167B66057A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Dec 2016 19:34:19 +0000 (UTC)
Received: by mail-wj0-f196.google.com with SMTP id xy5so31465946wjc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2016 11:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=YeSzk1SNM46XK8Ng9OJq0pRIZug62hciAZduzNKZC9k=;
	b=0apKtZW/WW3VRYu650WzrpMmycppzLfv1G9+IQ1wGlsUpwIcMiJP1VfvmrvRsWuRwU
	wOoMBeQAoU6CEIdlt5EbO/5foBiS42kHdh17+vDmMy+ixx+YPPQQLVMWOFp4iNXNq9Ky
	ViGHu5EY2GITPUGD3I7pYHNOt0e91cTEx2J7t6hgEJBZzRI0Y8hRejnL/hEeLOEgs5Hx
	zAIX4tgj6ZmM6/Dhd1raK4fUrrAHaBtIIZ3iD/Ep1+Xx/YplJsHG9q98NH23YddbRxBW
	yieMXeYuwlzLgu8nph+qKRUvUaMuDscAdShNDbPNyFuZR+NobAcxYMIOZ0sRl15edmKQ
	Dblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YeSzk1SNM46XK8Ng9OJq0pRIZug62hciAZduzNKZC9k=;
	b=jfU7XdRyvi4SvbMYUCPUIHeQMAlCvTssY1YvkgI0ESUrHI+mWygQF0DxFQlLuPTHG/
	QMbJMCeRQgZipJwxlUZYf6UnBx6fhbz13/z0A+muQ9mVmhbw9Cp0VwQ8vEOet7vsnbL8
	SLsaYGi2pwI9H5ZnF6kRqWFdKqODXtx2mGPvwUyrFlTLF+rNtabHxBN1rIS1IGV80OpM
	wbMlXwQqHaWHFmX874iyuvKDEOTSvZKP5x0D8CnuysJwcrdpreVdkaX+FA3rCHesewTt
	UqOVFlyrs4bMfieM9xM0+JyX5lEG9qjgDFFstc5VZ6rCcC/kja2/16iRSr0WD34WABF3
	BYdA==
X-Gm-Message-State: AKaTC03aQKLAHWI3d1fym9BvysJ2iJ87LdKLCXZuir9QpF9PS8cd6ItwMjfXC7f9j6H6nA==
X-Received: by 10.194.26.170 with SMTP id m10mr39759682wjg.152.1480707260400; 
	Fri, 02 Dec 2016 11:34:20 -0800 (PST)
Received: from naos.fritz.box
	(p20030071EF356500557AE35AFB271A47.dip0.t-ipconnect.de.
	[2003:71:ef35:6500:557a:e35a:fb27:1a47])
	by smtp.gmail.com with ESMTPSA id
	k11sm4709794wmb.18.2016.12.02.11.34.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 02 Dec 2016 11:34:19 -0800 (PST)
From: Frank Meerkoetter <meerkoetter@googlemail.com>
X-Google-Original-From: Frank Meerkoetter <frank@meerkoetter.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Dec 2016 20:33:59 +0100
Message-Id: <1480707239-32294-1-git-send-email-frank@meerkoetter.org>
X-Mailer: git-send-email 2.7.4
Cc: Frank Meerkoetter <frank@meerkoetter.org>
Subject: [meta-oe][PATCH] rrdtool: split out rrdcached into a package of its own
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
X-List-Received-Date: Fri, 02 Dec 2016 19:34:20 -0000

rrdcached is a caching daemon for rrdtool. It's typically
used in large installations. Small embedded systems might
not use it at all. Splitting it out allows a systems builder
to remove a daemon process running as root.

Signed-off-by: Frank Meerkoetter <frank@meerkoetter.org>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb
index 09aac4d..f168c16 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb
@@ -19,7 +19,8 @@ inherit cpan autotools-brokensep gettext pythonnative python-dir systemd
 
 BBCLASSEXTEND = "native"
 
-SYSTEMD_SERVICE_${PN} = "rrdcached.socket rrdcached.service"
+SYSTEMD_PACKAGES = "rrdcached"
+SYSTEMD_SERVICE_rrdcached = "rrdcached.socket rrdcached.service"
 
 EXTRA_AUTORECONF = "-I m4"
 
@@ -99,6 +100,14 @@ do_configure() {
 }
 
 PACKAGES =+ "${PN}-perl ${PN}-python"
+PACKAGES =+ "rrdcached"
+
+DESCRIPTION_rrdcached = \
+"The rrdcached package contains the data caching daemon for RRDtool."
+
+FILES_rrdcached = "${bindir}/rrdcached \
+    ${systemd_unitdir}/system/rrdcached.service \
+    ${systemd_unitdir}/system/rrdcached.socket"
 
 FILES_${PN}-doc += "${datadir}/rrdtool/examples"
 
-- 
2.7.4


