Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 108B461C2C
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Mar 2020 02:57:41 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id a23so2050693plm.1
	for <openembedded-devel@openembedded.org>;
	Wed, 11 Mar 2020 19:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=w44lyKiJKa8mfNcJlUDB/ENkvzP4GS4OIhm8GGljsWk=;
	b=p8YhysW8ygjkTbruxoFpFFTaqKdGqsdGhuatINhLttI3GV3mwUwEbHdZeGOOsG1/3Q
	Amm3006r6zIE21dhM7ofCxYbDWNja7Bm8ZX/UQ2y2HDWj8mY/XbxtGWVCd3OM4Cg4OFp
	Mpb1/o64dr2LTNKKhXs7jlw9PmZyEn2CuTOUyeJmVlkuuGfYA7nw/5gmcoDo1C7ip0TU
	zAglr+zA4PlNsjmr4Zh+sQ+6lAGPPaM37MBHLXZp9Smq+/7owPBgvjF3AunKrq6+D0w2
	nVZUa1+FyHUwgjcu3aNrQRN2hr0QZD1inh2kjHhBECZdMfQ4UIdXKuavDKHjovoFF2yD
	w0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=w44lyKiJKa8mfNcJlUDB/ENkvzP4GS4OIhm8GGljsWk=;
	b=NqAz0T4E/DVnp6xz/PR+xKGmI5QkIhsV43QVw3/ZtfOMUVKjSS3onRZn87DO/idcO0
	D26MSn0307/snI9rsxCtDO7en0gTHkxy2D5Q2c5kIA8af7vBqeye1/JF7ehBg/jv2JF2
	4xKfEyxPZFBC9tkPM0gzpLIezUYWVvrCBoH5Fk8JEF4SEFOZcQmxdZ1bKSKGLjgxTpxr
	9UdMtdvZLVhgWVtuFbyKSjat85VYDYQ/oi0148cygNOXgN0QX5RAQgp1mgpaWlFSW1NB
	s4Op7f0goKIjSgEdLgYRD/CVzNe25nXP5EouOkkucuvSHe59jHxunMYz/7d4eTK7m9wf
	7jsw==
X-Gm-Message-State: ANhLgQ0/B+ocKAdTJMTmFKUm7HQlfnRwhHUvDz5jUv4rwS02cB373vqE
	zjFhKbQggz1UoFiOqzzOLU/r8/+K
X-Google-Smtp-Source: ADFU+vsS5Pa0rEGN303ObbCxhKeceCl3fAJlHnnstr8w2Q9+EUyuxA5ZdrJEsfNBrEz9AL4ZZJ34iQ==
X-Received: by 2002:a17:90a:928c:: with SMTP id
	n12mr1864823pjo.45.1583981862969; 
	Wed, 11 Mar 2020 19:57:42 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:60a5:8a88:a7f9:d809])
	by smtp.gmail.com with ESMTPSA id
	e2sm18328236pgv.81.2020.03.11.19.57.42
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 19:57:42 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Wed, 11 Mar 2020 19:57:24 -0700
Message-Id: <863f24825bf877224ac8391a22798d15a2e60478.1583981708.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1583981708.git.akuster808@gmail.com>
References: <cover.1583981708.git.akuster808@gmail.com>
Subject: [zeus 05/13] libldb: Do not require the "pam" distro feature to be enabled
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
X-List-Received-Date: Thu, 12 Mar 2020 02:57:42 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

It was only added because samba was a dependency, but was not removed
again when the dependency on samba was removed in commit 6207331f.

This effectively reverts commit a190c2e3.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0d2b80bd783fb2190c28caa2ebf3a13d4491d7c7)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/libldb/libldb_1.5.6.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/libldb/libldb_1.5.6.bb b/meta-networking/recipes-support/libldb/libldb_1.5.6.bb
index 99eb6f9ce8..cc24863c60 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.5.6.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.5.6.bb
@@ -36,8 +36,7 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
 SRC_URI[md5sum] = "fc58ef432c1fcb03fc3bb6cccce08977"
 SRC_URI[sha256sum] = "ff82474d0bf109e415a2d50334bde5715f486a53ff4bb8c7f74459dd229e975b"
 
-inherit waf-samba distro_features_check
-REQUIRED_DISTRO_FEATURES = "pam"
+inherit waf-samba
 
 S = "${WORKDIR}/ldb-${PV}"
 
-- 
2.17.1


