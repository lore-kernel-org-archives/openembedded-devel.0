Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJ767-0001WS-Pn
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 18:44:47 +0200
Received: by mail-gy0-f175.google.com with SMTP id 1so1741699gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2011 09:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=tkTqdhvSBIX/V7cgpgdmsIgawYHgEqehCngL8Tnt62o=;
	b=GN90dKP8pQjaqeWwzoBDSR0LbHGwKIYxEkioXsqGC2VPOhKsGB5gy5DvmRbOE0s4xb
	/sDgj4C0ZMd+/aS5R5hEyaQpEer46WC4DVpPNCMVHw4oyjfCkH7y6eBEq+VJvFOSMmMT
	xursfaaFRoYqIHkl4Y0JJ9N2vyqmV3IPtLs9M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=bLbNIIsblCMsFaWUinUul9To8UR4voNPzd/bLQ+EIzPk5YF4zJNRfdlbBVe037WTfD
	KWI7kGMKV9W7L6RQlg+5dJgLCqcy1CFqDrMf2ew4L5cTgB/IlgXQQhtr9sUVddau9uf1
	ClFLCOHPmNzqKdOvmJda21mit7pC6C0d4rZaY=
Received: by 10.236.32.164 with SMTP id o24mr1315387yha.116.1304872923063;
	Sun, 08 May 2011 09:42:03 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l74sm2245064yhn.96.2011.05.08.09.42.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 May 2011 09:42:02 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 May 2011 16:41:31 +0000
Message-Id: <1304872895-21596-7-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304872895-21596-1-git-send-email-otavio@ossystems.com.br>
References: <1304872895-21596-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v3 07/11] libiconv: drop hack since gettext was being inherited
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
X-List-Received-Date: Sun, 08 May 2011 16:44:48 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-support/libiconv/libiconv_1.13.1.bb    |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/libiconv/libiconv_1.13.1.bb b/meta-oe/recipes-support/libiconv/libiconv_1.13.1.bb
index 4db70cb..868314b 100644
--- a/meta-oe/recipes-support/libiconv/libiconv_1.13.1.bb
+++ b/meta-oe/recipes-support/libiconv/libiconv_1.13.1.bb
@@ -8,10 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 BBCLASSEXTEND = "native nativesdk"
 
 PROVIDES = "virtual/libiconv"
-PR = "r1"
-
-#gettext.class cant be inherit here so use this hack
-DEPENDS = "${@['','gettext-native'][bb.data.getVar('USE_NLS', d, 1) == 'yes']}"
+PR = "r2"
 
 EXTRA_OECONF +=  "${@['--disable-nls','--enable-nls'][bb.data.getVar('USE_NLS', d, 1) == 'yes']}"
 
-- 
1.7.2.5



