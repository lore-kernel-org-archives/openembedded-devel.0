Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pcgag-0000ZF-I9
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 16:57:02 +0100
Received: by mail-ew0-f47.google.com with SMTP id 28so5818761ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 07:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=5TZWVZ3tGTU1Lmufq7DHukZIdO7EarDFRBnSjHHOGPk=;
	b=F1nqqKp7BTMjduMcuTjzUbIO8ORp8f5VvHwOhLEN7AgZ9/bWprmNOXjQcGBVQMOODy
	DzFQAlN8Hp+G//qV4jz7eId4mqFhsvtE0Ml4PvpNhORHjjBwC/Hu8Tds8PaYkvHtgqjY
	er6CylkuLARQJQpZwdKJRoLrrbX8trxZ34sbA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=YhcS8hKdWfmq9uer0eTW/3IOXn/JUtgZpxXhVbnJodWvaOHRWwfvuXHolG/LDGKr9p
	oOMWTVslz0ZZelfsN5+iswBAf5l2PbhK6ezuhRyXhre15qvICgAMdpXdHXNVQjNBNHeM
	1FgfsBV+u9gjwHN4ntkHxgy7Bp/rY98ZWGI0w=
Received: by 10.223.96.138 with SMTP id h10mr2383060fan.120.1294761389950;
	Tue, 11 Jan 2011 07:56:29 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n1sm7445901fam.16.2011.01.11.07.56.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 11 Jan 2011 07:56:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jan 2011 16:56:21 +0100
