Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f50.google.com (mail-pl0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id E035174D2F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 02:39:45 +0000 (UTC)
Received: by mail-pl0-f50.google.com with SMTP id v24-v6so18730448plo.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jun 2018 19:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CkjNCFYzmRvXaJdAUqA8ZGwM2YFdEFQ/GxCuaqixxOw=;
	b=SthRB5fVi1usky0I1NDwBGsyB5e7W96z6YP2RFpXQHVHV0r0r9cmvXkMhASyDFArnW
	Ghn7IV/e4qXI6IdUdu41wccjB5/h8whxcte4KJNZEy7hGoT9I8pIKVUdwGIISa3P3uTz
	+JYdhWBeMpq2NX++WRcZr12VSz9Y+7nnBAKM1MACH7Ub62/hgGJtwtAutX5/NskjERAH
	Oga9rqtw0oJ9iT+ujGIgp1xFRwAJbA53ZuSO+N/vAtjpPU9bPzYx8t3urstm1eSl0ET3
	Z8KKpHmmINnj5FxTuxD0qxR4zPf7xgFKSLw8nQHW70XTENwddiyPmgabseSd7W6/GfiW
	mhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CkjNCFYzmRvXaJdAUqA8ZGwM2YFdEFQ/GxCuaqixxOw=;
	b=TyWKVboGh59EJMcEQKXPW3Z8eUuTBNQ54ZRoguk1f26758TmYKpNtJuqyiwQcUUC71
	+8B5Icf+hrO6jLhO9Cu7bccKPFFrQs8Zbmz4Q3NAdBFtx8IKIaQtV3MfG5J/q/sNutDf
	SSdcNanOkeX/sdNQRjEWCrtlxB8T7clb//MNhZ9W1KhGsTMI585xFw6NcyeMuQ3kb746
	0Bvu2vmNRFZNCMTxtTas2ZugQ45E0uJUXOXAR8nLdlZ5AvA6tGR88T6TN7C+WYf/HPPm
	3BbcWqgK+fED6TBsEOSRnvOgZ7rKKvtnMFVNC+5l0bRKW2TEIgNhmejllSI1OsJrqb3M
	cnEQ==
X-Gm-Message-State: ALKqPwcjoFZJyu5TGsXw4ts78CyxK2NtFYwMPzs4pFAcTnnNmYFE8snM
	60FwV3a8rEsEEWfwOoGki0X33g==
X-Google-Smtp-Source: ADUXVKLAATekJlGuue9uR85B68kx+hwhVzXztWpf7a6U3Ahy6u0FEmxnEq/WkG4VRfi+etveKCZu5A==
X-Received: by 2002:a17:902:600a:: with SMTP id
	r10-v6mr19693054plj.70.1528079987136; 
	Sun, 03 Jun 2018 19:39:47 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:f1bd:c539:22b:bbf1])
	by smtp.gmail.com with ESMTPSA id
	m11-v6sm12069697pfk.42.2018.06.03.19.39.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Jun 2018 19:39:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sun,  3 Jun 2018 19:39:35 -0700
Message-Id: <a370c771887107f424c723c0fcb3c246ffe022a4.1528079821.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528079821.git.akuster808@gmail.com>
References: <cover.1528079821.git.akuster808@gmail.com>
Subject: [PATCH 5/6] wireshark: Update to 2.2.11
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
X-List-Received-Date: Mon, 04 Jun 2018 02:39:46 -0000

From: Armin Kuster <akuster@mvista.com>

changed --with-ssh to --with-libssh=DIR

includes:

wnpa-sec-2017-47 : CVE-2017-17084
    The IWARP_MPA dissector could crash. (Bug 14236)

wnpa-sec-2017-48 : CVE-2017-17083
    The NetBIOS dissector could crash. (Bug 14249)

wnpa-sec-2017-49 : CVE-2017-17085
    The CIP Safety dissector could crash. (Bug 14250)

release notes:
https://www.wireshark.org/docs/relnotes/wireshark-2.2.11.html

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_2.2.10.bb => wireshark_2.2.11.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.10.bb => wireshark_2.2.11.bb} (92%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.10.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.11.bb
similarity index 92%
rename from meta-networking/recipes-support/wireshark/wireshark_2.2.10.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.2.11.bb
index 5358ba0..5eb372e 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.10.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.11.bb
@@ -10,8 +10,8 @@ SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
 PE = "1"
 
-SRC_URI[md5sum] = "ae3a1a43a6e3687f44a738fd15d78021"
-SRC_URI[sha256sum] = "8574a5e1fdec7affae640924bd46c1aed1bd866e02632fa5625e1450e4a50707"
+SRC_URI[md5sum] = "a79ba6cda83be2a91bde4110fe194788"
+SRC_URI[sha256sum] = "a9f11621e85d7e1d72259157edd94825e72af3fd72e184b8474459f92ad5fc40"
 
 inherit autotools pkgconfig perlnative
 
@@ -39,7 +39,7 @@ PACKAGECONFIG[geoip] = "--with-geoip=yes, --with-geoip=no, geoip"
 PACKAGECONFIG[plugins] = "--with-plugins=yes, --with-plugins=no"
 PACKAGECONFIG[sbc] = "--with-sbc=yes, --with-sbc=no, sbc"
 
-PACKAGECONFIG[libssh] = "--with-ssh=yes, --with-ssh=no, libssh2"
+PACKAGECONFIG[libssh] = "--with-libssh=${STAGING_LIBDIR}, --with-libssh=no, libssh2"
 
 
 # these next two options require addional layers
-- 
2.7.4


