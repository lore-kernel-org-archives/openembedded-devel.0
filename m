Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 563DD70101
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 13:17:40 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id e124so2067045qkc.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 06:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=Pe0y7SVdU/+ibh5i1BoFmdHM+HDzi09sAjdE64s0zzM=;
	b=Ge9sb1Q6Eukbk8M+4CeYPgUX8O8RopeYautqiD4AIqY3NNLd5aZjyZel+YOew0XasJ
	CIWvaowrw/VPkX/FOp+WJcUzOj9umCwsO3cwtBjt2lcctSGxwWyr2NpQEfhZJ91lVzza
	WTWs+/NkTIkIUD4Y9WY3AeFMY/MJLL+fOdxzh2H5jGi+8StlAzEumR70gwcR4/yP+cxM
	17Ju7vKYld/7DeI/kUeiqgdZuPD5Wbn8loOtDK/mW/teyaj8Yja5/CgGW22jzOaY09yQ
	cFPfjKa7qYbGBqI50Y5EjIbwlgL0wvF0Kcket0RsDS0LC5KEVKYciTWLR2eyV6NYr0as
	wljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=Pe0y7SVdU/+ibh5i1BoFmdHM+HDzi09sAjdE64s0zzM=;
	b=m1bdOl64KXtjrP6GjaklVoodMgeAAslrp5ibYbiPsuBaCFNobK5zlaFyUROhJHfzfv
	76Bau58LqaUbI2Ov844JvTXfuI2RkScfsQvrd2S2i2F47fwOV0Dx40WHyLqndyemFhYF
	grd8bPE/2rmKUSU8qYdfVBhERyAf1r3RM4EUOCllvDc/uOaOg+r2hajcuXYbgmFH44cW
	i7MD69Hk6ZCeMASRrvSrK+R0REy6PlZHIpLyI7ClaelrjlJqj01D846cFhsvAIsmkOvu
	OBuQv+9BEJQiiyJEp55OF28Ny6N0iTcQMZJpCRI8Pdtf3POxuqk52YBRubhRCunSmIq1
	yohQ==
X-Gm-Message-State: AOPr4FVC95ctnIgWh4hSRvl1LO8Vj59JVJ76o9xeTjtVuPl7RaRQaYTnl0MLkt1PCpehhQ==
X-Received: by 10.55.165.3 with SMTP id o3mr11369253qke.0.1460553461107;
	Wed, 13 Apr 2016 06:17:41 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id
	s62sm9367206qhe.10.2016.04.13.06.17.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Apr 2016 06:17:40 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Apr 2016 10:16:59 -0300
Message-Id: <1460553420-12533-8-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1460553420-12533-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1460553420-12533-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 8/9] python-pam: Add recipe for version 1.8.2
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
X-List-Received-Date: Wed, 13 Apr 2016 13:17:40 -0000

It's a python PAM module using ctypes, py3/py2.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-pam_1.8.2.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pam_1.8.2.bb

diff --git a/meta-python/recipes-devtools/python/python-pam_1.8.2.bb b/meta-python/recipes-devtools/python/python-pam_1.8.2.bb
new file mode 100644
index 0000000..05bddd5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pam_1.8.2.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Python PAM module using ctypes, py3/py2."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=64326d42471b493c5c088305364ad5da"
+
+SRC_URI[md5sum] = "db71b6b999246fb05d78ecfbe166629d"
+SRC_URI[sha256sum] = "26efe4e79b869b10f97cd8c4a6bbb04a4e54d41186364e975b4108c9c071812c"
+
+PYPI_PACKAGE = "python-pam"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} = "libpam"
-- 
2.1.4


