Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Ol1eC-000690-JP
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 17:30:51 +0200
Received: by mail-fx0-f47.google.com with SMTP id 6so3101110fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 08:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=cAfMhAsxm5fr3hcg2kUbcMqukPrnan85UN+BBtSSQUk=;
	b=kstdRs+BgbLBmN3MEbXv+eOpOL+/0Qi6+wBsq1IgutYPxBPukWaLYGNA435hESXfOV
	ChjhHjU/k8QZ7HNJbzdNQap5FtDExNubW5hMyWOb4Eucbc9hgbvpjCaDSCDx3F9Bl4fx
	ftUb2qg/GN75UCoApHVKwM7XQZDlLBvrR8WvM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=RqINHSIsJyjWxFhNcdaCDa7n75oGJZNNv7jWeX1nK6wZD6wQ0a9kP2nOK5qNe4Wrbx
	szZ93YiT1ZjeFIYxTdRuh8ODtvEuunR9NUmoaD2eL8XcFX3d00nMFpDjnkTjxDxP5H5v
	4ofKuXE8VUtneDAsHhMQSYm9YU0KnQ6QNBvFU=
Received: by 10.223.105.197 with SMTP id u5mr5387328fao.14.1281972633851;
	Mon, 16 Aug 2010 08:30:33 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 10sm2499209fax.42.2010.08.16.08.30.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 16 Aug 2010 08:30:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Aug 2010 17:30:18 +0200
