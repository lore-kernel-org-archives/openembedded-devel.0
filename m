Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id A4C617752B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Mar 2017 16:41:00 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id g10so6603155wrg.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Mar 2017 09:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=muwA0hO8qPHyyN2fAJwkPk3YuAzsBOSsiv+VMMcxXIk=;
	b=G6KwHmw79eUfq2EPtvsxmxK4qhLpWhH6JgqeZYTeotTOwtN7lU7zJE77sgdNB+oC+i
	HqOgVwvxMejnsh+pRRSJFhnpPntqUcaqSCQ3TnsG4C06kcv+4A5I0K7XOvwLLSleV7hM
	JR9BT1HdrPNpMyghghUbw+YotQi3YqCjsAx1XFX/sXK8wPsv/YqHQBi0loxUIDnPOYXg
	M19lk5doy4zNtpuULIJ2Fgfani9Mjk/3e/cfWT1qx6zaGwgco8hXyIlaaFNgBSm6nZCF
	lEowEtRcN34gWJWvqJzpCkHs4gi78Z7r62PEqdgBmCrrONE1Trt8W8EiSXrfHHgF7sKB
	C3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=muwA0hO8qPHyyN2fAJwkPk3YuAzsBOSsiv+VMMcxXIk=;
	b=UPBYs4wpkLVPw3JiwmhVigkeCdY59q5NuELhEC24XZLPmoG3q12mXTQ4uJwpCCMM6n
	68Zr8G7n9NdZ2wOKR3rcxgOd5frfV/YB5iz062UvkkRrEVNU4EPNpyLoNeh/Papfr2Qa
	gYR/kuloa+Aa1YgUGY8gE5IsYElKqu1qJMqHxGQKlLi26FCazp18J7AsY4w6oy7NteX4
	k62aOmJguKJEM4RHYhZhRsvqOtBU1hO6La+tF5XxsfW/2+3qLIA3prgbH6pCdO2ytCiJ
	9axWql0PuKQia9TMt2qGu78f1O4BaqHZkgh4bbZ8wk+OJxgpmnMsu1neiCWhOa3Eu77/
	Ai/w==
X-Gm-Message-State: AFeK/H1mQbVhGiFNuNi9IyjesLIf5XtZA/nCrqA9H48CVr8t86dNLm2XFJ/unWSmS7E4Jw==
X-Received: by 10.223.150.123 with SMTP id c56mr8762276wra.202.1489682461631; 
	Thu, 16 Mar 2017 09:41:01 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	k10sm4929081wmg.10.2017.03.16.09.41.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Mar 2017 09:41:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Mar 2017 17:40:56 +0100
Message-Id: <20170316164056.15895-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170316164056.15895-1-Martin.Jansa@gmail.com>
References: <20170316164056.15895-1-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 3/3] lprng: disable clear support
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
X-List-Received-Date: Thu, 16 Mar 2017 16:41:00 -0000

* otherwise configure checks for clear and fails to find it since HOSTTOOLS filtering

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/lprng/lprng_3.8.C.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb b/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb
index 80b93d920..963c6320f 100644
--- a/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb
+++ b/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb
@@ -12,6 +12,9 @@ inherit autotools gettext
 EXTRA_OECONF = "--disable-ssl --disable-kerberos --enable-force_localhost"
 FILES_${PN}-dbg += "${libdir}/lprng/filters/.debug"
 
+# configure: WARNING: Program 'clear' is not found. Set environment CLEAR=no if you do not want to use it
+export CLEAR = "no"
+
 do_install_append() {
     mv ${D}/etc/printcap.sample ${D}/etc/printcap
     mv ${D}/etc/lpd/lpd.conf.sample ${D}/etc/lpd/lpd.conf
-- 
2.12.0


