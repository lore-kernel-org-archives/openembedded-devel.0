Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id A9B0371633
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:49:07 +0000 (UTC)
Received: by mail-qg0-f68.google.com with SMTP id c67so8588869qgc.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:49:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yaTBjQp0Y81Hv4h8iEXG7zSU3TZnh1MpocZEwnzBHnk=;
	b=kKFaAcpHImexPRPvxIbNlxIKcXIaWGKUuuIKeDhhnz24BBxOnvH6A+43nexzQauLeL
	e9r99YMXiG4HlJ/WoV/dIVVXRKbtVj8wzM1MMYGkmQC/aQAi6NKDgZPFqLvgGA7cf28o
	DgDpdQcFdFcIlI1NVAp5i6WGVPTX8UCxUxppjVvrXykLvA+9YEbUA8LdItL4JpbvmmDz
	KOPM/QOfJMseXPb99RbzPeKOeGHd3aw7K0OD4fqCZ7eSVgg+ZIMpqkaEEpMpKkb9CcFT
	Lcu+3xtBNO5k/sTEAVrEDrEvr3x8YAF1bfb+e6i0p9B1/ZP0MC8IWQBPPt0BkyBP+E0l
	Lilw==
X-Gm-Message-State: AD7BkJJs5DvZOcEcPrSznB0eo3e0f5M8f6w8nLGNQZ+GsXSF+mGXhMwnKAlj/XOsSmrW2A==
X-Received: by 10.140.96.137 with SMTP id k9mr24141803qge.23.1459000148571;
	Sat, 26 Mar 2016 06:49:08 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id w1sm7696536qha.3.2016.03.26.06.49.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:49:08 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:49:02 -0400
Message-Id: <1459000143-5306-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH 1/2] python-simplejson: update to 3.8.2
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
X-List-Received-Date: Sat, 26 Mar 2016 13:49:10 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-simplejson_3.8.1.bb => python-simplejson_3.8.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-simplejson_3.8.1.bb => python-simplejson_3.8.2.bb} (79%)

diff --git a/meta-oe/recipes-devtools/python/python-simplejson_3.8.1.bb b/meta-oe/recipes-devtools/python/python-simplejson_3.8.2.bb
similarity index 79%
rename from meta-oe/recipes-devtools/python/python-simplejson_3.8.1.bb
rename to meta-oe/recipes-devtools/python/python-simplejson_3.8.2.bb
index 96c0aef..a2a6c40 100644
--- a/meta-oe/recipes-devtools/python/python-simplejson_3.8.1.bb
+++ b/meta-oe/recipes-devtools/python/python-simplejson_3.8.2.bb
@@ -9,8 +9,8 @@ PR = "r1"
 SRCNAME = "simplejson"
 
 SRC_URI = "http://cheeseshop.python.org/packages/source/s/simplejson/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[md5sum] = "b8441f1053edd9dc335ded8c7f98a974"
-SRC_URI[sha256sum] = "428ac8f3219c78fb04ce05895d5dff9bd813c05a9a7922c53dc879cd32a12493"
+SRC_URI[md5sum] = "53b1371bbf883b129a12d594a97e9a18"
+SRC_URI[sha256sum] = "d58439c548433adcda98e695be53e526ba940a4b9c44fb9a05d92cd495cdd47f"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


