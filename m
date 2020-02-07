Return-Path: <ticotimo@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0491860EC5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Feb 2020 16:15:32 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id g6so1202092plt.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Feb 2020 08:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IC1KEV/aF5bcoRDHHWPi6/XVpCMoHEXn5giJwdL0tP4=;
	b=EKCwxTHmjzLc459wuOps7sH0BgFNyn7KrWGRuHxjDco+gWVZHCQj4U6x3irBpPi/a3
	05C+UtqN2FuqmtSVD8xjoLQWGdhHzzUUtwrv+bL4oWOUqSvmrReoQn7cGKrWwNRp12bp
	dexegrS0hyHM1+M03CR0VxzJOk6QuKcgtZ0CFBD9OG8DN9Gw9RHUUKEwy0kfOQNYpEmX
	Gw3P6T7zg+bZUhCU4wPjjlfYYaVqn8qa8loNbYBIDlLAR6romelGGtIPaEDDrcr3qFzM
	ZR/G1uTruy9DiHXUThqC5+8THAlmJKQPYfPDndGzg1cAvSn9TvQBAmDNeo8OZmi6P8jJ
	aEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IC1KEV/aF5bcoRDHHWPi6/XVpCMoHEXn5giJwdL0tP4=;
	b=Njrt2JkOreVKJfFUt4Wtt14zKzkyUy04WpbUu1026oYoIYZnWTvXm4uy2/wmrZRfbg
	B2H5Xyd5Cm81m9L5CxTIEwQSkaKUczWXnS3VF16rpkKoNRPV3hujhaAF5JC8MyH83iRZ
	7+pvsK++eaGYHWem4sTasZBYMbNbVBJmgm2OeJ7VO/vNjKp6d57B6Tn4yh3OruFKNk+U
	UkAPfBzS0b0B7ftPSylVSYwizemJ6Sb5UY3Uq+cRBFHMFPoEyweBTgNs89/axtfgQshZ
	RDrzN593XQyglVOTNgm5PeK/Fw3MLrZpbDfVFLomB2VA73uwqbCS763hTBMg29l3CbIg
	L3EA==
X-Gm-Message-State: APjAAAU7oWMtZpxrWiDz5p6l4VRI+29G67oe7QwFuKqrtQEhKlR+BXNF
	APIJ6xCvmai1fYL/tIaYirfy6bag83E=
X-Google-Smtp-Source: APXvYqwl8JoU6p4reO4ptB/vMajV8FF7FVh1rrFFXdZEZExrmkzJRO3obKWm16dZ0dmUhMJ086JnwA==
X-Received: by 2002:a17:902:8d91:: with SMTP id
	v17mr10049952plo.53.1581092133768; 
	Fri, 07 Feb 2020 08:15:33 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6000:9640:5492:77d:7f91:533a])
	by smtp.gmail.com with ESMTPSA id
	q15sm3506331pgm.47.2020.02.07.08.15.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 07 Feb 2020 08:15:33 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Feb 2020 08:14:59 -0800
Message-Id: <20200207161500.10273-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH 1/2] python-twisted: add required RDEPENDS for twistd
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
X-List-Received-Date: Fri, 07 Feb 2020 16:15:33 -0000
Content-Transfer-Encoding: 8bit

From: Trevor Gamblin <trevor.gamblin@windriver.com>

python-twisted is currently missing some packages for its /usr/bin/twistd
executable to function. Add these to the RDEPENDS list, and also clean up
formatting since the list is getting long.

Note that a similar patch has already been submitted for master branch,
but the python2 version of twisted needs more explicit RDEPENDS than the
python3 version submitted to master in order for /usr/bin/twistd to work
properly.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../python/python-twisted_19.10.0.bb           | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/recipes-devtools/python/python-twisted_19.10.0.bb b/recipes-devtools/python/python-twisted_19.10.0.bb
index 4e07d522..51a495a0 100644
--- a/recipes-devtools/python/python-twisted_19.10.0.bb
+++ b/recipes-devtools/python/python-twisted_19.10.0.bb
@@ -63,7 +63,23 @@ RDEPENDS_${PN} = "\
     ${PN}-zsh \
 "
 
-RDEPENDS_${PN}-core = "${PYTHON_PN}-core ${PYTHON_PN}-zopeinterface ${PYTHON_PN}-incremental ${PYTHON_PN}-constantly ${PYTHON_PN}-hyperlink ${PYTHON_PN}-automat ${PYTHON_PN}-pyserial"
+RDEPENDS_${PN}-core = "${PYTHON_PN}-automat \
+                       ${PYTHON_PN}-constantly \
+                       ${PYTHON_PN}-core \
+                       ${PYTHON_PN}-debugger \
+                       ${PYTHON_PN}-hyperlink \
+                       ${PYTHON_PN}-incremental \
+                       ${PYTHON_PN}-misc \
+                       ${PYTHON_PN}-pkg-resources \
+                       ${PYTHON_PN}-pkgutil \
+                       ${PYTHON_PN}-plistlib \
+                       ${PYTHON_PN}-pyhamcrest \
+                       ${PYTHON_PN}-pyserial \
+                       ${PYTHON_PN}-setuptools \
+                       ${PYTHON_PN}-unixadmin \
+                       ${PYTHON_PN}-zopeinterface \
+"
+
 RDEPENDS_${PN}-test = "${PN}"
 RDEPENDS_${PN}-conch = "${PN}-core ${PN}-protocols ${PYTHON_PN}-bcrypt ${PYTHON_PN}-cryptography ${PYTHON_PN}-pyasn1 ${PYTHON_PN}-pickle"
 RDEPENDS_${PN}-mail = "${PN}-core ${PN}-protocols"
-- 
2.25.0


