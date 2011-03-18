Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q0aHM-0005Tz-D3
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 15:03:48 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so3155541bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 07:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=QyEl6Xed+Bf4Ejo0q9Kl+cPh84NIEGfAetbtFHEEwfk=;
	b=len6sjiZ3ppAsdCWiwBFyblIChCootgHM+1E4O8NGlZRLw9Jj5UTU9lnVNE2vuq9Yd
	PwHtbnJJWMjn5BtudRLaFug4BF2xUYp9JCyFVb6qC81Il7ZnrkR1U/bM5K4yRnMuEpnB
	p3bgf3hwSv7f68hNAJSttlSMBJOq8G7AdDym8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=tKZyL29bl+7GGIbidNn4ASEY2HxzCVnhxd638KkFPWHhWCwkERvERIsSax00nqpnwx
	HxXX71AdU+z581v7ZsHJmtqvO4oHgJ1yODbekz5AbKc+IJbCjbhx/M7DLu8zMeRnUTDw
	2Nc/LgsUYTiNcPkHVbFNj/Shfcg9PN+WYwGII=
Received: by 10.204.18.194 with SMTP id x2mr1017783bka.69.1300456925104;
	Fri, 18 Mar 2011 07:02:05 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id k5sm2164905bku.16.2011.03.18.07.02.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Mar 2011 07:02:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Mar 2011 15:00:25 +0100
Message-Id: <1300456829-25755-8-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1300456829-25755-1-git-send-email-Martin.Jansa@gmail.com>
References: <1300456829-25755-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 08/12] hostap-daemon: depend only on libnl(-2.0) not libnl2(-2.0)
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
X-List-Received-Date: Fri, 18 Mar 2011 14:03:48 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/hostap/hostap-daemon_0.7.3.bb |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/recipes/hostap/hostap-daemon_0.7.3.bb b/recipes/hostap/hostap-daemon_0.7.3.bb
index 2dfec35..10b1389 100644
--- a/recipes/hostap/hostap-daemon_0.7.3.bb
+++ b/recipes/hostap/hostap-daemon_0.7.3.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://hostap.epitest.fi"
 SECTION = "kernel/userland"
 PRIORITY = "optional"
 LICENSE = "GPL"
-DEPENDS = "libnl2 openssl"
-PR = "r1"
+DEPENDS = "libnl openssl"
+PR = "r2"
 
 DEFAULT_PREFERENCE = "-1"
 
@@ -21,7 +21,6 @@ INITSCRIPT_NAME=hostapd
 
 do_configure() {
 	install -m 0644 ${WORKDIR}/defconfig ${S}/.config
-	echo 'CFLAGS += "-I${STAGING_INCDIR}/libnl2"' >> ${S}/.config
 }
 
 do_compile() {
-- 
1.7.4.1



