Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id A2B17771DA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Aug 2016 23:13:48 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id q11so1039463qtb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Aug 2016 16:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FppHkTNH//2CyH6gJq6TAMpyT0KDdfWgbWEiSgQGDD4=;
	b=PfyKB/NatgIBVQQWG4k8MIjvHps+ohgSUCP5BwZHgMbZrxSZmmwzAJBPGUG6ogZMVC
	73RB3O1D2/7PYkTciXTov5s01g9OaUgKbIvRydHNcRp7Sm48A8lgCSAVNEANM67ZWzu/
	NeoqpS8Tom/nYo3TWbq5VC6Zlz66fm9HA+s6FrggECnRaFZIwITH+/Iaj+tfuwhVudU6
	5f1N1TSc9NRjOXghRMyE8H8mgqpBGwyjK8+bZJBjLnac+Cjm0T6IxFPbjPmN9RHFHC1L
	bY0tP4qb3llhIth7GZoW2Uu1Zsy+P1sc/AAzP/m1kQgH9ltYwsYX+M8OcisY4FDzNy+s
	NlKw==
X-Gm-Message-State: AEkoous10Rei5kzaz91NEKTvF2wyszcnFFEoEEHTqth7SnerQlT+oscBNIcX7A4H8+QPxw==
X-Received: by 10.200.50.82 with SMTP id y18mr1065360qta.29.1470784428576;
	Tue, 09 Aug 2016 16:13:48 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	133sm12135393qkf.33.2016.08.09.16.13.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Aug 2016 16:13:48 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Aug 2016 19:13:39 -0400
Message-Id: <1470784419-24050-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] dstat: update to version 0.7.3
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
X-List-Received-Date: Tue, 09 Aug 2016 23:13:51 -0000

  * License checksum updated for whitespace differences
  * Add DEPENDS for asciidoc-native
  * Add RDEPENDS for python

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../dstat/{dstat_0.7.2.bb => dstat_0.7.3.bb}              | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-support/dstat/{dstat_0.7.2.bb => dstat_0.7.3.bb} (57%)

diff --git a/meta-oe/recipes-support/dstat/dstat_0.7.2.bb b/meta-oe/recipes-support/dstat/dstat_0.7.3.bb
similarity index 57%
rename from meta-oe/recipes-support/dstat/dstat_0.7.2.bb
rename to meta-oe/recipes-support/dstat/dstat_0.7.3.bb
index 63f1812..1673b91 100644
--- a/meta-oe/recipes-support/dstat/dstat_0.7.2.bb
+++ b/meta-oe/recipes-support/dstat/dstat_0.7.3.bb
@@ -5,19 +5,18 @@ and flexibility. Dstat is handy for monitoring systems during performance tuning
 benchmarks or troubleshooting."
 HOMEPAGE = "http://dag.wiee.rs/home-made/dstat"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS += "asciidoc-native"
+
 SRC_URI = "git://github.com/dagwieers/dstat.git"
-SRC_URI[md5sum] = "798e050e2e024f08a272dd4b0e1eba41"
-SRC_URI[sha256sum] = "96d1e6ea2434e477fa97322d92778f68458d7e57bc55bc4f72e29467a52cffd1"
 
-SRCREV = "5251397eb8d3b284a90bfdfaec0c8e1210146e3f"
+SRCREV = "ebace6d4177f8748f35cec87f7a49946046b0a20"
 
 S = "${WORKDIR}/git"
 
-do_compile_prepend() {
-    #undo the step "make docs"
-    sed -i -e 's/$(MAKE) -C docs docs/# $(MAKE) -C docs docs/;' ${S}/Makefile
-}
 do_install() {
     oe_runmake 'DESTDIR=${D}' install
 }
+
+RDEPENDS_${PN} += "python-core python-misc python-resource python-shell python-unixadmin"
-- 
1.9.1


