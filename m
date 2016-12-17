Return-Path: <joe@deserted.net>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 909A977438
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 16:04:50 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id b194so14925164ioa.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 08:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5WvsXZ7ENbYHvH7F743DWvcmlZwAof2aCukVageNJy0=;
	b=FTtSvuGR1JW8gJ4egGDBeHvfYheYk4ureEjB9NRAVIgTOGBVPEGjWwanBgGkxMrkQa
	SEMa6+et8KQCBiyl4ouwFgSqCOE7sk/saRfEH9HdXiboYD+uG5d7wQpYHkl+QAuNwBZX
	5iGfKWpeG9eHgujQZS2xE8rMDILR4kLkAZwIK5wkBbzBTof75HFzO2nX7iPxiSLJCiZA
	Ln+0vpQXlMx+T/BH6GbhWkiGbsSeQzzwR656usFcX50NY60sUCEjTpamF69gdXjwt2Ua
	DzupuwljrCS3q19SQ+Emd0d9DhDe6A2nJ3e1Uc86VYsTmWTw6B3dU9ZsQA2csfpkaF5Q
	oDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=5WvsXZ7ENbYHvH7F743DWvcmlZwAof2aCukVageNJy0=;
	b=HscPD8EEQ9u3TJiZ1OjoDMDVaoGULCLq6++BIL26l5vUnPKwy2Ka+GVmEIi+6Gy51T
	S52b9ZIspNXBhRTSTCJJ8jfyX+fuaWOGkwYP2icZj7ywprh2RTY9SnqWqJ5lJseRjgce
	9xyb8ektZopsxjZafCFf3JRxbjwP66Hp9r/3JqIEGkJ0103/FlWK4yY2PfdKmnwHTz4u
	LUTLj6gAN7ACqK7zdmEbGJhQiqsokbBWxg/y/gftuRL66Le+UtSGNFD6Rp9YvmQPYn93
	eobOTzhQtZ3KgpmCoakZcg/MjrPdv28auruzIeOjxxFhvvxPATchhX2Vl0yw4Iw56bjd
	JL0Q==
X-Gm-Message-State: AKaTC01/gTJJRp9IMKaDWsuD6zZfbxFP4TPJzbcHH0KYwofgcydv6PxcP+rSvU0bZh+O2A==
X-Received: by 10.107.10.20 with SMTP id u20mr8271652ioi.187.1481990692252;
	Sat, 17 Dec 2016 08:04:52 -0800 (PST)
Received: from mir.deserted.net (23-233-31-74.cpe.pppoe.ca. [23.233.31.74])
	by smtp.gmail.com with ESMTPSA id
	c36sm3371303itd.18.2016.12.17.08.04.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 17 Dec 2016 08:04:51 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Dec 2016 11:04:53 -0500
Message-Id: <1481990698-15962-6-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1481990698-15962-1-git-send-email-joe_macdonald@mentor.com>
References: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
	<1481990698-15962-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 05/10] samba: simplify files list for samba-python
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
X-List-Received-Date: Sat, 17 Dec 2016 16:04:50 -0000

From: Andreas Oberritter <obi@opendreambox.org>

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 .../recipes-connectivity/samba/samba_4.4.5.bb          | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index 27f605a..b17e0cf 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -293,23 +293,7 @@ FILES_libwinbind = "${base_libdir}/security/pam_winbind.so \
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


