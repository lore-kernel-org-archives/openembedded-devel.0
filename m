Return-Path: <eren@hambedded.org>
Received: from mail-bk0-f45.google.com (mail-bk0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 113116065F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2013 14:46:21 +0000 (UTC)
Received: by mail-bk0-f45.google.com with SMTP id mx11so266144bkb.18
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2013 07:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=0rfxGagYY2jUCxZNgHeSUFdCPQAgL0ofdxLg/OHRd50=;
	b=HwAT+7KJU6auFoJfcD8Xrnwn8kYEzr0AJDjEn1c0wntyWOOqrkBok9woSQy8vOAybT
	jE6MfYm9N+eri47iKZls0Jb4fEWT4sbbKTxAF1keyVLtbVUONMU3pLAdAg5+j5CCfE71
	9Il4SOjHaXFWXYaXTIWI9WxQihSt2ko9S6/8tCV5bx+/h8PsgzdsVxhL9Sv8uUy+EMpS
	4vXlJohglt+E7jrCpVxKPTQfFzZlWfJMUuPPIH/AybTBAWLGF5Ol2jdcu9aQzCgtIt6D
	MIHVhOoMT5umUj1hQfXbqp98TB0nzIT4RbFqumTbtcuNWuLjMLVHtYZ0xMEN0mdhWm12
	pt/w==
X-Gm-Message-State: ALoCoQkCerSA3iliMZUy+/hfPe7VCQ99aZAU6mcKdKsR95dU0VqnMfAKu27wuwya9XzdYEhwmfUU
X-Received: by 10.204.241.194 with SMTP id lf2mr49084bkb.142.1377269181151;
	Fri, 23 Aug 2013 07:46:21 -0700 (PDT)
Received: from localhost.localdomain (farscape.ibun.edu.tr. [194.27.149.253])
	by mx.google.com with ESMTPSA id ku9sm55719bkb.1.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 23 Aug 2013 07:46:20 -0700 (PDT)
From: =?UTF-8?q?Eren=20T=C3=BCrkay?= <eren@hambedded.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Aug 2013 17:41:52 +0300
Message-Id: <1377268912-8340-1-git-send-email-eren@hambedded.org>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe][PATCH] omgps: add libcap dependency
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
X-List-Received-Date: Fri, 23 Aug 2013 14:46:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

http://lists.openembedded.org/pipermail/openembedded-core/2013-August/082530.html

Omgps links against libcap without checking the library. If it cannot
find it as in the minimal build, it emits an error in the linking stage.
Add the dependency explicitly.

Signed-off-by: Eren Türkay <eren@hambedded.org>
---
 meta-oe/recipes-navigation/omgps/omgps_svn.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/omgps/omgps_svn.bb b/meta-oe/recipes-navigation/omgps/omgps_svn.bb
index 1a79df4..625377d 100644
--- a/meta-oe/recipes-navigation/omgps/omgps_svn.bb
+++ b/meta-oe/recipes-navigation/omgps/omgps_svn.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://omgps.googlecode.com"
 SECTION = "openmoko/applications"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-DEPENDS = "gtk+ python-pygobject dbus-glib"
+DEPENDS = "gtk+ python-pygobject dbus-glib libcap"
 SRCREV = "109"
 PV = "0.1+svnr${SRCPV}"
 PR = "r2"
-- 
1.7.9.5


