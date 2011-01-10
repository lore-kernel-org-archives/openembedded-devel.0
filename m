Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PcEUO-0003Uq-4L
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 10:56:36 +0100
Received: by fxm17 with SMTP id 17so17855661fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jan 2011 01:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=CvxGg3y+S1vOiVafwVFaiFkS7JNwXAVN4u+oNMb5dfU=;
	b=SFd4mJxn7sgMi7B7XPnNNqv8FqcjFGA1hZY6hf0awBhO1cAl2LnpMXp8qlK/OvWnmG
	cjTihFA2kDcpHBBzLFoOshSSTi5SETxaGPZSeTujE5F0k44Mgv+KYbqyyGFRTXWlR0A6
	xch5uI+a4TFWeqIsL3u4gsbkFfLafuTBy6SgM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=LgGm4EdEtCsrTm5/tkHn0kLdcW10Ld2gAMqHOVgI3WMeMikLYUNU7dvh/qB6SoCIAR
	j4lRozbQPhUZ2lJyndrQSLXlwoNTMjyGQEDfhCKN18xCCdRHjFF77eCErlsDDmR1ry8e
	ZGn3aWBjnJzseSuRBJG7b+NXqfn5L0MLKPCKw=
Received: by 10.223.96.199 with SMTP id i7mr776891fan.56.1294653366138;
	Mon, 10 Jan 2011 01:56:06 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id r24sm6857172fax.3.2011.01.10.01.56.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 10 Jan 2011 01:56:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Jan 2011 10:55:56 +0100
Message-Id: <1294653360-27612-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.rc1
In-Reply-To: <1294653360-27612-1-git-send-email-Martin.Jansa@gmail.com>
References: <1294653360-27612-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/6] mesa-7.9.1: change configure.ac to check for python not python2 as python-native does not stage python2
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
X-List-Received-Date: Mon, 10 Jan 2011 09:56:36 -0000

* should we fix it in python recipes instead? maybe more projects are looking for python2 and finds is on host not sysroot

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/mesa/mesa-7.9.1.inc |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/recipes/mesa/mesa-7.9.1.inc b/recipes/mesa/mesa-7.9.1.inc
index 48bdd42..99a1afe 100644
--- a/recipes/mesa/mesa-7.9.1.inc
+++ b/recipes/mesa/mesa-7.9.1.inc
@@ -9,3 +9,8 @@ SRC_URI[archive.md5sum] = "07dc6cfb5928840b8b9df5bd1b3ae434"
 SRC_URI[archive.sha256sum] = "403986cd83d957db17957f11c320c9562cc8675273efbaa402e88bf4e6586721"
 
 EXTRA_OECONF += " --disable-gallium"
+
+do_configure_prepend() {
+  #check for python not python2, because python-native does not stage python2 binary/link
+  sed -i 's/AC_CHECK_PROGS(\[PYTHON2\], \[python2 python\])/AC_CHECK_PROGS(\[PYTHON2\], \[python python\])/g' ${S}/configure.ac
+}
-- 
1.7.4.rc1



