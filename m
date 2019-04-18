Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 073267D274
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2019 15:54:22 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id y13so3587984wrd.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2019 08:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=yei249p63Nqsiprv4ysm9O+r2lRJv1VLiGki/8tdKNc=;
	b=elDUdUUWXpiaIrM3v30nXdqRq228uzushb9segI4dLdQ1Rna9I88MAMPSH3N4SJais
	fOL/FZ7euG1Vc/iF1ivYOle4EIZy3eE2otJ/OFDX6jPfcYuff5JqcNQx15y84OpOL0Qk
	lEJ5vgHf5kg3Us4QXMJNb6srbBjotYz7+JRD1u/YdwThPp2daTuC8+21GUUgsBQjbdEq
	1NVeGVaWy7SZk9Le5BqyuBo/kiYLuBGwfyVxZoRIAs0PIo5WwKXw5++3TZRlMUvoJg+f
	xRLmSU1+g4WQQxxp+2S71xnbQLPpskRSIb0kqvk5bKkQPWf4nrgMKvT4Kjr5Omm4n5dD
	Du7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=yei249p63Nqsiprv4ysm9O+r2lRJv1VLiGki/8tdKNc=;
	b=ogXikj7CQycUsQ3pL2DbftE4P08QtQNpbARG83TNL2bzbG+en5FyxFAaF3fW5xcSK3
	6KMuXEgKQ8NlNdVN0DKYxy5UBKW1U91HN7mdPxRe+8ugLbbWDFg+7W0NDOCrlVbtOmwD
	eT2x/hLjWXliNbQlFn77IM5bTDR8sHSUv3CYVSERBjhxmoQ8eZJr+unzTZzcdnIuJPck
	dyfnUQlCrWDVV6akcPitp0KWd490UyVZkrsReqwYm6reEd4oO57vvBdJQzqEqQb+rBPZ
	kqWuxjRuIwGkxoLmSrEseoQeQiMLt4ch0EQ9ZP/cunKcvFJukwMfeqG86MfeFTCN0IPv
	4YDw==
X-Gm-Message-State: APjAAAUexbJLsHL4zVKHi3UDpD/iu5BN/cIdQNhhAE1b/Je1op73C+/b
	fKOM+GvWtCoMu+0K7dmH9EyqhFik
X-Google-Smtp-Source: APXvYqy3vH2VSxKO2GJD8uWJWs0RXOMeZmc3/5Z43VeLk0YaFPMRt9QoWblLtGTPYFRgGrSUkrX2ZQ==
X-Received: by 2002:adf:c788:: with SMTP id l8mr2809066wrg.143.1555602863516; 
	Thu, 18 Apr 2019 08:54:23 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id o5sm2075962wmc.16.2019.04.18.08.54.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 18 Apr 2019 08:54:22 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Apr 2019 17:54:08 +0200
Message-Id: <20190418155408.10418-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190418155408.10418-1-schnitzeltony@gmail.com>
References: <20190418155408.10418-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] samba: rework localstatedir package split
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
X-List-Received-Date: Thu, 18 Apr 2019 15:54:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that we can install smbclient without samba package e.g for gvfs there are
complains:

| gvsd: mkdir failed on directory /var/lib/samba: Permission denied

and browsing Windows network does not work anymore

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.8.4.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.8.4.bb b/meta-networking/recipes-connectivity/samba/samba_4.8.4.bb
index aa8087131..2a785bd89 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.8.4.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.8.4.bb
@@ -230,16 +230,13 @@ RDEPENDS_${PN}-python += "pytalloc python-tdb"
 FILES_${PN}-base = "${sbindir}/nmbd \
                     ${sbindir}/smbd \
                     ${sysconfdir}/init.d \
-                    ${localstatedir}/lib/samba \
-                    ${localstatedir}/nmbd \
-                    ${localstatedir}/spool/samba \
                     ${systemd_system_unitdir}/nmb.service \
                     ${systemd_system_unitdir}/smb.service"
 
 FILES_${PN}-ad-dc = "${sbindir}/samba \
                      ${systemd_system_unitdir}/samba.service \
                      ${libdir}/krb5/plugins/kdb/samba.so \
-                    "
+"
 RDEPENDS_${PN}-ad-dc = "krb5-kdc"
 
 FILES_${PN}-ctdb-tests = "${bindir}/ctdb_run_tests \
@@ -247,11 +244,14 @@ FILES_${PN}-ctdb-tests = "${bindir}/ctdb_run_tests \
                           ${sysconfdir}/ctdb/nodes \
                           ${datadir}/ctdb-tests \
                           ${datadir}/ctdb/tests \
+                          ${localstatedir}/lib/ctdb \
                          "
 
 FILES_${BPN}-common = "${sysconfdir}/default \
                        ${sysconfdir}/samba \
                        ${sysconfdir}/tmpfiles.d \
+                       ${localstatedir}/lib/samba \
+                       ${localstatedir}/spool/samba \
 "
 
 FILES_${PN} += "${libdir}/vfs/*.so \
-- 
2.20.1