Message-Id: <1294761389-13634-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.rc1
In-Reply-To: <1294761389-13634-1-git-send-email-Martin.Jansa@gmail.com>
References: <1294761389-13634-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 04/12] xorg-proto: obsolete old versions
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
X-List-Received-Date: Tue, 11 Jan 2011 15:57:02 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/obsolete/xorg-proto/bigreqsproto_1.1.0.bb  |    7 +++++++
 .../obsolete/xorg-proto/compositeproto_0.4.1.bb    |    8 ++++++++
 recipes/obsolete/xorg-proto/damageproto_1.2.0.bb   |    8 ++++++++
 recipes/obsolete/xorg-proto/dri2proto_2.1.bb       |    6 ++++++
 recipes/obsolete/xorg-proto/fixesproto_4.1.1.bb    |    9 +++++++++
 recipes/obsolete/xorg-proto/fontsproto_2.1.0.bb    |    7 +++++++
 recipes/obsolete/xorg-proto/glproto_1.4.10.bb      |    6 ++++++
 recipes/obsolete/xorg-proto/glproto_1.4.9.bb       |    6 ++++++
 recipes/obsolete/xorg-proto/inputproto_2.0.bb      |    7 +++++++
 recipes/obsolete/xorg-proto/kbproto_1.0.4.bb       |    7 +++++++
 recipes/obsolete/xorg-proto/randrproto_1.3.1.bb    |    9 +++++++++
 recipes/obsolete/xorg-proto/recordproto_1.14.bb    |    8 ++++++++
 recipes/obsolete/xorg-proto/renderproto_0.11.bb    |    9 +++++++++
 recipes/obsolete/xorg-proto/resourceproto_1.1.0.bb |    8 ++++++++
 .../obsolete/xorg-proto/scrnsaverproto_1.2.0.bb    |    6 ++++++
 recipes/obsolete/xorg-proto/videoproto_2.3.0.bb    |    6 ++++++
 recipes/obsolete/xorg-proto/xcmiscproto_1.2.0.bb   |    7 +++++++
 recipes/obsolete/xorg-proto/xextproto_7.1.1.bb     |    7 +++++++
 recipes/obsolete/xorg-proto/xproto_7.0.16.bb       |    7 +++++++
 recipes/xorg-proto/bigreqsproto_1.1.0.bb           |    7 -------
 recipes/xorg-proto/compositeproto_0.4.1.bb         |    8 --------
 recipes/xorg-proto/damageproto_1.2.0.bb            |    8 --------
 recipes/xorg-proto/dri2proto_2.1.bb                |    6 ------
 recipes/xorg-proto/fixesproto_4.1.1.bb             |    9 ---------
 recipes/xorg-proto/fontsproto_2.1.0.bb             |    7 -------
 recipes/xorg-proto/glproto_1.4.10.bb               |    6 ------
 recipes/xorg-proto/glproto_1.4.9.bb                |    6 ------
 recipes/xorg-proto/inputproto_2.0.bb               |    7 -------
 recipes/xorg-proto/kbproto_1.0.4.bb                |    7 -------
 recipes/xorg-proto/randrproto_1.3.1.bb             |    9 ---------
 recipes/xorg-proto/recordproto_1.14.bb             |    8 --------
 recipes/xorg-proto/renderproto_0.11.bb             |    9 ---------
 recipes/xorg-proto/resourceproto_1.1.0.bb          |    8 --------
 recipes/xorg-proto/scrnsaverproto_1.2.0.bb         |    6 ------
 recipes/xorg-proto/videoproto_2.3.0.bb             |    6 ------
 recipes/xorg-proto/xcmiscproto_1.2.0.bb            |    7 -------
 recipes/xorg-proto/xextproto_7.1.1.bb              |    7 -------
 recipes/xorg-proto/xproto_7.0.16.bb                |    7 -------
 38 files changed, 138 insertions(+), 138 deletions(-)
 create mode 100644 recipes/obsolete/xorg-proto/bigreqsproto_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg-proto/compositeproto_0.4.1.bb
 create mode 100644 recipes/obsolete/xorg-proto/damageproto_1.2.0.bb
 create mode 100644 recipes/obsolete/xorg-proto/dri2proto_2.1.bb
 create mode 100644 recipes/obsolete/xorg-proto/fixesproto_4.1.1.bb
 create mode 100644 recipes/obsolete/xorg-proto/fontsproto_2.1.0.bb
 create mode 100644 recipes/obsolete/xorg-proto/glproto_1.4.10.bb
 create mode 100644 recipes/obsolete/xorg-proto/glproto_1.4.9.bb
 create mode 100644 recipes/obsolete/xorg-proto/inputproto_2.0.bb
 create mode 100644 recipes/obsolete/xorg-proto/kbproto_1.0.4.bb
 create mode 100644 recipes/obsolete/xorg-proto/randrproto_1.3.1.bb
 create mode 100644 recipes/obsolete/xorg-proto/recordproto_1.14.bb
 create mode 100644 recipes/obsolete/xorg-proto/renderproto_0.11.bb
 create mode 100644 recipes/obsolete/xorg-proto/resourceproto_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg-proto/scrnsaverproto_1.2.0.bb
 create mode 100644 recipes/obsolete/xorg-proto/videoproto_2.3.0.bb
 create mode 100644 recipes/obsolete/xorg-proto/xcmiscproto_1.2.0.bb
 create mode 100644 recipes/obsolete/xorg-proto/xextproto_7.1.1.bb
 create mode 100644 recipes/obsolete/xorg-proto/xproto_7.0.16.bb
 delete mode 100644 recipes/xorg-proto/bigreqsproto_1.1.0.bb
 delete mode 100644 recipes/xorg-proto/compositeproto_0.4.1.bb
 delete mode 100644 recipes/xorg-proto/damageproto_1.2.0.bb
 delete mode 100644 recipes/xorg-proto/dri2proto_2.1.bb
 delete mode 100644 recipes/xorg-proto/fixesproto_4.1.1.bb
 delete mode 100644 recipes/xorg-proto/fontsproto_2.1.0.bb
 delete mode 100644 recipes/xorg-proto/glproto_1.4.10.bb
 delete mode 100644 recipes/xorg-proto/glproto_1.4.9.bb
 delete mode 100644 recipes/xorg-proto/inputproto_2.0.bb
 delete mode 100644 recipes/xorg-proto/kbproto_1.0.4.bb
 delete mode 100644 recipes/xorg-proto/randrproto_1.3.1.bb
 delete mode 100644 recipes/xorg-proto/recordproto_1.14.bb
 delete mode 100644 recipes/xorg-proto/renderproto_0.11.bb
 delete mode 100644 recipes/xorg-proto/resourceproto_1.1.0.bb
 delete mode 100644 recipes/xorg-proto/scrnsaverproto_1.2.0.bb
 delete mode 100644 recipes/xorg-proto/videoproto_2.3.0.bb
 delete mode 100644 recipes/xorg-proto/xcmiscproto_1.2.0.bb
 delete mode 100644 recipes/xorg-proto/xextproto_7.1.1.bb
 delete mode 100644 recipes/xorg-proto/xproto_7.0.16.bb

