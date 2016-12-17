Return-Path: <joe@deserted.net>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id D0AAD77429
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 02:15:22 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id n68so4527009itn.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2016 18:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=856xK+porufJoPaKtvWIf3Qva+rABzllDhhW94LwXF8=;
	b=h5UONALoymXDF7em1M+RwkOjVzAeE+prleZbGAFj83JdUgfFqP9iR+6APfATv7sQ7a
	dTa4A6ulvGEkYbTnGC3JXPY7RacUP75VkVq9S7DjuD2KioLBPDZwCNAkDF4z57v28OB5
	XQ74J3Iz4brl+pdlkk/T/hyQ3MCjfD5Um2fziDcK/Zu2+JTBxEgEGgW7+SvxRM8JaslV
	FZ1NTMA6t+xjqXK7+/UuWQrYmKfAMcc8GRHBWKR5z27XgmQuJZLm6DyhH/Yqj4v9BY26
	SSdw3WSk7F/5Yz3e+up1KPe1UfzdtfCNn7DvynZJS2z3c+40OGgudqQk4isgOZ5KxUzh
	Z16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=856xK+porufJoPaKtvWIf3Qva+rABzllDhhW94LwXF8=;
	b=W8+b8Erduqe47MWau4jM0hi3KUoHbNWmXYgJHrAyYMJxKcKmhvKPrt9F9WeoWptX1d
	9p18l9jOnCSBPkcE9VldiZvhOREedoIOzXV5qO4FvhHUEIVEcHkM3k/TIpLDjagjAZwq
	zQdx4EzOokiEsb5uTkLjio7AODxjLSrMNdg4WFwhdFYzRfkImMvQzuvoDVeBNiT+SJLG
	jzgOowAUhQ15z0uyGLu1+FXxqb2qT/3UsET7Ep/pdzOQRsaNwSAX4kS0l/DgROkCr1Z0
	0YCMijz2KYBS75id4Xpp9GkvO+sbw1SahaoN5kJdCYiMepYTlm9YfS/TliwgIbzzqScP
	04Cw==
X-Gm-Message-State: AKaTC00dzzlih+lD+0iXMCbMwfmOFXqfSD870HQgJNcnilIypD8AFhGlFdkdzWVrTb5XcQ==
X-Received: by 10.36.82.85 with SMTP id d82mr6874788itb.95.1481940923974;
	Fri, 16 Dec 2016 18:15:23 -0800 (PST)
Received: from mir.deserted.net (23-233-31-74.cpe.pppoe.ca. [23.233.31.74])
	by smtp.gmail.com with ESMTPSA id l73sm3804122ioe.1.2016.12.16.18.15.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Dec 2016 18:15:23 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Dec 2016 21:15:20 -0500
Message-Id: <1481940923-12914-9-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
References: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 08/11] samba: add packages samba-dsdb-modules, samba-testsuite and registry-tools
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
X-List-Received-Date: Sat, 17 Dec 2016 02:15:23 -0000

From: Andreas Oberritter <obi@opendreambox.org>

Inspired by Debian.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index ac090c2..a678578 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -153,6 +153,7 @@ do_install_append() {
 }
 
 PACKAGES =+ "${PN}-python ${PN}-pidl \
+             ${PN}-dsdb-modules ${PN}-testsuite registry-tools \
              winbind \
              ${PN}-common ${PN}-base ${PN}-ctdb-tests \
              smbclient"
@@ -209,6 +210,19 @@ FILES_${PN} += "${libdir}/vfs/*.so \
                 ${libdir}/auth/*.so \
 "
 
+FILES_${PN}-dsdb-modules = "${libdir}/samba/ldb"
+
+FILES_${PN}-testsuite = "${bindir}/gentest \
+                         ${bindir}/locktest \
+                         ${bindir}/masktest \
+                         ${bindir}/ndrdump \
+                         ${bindir}/smbtorture"
+
+FILES_registry-tools = "${bindir}/regdiff \
+                        ${bindir}/regpatch \
+                        ${bindir}/regshell \
+                        ${bindir}/regtree"
+
 FILES_winbind = "${sbindir}/winbindd \
                  ${bindir}/wbinfo \
                  ${bindir}/ntlm_auth \
-- 
1.9.1