Message-Id: <1281972620-7317-8-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <1281972620-7317-1-git-send-email-Martin.Jansa@gmail.com>
References: <1281972620-7317-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 7/9] xorg-proto: move older not pinned versions to obsolete dir
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
X-List-Received-Date: Mon, 16 Aug 2010 15:30:52 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../obsolete/xorg/xorg-proto/applewmproto_1.0.3.bb |    6 ++++++
 .../obsolete/xorg/xorg-proto/applewmproto_1.2.0.bb |    6 ++++++
 .../obsolete/xorg/xorg-proto/bigreqsproto_1.0.2.bb |    8 ++++++++
 .../obsolete/xorg/xorg-proto/compositeproto_0.4.bb |    8 ++++++++
 .../obsolete/xorg/xorg-proto/damageproto_1.1.0.bb  |    8 ++++++++
 recipes/obsolete/xorg/xorg-proto/dmxproto_2.2.2.bb |    6 ++++++
 recipes/obsolete/xorg/xorg-proto/dri2proto_1.1.bb  |    6 ++++++
 recipes/obsolete/xorg/xorg-proto/dri2proto_2.0.bb  |    6 ++++++
 recipes/obsolete/xorg/xorg-proto/dri2proto_2.2.bb  |    6 ++++++
 recipes/obsolete/xorg/xorg-proto/evieext_1.0.2.bb  |    6 ++++++
 recipes/obsolete/xorg/xorg-proto/fixesproto_4.0.bb |   10 ++++++++++
 .../xorg/xorg-proto/fontcacheproto_0.1.2.bb        |    8 ++++++++
 .../obsolete/xorg/xorg-proto/fontsproto_2.0.2.bb   |    8 ++++++++
 recipes/obsolete/xorg/xorg-proto/glproto_1.4.11.bb |    6 ++++++
 recipes/obsolete/xorg/xorg-proto/glproto_1.4.8.bb  |    6 ++++++
 .../obsolete/xorg/xorg-proto/inputproto_1.4.1.bb   |    8 ++++++++
 .../obsolete/xorg/xorg-proto/inputproto_1.4.2.1.bb |    8 ++++++++
 .../obsolete/xorg/xorg-proto/inputproto_1.4.2.bb   |    8 ++++++++
 .../obsolete/xorg/xorg-proto/inputproto_1.4.3.bb   |    8 ++++++++
 .../obsolete/xorg/xorg-proto/inputproto_1.4.4.bb   |    8 ++++++++
 .../obsolete/xorg/xorg-proto/inputproto_1.5.0.bb   |    8 ++++++++
 recipes/obsolete/xorg/xorg-proto/kbproto_1.0.3.bb  |    8 ++++++++
 .../obsolete/xorg/xorg-proto/printproto_1.0.3.bb   |    6 ++++++
 .../obsolete/xorg/xorg-proto/randrproto_1.3.0.bb   |   10 ++++++++++
 .../obsolete/xorg/xorg-proto/recordproto_1.13.2.bb |    8 ++++++++
 .../obsolete/xorg/xorg-proto/renderproto_0.9.2.bb  |   10 ++++++++++
 .../obsolete/xorg/xorg-proto/renderproto_0.9.3.bb  |   10 ++++++++++
 .../xorg/xorg-proto/resourceproto_1.0.2.bb         |    8 ++++++++
 .../xorg/xorg-proto/scrnsaverproto_1.1.0.bb        |    6 ++++++
 .../obsolete/xorg/xorg-proto/videoproto_2.2.2.bb   |    6 ++++++
 .../xorg/xorg-proto/windowswmproto_1.0.3.bb        |    6 ++++++
 .../obsolete/xorg/xorg-proto/xcmiscproto_1.1.2.bb  |    8 ++++++++
 .../obsolete/xorg/xorg-proto/xextproto_7.0.2.bb    |    8 ++++++++
 .../obsolete/xorg/xorg-proto/xextproto_7.0.3.bb    |    8 ++++++++
 .../xorg/xorg-proto/xf86bigfontproto_1.1.2.bb      |    8 ++++++++
 .../obsolete/xorg/xorg-proto/xf86dgaproto_2.0.2.bb |    8 ++++++++
 .../obsolete/xorg/xorg-proto/xf86dgaproto_2.0.3.bb |    8 ++++++++
 .../obsolete/xorg/xorg-proto/xf86driproto_2.0.3.bb |    6 ++++++
 .../obsolete/xorg/xorg-proto/xf86driproto_2.0.4.bb |    6 ++++++
 .../xorg/xorg-proto/xf86miscproto_0.9.2.bb         |    6 ++++++
 .../xorg/xorg-proto/xf86vidmodeproto_2.2.2.bb      |    8 ++++++++
 .../xorg/xorg-proto/xineramaproto_1.1.2.bb         |    6 ++++++
 recipes/obsolete/xorg/xorg-proto/xproto_7.0.10.bb  |    8 ++++++++
 recipes/obsolete/xorg/xorg-proto/xproto_7.0.11.bb  |    9 +++++++++
 recipes/obsolete/xorg/xorg-proto/xproto_7.0.12.bb  |    8 ++++++++
 recipes/obsolete/xorg/xorg-proto/xproto_7.0.13.bb  |    8 ++++++++
 recipes/obsolete/xorg/xorg-proto/xproto_7.0.15.bb  |    8 ++++++++
 recipes/obsolete/xorg/xorg-proto/xproto_7.0.17.bb  |    8 ++++++++
 .../xorg-proto/xproxymanagementprotocol_1.0.2.bb   |    7 +++++++
 recipes/xorg-proto/applewmproto_1.0.3.bb           |    6 ------
 recipes/xorg-proto/applewmproto_1.2.0.bb           |    6 ------
 recipes/xorg-proto/bigreqsproto_1.0.2.bb           |    8 --------
 recipes/xorg-proto/compositeproto_0.4.bb           |    8 --------
 recipes/xorg-proto/damageproto_1.1.0.bb            |    8 --------
 recipes/xorg-proto/dmxproto_2.2.2.bb               |    6 ------
 recipes/xorg-proto/dri2proto_1.1.bb                |    6 ------
 recipes/xorg-proto/dri2proto_2.0.bb                |    6 ------
 recipes/xorg-proto/dri2proto_2.2.bb                |    6 ------
 recipes/xorg-proto/evieext_1.0.2.bb                |    6 ------
 recipes/xorg-proto/fixesproto_4.0.bb               |   10 ----------
 recipes/xorg-proto/fontcacheproto_0.1.2.bb         |    8 --------
 recipes/xorg-proto/fontsproto_2.0.2.bb             |    8 --------
 recipes/xorg-proto/glproto_1.4.11.bb               |    6 ------
 recipes/xorg-proto/glproto_1.4.8.bb                |    6 ------
 recipes/xorg-proto/inputproto_1.4.1.bb             |    8 --------
 recipes/xorg-proto/inputproto_1.4.2.1.bb           |    8 --------
 recipes/xorg-proto/inputproto_1.4.2.bb             |    8 --------
 recipes/xorg-proto/inputproto_1.4.3.bb             |    8 --------
 recipes/xorg-proto/inputproto_1.4.4.bb             |    8 --------
 recipes/xorg-proto/inputproto_1.5.0.bb             |    8 --------
 recipes/xorg-proto/kbproto_1.0.3.bb                |    8 --------
 recipes/xorg-proto/printproto_1.0.3.bb             |    6 ------
 recipes/xorg-proto/randrproto_1.3.0.bb             |   10 ----------
 recipes/xorg-proto/recordproto_1.13.2.bb           |    8 --------
 recipes/xorg-proto/renderproto_0.9.2.bb            |   10 ----------
 recipes/xorg-proto/renderproto_0.9.3.bb            |   10 ----------
 recipes/xorg-proto/resourceproto_1.0.2.bb          |    8 --------
 recipes/xorg-proto/scrnsaverproto_1.1.0.bb         |    6 ------
 recipes/xorg-proto/videoproto_2.2.2.bb             |    6 ------
 recipes/xorg-proto/windowswmproto_1.0.3.bb         |    6 ------
 recipes/xorg-proto/xcmiscproto_1.1.2.bb            |    8 --------
 recipes/xorg-proto/xextproto_7.0.2.bb              |    8 --------
 recipes/xorg-proto/xextproto_7.0.3.bb              |    8 --------
 recipes/xorg-proto/xf86bigfontproto_1.1.2.bb       |    8 --------
 recipes/xorg-proto/xf86dgaproto_2.0.2.bb           |    8 --------
 recipes/xorg-proto/xf86dgaproto_2.0.3.bb           |    8 --------
 recipes/xorg-proto/xf86driproto_2.0.3.bb           |    6 ------
 recipes/xorg-proto/xf86driproto_2.0.4.bb           |    6 ------
 recipes/xorg-proto/xf86miscproto_0.9.2.bb          |    6 ------
 recipes/xorg-proto/xf86vidmodeproto_2.2.2.bb       |    8 --------
 recipes/xorg-proto/xineramaproto_1.1.2.bb          |    6 ------
 recipes/xorg-proto/xproto_7.0.10.bb                |    8 --------
 recipes/xorg-proto/xproto_7.0.11.bb                |    9 ---------
 recipes/xorg-proto/xproto_7.0.12.bb                |    8 --------
 recipes/xorg-proto/xproto_7.0.13.bb                |    8 --------
 recipes/xorg-proto/xproto_7.0.15.bb                |    8 --------
 recipes/xorg-proto/xproto_7.0.17.bb                |    8 --------
 .../xorg-proto/xproxymanagementprotocol_1.0.2.bb   |    7 -------
 98 files changed, 366 insertions(+), 366 deletions(-)
 create mode 100644 recipes/obsolete/xorg/xorg-proto/applewmproto_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/applewmproto_1.2.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/bigreqsproto_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/compositeproto_0.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/damageproto_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/dmxproto_2.2.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/dri2proto_1.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/dri2proto_2.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/dri2proto_2.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/evieext_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/fixesproto_4.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/fontcacheproto_0.1.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/fontsproto_2.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/glproto_1.4.11.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/glproto_1.4.8.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/inputproto_1.4.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/inputproto_1.4.2.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/inputproto_1.4.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/inputproto_1.4.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/inputproto_1.4.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/inputproto_1.5.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/kbproto_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/printproto_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/randrproto_1.3.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/recordproto_1.13.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/renderproto_0.9.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/renderproto_0.9.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/resourceproto_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/scrnsaverproto_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/videoproto_2.2.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/windowswmproto_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/xcmiscproto_1.1.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/xextproto_7.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/xextproto_7.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/xf86bigfontproto_1.1.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/xf86dgaproto_2.0.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/xf86dgaproto_2.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/xf86driproto_2.0.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/xf86driproto_2.0.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/xf86miscproto_0.9.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/xf86vidmodeproto_2.2.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/xineramaproto_1.1.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/xproto_7.0.10.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/xproto_7.0.11.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/xproto_7.0.12.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/xproto_7.0.13.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/xproto_7.0.15.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/xproto_7.0.17.bb
 create mode 100644 recipes/obsolete/xorg/xorg-proto/xproxymanagementprotocol_1.0.2.bb
 delete mode 100644 recipes/xorg-proto/applewmproto_1.0.3.bb
 delete mode 100644 recipes/xorg-proto/applewmproto_1.2.0.bb
 delete mode 100644 recipes/xorg-proto/bigreqsproto_1.0.2.bb
 delete mode 100644 recipes/xorg-proto/compositeproto_0.4.bb
 delete mode 100644 recipes/xorg-proto/damageproto_1.1.0.bb
 delete mode 100644 recipes/xorg-proto/dmxproto_2.2.2.bb
 delete mode 100644 recipes/xorg-proto/dri2proto_1.1.bb
 delete mode 100644 recipes/xorg-proto/dri2proto_2.0.bb
 delete mode 100644 recipes/xorg-proto/dri2proto_2.2.bb
 delete mode 100644 recipes/xorg-proto/evieext_1.0.2.bb
 delete mode 100644 recipes/xorg-proto/fixesproto_4.0.bb
 delete mode 100644 recipes/xorg-proto/fontcacheproto_0.1.2.bb
 delete mode 100644 recipes/xorg-proto/fontsproto_2.0.2.bb
 delete mode 100644 recipes/xorg-proto/glproto_1.4.11.bb
 delete mode 100644 recipes/xorg-proto/glproto_1.4.8.bb
 delete mode 100644 recipes/xorg-proto/inputproto_1.4.1.bb
 delete mode 100644 recipes/xorg-proto/inputproto_1.4.2.1.bb
 delete mode 100644 recipes/xorg-proto/inputproto_1.4.2.bb
 delete mode 100644 recipes/xorg-proto/inputproto_1.4.3.bb
 delete mode 100644 recipes/xorg-proto/inputproto_1.4.4.bb
 delete mode 100644 recipes/xorg-proto/inputproto_1.5.0.bb
 delete mode 100644 recipes/xorg-proto/kbproto_1.0.3.bb
 delete mode 100644 recipes/xorg-proto/printproto_1.0.3.bb
 delete mode 100644 recipes/xorg-proto/randrproto_1.3.0.bb
 delete mode 100644 recipes/xorg-proto/recordproto_1.13.2.bb
 delete mode 100644 recipes/xorg-proto/renderproto_0.9.2.bb
 delete mode 100644 recipes/xorg-proto/renderproto_0.9.3.bb
 delete mode 100644 recipes/xorg-proto/resourceproto_1.0.2.bb
 delete mode 100644 recipes/xorg-proto/scrnsaverproto_1.1.0.bb
 delete mode 100644 recipes/xorg-proto/videoproto_2.2.2.bb
 delete mode 100644 recipes/xorg-proto/windowswmproto_1.0.3.bb
 delete mode 100644 recipes/xorg-proto/xcmiscproto_1.1.2.bb
 delete mode 100644 recipes/xorg-proto/xextproto_7.0.2.bb
 delete mode 100644 recipes/xorg-proto/xextproto_7.0.3.bb
 delete mode 100644 recipes/xorg-proto/xf86bigfontproto_1.1.2.bb
 delete mode 100644 recipes/xorg-proto/xf86dgaproto_2.0.2.bb
 delete mode 100644 recipes/xorg-proto/xf86dgaproto_2.0.3.bb
 delete mode 100644 recipes/xorg-proto/xf86driproto_2.0.3.bb
 delete mode 100644 recipes/xorg-proto/xf86driproto_2.0.4.bb
 delete mode 100644 recipes/xorg-proto/xf86miscproto_0.9.2.bb
 delete mode 100644 recipes/xorg-proto/xf86vidmodeproto_2.2.2.bb
 delete mode 100644 recipes/xorg-proto/xineramaproto_1.1.2.bb
 delete mode 100644 recipes/xorg-proto/xproto_7.0.10.bb
 delete mode 100644 recipes/xorg-proto/xproto_7.0.11.bb
 delete mode 100644 recipes/xorg-proto/xproto_7.0.12.bb
 delete mode 100644 recipes/xorg-proto/xproto_7.0.13.bb
 delete mode 100644 recipes/xorg-proto/xproto_7.0.15.bb
 delete mode 100644 recipes/xorg-proto/xproto_7.0.17.bb
 delete mode 100644 recipes/xorg-proto/xproxymanagementprotocol_1.0.2.bb

