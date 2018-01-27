Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7ACDA787DE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:24:58 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id i66so1452167pfd.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=HDbpl7L2hvx15auqxU7QA/YVvM9PZFdp/Nv8xvQgzK0=;
	b=akn/Uob8FYMddUUpPUubPOhcg6Ym4NxSqGZWxH6Ibq7IiQbihXrdBd2O96sXab9qu1
	KKSFJPPJ/r8ts3sRV1v1nAqNicsINLpeFTLIU51dtBO09TX5uEyMfW6cRqhgsP3xnL6l
	DQ0SUeeS9Xz+HhJL66iRe55vD5UXwDN9c2dNSMnv5XtzHT8oEDO6VomRW4t9xnEJnpGp
	O2Ja1ckTFcdaLJmny4VJY8/QHN7yLm81yk33wkAyNvN5b0k2SNzGlA1mLSoghiSU6tf8
	BEGnsDUOIOWsy/h4FWWlIl2CakM4Lw+cqT3avNHSjN5siU2oR12tEuccyZ4ImW/htj90
	il7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=HDbpl7L2hvx15auqxU7QA/YVvM9PZFdp/Nv8xvQgzK0=;
	b=uVpwdB/ORi2amXOO5iMGkbFPDYY/z/MnKvFIIh2NZq3YYC6B3Ky1TUKHVmlV0m0q84
	trjDvySMXTIuiPqSpdQcZTp4+YSuX+4D33Yd+h+lS7lLy/K1sBthP4+mh12Qkf98XQN6
	JUEe6G88h3MSNihxKsUpHPScmt076lVW27nRad/t1gA25saJJKNqxmOINHffH3V61e43
	NhY4keQfhXEdzQL4oERF3kjuWact/xt7Loxf4/yeVAccOvrsYlKqiE021T1rhAXTF8YM
	UBAk1TNYpoQswIIzxYIUFC+RD8CGwSP267aFGlUadfr7h5OoVSM2hGTnOPOZQd+V9OE2
	4Y3w==
X-Gm-Message-State: AKwxytd0SRA1GMQVgcA0HLbeYGgD138bvAw9fUUHGsvU7TwaBGURmQjG
	SlLHGlk608bJmkzl0O4BBH72mg==
X-Google-Smtp-Source: AH8x225fQMMiKEowO/99V24hVLuyRkqMnVX4gSMkPXNZCFkXug9wZfwNLBRgcQKEd9yUfpOzw939/g==
X-Received: by 10.98.58.194 with SMTP id v63mr20993767pfj.36.1517023499733;
	Fri, 26 Jan 2018 19:24:59 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.24.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:24:59 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:20 -0800
Message-Id: <bd348c701142b547cceb4e53c78e6ebaaed81f68.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
Subject: [PATCH 20/36] openldap: fix QA Warning
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
X-List-Received-Date: Sat, 27 Jan 2018 03:24:58 -0000

From: Qi Hou <qi.hou@windriver.com>

While building openldap, there was a warning, like below:

WARNING: QA Issue: openldap: Files/directories were installed but not shipped in any package:
  /usr/libexec
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
openldap: 1 installed and not shipped files. [installed-vs-shipped]

This is because that after openldap all contents of /usr/libexec are split
into subsets or moved into other directory and no one makes use of it.

So, to fix this QA warning, delete /usr/libexec.

Signed-off-by: Qi Hou <qi.hou@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit aaf496df4cef4703a6d4b380b3f5ddf738753406)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/openldap/openldap_2.4.45.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.45.bb b/meta-oe/recipes-support/openldap/openldap_2.4.45.bb
index 06d2467..82d6619 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.45.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.45.bb
@@ -188,6 +188,7 @@ do_install_append() {
 
     # Installing slapd under ${sbin} is more FHS and LSB compliance
     mv ${D}${libexecdir}/slapd ${D}/${sbindir}/slapd
+    rmdir --ignore-fail-on-non-empty ${D}${libexecdir}
     SLAPTOOLS="slapadd slapcat slapdn slapindex slappasswd slaptest slapauth slapacl slapschema"
     cd ${D}/${sbindir}/
     rm -f ${SLAPTOOLS}
-- 
2.7.4


