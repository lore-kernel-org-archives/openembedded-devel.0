Return-Path: <joe@deserted.net>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0C69D7744D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 16:04:48 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id p13so14995271ioi.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 08:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7TYKJw7vj9qvGkT7dfYIMZ9bidUF8Shees4JND/RJpM=;
	b=UU0dkt405monDDSl0HU9pOqReJx+J9B2a29+dcFkZvBm3DNtpW0+KT6gMqw2EYI7cI
	481g8j4I32o/GUYjJs2kaDN/Dg4ST5ldV7HBDRL78FQalt5sZPHExURlC7B4EegFhkk7
	R8408MyAjbEkFqGyusoCo/e1qIArct52EsoBxDbVN7SBE2jjx+N3KQjnMY+rUbH+Lxqq
	p56ZB455p7kcgD0xKyISJ7jTFq+Ne1h8YyWC8r8OfSg5gKq1YXZCjo4hsSb2azkmh/fN
	oGFqLmBicUikMqGrapDYEYeP6Cpd37Fc4TCjjNOvKzSMqa1U7A1slEHw26TLAP62fX4y
	4LxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=7TYKJw7vj9qvGkT7dfYIMZ9bidUF8Shees4JND/RJpM=;
	b=hnXCkuWZl2BXALNtLiY6Cx5dcNKUAuge8ltjPJnSPdJ+EaUJM3H4JNkurIG4l3zcuF
	b8YsEn5tXBA+25Yn6v0pbIAozpXp/jkK7aM+oT5l29avUFvRUPI4OHsRrQ8DgTECJpEi
	MbyaeJivuZhtJHMjIGXEsATf6myTDFXv3XSTtGJHL53rBcL01V0nJ8QQcMCmMs+S47l4
	oZEoSCie3Q6cRFzuaz3Yvpi38o+vqFwxKV/+J1QZ+R3Vx6E6hvsAxbNLapA0KmKyQtef
	d1CL4ZTn5HN5fqAW9U/dlzjLeKFo9HgI1tg7Z85oIfJ8R/tmj75XX9HbKgdC9ZHJ+CgY
	DH7A==
X-Gm-Message-State: AIkVDXKb4GVhGgYXCaHKnyBrtrS8mLJJ7+++sf454At0+VXvOkIy9yMwWl7X+Dooa1bKBw==
X-Received: by 10.107.37.6 with SMTP id l6mr8054301iol.218.1481990690142;
	Sat, 17 Dec 2016 08:04:50 -0800 (PST)
Received: from mir.deserted.net (23-233-31-74.cpe.pppoe.ca. [23.233.31.74])
	by smtp.gmail.com with ESMTPSA id
	c36sm3371303itd.18.2016.12.17.08.04.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 17 Dec 2016 08:04:49 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Dec 2016 11:04:51 -0500
Message-Id: <1481990698-15962-4-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1481990698-15962-1-git-send-email-joe_macdonald@mentor.com>
References: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
	<1481990698-15962-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 03/10] samba: add smbclient package
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
X-List-Received-Date: Sat, 17 Dec 2016 16:04:49 -0000

From: Andreas Oberritter <obi@opendreambox.org>

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 .../recipes-connectivity/samba/samba_4.4.5.bb         | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index aabc043..1d9d75b 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -144,10 +144,10 @@ do_install_append() {
     rm -rf ${D}/run ${D}${localstatedir}/run ${D}${localstatedir}/log
 }
 
-PACKAGES =+ "${PN}-python ${PN}-pidl libwinbind libwinbind-krb5-locator"
-PACKAGES =+ "libwbclient libnss-winbind winbind libnetapi libsmbsharemodes \
-             libsmbclient lib${BPN}-base ${PN}-base ${PN}-ctdb-tests"
-
+PACKAGES =+ "${PN}-python ${PN}-pidl libwinbind libwinbind-krb5-locator \
+             libwbclient libnss-winbind winbind libnetapi libsmbsharemodes \
+             libsmbclient lib${BPN}-base ${PN}-base ${PN}-ctdb-tests \
+             smbclient"
 
 RDEPENDS_${PN} += "${PN}-base"
 
@@ -302,5 +302,16 @@ FILES_${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.so \
                       ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/web_server/* \
 "
 
+FILES_smbclient = "${bindir}/cifsdd \
+                   ${bindir}/rpcclient \
+                   ${bindir}/smbcacls \
+                   ${bindir}/smbclient \
+                   ${bindir}/smbcquotas \
+                   ${bindir}/smbget \
+                   ${bindir}/smbspool \
+                   ${bindir}/smbtar \
+                   ${bindir}/smbtree \
+                   ${libdir}/samba/smbspool_krb5_wrapper"
+
 RDEPENDS_${PN}-pidl_append = " perl"
 FILES_${PN}-pidl = "${bindir}/pidl ${datadir}/perl5/Parse"
-- 
1.9.1


