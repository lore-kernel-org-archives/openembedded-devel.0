Return-Path: <joe@deserted.net>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id A195F77423
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 02:15:20 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id f73so13706950ioe.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2016 18:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Vo8kHy6XUqYG+XZSk1dJijZC8+/sWceTK9riV4zMwPU=;
	b=F8Qay1+tqA0iVWLr5A+3X7JeULLzGy9KmVi/61Z4M5T+sxnmVYeNgCXEhYI8hNcmIH
	TZiFB45hSadHuM1rDUr79rDeAKmeB90cfzyriXBhTx9++PHi2p6tZgWv2qZ0JAO3eyA9
	86BYH+XX7Hpu8m6mdOjNlix4SZzEihkNYmxk9MLQMD9482T/ikgzkOfBjcF/bfR52auF
	JcnOd2QR+yjc0wAbmsEDo22uAPrNIlrcziDDDpgrT1n0povw2sWfJpE8urQb1jDBT6Q6
	lVyBd3B72rjBA3uJLFYqIur/u9Mu0BGcM7kVeWN1l33FU7n4Rh22NNh8/PQXakfqfTwK
	fS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=Vo8kHy6XUqYG+XZSk1dJijZC8+/sWceTK9riV4zMwPU=;
	b=NGLIV8JGGr2MALNhRRn9ezi/3yf8gWPlzhqwRQFrf+GxjC0sp7Y0RUQZzQNpDjmkIV
	1dtBujAdhaOrOX2n8ZCIEv+83yX9/haMzBw+xXrLsgxvnT16kNneqBbyBie3aqa0hcBX
	0k99SEFdCVBdBZ9smAUjJgw2cbCapS2lJcw+VezT0IsfBJnH0SqveK59WtKHyjwaCBLO
	PaA66BWUpGu9qhGnPPCEBsdMeb69D5b8I+jSt/qLp7DP5pVKYpM0LqPQtI6QFT54DNBi
	tKa6RJDlM90fTKDGPB7Hq7W5TxJjlQEFVeICIDGEAnKZtcF1UaunZ30XtpRnaxxHVqeW
	YsZA==
X-Gm-Message-State: AIkVDXKxOph/c93E0ETdgw/Tn7Gykmfnb59oI4F4QW4gOVIrhDG5NSWSXdTYUilpkXvpmQ==
X-Received: by 10.107.12.28 with SMTP id w28mr6465278ioi.196.1481940922266;
	Fri, 16 Dec 2016 18:15:22 -0800 (PST)
Received: from mir.deserted.net (23-233-31-74.cpe.pppoe.ca. [23.233.31.74])
	by smtp.gmail.com with ESMTPSA id l73sm3804122ioe.1.2016.12.16.18.15.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Dec 2016 18:15:21 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Dec 2016 21:15:18 -0500
Message-Id: <1481940923-12914-7-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
References: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 06/11] samba: simplify files list for samba-python
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
X-List-Received-Date: Sat, 17 Dec 2016 02:15:20 -0000

From: Andreas Oberritter <obi@opendreambox.org>

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 .../recipes-connectivity/samba/samba_4.4.5.bb          | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index c4b31df..1b855c3 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -292,23 +292,7 @@ FILES_libwinbind = "${base_libdir}/security/pam_winbind.so \
                     ${systemd_system_unitdir}/winbind.service"
 FILES_libwinbind-krb5-locator = "${libdir}/winbind_krb5_locator.so"
 
-FILES_${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.so \
-                      ${libdir}/python${PYTHON_BASEVERSION}/site-packages/_ldb_text.py \
-                      ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/*.py \
-                      ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/*.so \
-                      ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/dcerpc/*.so \
-                      ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/dcerpc/*.py \
-                      ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/external/* \
-                      ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/kcc/* \
-                      ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/netcmd/*.py \
-                      ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/provision/*.py \
-                      ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/samba3/*.py \
-                      ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/samba3/*.so \
-                      ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/subunit/* \
-                      ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/tests/* \
-                      ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/third_party/* \
-                      ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/web_server/* \
-"
+FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
 
 FILES_smbclient = "${bindir}/cifsdd \
                    ${bindir}/rpcclient \
-- 
1.9.1


