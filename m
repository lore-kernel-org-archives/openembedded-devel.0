Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Spc6o-0006Vo-Pc
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 11:24:23 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so352488eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 02:13:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=m3I4eQctbJcTZeuV9ND8zONw5JrjG5wvJTojkYnJYk8=;
	b=Dq2ECMrUJgtqc/msgI2yAf4Lz9vlfPbDkbLBwqavcqKv/4mjSa9jKNC+nUdZZLIY2K
	FQIlGNbUhBHr4rLR3zP43Uge3I/Sll/tngEZDAHRYOC+tqU1optlMPjpL+gZ/H9QAV10
	3FAVXeJDrd39+8LlF89ZLzCkwyidNjFCaYcZBJd5w/Er2EMyUs58ak2RrhJRibjZEAbJ
	ptbwhUBufjslqWrY6Q3+SgKNburbWT//OiMeeUPj3EG6nuQ9Tsjt3cpkwSh9u6v2i8k6
	lrKVYL2bdRQAUSqqYfdOXBo0+JUuSbFWKriSHHKQB1orwbPSjs8RRzuNNEee7vQQHj0w
	JB2g==
Received: by 10.14.119.14 with SMTP id m14mr67967eeh.189.1342170790778;
	Fri, 13 Jul 2012 02:13:10 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id h53sm23302034eea.1.2012.07.13.02.13.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 02:13:09 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 11:12:02 +0200
Message-Id: <1342170730-14982-16-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
References: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQmzrlf7qB9UWYREqHXx5nHSIwt9zO+SauxbOPdb5t4Qsok6n5pZFx3t+mtX4O8ssljEuC5B
Cc: Koen Kooi <koen@dominion.thruhere.net>, eric@eukrea.com
Subject: [for-denzil][meta-oe 16/24] libjpeg-turbo: update 1.2.1 / use version 8d to follow oe-core libjpeg update
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jul 2012 09:24:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

without following oe-core's version PREFERRED_PROVIDER_jpeg does not work and
libjpeg is build.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
index 76e2da4..16fb2c7 100644
--- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
+++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=12;md5=78fa8dbac547bb5b2a0e6457a6cfe
                     file://jpeglib.h;endline=14;md5=7bb9a39828a1b1e84acd4e8aec1e5532 \
                     file://djpeg.c;endline=13;md5=e85613b52f2906c5dfc0e21ec902cb33 \
 "
-PV = "8c+1.2.0"
-SRCREV = "733"
+PV = "8d+1.2.1"
+SRCREV = "837"
 SRC_URI = "svn://libjpeg-turbo.svn.sourceforge.net/svnroot/libjpeg-turbo;proto=https;module=trunk"
 
 S = "${WORKDIR}/trunk"
-- 
1.7.10



