Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7484B7DE87
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 07:52:48 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id k21so25763942edq.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 00:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=J1XfRq/vqjfHHAGsvP3TQC11JFE5ke/BLSP9Ewh4AtY=;
	b=sZ0AxG3KOE9kQeNmsZf04AZV/6FKkp3rfc0mntqDOOkVgagzr/qUCHv0hxFpjQPgxD
	2ALF0F0MysQsMJ99Vk4KhXanGXsVAbIZLbBBeF3Zb9hDi6XpUEoa+Zinpyjpy9HjZNxN
	gsQxsUwdvhWbO1KHNSteLDehDWTnDSHWsrvK2HN05dtbwOeVoJ6m38PIpcFjb8SsDTNe
	n+JO3ZbvwgATm6E1Ifo6wEzaUABaa1WmpFLbGyEe/S1XbmOxcVHoPyx24ARDAJFGw6Xu
	EUZwXfjZFTgOSPpqW/bwzZ0axPo5KKCJ877uxjWIOZdbJVl6EFm8eyxG698adkgpy5il
	nGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=J1XfRq/vqjfHHAGsvP3TQC11JFE5ke/BLSP9Ewh4AtY=;
	b=lbbcQILMhTHyKAAGh3lI4nETtCytyWIBd5lA655Z3luWgjXdWFEcUiOnfEn85sN/P2
	h2Bo7rSfEUB+UcKsy0/X7P6W6V1rsGYZ4uEqzRhnnlGdhGuKSyWegBhu0xCob1Ewa+RW
	TQukL+YrjH6O4NyXAPXy74adNjktJUBh/obuqbJB4MwOlX8jkYClyKOCTYW7KVDTMRmF
	SBkkthRjBifVqShd6FBLesCFJj7aFw9cY+y/Q730sn4ETOVUU7x8+ucQIXKviH6ZFUll
	xplEOqMhJgfQoIWF1sIamHQGK5ZDKI4jbMFjjIsR6+hjc/Rw1DCINLh5PFcflCwL3JWX
	sgLg==
X-Gm-Message-State: APjAAAUiE+S47UiZTEGbOq9cAKO6o2grzWVMimTnx795YXw2pdXrPzR0
	LACLhnNuxw5KtPIRQx9QWCVrkGHPRZI=
X-Google-Smtp-Source: APXvYqyDmxuuD8gEneEClfvHDG14dTje+HNCr5+pC5FKwkQM7b96v42VPOAjIob97UKrcaJerGMGrQ==
X-Received: by 2002:a50:913c:: with SMTP id
	e57mr118552805eda.257.1561449169003; 
	Tue, 25 Jun 2019 00:52:49 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	y22sm4308640edw.94.2019.06.25.00.52.47
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 25 Jun 2019 00:52:48 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Jun 2019 09:52:16 +0200
Message-Id: <20190625075223.13585-17-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625075223.13585-1-ricardo@ribalda.com>
References: <20190625075223.13585-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH 16/23] xom: Do not use all as PACKAGE_ARCH
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
X-List-Received-Date: Tue, 25 Jun 2019 07:52:48 -0000
Content-Transfer-Encoding: 8bit

It RDEPENDS on packages that ar not PACKAGE_ARCH=all

Fixes:
ERROR: mc:qt5507:xom-1.2.10-r0 do_compile: Function failed: do_compile (log file is located at /workdir/build/tmp/work/all-poky-linux/xom/1.2.10-r0/temp/log.do_compile.3256)
ERROR: Logfile of failure stored in: /workdir/build/tmp/work/all-poky-linux/xom/1.2.10-r0/temp/log.do_compile.3256
Log data follows:
| DEBUG: Executing shell function do_compile
| mv: cannot stat '/workdir/build/tmp/work/all-poky-linux/xom/1.2.10-r0/git/jaxen': No such file or directory
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /workdir/build/tmp/work/all-poky-linux/xom/1.2.10-r0/temp/log.do_compile.3256)
NOTE: recipe xom-1.2.10-r0: task do_compile: Failed

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 recipes-core/xml-commons/xom_1.2.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/xml-commons/xom_1.2.10.bb b/recipes-core/xml-commons/xom_1.2.10.bb
index 0e923d4..8755ddc 100644
--- a/recipes-core/xml-commons/xom_1.2.10.bb
+++ b/recipes-core/xml-commons/xom_1.2.10.bb
@@ -22,6 +22,8 @@ SRC_URI[archive.sha256sum] = "39985c2debb8044005fd07b09cb06f10e75652b3c048c9b443
 
 S = "${WORKDIR}/XOM"
 
+PACKAGE_ARCH = "${TUNE_PKGARCH}"
+
 inherit java-library
 
 DEPENDS = "fastjar-native virtual/javac-native xerces-j xalan-j"
-- 
2.20.1