diff --git a/recipes/obsolete/xorg-proto/bigreqsproto_1.1.0.bb b/recipes/obsolete/xorg-proto/bigreqsproto_1.1.0.bb
new file mode 100644
index 0000000..7fb106b
--- /dev/null
+++ b/recipes/obsolete/xorg-proto/bigreqsproto_1.1.0.bb
@@ -0,0 +1,7 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "d30c5dbf19ca6dffcd9788227ecff8c5"
+SRC_URI[archive.sha256sum] = "4864e12d3c5a99b0a9ee4704822455299345e6c65b23c688a4e4bf11481107bd"
+
diff --git a/recipes/obsolete/xorg-proto/compositeproto_0.4.1.bb b/recipes/obsolete/xorg-proto/compositeproto_0.4.1.bb
new file mode 100644
index 0000000..8239f8d
--- /dev/null
+++ b/recipes/obsolete/xorg-proto/compositeproto_0.4.1.bb
@@ -0,0 +1,8 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "3692f3f8b2ea10dff3d2cede8dc65e79"
+SRC_URI[archive.sha256sum] = "e2744576731e1416503aade0d58a7861d0260f70b993351473a9f38ced606984"
+
+CONFLICTS = "compositeext"
diff --git a/recipes/obsolete/xorg-proto/damageproto_1.2.0.bb b/recipes/obsolete/xorg-proto/damageproto_1.2.0.bb
new file mode 100644
index 0000000..d5228f8
--- /dev/null
+++ b/recipes/obsolete/xorg-proto/damageproto_1.2.0.bb
@@ -0,0 +1,8 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "434b931b02bd83ed9fc44951df81cdac"
+SRC_URI[archive.sha256sum] = "a50250770a2eead9d6fd56577e3328d0a6a1c4d425b58faa0f5ca7683169ee8f"
+
+CONFLICTS = "damageext"
diff --git a/recipes/obsolete/xorg-proto/dri2proto_2.1.bb b/recipes/obsolete/xorg-proto/dri2proto_2.1.bb
new file mode 100644
index 0000000..55f793b
--- /dev/null
+++ b/recipes/obsolete/xorg-proto/dri2proto_2.1.bb
@@ -0,0 +1,6 @@
+require xorg-proto-common.inc
+DESCRIPTION = "DRI2 extension headers"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "5cb7987d29db068153bdc8f23c767c43"
+SRC_URI[archive.sha256sum] = "2b33f7c7658fb8f004c3aaf2717711262baeb5d77cf3fd24e9b6cc263895122d"
diff --git a/recipes/obsolete/xorg-proto/fixesproto_4.1.1.bb b/recipes/obsolete/xorg-proto/fixesproto_4.1.1.bb
new file mode 100644
index 0000000..4c57f21
--- /dev/null
+++ b/recipes/obsolete/xorg-proto/fixesproto_4.1.1.bb
@@ -0,0 +1,9 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "4c1cb4f2ed9f34de59f2f04783ca9483"
+SRC_URI[archive.sha256sum] = "e72a32916ad4bbd03847f8945c55582bdbafc039d286ded7365d402a7ff164ef"
+
+
+CONFLICTS = "fixesext"
diff --git a/recipes/obsolete/xorg-proto/fontsproto_2.1.0.bb b/recipes/obsolete/xorg-proto/fontsproto_2.1.0.bb
new file mode 100644
index 0000000..63c32f1
--- /dev/null
+++ b/recipes/obsolete/xorg-proto/fontsproto_2.1.0.bb
@@ -0,0 +1,7 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "f3a857deadca3144fba041af1dbf7603"
+SRC_URI[archive.sha256sum] = "5a9af61dc9142488c9ba6e4ae30a9d970ea0f889a1ab7f59de1c1898c83aeb35"
+
diff --git a/recipes/obsolete/xorg-proto/glproto_1.4.10.bb b/recipes/obsolete/xorg-proto/glproto_1.4.10.bb
new file mode 100644
index 0000000..8c16bfc
--- /dev/null
+++ b/recipes/obsolete/xorg-proto/glproto_1.4.10.bb
@@ -0,0 +1,6 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "c9f8cebfba72bfab674bc0170551fb8d"
+SRC_URI[archive.sha256sum] = "7fb83a28ae24d4f56eca88bc48f0fe414faee1afb2574bfb6257b52e8c716fcf"
diff --git a/recipes/obsolete/xorg-proto/glproto_1.4.9.bb b/recipes/obsolete/xorg-proto/glproto_1.4.9.bb
new file mode 100644
index 0000000..4d73486
--- /dev/null
+++ b/recipes/obsolete/xorg-proto/glproto_1.4.9.bb
@@ -0,0 +1,6 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e60951628422663e60faeb400f27bac1"
+SRC_URI[archive.sha256sum] = "69d7fb7be4f0f56bd3a67b6c8c88dc677892eb99fd1b13e166b43b39d64764a3"
diff --git a/recipes/obsolete/xorg-proto/inputproto_2.0.bb b/recipes/obsolete/xorg-proto/inputproto_2.0.bb
new file mode 100644
index 0000000..e5c6807
--- /dev/null
+++ b/recipes/obsolete/xorg-proto/inputproto_2.0.bb
@@ -0,0 +1,7 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "0f7acbc14a082f9ae03744396527d23d"
+SRC_URI[archive.sha256sum] = "472f57f7928ab20a1303a25982c4091db9674c2729bbd692c9a7204e23ea1af4"
+
diff --git a/recipes/obsolete/xorg-proto/kbproto_1.0.4.bb b/recipes/obsolete/xorg-proto/kbproto_1.0.4.bb
new file mode 100644
index 0000000..314107b
--- /dev/null
+++ b/recipes/obsolete/xorg-proto/kbproto_1.0.4.bb
@@ -0,0 +1,7 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "7f439166a9b2bf81471a33951883019f"
+SRC_URI[archive.sha256sum] = "1baa29931313d0c3eb81dffd42662768cc76ce49ce94024d5fe32ef5a4e8603c"
+
diff --git a/recipes/obsolete/xorg-proto/randrproto_1.3.1.bb b/recipes/obsolete/xorg-proto/randrproto_1.3.1.bb
new file mode 100644
index 0000000..6f34976
--- /dev/null
+++ b/recipes/obsolete/xorg-proto/randrproto_1.3.1.bb
@@ -0,0 +1,9 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "a5c244c36382b0de39b2828cea4b651d"
+SRC_URI[archive.sha256sum] = "d93ca3c0ae710a45da6a27e1eeadfb3c9d4aee47f23657c996e1124c0d9985ca"
+
+
+CONFLICTS = "randrext"
diff --git a/recipes/obsolete/xorg-proto/recordproto_1.14.bb b/recipes/obsolete/xorg-proto/recordproto_1.14.bb
new file mode 100644
index 0000000..946b12d
--- /dev/null
+++ b/recipes/obsolete/xorg-proto/recordproto_1.14.bb
@@ -0,0 +1,8 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "70f5998c673aa510e2acd6d8fb3799de"
+SRC_URI[archive.sha256sum] = "1bd2375bd2bdaa3ea90aa0a70cf1657a2d61877b6eb7e3fe3e6f1d289e69d067"
+
+CONFLICTS = "recordext"
diff --git a/recipes/obsolete/xorg-proto/renderproto_0.11.bb b/recipes/obsolete/xorg-proto/renderproto_0.11.bb
new file mode 100644
index 0000000..11c0783
--- /dev/null
+++ b/recipes/obsolete/xorg-proto/renderproto_0.11.bb
@@ -0,0 +1,9 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "b160a9733fe91b666e74fca284333148"
+SRC_URI[archive.sha256sum] = "c4d1d6d9b0b6ed9a328a94890c171d534f62708f0982d071ccd443322bedffc2"
+
+
+CONFLICTS = "renderext"
diff --git a/recipes/obsolete/xorg-proto/resourceproto_1.1.0.bb b/recipes/obsolete/xorg-proto/resourceproto_1.1.0.bb
new file mode 100644
index 0000000..4503a02
--- /dev/null
+++ b/recipes/obsolete/xorg-proto/resourceproto_1.1.0.bb
@@ -0,0 +1,8 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "84795594b3ebd2ee2570cf93340d152c"
+SRC_URI[archive.sha256sum] = "408d9ab067e4141d1bb844d2d0d7d26ad177567384190c32a913131cf549b36b"
+
+CONFLICTS = "resourceext"
diff --git a/recipes/obsolete/xorg-proto/scrnsaverproto_1.2.0.bb b/recipes/obsolete/xorg-proto/scrnsaverproto_1.2.0.bb
new file mode 100644
index 0000000..257da8d
--- /dev/null
+++ b/recipes/obsolete/xorg-proto/scrnsaverproto_1.2.0.bb
@@ -0,0 +1,6 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "9040c991a56ee9b5976936f8c65d5c8a"
+SRC_URI[archive.sha256sum] = "deaf0a3212617e0dab353a3c3a66e0a1f2398306eca0fd882ac15996b0e44d99"
diff --git a/recipes/obsolete/xorg-proto/videoproto_2.3.0.bb b/recipes/obsolete/xorg-proto/videoproto_2.3.0.bb
new file mode 100644
index 0000000..053f71e
--- /dev/null
+++ b/recipes/obsolete/xorg-proto/videoproto_2.3.0.bb
@@ -0,0 +1,6 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "fb762146a18207a1e8bc9f299dfc7ac0"
+SRC_URI[archive.sha256sum] = "4f2bc94e5a1b60d6f35a9a2589ca98949e8841997f6a9acf4e85f46c1f34045f"
diff --git a/recipes/obsolete/xorg-proto/xcmiscproto_1.2.0.bb b/recipes/obsolete/xorg-proto/xcmiscproto_1.2.0.bb
new file mode 100644
index 0000000..cb6c83e
--- /dev/null
+++ b/recipes/obsolete/xorg-proto/xcmiscproto_1.2.0.bb
@@ -0,0 +1,7 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "7b83e4a7e9f4edc9c6cfb0500f4a7196"
+SRC_URI[archive.sha256sum] = "de17c06b7005c5e9ab469e324e76c5c3b8baa2dfc3c1dc7e93438c197facf68e"
+
diff --git a/recipes/obsolete/xorg-proto/xextproto_7.1.1.bb b/recipes/obsolete/xorg-proto/xextproto_7.1.1.bb
new file mode 100644
index 0000000..67a03a8
--- /dev/null
+++ b/recipes/obsolete/xorg-proto/xextproto_7.1.1.bb
@@ -0,0 +1,7 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "fb6ccaae76db7a35e49b12aea60ca6ff"
+SRC_URI[archive.sha256sum] = "6d0abd31ddd57c2cb24cecf5fd90b4c29a276e20e3e03ca3c2c57d074f964d99"
+
diff --git a/recipes/obsolete/xorg-proto/xproto_7.0.16.bb b/recipes/obsolete/xorg-proto/xproto_7.0.16.bb
new file mode 100644
index 0000000..27162c1
--- /dev/null
+++ b/recipes/obsolete/xorg-proto/xproto_7.0.16.bb
@@ -0,0 +1,7 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "75c9edff1f3823e5ab6bb9e66821a901"
+SRC_URI[archive.sha256sum] = "8224da1ce19c0ded4e07a325f3ed62bb4453782db97fd175cb3ffd1acaeb9672"
+
diff --git a/recipes/xorg-proto/bigreqsproto_1.1.0.bb b/recipes/xorg-proto/bigreqsproto_1.1.0.bb
deleted file mode 100644
index 7fb106b..0000000
--- a/recipes/xorg-proto/bigreqsproto_1.1.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "d30c5dbf19ca6dffcd9788227ecff8c5"
-SRC_URI[archive.sha256sum] = "4864e12d3c5a99b0a9ee4704822455299345e6c65b23c688a4e4bf11481107bd"
-
diff --git a/recipes/xorg-proto/compositeproto_0.4.1.bb b/recipes/xorg-proto/compositeproto_0.4.1.bb
deleted file mode 100644
index 8239f8d..0000000
--- a/recipes/xorg-proto/compositeproto_0.4.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "3692f3f8b2ea10dff3d2cede8dc65e79"
-SRC_URI[archive.sha256sum] = "e2744576731e1416503aade0d58a7861d0260f70b993351473a9f38ced606984"
-
-CONFLICTS = "compositeext"
diff --git a/recipes/xorg-proto/damageproto_1.2.0.bb b/recipes/xorg-proto/damageproto_1.2.0.bb
deleted file mode 100644
index d5228f8..0000000
--- a/recipes/xorg-proto/damageproto_1.2.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "434b931b02bd83ed9fc44951df81cdac"
-SRC_URI[archive.sha256sum] = "a50250770a2eead9d6fd56577e3328d0a6a1c4d425b58faa0f5ca7683169ee8f"
-
-CONFLICTS = "damageext"
diff --git a/recipes/xorg-proto/dri2proto_2.1.bb b/recipes/xorg-proto/dri2proto_2.1.bb
deleted file mode 100644
index 55f793b..0000000
--- a/recipes/xorg-proto/dri2proto_2.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-proto-common.inc
-DESCRIPTION = "DRI2 extension headers"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "5cb7987d29db068153bdc8f23c767c43"
-SRC_URI[archive.sha256sum] = "2b33f7c7658fb8f004c3aaf2717711262baeb5d77cf3fd24e9b6cc263895122d"
diff --git a/recipes/xorg-proto/fixesproto_4.1.1.bb b/recipes/xorg-proto/fixesproto_4.1.1.bb
deleted file mode 100644
index 4c57f21..0000000
--- a/recipes/xorg-proto/fixesproto_4.1.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "4c1cb4f2ed9f34de59f2f04783ca9483"
-SRC_URI[archive.sha256sum] = "e72a32916ad4bbd03847f8945c55582bdbafc039d286ded7365d402a7ff164ef"
-
-
-CONFLICTS = "fixesext"
diff --git a/recipes/xorg-proto/fontsproto_2.1.0.bb b/recipes/xorg-proto/fontsproto_2.1.0.bb
deleted file mode 100644
index 63c32f1..0000000
--- a/recipes/xorg-proto/fontsproto_2.1.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "f3a857deadca3144fba041af1dbf7603"
-SRC_URI[archive.sha256sum] = "5a9af61dc9142488c9ba6e4ae30a9d970ea0f889a1ab7f59de1c1898c83aeb35"
-
diff --git a/recipes/xorg-proto/glproto_1.4.10.bb b/recipes/xorg-proto/glproto_1.4.10.bb
deleted file mode 100644
index 8c16bfc..0000000
--- a/recipes/xorg-proto/glproto_1.4.10.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "c9f8cebfba72bfab674bc0170551fb8d"
-SRC_URI[archive.sha256sum] = "7fb83a28ae24d4f56eca88bc48f0fe414faee1afb2574bfb6257b52e8c716fcf"
diff --git a/recipes/xorg-proto/glproto_1.4.9.bb b/recipes/xorg-proto/glproto_1.4.9.bb
deleted file mode 100644
index 4d73486..0000000
--- a/recipes/xorg-proto/glproto_1.4.9.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "e60951628422663e60faeb400f27bac1"
-SRC_URI[archive.sha256sum] = "69d7fb7be4f0f56bd3a67b6c8c88dc677892eb99fd1b13e166b43b39d64764a3"
diff --git a/recipes/xorg-proto/inputproto_2.0.bb b/recipes/xorg-proto/inputproto_2.0.bb
deleted file mode 100644
index e5c6807..0000000
--- a/recipes/xorg-proto/inputproto_2.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "0f7acbc14a082f9ae03744396527d23d"
-SRC_URI[archive.sha256sum] = "472f57f7928ab20a1303a25982c4091db9674c2729bbd692c9a7204e23ea1af4"
-
diff --git a/recipes/xorg-proto/kbproto_1.0.4.bb b/recipes/xorg-proto/kbproto_1.0.4.bb
deleted file mode 100644
index 314107b..0000000
--- a/recipes/xorg-proto/kbproto_1.0.4.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "7f439166a9b2bf81471a33951883019f"
-SRC_URI[archive.sha256sum] = "1baa29931313d0c3eb81dffd42662768cc76ce49ce94024d5fe32ef5a4e8603c"
-
diff --git a/recipes/xorg-proto/randrproto_1.3.1.bb b/recipes/xorg-proto/randrproto_1.3.1.bb
deleted file mode 100644
index 6f34976..0000000
--- a/recipes/xorg-proto/randrproto_1.3.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a5c244c36382b0de39b2828cea4b651d"
-SRC_URI[archive.sha256sum] = "d93ca3c0ae710a45da6a27e1eeadfb3c9d4aee47f23657c996e1124c0d9985ca"
-
-
-CONFLICTS = "randrext"
diff --git a/recipes/xorg-proto/recordproto_1.14.bb b/recipes/xorg-proto/recordproto_1.14.bb
deleted file mode 100644
index 946b12d..0000000
--- a/recipes/xorg-proto/recordproto_1.14.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "70f5998c673aa510e2acd6d8fb3799de"
-SRC_URI[archive.sha256sum] = "1bd2375bd2bdaa3ea90aa0a70cf1657a2d61877b6eb7e3fe3e6f1d289e69d067"
-
-CONFLICTS = "recordext"
diff --git a/recipes/xorg-proto/renderproto_0.11.bb b/recipes/xorg-proto/renderproto_0.11.bb
deleted file mode 100644
index 11c0783..0000000
--- a/recipes/xorg-proto/renderproto_0.11.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "b160a9733fe91b666e74fca284333148"
-SRC_URI[archive.sha256sum] = "c4d1d6d9b0b6ed9a328a94890c171d534f62708f0982d071ccd443322bedffc2"
-
-
-CONFLICTS = "renderext"
diff --git a/recipes/xorg-proto/resourceproto_1.1.0.bb b/recipes/xorg-proto/resourceproto_1.1.0.bb
deleted file mode 100644
index 4503a02..0000000
--- a/recipes/xorg-proto/resourceproto_1.1.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "84795594b3ebd2ee2570cf93340d152c"
-SRC_URI[archive.sha256sum] = "408d9ab067e4141d1bb844d2d0d7d26ad177567384190c32a913131cf549b36b"
-
-CONFLICTS = "resourceext"
diff --git a/recipes/xorg-proto/scrnsaverproto_1.2.0.bb b/recipes/xorg-proto/scrnsaverproto_1.2.0.bb
deleted file mode 100644
index 257da8d..0000000
--- a/recipes/xorg-proto/scrnsaverproto_1.2.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "9040c991a56ee9b5976936f8c65d5c8a"
-SRC_URI[archive.sha256sum] = "deaf0a3212617e0dab353a3c3a66e0a1f2398306eca0fd882ac15996b0e44d99"
diff --git a/recipes/xorg-proto/videoproto_2.3.0.bb b/recipes/xorg-proto/videoproto_2.3.0.bb
deleted file mode 100644
index 053f71e..0000000
--- a/recipes/xorg-proto/videoproto_2.3.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "fb762146a18207a1e8bc9f299dfc7ac0"
-SRC_URI[archive.sha256sum] = "4f2bc94e5a1b60d6f35a9a2589ca98949e8841997f6a9acf4e85f46c1f34045f"
diff --git a/recipes/xorg-proto/xcmiscproto_1.2.0.bb b/recipes/xorg-proto/xcmiscproto_1.2.0.bb
deleted file mode 100644
index cb6c83e..0000000
--- a/recipes/xorg-proto/xcmiscproto_1.2.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "7b83e4a7e9f4edc9c6cfb0500f4a7196"
-SRC_URI[archive.sha256sum] = "de17c06b7005c5e9ab469e324e76c5c3b8baa2dfc3c1dc7e93438c197facf68e"
-
diff --git a/recipes/xorg-proto/xextproto_7.1.1.bb b/recipes/xorg-proto/xextproto_7.1.1.bb
deleted file mode 100644
index 67a03a8..0000000
--- a/recipes/xorg-proto/xextproto_7.1.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "fb6ccaae76db7a35e49b12aea60ca6ff"
-SRC_URI[archive.sha256sum] = "6d0abd31ddd57c2cb24cecf5fd90b4c29a276e20e3e03ca3c2c57d074f964d99"
-
diff --git a/recipes/xorg-proto/xproto_7.0.16.bb b/recipes/xorg-proto/xproto_7.0.16.bb
deleted file mode 100644
index 27162c1..0000000
--- a/recipes/xorg-proto/xproto_7.0.16.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "75c9edff1f3823e5ab6bb9e66821a901"
-SRC_URI[archive.sha256sum] = "8224da1ce19c0ded4e07a325f3ed62bb4453782db97fd175cb3ffd1acaeb9672"
-
-- 
1.7.4.rc1