diff --git a/recipes/obsolete/xorg/xorg-proto/applewmproto_1.0.3.bb b/recipes/obsolete/xorg/xorg-proto/applewmproto_1.0.3.bb
new file mode 100644
index 0000000..82100e3
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/applewmproto_1.0.3.bb
@@ -0,0 +1,6 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "d5d7c69837cc7dcbf2aa181ff423ab20"
+SRC_URI[archive.sha256sum] = "a938c07ea331359f379802c50c33aa0307b913f742ad74087d45e7fb2a1f4d50"
diff --git a/recipes/obsolete/xorg/xorg-proto/applewmproto_1.2.0.bb b/recipes/obsolete/xorg/xorg-proto/applewmproto_1.2.0.bb
new file mode 100644
index 0000000..b178abd
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/applewmproto_1.2.0.bb
@@ -0,0 +1,6 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "44e18d01857f9dfeb8628e317e786f31"
+SRC_URI[archive.sha256sum] = "4f549083df9db85e61d0b272645e3dc71bacde9b9156ca20a57440e794b71042"
diff --git a/recipes/obsolete/xorg/xorg-proto/bigreqsproto_1.0.2.bb b/recipes/obsolete/xorg/xorg-proto/bigreqsproto_1.0.2.bb
new file mode 100644
index 0000000..f817bca
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/bigreqsproto_1.0.2.bb
@@ -0,0 +1,8 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "95c29d9d10bf2868996c0c47a3b9a8dc"
+SRC_URI[archive.sha256sum] = "30da0098a24578e645193464526cc4d5c2c7fecaf476d1b9dabe68118850adee"
+
+BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/obsolete/xorg/xorg-proto/compositeproto_0.4.bb b/recipes/obsolete/xorg/xorg-proto/compositeproto_0.4.bb
new file mode 100644
index 0000000..aebc61b
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/compositeproto_0.4.bb
@@ -0,0 +1,8 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "6281344d656d4e0c8e9db4918efe3d1d"
+SRC_URI[archive.sha256sum] = "6013d1ca63b2b7540f6f99977090812b899852acfbd9df123b5ebaa911e30003"
+
+CONFLICTS = "compositeext"
diff --git a/recipes/obsolete/xorg/xorg-proto/damageproto_1.1.0.bb b/recipes/obsolete/xorg/xorg-proto/damageproto_1.1.0.bb
new file mode 100644
index 0000000..2daea83
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/damageproto_1.1.0.bb
@@ -0,0 +1,8 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "33ee591e0b1ca5ad7902934541db7d24"
+SRC_URI[archive.sha256sum] = "9d2684fac835e9cdf78befff2a58292f54db90094acbfb9f2ed5316fa30d641d"
+
+CONFLICTS = "damageext"
diff --git a/recipes/obsolete/xorg/xorg-proto/dmxproto_2.2.2.bb b/recipes/obsolete/xorg/xorg-proto/dmxproto_2.2.2.bb
new file mode 100644
index 0000000..999e47f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/dmxproto_2.2.2.bb
@@ -0,0 +1,6 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "d80acad88411e7944b9b085463d53302"
+SRC_URI[archive.sha256sum] = "aaa6d9c9d5ec58f733ca4d7413c541413482bce666217267e5bf88442e35fce2"
diff --git a/recipes/obsolete/xorg/xorg-proto/dri2proto_1.1.bb b/recipes/obsolete/xorg/xorg-proto/dri2proto_1.1.bb
new file mode 100644
index 0000000..7329971
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/dri2proto_1.1.bb
@@ -0,0 +1,6 @@
+require xorg-proto-common.inc
+DESCRIPTION = "DRI2 extension headers"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "1d70f0653b0b3a837853262dc5d34da4"
+SRC_URI[archive.sha256sum] = "69def6d1f64b3699ec9c729596d8b096623a62bdda6bbea78ed690421d174c11"
diff --git a/recipes/obsolete/xorg/xorg-proto/dri2proto_2.0.bb b/recipes/obsolete/xorg/xorg-proto/dri2proto_2.0.bb
new file mode 100644
index 0000000..6df4e52
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/dri2proto_2.0.bb
@@ -0,0 +1,6 @@
+require xorg-proto-common.inc
+DESCRIPTION = "DRI2 extension headers"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "26f6515322ec50691584ac74291b4254"
+SRC_URI[archive.sha256sum] = "1954a7e96d7fe70611c483836ed143e84a069eed6d3dab22c05a531bfb6da9e4"
diff --git a/recipes/obsolete/xorg/xorg-proto/dri2proto_2.2.bb b/recipes/obsolete/xorg/xorg-proto/dri2proto_2.2.bb
new file mode 100644
index 0000000..84467a3
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/dri2proto_2.2.bb
@@ -0,0 +1,6 @@
+require xorg-proto-common.inc
+DESCRIPTION = "DRI2 extension headers"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "3ca8ddb42cd4ee31b8690031303221af"
+SRC_URI[archive.sha256sum] = "f352950ffee4437d9da3e216d9a348ba0c7cf80c8c0fb30385c77ce3b780b2a1"
diff --git a/recipes/obsolete/xorg/xorg-proto/evieext_1.0.2.bb b/recipes/obsolete/xorg/xorg-proto/evieext_1.0.2.bb
new file mode 100644
index 0000000..1a3bff2
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/evieext_1.0.2.bb
@@ -0,0 +1,6 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "2507b5d0f4b2848147fbddd155aa6cfe"
+SRC_URI[archive.sha256sum] = "0b85113a9770083715927f9c7a7d0ab354c8a508a91cb6e8e11130851494d125"
diff --git a/recipes/obsolete/xorg/xorg-proto/fixesproto_4.0.bb b/recipes/obsolete/xorg/xorg-proto/fixesproto_4.0.bb
new file mode 100644
index 0000000..0004625
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/fixesproto_4.0.bb
@@ -0,0 +1,10 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "8b298cc3424597f8138c7faf7763dce9"
+SRC_URI[archive.sha256sum] = "b3fe971ccc8152db6c78da7117c31fc4cd2fcb2b6a4df3db0f8fed13d4ceb08f"
+
+BBCLASSEXTEND = "native"
+
+CONFLICTS = "fixesext"
diff --git a/recipes/obsolete/xorg/xorg-proto/fontcacheproto_0.1.2.bb b/recipes/obsolete/xorg/xorg-proto/fontcacheproto_0.1.2.bb
new file mode 100644
index 0000000..aed2402
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/fontcacheproto_0.1.2.bb
@@ -0,0 +1,8 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "60df6b625074a9790e28543dcea71651"
+SRC_URI[archive.sha256sum] = "48063ed49b200927376645f9ffe65faa39af84d59ba6f60f2abb2f9c6fa3d9f9"
+
+BBCLASSEXTEND = "native"
diff --git a/recipes/obsolete/xorg/xorg-proto/fontsproto_2.0.2.bb b/recipes/obsolete/xorg/xorg-proto/fontsproto_2.0.2.bb
new file mode 100644
index 0000000..5b044d3
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/fontsproto_2.0.2.bb
@@ -0,0 +1,8 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "c946f166107b016a21cc7a02e1132724"
+SRC_URI[archive.sha256sum] = "83bd547131aa11a232717a0f06d3c6cd58a0b2f6d541660bbe9ebf43073a8b7b"
+
+BBCLASSEXTEND = "native"
diff --git a/recipes/obsolete/xorg/xorg-proto/glproto_1.4.11.bb b/recipes/obsolete/xorg/xorg-proto/glproto_1.4.11.bb
new file mode 100644
index 0000000..13d35ab
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/glproto_1.4.11.bb
@@ -0,0 +1,6 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "78e7c4dc7dcb74b1869fee7897e00f59"
+SRC_URI[archive.sha256sum] = "fe481d89d74f01db4f3a671ef1f29df29da74dff5b678517ee659a6f9d819451"
diff --git a/recipes/obsolete/xorg/xorg-proto/glproto_1.4.8.bb b/recipes/obsolete/xorg/xorg-proto/glproto_1.4.8.bb
new file mode 100644
index 0000000..ee27027
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/glproto_1.4.8.bb
@@ -0,0 +1,6 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "3dfbd17203c0c88b94b6f579f24c11cc"
+SRC_URI[archive.sha256sum] = "2f5d84413853b688b7bb46c66fee108a499190e1f7810afffb775910778f053c"
diff --git a/recipes/obsolete/xorg/xorg-proto/inputproto_1.4.1.bb b/recipes/obsolete/xorg/xorg-proto/inputproto_1.4.1.bb
new file mode 100644
index 0000000..6e21b13
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/inputproto_1.4.1.bb
@@ -0,0 +1,8 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "563cc41eeb590cf5eb2127807b838dfc"
+SRC_URI[archive.sha256sum] = "913ff534aa777e3c36f3e9fe3e8638c3ccfe398daeb7532fa917e7bcd6fed07d"
+
+BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/obsolete/xorg/xorg-proto/inputproto_1.4.2.1.bb b/recipes/obsolete/xorg/xorg-proto/inputproto_1.4.2.1.bb
new file mode 100644
index 0000000..b05df8c
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/inputproto_1.4.2.1.bb
@@ -0,0 +1,8 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "aa948a7469168ddd9c33f11c5dff55ac"
+SRC_URI[archive.sha256sum] = "9b6db77037de7c52b9a17862b99bc435bd5c20e5d3faf5aec943b206cdaff3ed"
+
+BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/obsolete/xorg/xorg-proto/inputproto_1.4.2.bb b/recipes/obsolete/xorg/xorg-proto/inputproto_1.4.2.bb
new file mode 100644
index 0000000..96bdc72
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/inputproto_1.4.2.bb
@@ -0,0 +1,8 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e2c4cf4c2ad59d1e27f09381f6b4a3c3"
+SRC_URI[archive.sha256sum] = "62ba68a056daa89f5b21a02b27f6a4c858933e1c5547c9d16985d9ed182014e6"
+
+BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/obsolete/xorg/xorg-proto/inputproto_1.4.3.bb b/recipes/obsolete/xorg/xorg-proto/inputproto_1.4.3.bb
new file mode 100644
index 0000000..ab4981f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/inputproto_1.4.3.bb
@@ -0,0 +1,8 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "a0f0d8cf6fbf0db8ba3937d0cc16138d"
+SRC_URI[archive.sha256sum] = "627119ff21391314b88e5f34da837473151a54ab980d2f76d7f3c6bd3d560d4a"
+
+BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/obsolete/xorg/xorg-proto/inputproto_1.4.4.bb b/recipes/obsolete/xorg/xorg-proto/inputproto_1.4.4.bb
new file mode 100644
index 0000000..0c37756
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/inputproto_1.4.4.bb
@@ -0,0 +1,8 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "3a532379f226c34b36a5c585999f75e4"
+SRC_URI[archive.sha256sum] = "63278ef492d6babb9e3efaef84a67a982e5362c51623714c9428f0384007dfe5"
+
+BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/obsolete/xorg/xorg-proto/inputproto_1.5.0.bb b/recipes/obsolete/xorg/xorg-proto/inputproto_1.5.0.bb
new file mode 100644
index 0000000..007e477
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/inputproto_1.5.0.bb
@@ -0,0 +1,8 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "dcc36554aea1338b3813943daf1e9988"
+SRC_URI[archive.sha256sum] = "ef90f7e4c151095cc75a573acd86355aa65c5bc7fd1dcce4a1483b64788e1461"
+
+BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/obsolete/xorg/xorg-proto/kbproto_1.0.3.bb b/recipes/obsolete/xorg/xorg-proto/kbproto_1.0.3.bb
new file mode 100644
index 0000000..1b089d6
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/kbproto_1.0.3.bb
@@ -0,0 +1,8 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "6092cdb0a1225f95356ddbe6c2abaad5"
+SRC_URI[archive.sha256sum] = "7000005ebbd07a28a71477d72bcb76c47064e043a4ead26fcf4d5af394ce19df"
+
+BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/obsolete/xorg/xorg-proto/printproto_1.0.3.bb b/recipes/obsolete/xorg/xorg-proto/printproto_1.0.3.bb
new file mode 100644
index 0000000..e579a5a
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/printproto_1.0.3.bb
@@ -0,0 +1,6 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "0f4e7982c6d4ec3b2cf38502dd1293a3"
+SRC_URI[archive.sha256sum] = "8b375f8cda83dfc7d84be44af41eedd484d0e2499acbd19bdca5b4056dec7235"
diff --git a/recipes/obsolete/xorg/xorg-proto/randrproto_1.3.0.bb b/recipes/obsolete/xorg/xorg-proto/randrproto_1.3.0.bb
new file mode 100644
index 0000000..aab111a
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/randrproto_1.3.0.bb
@@ -0,0 +1,10 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "a49416013fff33c853efb32f1926551e"
+SRC_URI[archive.sha256sum] = "cfeb1429465e3c24debde1bf53ec35ef738fde5e80d2eed14f33e315e747bb8d"
+
+BBCLASSEXTEND = "nativesdk sdk"
+
+CONFLICTS = "randrext"
diff --git a/recipes/obsolete/xorg/xorg-proto/recordproto_1.13.2.bb b/recipes/obsolete/xorg/xorg-proto/recordproto_1.13.2.bb
new file mode 100644
index 0000000..fc5e086
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/recordproto_1.13.2.bb
@@ -0,0 +1,8 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "0ed4706564a34fc2aff724aa16d3ff00"
+SRC_URI[archive.sha256sum] = "04e77a8b14f373a1825bbe0116cd0db8b2c5dee17b34ba9bddd27e576609cff9"
+
+CONFLICTS = "recordext"
diff --git a/recipes/obsolete/xorg/xorg-proto/renderproto_0.9.2.bb b/recipes/obsolete/xorg/xorg-proto/renderproto_0.9.2.bb
new file mode 100644
index 0000000..8c5edbf
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/renderproto_0.9.2.bb
@@ -0,0 +1,10 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "28fbe8a59ebd31f098b90ec64f3d133a"
+SRC_URI[archive.sha256sum] = "7754dfbbb1e3818f28720fa9647b8a593e9d54626a7896771c2bfac7f75e2726"
+
+BBCLASSEXTEND = "native nativesdk sdk"
+
+CONFLICTS = "renderext"
diff --git a/recipes/obsolete/xorg/xorg-proto/renderproto_0.9.3.bb b/recipes/obsolete/xorg/xorg-proto/renderproto_0.9.3.bb
new file mode 100644
index 0000000..ac8550e
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/renderproto_0.9.3.bb
@@ -0,0 +1,10 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "598bc9a493deee2e48e4434e94467189"
+SRC_URI[archive.sha256sum] = "c98a08b877e98a8fa7daa04be472de7e0cb38a99593faca8b987effcea2dd45b"
+
+BBCLASSEXTEND = "native nativesdk sdk"
+
+CONFLICTS = "renderext"
diff --git a/recipes/obsolete/xorg/xorg-proto/resourceproto_1.0.2.bb b/recipes/obsolete/xorg/xorg-proto/resourceproto_1.0.2.bb
new file mode 100644
index 0000000..40e19ea
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/resourceproto_1.0.2.bb
@@ -0,0 +1,8 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "b823b314e37eb19dae1f297951d2e933"
+SRC_URI[archive.sha256sum] = "0c33d6fceef5483001459bdc934b5831502250b27f1f4ad370ab044f8ab53487"
+
+CONFLICTS = "resourceext"
diff --git a/recipes/obsolete/xorg/xorg-proto/scrnsaverproto_1.1.0.bb b/recipes/obsolete/xorg/xorg-proto/scrnsaverproto_1.1.0.bb
new file mode 100644
index 0000000..52d4869
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/scrnsaverproto_1.1.0.bb
@@ -0,0 +1,6 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "5d551850e6f4acdf49a13f4eb3a5bbfa"
+SRC_URI[archive.sha256sum] = "db09abf73cc339c05c0488639731794372a4770cfca76c2645f503f9fccd478f"
diff --git a/recipes/obsolete/xorg/xorg-proto/videoproto_2.2.2.bb b/recipes/obsolete/xorg/xorg-proto/videoproto_2.2.2.bb
new file mode 100644
index 0000000..071f6a3
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/videoproto_2.2.2.bb
@@ -0,0 +1,6 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "44292d74a9a3c94b1ecb9d77a0da83e8"
+SRC_URI[archive.sha256sum] = "ab088478830cd30c2fe34fb7f44ffd4d177af7711c225c24676d3e9e9f24780c"
diff --git a/recipes/obsolete/xorg/xorg-proto/windowswmproto_1.0.3.bb b/recipes/obsolete/xorg/xorg-proto/windowswmproto_1.0.3.bb
new file mode 100644
index 0000000..1daa5c7
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/windowswmproto_1.0.3.bb
@@ -0,0 +1,6 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "ed5416cf7e2ba6e66641c88f12768c0c"
+SRC_URI[archive.sha256sum] = "780d249696bb2de7acabded90a465a62cd6cbda3b7f0ccff6ebfdf0d8180f151"
diff --git a/recipes/obsolete/xorg/xorg-proto/xcmiscproto_1.1.2.bb b/recipes/obsolete/xorg/xorg-proto/xcmiscproto_1.1.2.bb
new file mode 100644
index 0000000..cafebbc
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/xcmiscproto_1.1.2.bb
@@ -0,0 +1,8 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "fde0b050901f024b19159cdacdcfbd20"
+SRC_URI[archive.sha256sum] = "b2807e96a9d632b7bbf1782a43095de51f3feae3d2e25374d3df00c6c68792ab"
+
+BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/obsolete/xorg/xorg-proto/xextproto_7.0.2.bb b/recipes/obsolete/xorg/xorg-proto/xextproto_7.0.2.bb
new file mode 100644
index 0000000..e58f88a
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/xextproto_7.0.2.bb
@@ -0,0 +1,8 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "242388ab65dde3a3dd313eeee265e429"
+SRC_URI[archive.sha256sum] = "53f3039ae769b08bd139d4474a7debe0b6f24048e7c514c835c8a1880f11e0d9"
+
+BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/obsolete/xorg/xorg-proto/xextproto_7.0.3.bb b/recipes/obsolete/xorg/xorg-proto/xextproto_7.0.3.bb
new file mode 100644
index 0000000..908cd32
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/xextproto_7.0.3.bb
@@ -0,0 +1,8 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "3a2e0252e853ab30b3bff05ac92ec61c"
+SRC_URI[archive.sha256sum] = "3972428e3651c9159aff655c9c794728520c3ce3d66ac219ec5243d5d73d4db4"
+
+BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/obsolete/xorg/xorg-proto/xf86bigfontproto_1.1.2.bb b/recipes/obsolete/xorg/xorg-proto/xf86bigfontproto_1.1.2.bb
new file mode 100644
index 0000000..228b5e2
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/xf86bigfontproto_1.1.2.bb
@@ -0,0 +1,8 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "a318c1e86123832d7b0c95fc7d47ef35"
+SRC_URI[archive.sha256sum] = "01b475b5b27709a738db6f94ce2ded37f5db0792e8d9318069ecf1690a15f124"
+
+BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/obsolete/xorg/xorg-proto/xf86dgaproto_2.0.2.bb b/recipes/obsolete/xorg/xorg-proto/xf86dgaproto_2.0.2.bb
new file mode 100644
index 0000000..fc04869
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/xf86dgaproto_2.0.2.bb
@@ -0,0 +1,8 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "461aa291a23e8cf387b70f3efa71b05c"
+SRC_URI[archive.sha256sum] = "3ee1db2481ea222269bd201eef4d0e5d8ca4dbdb5eeb4852cf1efc42d4269b60"
+
+CONFLICTS = "xxf86dgaext"
diff --git a/recipes/obsolete/xorg/xorg-proto/xf86dgaproto_2.0.3.bb b/recipes/obsolete/xorg/xorg-proto/xf86dgaproto_2.0.3.bb
new file mode 100644
index 0000000..171a401
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/xf86dgaproto_2.0.3.bb
@@ -0,0 +1,8 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "42fdcebc66efac02ab4beec2b1b0ad6e"
+SRC_URI[archive.sha256sum] = "5ac4d4a308b032727c61fd56db5a2eaadaedfbce5bc9dc504320bff9d696b002"
+
+CONFLICTS = "xxf86dgaext"
diff --git a/recipes/obsolete/xorg/xorg-proto/xf86driproto_2.0.3.bb b/recipes/obsolete/xorg/xorg-proto/xf86driproto_2.0.3.bb
new file mode 100644
index 0000000..6c62b64
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/xf86driproto_2.0.3.bb
@@ -0,0 +1,6 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e4a282cfd708b8892fca4425fee9cd7b"
+SRC_URI[archive.sha256sum] = "111c469a24374803b08104c725d8318760b226cedccd12b199c83d1b2756b8d6"
diff --git a/recipes/obsolete/xorg/xorg-proto/xf86driproto_2.0.4.bb b/recipes/obsolete/xorg/xorg-proto/xf86driproto_2.0.4.bb
new file mode 100644
index 0000000..cd7b087
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/xf86driproto_2.0.4.bb
@@ -0,0 +1,6 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "01470d088da3a8a3deefa8e1f45d69cb"
+SRC_URI[archive.sha256sum] = "f57da66bec8563502fe95c0e3f6ed297d9985862f5b64a5c9d3039719ac7f9da"
diff --git a/recipes/obsolete/xorg/xorg-proto/xf86miscproto_0.9.2.bb b/recipes/obsolete/xorg/xorg-proto/xf86miscproto_0.9.2.bb
new file mode 100644
index 0000000..df4c612
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/xf86miscproto_0.9.2.bb
@@ -0,0 +1,6 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "acae8edeb05a406f7f60bcbb218a8f1d"
+SRC_URI[archive.sha256sum] = "aaab4cbf19c73ded4785ba69cdd7ae23aaf103c7040559283f85fc1237dad6e6"
diff --git a/recipes/obsolete/xorg/xorg-proto/xf86vidmodeproto_2.2.2.bb b/recipes/obsolete/xorg/xorg-proto/xf86vidmodeproto_2.2.2.bb
new file mode 100644
index 0000000..00fc499
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/xf86vidmodeproto_2.2.2.bb
@@ -0,0 +1,8 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "f00844a63d6e76b69eb0eb5e41eed843"
+SRC_URI[archive.sha256sum] = "07152f990cc79ec5931989decc4a90b1919147e98ff6fcfe39507a9d3fc4d96e"
+
+CONFLICTS = "xxf86vmext"
diff --git a/recipes/obsolete/xorg/xorg-proto/xineramaproto_1.1.2.bb b/recipes/obsolete/xorg/xorg-proto/xineramaproto_1.1.2.bb
new file mode 100644
index 0000000..2c8b2f7
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/xineramaproto_1.1.2.bb
@@ -0,0 +1,6 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "1cc292c562962ad0ad3a253cae68c632"
+SRC_URI[archive.sha256sum] = "e8a62b1cafbcfc3b9fed147612ed4320233d0c9d6de30c991c2cd0c691c40910"
diff --git a/recipes/obsolete/xorg/xorg-proto/xproto_7.0.10.bb b/recipes/obsolete/xorg/xorg-proto/xproto_7.0.10.bb
new file mode 100644
index 0000000..558bc60
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/xproto_7.0.10.bb
@@ -0,0 +1,8 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "2ed80e90992e7455eaac4c3e977ebd01"
+SRC_URI[archive.sha256sum] = "6d659920262d41e48714184f94ff9cd2608515e0f3d2f074892fe0c048784df4"
+
+BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/obsolete/xorg/xorg-proto/xproto_7.0.11.bb b/recipes/obsolete/xorg/xorg-proto/xproto_7.0.11.bb
new file mode 100644
index 0000000..0ea401a
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/xproto_7.0.11.bb
@@ -0,0 +1,9 @@
+require xorg-proto-common.inc
+DESCRIPTION = "X11 core wire protocol and auxiliary headers"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "6b6c266576d81c505aa4a1828151f7f8"
+SRC_URI[archive.sha256sum] = "4ba69b7ef195c1a4e2e8ea9a1101f5079ada1f060c66968226754687685e9e53"
+
+BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/obsolete/xorg/xorg-proto/xproto_7.0.12.bb b/recipes/obsolete/xorg/xorg-proto/xproto_7.0.12.bb
new file mode 100644
index 0000000..8969c85
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/xproto_7.0.12.bb
@@ -0,0 +1,8 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "388234421add6c1760b4fc99fcdc76b0"
+SRC_URI[archive.sha256sum] = "bec5a98bbea56da069785784116261ec956df039fb07d0cdca53ae1ed03ebc0f"
+
+BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/obsolete/xorg/xorg-proto/xproto_7.0.13.bb b/recipes/obsolete/xorg/xorg-proto/xproto_7.0.13.bb
new file mode 100644
index 0000000..938df7f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/xproto_7.0.13.bb
@@ -0,0 +1,8 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "7d26f45dca52632712a696e0631dc17b"
+SRC_URI[archive.sha256sum] = "6f6328922d69f5de29513a5baf1d010db2a7a54cb58a7a6cbbb1b25097ecd592"
+
+BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/obsolete/xorg/xorg-proto/xproto_7.0.15.bb b/recipes/obsolete/xorg/xorg-proto/xproto_7.0.15.bb
new file mode 100644
index 0000000..4beb67f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/xproto_7.0.15.bb
@@ -0,0 +1,8 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "1a2b31430d04340be2e49e8b6445e076"
+SRC_URI[archive.sha256sum] = "fd8cd0bc3e94d7416e6af9eddfa909b0e64246e0d2bb41c00f4e02bd85c76bee"
+
+BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/obsolete/xorg/xorg-proto/xproto_7.0.17.bb b/recipes/obsolete/xorg/xorg-proto/xproto_7.0.17.bb
new file mode 100644
index 0000000..5d7ed8f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/xproto_7.0.17.bb
@@ -0,0 +1,8 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "74abb8fb91af66f35873b1f444731220"
+SRC_URI[archive.sha256sum] = "9b2c1fdc5b3780cedc9f5d9caf8f1364f26d07f8502b0eccdde74319157f9d01"
+
+BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/obsolete/xorg/xorg-proto/xproxymanagementprotocol_1.0.2.bb b/recipes/obsolete/xorg/xorg-proto/xproxymanagementprotocol_1.0.2.bb
new file mode 100644
index 0000000..b018f77
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-proto/xproxymanagementprotocol_1.0.2.bb
@@ -0,0 +1,7 @@
+require xorg-proto-common.inc
+PROVIDES = "xproxymngproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "d28007a50976204960fc1fc07b4ca093"
+SRC_URI[archive.sha256sum] = "c45176d002c85c142ac52774680f5325d330c5ecc32d4d6a056d85ee039a0cbc"
diff --git a/recipes/xorg-proto/applewmproto_1.0.3.bb b/recipes/xorg-proto/applewmproto_1.0.3.bb
deleted file mode 100644
index 82100e3..0000000
--- a/recipes/xorg-proto/applewmproto_1.0.3.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "d5d7c69837cc7dcbf2aa181ff423ab20"
-SRC_URI[archive.sha256sum] = "a938c07ea331359f379802c50c33aa0307b913f742ad74087d45e7fb2a1f4d50"
diff --git a/recipes/xorg-proto/applewmproto_1.2.0.bb b/recipes/xorg-proto/applewmproto_1.2.0.bb
deleted file mode 100644
index b178abd..0000000
--- a/recipes/xorg-proto/applewmproto_1.2.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "44e18d01857f9dfeb8628e317e786f31"
-SRC_URI[archive.sha256sum] = "4f549083df9db85e61d0b272645e3dc71bacde9b9156ca20a57440e794b71042"
diff --git a/recipes/xorg-proto/bigreqsproto_1.0.2.bb b/recipes/xorg-proto/bigreqsproto_1.0.2.bb
deleted file mode 100644
index f817bca..0000000
--- a/recipes/xorg-proto/bigreqsproto_1.0.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "95c29d9d10bf2868996c0c47a3b9a8dc"
-SRC_URI[archive.sha256sum] = "30da0098a24578e645193464526cc4d5c2c7fecaf476d1b9dabe68118850adee"
-
-BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/xorg-proto/compositeproto_0.4.bb b/recipes/xorg-proto/compositeproto_0.4.bb
deleted file mode 100644
index aebc61b..0000000
--- a/recipes/xorg-proto/compositeproto_0.4.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "6281344d656d4e0c8e9db4918efe3d1d"
-SRC_URI[archive.sha256sum] = "6013d1ca63b2b7540f6f99977090812b899852acfbd9df123b5ebaa911e30003"
-
-CONFLICTS = "compositeext"
diff --git a/recipes/xorg-proto/damageproto_1.1.0.bb b/recipes/xorg-proto/damageproto_1.1.0.bb
deleted file mode 100644
index 2daea83..0000000
--- a/recipes/xorg-proto/damageproto_1.1.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "33ee591e0b1ca5ad7902934541db7d24"
-SRC_URI[archive.sha256sum] = "9d2684fac835e9cdf78befff2a58292f54db90094acbfb9f2ed5316fa30d641d"
-
-CONFLICTS = "damageext"
diff --git a/recipes/xorg-proto/dmxproto_2.2.2.bb b/recipes/xorg-proto/dmxproto_2.2.2.bb
deleted file mode 100644
index 999e47f..0000000
--- a/recipes/xorg-proto/dmxproto_2.2.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "d80acad88411e7944b9b085463d53302"
-SRC_URI[archive.sha256sum] = "aaa6d9c9d5ec58f733ca4d7413c541413482bce666217267e5bf88442e35fce2"
diff --git a/recipes/xorg-proto/dri2proto_1.1.bb b/recipes/xorg-proto/dri2proto_1.1.bb
deleted file mode 100644
index 7329971..0000000
--- a/recipes/xorg-proto/dri2proto_1.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-proto-common.inc
-DESCRIPTION = "DRI2 extension headers"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "1d70f0653b0b3a837853262dc5d34da4"
-SRC_URI[archive.sha256sum] = "69def6d1f64b3699ec9c729596d8b096623a62bdda6bbea78ed690421d174c11"
diff --git a/recipes/xorg-proto/dri2proto_2.0.bb b/recipes/xorg-proto/dri2proto_2.0.bb
deleted file mode 100644
index 6df4e52..0000000
--- a/recipes/xorg-proto/dri2proto_2.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-proto-common.inc
-DESCRIPTION = "DRI2 extension headers"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "26f6515322ec50691584ac74291b4254"
-SRC_URI[archive.sha256sum] = "1954a7e96d7fe70611c483836ed143e84a069eed6d3dab22c05a531bfb6da9e4"
diff --git a/recipes/xorg-proto/dri2proto_2.2.bb b/recipes/xorg-proto/dri2proto_2.2.bb
deleted file mode 100644
index 84467a3..0000000
--- a/recipes/xorg-proto/dri2proto_2.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-proto-common.inc
-DESCRIPTION = "DRI2 extension headers"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "3ca8ddb42cd4ee31b8690031303221af"
-SRC_URI[archive.sha256sum] = "f352950ffee4437d9da3e216d9a348ba0c7cf80c8c0fb30385c77ce3b780b2a1"
diff --git a/recipes/xorg-proto/evieext_1.0.2.bb b/recipes/xorg-proto/evieext_1.0.2.bb
deleted file mode 100644
index 1a3bff2..0000000
--- a/recipes/xorg-proto/evieext_1.0.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "2507b5d0f4b2848147fbddd155aa6cfe"
-SRC_URI[archive.sha256sum] = "0b85113a9770083715927f9c7a7d0ab354c8a508a91cb6e8e11130851494d125"
diff --git a/recipes/xorg-proto/fixesproto_4.0.bb b/recipes/xorg-proto/fixesproto_4.0.bb
deleted file mode 100644
index 0004625..0000000
--- a/recipes/xorg-proto/fixesproto_4.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "8b298cc3424597f8138c7faf7763dce9"
-SRC_URI[archive.sha256sum] = "b3fe971ccc8152db6c78da7117c31fc4cd2fcb2b6a4df3db0f8fed13d4ceb08f"
-
-BBCLASSEXTEND = "native"
-
-CONFLICTS = "fixesext"
diff --git a/recipes/xorg-proto/fontcacheproto_0.1.2.bb b/recipes/xorg-proto/fontcacheproto_0.1.2.bb
deleted file mode 100644
index aed2402..0000000
--- a/recipes/xorg-proto/fontcacheproto_0.1.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "60df6b625074a9790e28543dcea71651"
-SRC_URI[archive.sha256sum] = "48063ed49b200927376645f9ffe65faa39af84d59ba6f60f2abb2f9c6fa3d9f9"
-
-BBCLASSEXTEND = "native"
diff --git a/recipes/xorg-proto/fontsproto_2.0.2.bb b/recipes/xorg-proto/fontsproto_2.0.2.bb
deleted file mode 100644
index 5b044d3..0000000
--- a/recipes/xorg-proto/fontsproto_2.0.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "c946f166107b016a21cc7a02e1132724"
-SRC_URI[archive.sha256sum] = "83bd547131aa11a232717a0f06d3c6cd58a0b2f6d541660bbe9ebf43073a8b7b"
-
-BBCLASSEXTEND = "native"
diff --git a/recipes/xorg-proto/glproto_1.4.11.bb b/recipes/xorg-proto/glproto_1.4.11.bb
deleted file mode 100644
index 13d35ab..0000000
--- a/recipes/xorg-proto/glproto_1.4.11.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "78e7c4dc7dcb74b1869fee7897e00f59"
-SRC_URI[archive.sha256sum] = "fe481d89d74f01db4f3a671ef1f29df29da74dff5b678517ee659a6f9d819451"
diff --git a/recipes/xorg-proto/glproto_1.4.8.bb b/recipes/xorg-proto/glproto_1.4.8.bb
deleted file mode 100644
index ee27027..0000000
--- a/recipes/xorg-proto/glproto_1.4.8.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "3dfbd17203c0c88b94b6f579f24c11cc"
-SRC_URI[archive.sha256sum] = "2f5d84413853b688b7bb46c66fee108a499190e1f7810afffb775910778f053c"
diff --git a/recipes/xorg-proto/inputproto_1.4.1.bb b/recipes/xorg-proto/inputproto_1.4.1.bb
deleted file mode 100644
index 6e21b13..0000000
--- a/recipes/xorg-proto/inputproto_1.4.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "563cc41eeb590cf5eb2127807b838dfc"
-SRC_URI[archive.sha256sum] = "913ff534aa777e3c36f3e9fe3e8638c3ccfe398daeb7532fa917e7bcd6fed07d"
-
-BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/xorg-proto/inputproto_1.4.2.1.bb b/recipes/xorg-proto/inputproto_1.4.2.1.bb
deleted file mode 100644
index b05df8c..0000000
--- a/recipes/xorg-proto/inputproto_1.4.2.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "aa948a7469168ddd9c33f11c5dff55ac"
-SRC_URI[archive.sha256sum] = "9b6db77037de7c52b9a17862b99bc435bd5c20e5d3faf5aec943b206cdaff3ed"
-
-BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/xorg-proto/inputproto_1.4.2.bb b/recipes/xorg-proto/inputproto_1.4.2.bb
deleted file mode 100644
index 96bdc72..0000000
--- a/recipes/xorg-proto/inputproto_1.4.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "e2c4cf4c2ad59d1e27f09381f6b4a3c3"
-SRC_URI[archive.sha256sum] = "62ba68a056daa89f5b21a02b27f6a4c858933e1c5547c9d16985d9ed182014e6"
-
-BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/xorg-proto/inputproto_1.4.3.bb b/recipes/xorg-proto/inputproto_1.4.3.bb
deleted file mode 100644
index ab4981f..0000000
--- a/recipes/xorg-proto/inputproto_1.4.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a0f0d8cf6fbf0db8ba3937d0cc16138d"
-SRC_URI[archive.sha256sum] = "627119ff21391314b88e5f34da837473151a54ab980d2f76d7f3c6bd3d560d4a"
-
-BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/xorg-proto/inputproto_1.4.4.bb b/recipes/xorg-proto/inputproto_1.4.4.bb
deleted file mode 100644
index 0c37756..0000000
--- a/recipes/xorg-proto/inputproto_1.4.4.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "3a532379f226c34b36a5c585999f75e4"
-SRC_URI[archive.sha256sum] = "63278ef492d6babb9e3efaef84a67a982e5362c51623714c9428f0384007dfe5"
-
-BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/xorg-proto/inputproto_1.5.0.bb b/recipes/xorg-proto/inputproto_1.5.0.bb
deleted file mode 100644
index 007e477..0000000
--- a/recipes/xorg-proto/inputproto_1.5.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "dcc36554aea1338b3813943daf1e9988"
-SRC_URI[archive.sha256sum] = "ef90f7e4c151095cc75a573acd86355aa65c5bc7fd1dcce4a1483b64788e1461"
-
-BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/xorg-proto/kbproto_1.0.3.bb b/recipes/xorg-proto/kbproto_1.0.3.bb
deleted file mode 100644
index 1b089d6..0000000
--- a/recipes/xorg-proto/kbproto_1.0.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "6092cdb0a1225f95356ddbe6c2abaad5"
-SRC_URI[archive.sha256sum] = "7000005ebbd07a28a71477d72bcb76c47064e043a4ead26fcf4d5af394ce19df"
-
-BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/xorg-proto/printproto_1.0.3.bb b/recipes/xorg-proto/printproto_1.0.3.bb
deleted file mode 100644
index e579a5a..0000000
--- a/recipes/xorg-proto/printproto_1.0.3.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "0f4e7982c6d4ec3b2cf38502dd1293a3"
-SRC_URI[archive.sha256sum] = "8b375f8cda83dfc7d84be44af41eedd484d0e2499acbd19bdca5b4056dec7235"
diff --git a/recipes/xorg-proto/randrproto_1.3.0.bb b/recipes/xorg-proto/randrproto_1.3.0.bb
deleted file mode 100644
index aab111a..0000000
--- a/recipes/xorg-proto/randrproto_1.3.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a49416013fff33c853efb32f1926551e"
-SRC_URI[archive.sha256sum] = "cfeb1429465e3c24debde1bf53ec35ef738fde5e80d2eed14f33e315e747bb8d"
-
-BBCLASSEXTEND = "nativesdk sdk"
-
-CONFLICTS = "randrext"
diff --git a/recipes/xorg-proto/recordproto_1.13.2.bb b/recipes/xorg-proto/recordproto_1.13.2.bb
deleted file mode 100644
index fc5e086..0000000
--- a/recipes/xorg-proto/recordproto_1.13.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "0ed4706564a34fc2aff724aa16d3ff00"
-SRC_URI[archive.sha256sum] = "04e77a8b14f373a1825bbe0116cd0db8b2c5dee17b34ba9bddd27e576609cff9"
-
-CONFLICTS = "recordext"
diff --git a/recipes/xorg-proto/renderproto_0.9.2.bb b/recipes/xorg-proto/renderproto_0.9.2.bb
deleted file mode 100644
index 8c5edbf..0000000
--- a/recipes/xorg-proto/renderproto_0.9.2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "28fbe8a59ebd31f098b90ec64f3d133a"
-SRC_URI[archive.sha256sum] = "7754dfbbb1e3818f28720fa9647b8a593e9d54626a7896771c2bfac7f75e2726"
-
-BBCLASSEXTEND = "native nativesdk sdk"
-
-CONFLICTS = "renderext"
diff --git a/recipes/xorg-proto/renderproto_0.9.3.bb b/recipes/xorg-proto/renderproto_0.9.3.bb
deleted file mode 100644
index ac8550e..0000000
--- a/recipes/xorg-proto/renderproto_0.9.3.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "598bc9a493deee2e48e4434e94467189"
-SRC_URI[archive.sha256sum] = "c98a08b877e98a8fa7daa04be472de7e0cb38a99593faca8b987effcea2dd45b"
-
-BBCLASSEXTEND = "native nativesdk sdk"
-
-CONFLICTS = "renderext"
diff --git a/recipes/xorg-proto/resourceproto_1.0.2.bb b/recipes/xorg-proto/resourceproto_1.0.2.bb
deleted file mode 100644
index 40e19ea..0000000
--- a/recipes/xorg-proto/resourceproto_1.0.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "b823b314e37eb19dae1f297951d2e933"
-SRC_URI[archive.sha256sum] = "0c33d6fceef5483001459bdc934b5831502250b27f1f4ad370ab044f8ab53487"
-
-CONFLICTS = "resourceext"
diff --git a/recipes/xorg-proto/scrnsaverproto_1.1.0.bb b/recipes/xorg-proto/scrnsaverproto_1.1.0.bb
deleted file mode 100644
index 52d4869..0000000
--- a/recipes/xorg-proto/scrnsaverproto_1.1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "5d551850e6f4acdf49a13f4eb3a5bbfa"
-SRC_URI[archive.sha256sum] = "db09abf73cc339c05c0488639731794372a4770cfca76c2645f503f9fccd478f"
diff --git a/recipes/xorg-proto/videoproto_2.2.2.bb b/recipes/xorg-proto/videoproto_2.2.2.bb
deleted file mode 100644
index 071f6a3..0000000
--- a/recipes/xorg-proto/videoproto_2.2.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "44292d74a9a3c94b1ecb9d77a0da83e8"
-SRC_URI[archive.sha256sum] = "ab088478830cd30c2fe34fb7f44ffd4d177af7711c225c24676d3e9e9f24780c"
diff --git a/recipes/xorg-proto/windowswmproto_1.0.3.bb b/recipes/xorg-proto/windowswmproto_1.0.3.bb
deleted file mode 100644
index 1daa5c7..0000000
--- a/recipes/xorg-proto/windowswmproto_1.0.3.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "ed5416cf7e2ba6e66641c88f12768c0c"
-SRC_URI[archive.sha256sum] = "780d249696bb2de7acabded90a465a62cd6cbda3b7f0ccff6ebfdf0d8180f151"
diff --git a/recipes/xorg-proto/xcmiscproto_1.1.2.bb b/recipes/xorg-proto/xcmiscproto_1.1.2.bb
deleted file mode 100644
index cafebbc..0000000
--- a/recipes/xorg-proto/xcmiscproto_1.1.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "fde0b050901f024b19159cdacdcfbd20"
-SRC_URI[archive.sha256sum] = "b2807e96a9d632b7bbf1782a43095de51f3feae3d2e25374d3df00c6c68792ab"
-
-BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/xorg-proto/xextproto_7.0.2.bb b/recipes/xorg-proto/xextproto_7.0.2.bb
deleted file mode 100644
index e58f88a..0000000
--- a/recipes/xorg-proto/xextproto_7.0.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "242388ab65dde3a3dd313eeee265e429"
-SRC_URI[archive.sha256sum] = "53f3039ae769b08bd139d4474a7debe0b6f24048e7c514c835c8a1880f11e0d9"
-
-BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/xorg-proto/xextproto_7.0.3.bb b/recipes/xorg-proto/xextproto_7.0.3.bb
deleted file mode 100644
index 908cd32..0000000
--- a/recipes/xorg-proto/xextproto_7.0.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "3a2e0252e853ab30b3bff05ac92ec61c"
-SRC_URI[archive.sha256sum] = "3972428e3651c9159aff655c9c794728520c3ce3d66ac219ec5243d5d73d4db4"
-
-BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/xorg-proto/xf86bigfontproto_1.1.2.bb b/recipes/xorg-proto/xf86bigfontproto_1.1.2.bb
deleted file mode 100644
index 228b5e2..0000000
--- a/recipes/xorg-proto/xf86bigfontproto_1.1.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a318c1e86123832d7b0c95fc7d47ef35"
-SRC_URI[archive.sha256sum] = "01b475b5b27709a738db6f94ce2ded37f5db0792e8d9318069ecf1690a15f124"
-
-BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/xorg-proto/xf86dgaproto_2.0.2.bb b/recipes/xorg-proto/xf86dgaproto_2.0.2.bb
deleted file mode 100644
index fc04869..0000000
--- a/recipes/xorg-proto/xf86dgaproto_2.0.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "461aa291a23e8cf387b70f3efa71b05c"
-SRC_URI[archive.sha256sum] = "3ee1db2481ea222269bd201eef4d0e5d8ca4dbdb5eeb4852cf1efc42d4269b60"
-
-CONFLICTS = "xxf86dgaext"
diff --git a/recipes/xorg-proto/xf86dgaproto_2.0.3.bb b/recipes/xorg-proto/xf86dgaproto_2.0.3.bb
deleted file mode 100644
index 171a401..0000000
--- a/recipes/xorg-proto/xf86dgaproto_2.0.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "42fdcebc66efac02ab4beec2b1b0ad6e"
-SRC_URI[archive.sha256sum] = "5ac4d4a308b032727c61fd56db5a2eaadaedfbce5bc9dc504320bff9d696b002"
-
-CONFLICTS = "xxf86dgaext"
diff --git a/recipes/xorg-proto/xf86driproto_2.0.3.bb b/recipes/xorg-proto/xf86driproto_2.0.3.bb
deleted file mode 100644
index 6c62b64..0000000
--- a/recipes/xorg-proto/xf86driproto_2.0.3.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "e4a282cfd708b8892fca4425fee9cd7b"
-SRC_URI[archive.sha256sum] = "111c469a24374803b08104c725d8318760b226cedccd12b199c83d1b2756b8d6"
diff --git a/recipes/xorg-proto/xf86driproto_2.0.4.bb b/recipes/xorg-proto/xf86driproto_2.0.4.bb
deleted file mode 100644
index cd7b087..0000000
--- a/recipes/xorg-proto/xf86driproto_2.0.4.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "01470d088da3a8a3deefa8e1f45d69cb"
-SRC_URI[archive.sha256sum] = "f57da66bec8563502fe95c0e3f6ed297d9985862f5b64a5c9d3039719ac7f9da"
diff --git a/recipes/xorg-proto/xf86miscproto_0.9.2.bb b/recipes/xorg-proto/xf86miscproto_0.9.2.bb
deleted file mode 100644
index df4c612..0000000
--- a/recipes/xorg-proto/xf86miscproto_0.9.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "acae8edeb05a406f7f60bcbb218a8f1d"
-SRC_URI[archive.sha256sum] = "aaab4cbf19c73ded4785ba69cdd7ae23aaf103c7040559283f85fc1237dad6e6"
diff --git a/recipes/xorg-proto/xf86vidmodeproto_2.2.2.bb b/recipes/xorg-proto/xf86vidmodeproto_2.2.2.bb
deleted file mode 100644
index 00fc499..0000000
--- a/recipes/xorg-proto/xf86vidmodeproto_2.2.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "f00844a63d6e76b69eb0eb5e41eed843"
-SRC_URI[archive.sha256sum] = "07152f990cc79ec5931989decc4a90b1919147e98ff6fcfe39507a9d3fc4d96e"
-
-CONFLICTS = "xxf86vmext"
diff --git a/recipes/xorg-proto/xineramaproto_1.1.2.bb b/recipes/xorg-proto/xineramaproto_1.1.2.bb
deleted file mode 100644
index 2c8b2f7..0000000
--- a/recipes/xorg-proto/xineramaproto_1.1.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "1cc292c562962ad0ad3a253cae68c632"
-SRC_URI[archive.sha256sum] = "e8a62b1cafbcfc3b9fed147612ed4320233d0c9d6de30c991c2cd0c691c40910"
diff --git a/recipes/xorg-proto/xproto_7.0.10.bb b/recipes/xorg-proto/xproto_7.0.10.bb
deleted file mode 100644
index 558bc60..0000000
--- a/recipes/xorg-proto/xproto_7.0.10.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "2ed80e90992e7455eaac4c3e977ebd01"
-SRC_URI[archive.sha256sum] = "6d659920262d41e48714184f94ff9cd2608515e0f3d2f074892fe0c048784df4"
-
-BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/xorg-proto/xproto_7.0.11.bb b/recipes/xorg-proto/xproto_7.0.11.bb
deleted file mode 100644
index 0ea401a..0000000
--- a/recipes/xorg-proto/xproto_7.0.11.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-proto-common.inc
-DESCRIPTION = "X11 core wire protocol and auxiliary headers"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "6b6c266576d81c505aa4a1828151f7f8"
-SRC_URI[archive.sha256sum] = "4ba69b7ef195c1a4e2e8ea9a1101f5079ada1f060c66968226754687685e9e53"
-
-BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/xorg-proto/xproto_7.0.12.bb b/recipes/xorg-proto/xproto_7.0.12.bb
deleted file mode 100644
index 8969c85..0000000
--- a/recipes/xorg-proto/xproto_7.0.12.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "388234421add6c1760b4fc99fcdc76b0"
-SRC_URI[archive.sha256sum] = "bec5a98bbea56da069785784116261ec956df039fb07d0cdca53ae1ed03ebc0f"
-
-BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/xorg-proto/xproto_7.0.13.bb b/recipes/xorg-proto/xproto_7.0.13.bb
deleted file mode 100644
index 938df7f..0000000
--- a/recipes/xorg-proto/xproto_7.0.13.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "7d26f45dca52632712a696e0631dc17b"
-SRC_URI[archive.sha256sum] = "6f6328922d69f5de29513a5baf1d010db2a7a54cb58a7a6cbbb1b25097ecd592"
-
-BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/xorg-proto/xproto_7.0.15.bb b/recipes/xorg-proto/xproto_7.0.15.bb
deleted file mode 100644
index 4beb67f..0000000
--- a/recipes/xorg-proto/xproto_7.0.15.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "1a2b31430d04340be2e49e8b6445e076"
-SRC_URI[archive.sha256sum] = "fd8cd0bc3e94d7416e6af9eddfa909b0e64246e0d2bb41c00f4e02bd85c76bee"
-
-BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/xorg-proto/xproto_7.0.17.bb b/recipes/xorg-proto/xproto_7.0.17.bb
deleted file mode 100644
index 5d7ed8f..0000000
--- a/recipes/xorg-proto/xproto_7.0.17.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "74abb8fb91af66f35873b1f444731220"
-SRC_URI[archive.sha256sum] = "9b2c1fdc5b3780cedc9f5d9caf8f1364f26d07f8502b0eccdde74319157f9d01"
-
-BBCLASSEXTEND = "native nativesdk sdk"
diff --git a/recipes/xorg-proto/xproxymanagementprotocol_1.0.2.bb b/recipes/xorg-proto/xproxymanagementprotocol_1.0.2.bb
deleted file mode 100644
index b018f77..0000000
--- a/recipes/xorg-proto/xproxymanagementprotocol_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-proto-common.inc
-PROVIDES = "xproxymngproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "d28007a50976204960fc1fc07b4ca093"
-SRC_URI[archive.sha256sum] = "c45176d002c85c142ac52774680f5325d330c5ecc32d4d6a056d85ee039a0cbc"
-- 
1.7.2



