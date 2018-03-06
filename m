Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2308371BF9
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Mar 2018 04:04:59 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id v194so12991248itb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Mar 2018 20:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=Gc6eidO7mxETGHXODfDKpmSRcArbdrGUZvTH/NqP1rw=;
	b=E7RPavTy76q20lskyFnTjPbcQXdWI5vH3VHLsLmGcy8Y1Pr+orHFnjS7vkDdeCXVqA
	lItGewsdIubas+R+9HqigaiQWU+C3CDPGGcnD1QKdSDUIt+cGnHZ06qzesHuw/8YnCVj
	bgeiqJT3s+WLXGslas60GUdbqfLbsJ+veEKd7+Sm9gZBuvEKqKc4Y93VmvhNAKDEYYPJ
	4IJCQPp2MCZY6JqA9s336YtIObBFc5BdksrHFdgy2uDIFh0rLrJMTuYHMO8V+h7jMFg2
	HX2AKjE5akfOPWU9zvod8eMJamPYA//wfmjSMyuIKjWP4e8mzAXA1mKX+kE26NolD9v7
	QfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Gc6eidO7mxETGHXODfDKpmSRcArbdrGUZvTH/NqP1rw=;
	b=ot/tVWzfwvFSmNlyX8TPAOBdqYyFJnAhVtaMHrTnmo7R1J6B57Oi0T0EfW0sVA5If6
	w0Lwub+UgReJzVTCX143NMnAkXEE6D6+75wVS44tAelqP4ngyBzWQSfOUj8aS7Ts1wse
	lIEaN2Fo3a7kdn1tZlyTiMteVbonrKvI2iZMdrN1QEK7fYztPxxw8TfwPYHA+ds6sBl+
	nlBsH7nU3wBJ6IyKaPVdI8ZG7YKciWzs9ogYYD2rELaKltuQbsuWOSD+gUuFMPXeTzdq
	PG8FF2dSTVv9Ll+qC3HZlHYj2ngFzS5fRikwGOUnht7XnAJbMrO/6xtYXFVIDRQ/C6bq
	GrTA==
X-Gm-Message-State: AElRT7HRZaMdi8DkYX1msxgH6qli5vGAiuf0bb75Ewe7WKWDV8rLKImO
	PA1o2FJbOraOEi/h8I8oZC3mUQOy
X-Google-Smtp-Source: AG47ELvAV4kKcnab7NbpY5H4JCUQxwDBTOnnbbycBK35bkDYBaRC5WSNkmpjRPJKtmcUBZ58KxlP6A==
X-Received: by 10.36.54.144 with SMTP id l138mr16388041itl.14.1520309100824;
	Mon, 05 Mar 2018 20:05:00 -0800 (PST)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	x186sm5730709itb.6.2018.03.05.20.04.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Mar 2018 20:05:00 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Mar 2018 23:04:51 -0500
Message-Id: <20180306040451.3277-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.14.1.459.g238e487ea
Subject: [meta-oe][PATCH v2] nodejs: add extra RDEPENDS for building
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
X-List-Received-Date: Tue, 06 Mar 2018 04:05:00 -0000

If you want to perform an "npm install" and a module needs to be compiled,
these additional packages need to be on the target otherwise the compile might
fail with one or more of the following error messages:

	ImportError: No module named compiler.ast
	ImportError: No module named filecmp
	ImportError: No module named multiprocessing

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

Changes from v1:
	- updated so it applies on HEAD

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb b/meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb
index afd2d96d85..8930cd9022 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb
@@ -80,7 +80,8 @@ do_install_append_class-target() {
 
 PACKAGES =+ "${PN}-npm"
 FILES_${PN}-npm = "${exec_prefix}/lib/node_modules ${bindir}/npm ${bindir}/npx"
-RDEPENDS_${PN}-npm = "bash python-shell python-datetime python-subprocess python-textutils"
+RDEPENDS_${PN}-npm = "bash python-shell python-datetime python-subprocess python-textutils \
+    python-compiler python-misc python-multiprocessing"
 
 PACKAGES =+ "${PN}-systemtap"
 FILES_${PN}-systemtap = "${datadir}/systemtap"
-- 
2.14.1.459.g238e487ea


