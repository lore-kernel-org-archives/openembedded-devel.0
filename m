Return-Path: <ticotimo@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id 76A2C764AC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2015 16:13:56 +0000 (UTC)
Received: by ykbi184 with SMTP id i184so8654288ykb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2015 09:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7mW+epZI9AeLPOK9CKskxBhjYBSe7xIrdsK53ntT3qI=;
	b=IhwwGDBT8d5z1VuGmxMhktrK2IAKIj0N7idh5ItQc/d3oVvtHpde59KU1g+7WOUYq8
	uYbsfgTWU8YQ0butsnzDBAQx/a+um21wu95oG2GibNI4EQpugUKRjn6xKYv9i4qtzxOO
	qC+yncd9ozzOs2vS+k0sVQM5aV3bNOkb62lXMOnb7PtDs3iuQaMcUQJJZfCopD4kd+FP
	MTp6GZKO9+X4E0VBLonkDGXsjTCxyXBSRN2TdHiCy0iEnPs+tLJVRWhrBctev1opYlrh
	HvBvU+VpuKCMCxj9bAg3JeWYzexgbXdP2zcqJjuc0K4yPJ18A6KUOsxXrExuP40vA2LO
	8Bcw==
X-Received: by 10.13.250.198 with SMTP id k189mr47202314ywf.46.1439568837009; 
	Fri, 14 Aug 2015 09:13:57 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by smtp.gmail.com with ESMTPSA id c6sm5559241ywe.12.2015.08.14.09.13.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Aug 2015 09:13:56 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Aug 2015 09:13:26 -0700
Message-Id: <1439568807-1839-2-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1439568807-1839-1-git-send-email-TicoTimo@gmail.com>
References: <1439568807-1839-1-git-send-email-TicoTimo@gmail.com>
Subject: [meta-perl][PATCH 2/3] librole-tiny-perl: add 2.000001 recipe
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
X-List-Received-Date: Fri, 14 Aug 2015 16:13:59 -0000

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../librole/librole-tiny-perl_2.000001.bb          | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-perl/recipes-perl/librole/librole-tiny-perl_2.000001.bb

diff --git a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.000001.bb b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.000001.bb
new file mode 100644
index 0000000..9a8ec2e
--- /dev/null
+++ b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.000001.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Role::Tiny - Roles. Like a nouvelle cousine portion size of Moose."
+DESCRIPTION = "\"Role::Tiny\" is a minimalist role composition tool."
+
+SECTION = "libs"
+
+HOMEPAGE = "https://metacpan.org/pod/Role-Tiny"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;beginline=172;endline=209;md5=26df7e7c20551fb1906e2286624f0b71"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Role-Tiny-${PV}.tar.gz"
+SRC_URI[md5sum] = "f350f1f8c13652bf85da172380b39ec8"
+SRC_URI[sha256sum] = "31883410a7c85d6dc7501c718b1f83edba013a7b9bbccf0338a1033c391f296d"
+
+S = "${WORKDIR}/Role-Tiny-${PV}"
+
+inherit cpan
+
+RDEPENDS_${PN} = " perl-module-exporter \
+                   perl-module-strict \
+                   perl-module-test-more \
+                   perl-module-warnings \
+"
+
+RPROVIDES_${PN} = " librole-tiny-perl \
+                    librole-tiny-with-perl \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.1.0


