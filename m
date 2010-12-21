Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen.kooi@gmail.com>) id 1PUz6t-0000nJ-Kw
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 11:06:23 +0100
Received: by wyb40 with SMTP id 40so3835542wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 02:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=iGs8zKg/HSMmxeWCuDSWgwiSv2WjV6xfupkXbPxCwRI=;
	b=h3u5uEL4K/jznj1ygdQDmhHxlGpB6TCQU65Y/OqxP1vWPYRrELDOtaKlJ+bML6IYO9
	Hp10ITDDeYZu5QAR/UrT/93mKMpviTnNLbmv6y6RSJERefnLMczJ3qD6lBlWd7H2Umuq
	ot/dFH2Shk3gxCIbHlKxC4p0phS5XnRQh/z/A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=SI+1dQDfjH3Svp5SJd9+jq/lY1zJE+svtcHi2X9UiOGeJO9rX/tyt7Orjge/ettl+Q
	uQyawucCvJ4gXOXE/Pf9JRyfwbMBexntJ4BK9JDeZnFMsB/yeYcFl7s2bLbCoEB2fr5q
	odjQGDDrEquiws0WPxwQtyQT8bXaqlIA0hUJI=
Received: by 10.216.188.141 with SMTP id a13mr919425wen.59.1292925973990;
	Tue, 21 Dec 2010 02:06:13 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id n78sm2386018weq.3.2010.12.21.02.06.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 21 Dec 2010 02:06:13 -0800 (PST)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Dec 2010 11:06:06 +0100
Message-Id: <1292925966-65237-1-git-send-email-koen@openembedded.org>
X-Mailer: git-send-email 1.7.0
Cc: Koen Kooi <koen@openembedded.org>
Subject: [PATCH 1/2] package ipk bbclass: store build branch and revision in ipkg metadata
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
X-List-Received-Date: Tue, 21 Dec 2010 10:06:23 -0000

The ipkg metadata will look like this now:

koen@dominion:/OE/angstrom-dev/deploy/glibc$ dpkg-deb -I ipk/am3517-evm/matrix-gui_1.3-r19.0.6_am3517-evm.ipk
 new debian package, version 2.0.
 size 24112 bytes: control archive= 540 bytes.
     629 bytes,    13 lines      control
 Package: matrix-gui
 Version: 1.3-r19.0.6
 Description: Matrix GUI for Qt X11
 Section: multimedia
 Priority: optional
 Maintainer: Angstrom Developers <angstrom-distro-devel@linuxtogo.org>
 License: BSD
 Architecture: am3517-evm
 OE: matrix-gui
 Homepage: https://gforge.ti.com/gf/project/matrix_gui/
 Build: org.openembedded.dev/f35ab2d
 Depends: matrix-gui-common, libpng12-0, libfreetype6, libz1, libgthread-2.0-0, libqtwebkit4, libphonon4, libqtdbus4, libqtxml4, libqtgui4, libqtnetwork4, libqtcore4, libglib-2.0-0, libc6, libstdc++6, libgcc1
 Source: svn://gforge.ti.com/svn/matrix_gui/;module=trunk;proto=https;user=anonymous;pswd=''
koen@dominion:/OE/angstrom-dev/deploy/glibc$

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 classes/package_ipk.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/classes/package_ipk.bbclass b/classes/package_ipk.bbclass
index 5d388da..97e5cd8 100644
--- a/classes/package_ipk.bbclass
+++ b/classes/package_ipk.bbclass
@@ -224,6 +224,7 @@ python do_package_ipk () {
 		fields.append(["Architecture: %s\n", ['PACKAGE_ARCH']])
 		fields.append(["OE: %s\n", ['PN']])
 		fields.append(["Homepage: %s\n", ['HOMEPAGE']])
+		fields.append(["Build: %s/%s\n", ['METADATA_BRANCH', 'METADATA_REVISION']])
 
 		def pullData(l, d):
 			l2 = []
-- 
1.6.6.1



