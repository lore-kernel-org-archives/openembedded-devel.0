Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5661E77E97
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Sep 2017 22:06:08 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id v22so2164215pfk.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Sep 2017 15:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=zlSuOOzgtuI/1lozwAI26dUABgPi7XBnJAgYfE4AEno=;
	b=l9v7HgwrgZTTMv0jRBLCBreeKThi5IbaSLVcI3rpL7hCoOLNtPrgzpb5unlBT0Y5AI
	M83shZCMdVTEqm5BFXd0+9WtpNWKA2TtPImMoJ0bhXxBNchijTLEcwys2NuTuKH/uXA6
	EBpczoswhmpHTRbzH2W2i/dZOxoM+ged93q9sGVYnFCQza60+xR4jfIXS7NP/P/0GeGN
	1LO2nJpMaSzwNWsHPidZkhL2y+hxmPfdpiu80R3oN0QQ4ECn3hbONkfxmoCbOhE0CoED
	sc8AkjcxhDG2+FO8eAsu7lfdauqX7yvjkq+j+aMNC93i3RIaaja+m+ewaVhmxM9H6WyW
	fSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zlSuOOzgtuI/1lozwAI26dUABgPi7XBnJAgYfE4AEno=;
	b=r6fdQ+YRrS3impkVCZidUHKkR3z6TNFdYVwMmaQ29SlGb509pKj8POCOGRNzbTjXxx
	+i8e33p0rora7Oxqf3CpkIhLAluUN3x/3JAAHpxeOpGMJ1fD7sVuLGZDWkl+sdh4p4U1
	8v6pyqcCmQjKzoJFq4Xq5PdA1TR9Q8RJpMtIbBhIvI0UmExj4gna1USK+sa8oG2X5SQE
	w/AXTGNeAq6Gjg1r1bIe/nf7bdoi0imqkBXUx30HbFEQijur5AXVdshPPqSXBgv6+OaZ
	XAa6ZJzuILTf52T+vkSsXzKzxV7U/JC+PuSrJTcBXQrkMCgCQrBZbi3cl1SErQ7WiZlh
	0qBA==
X-Gm-Message-State: AHPjjUhm6ZGof0AxdkoHWNX1EUbiduyWOjkU8CygLUZSxrjSoywAYeaj
	bgxLxIpxlnQyrYP/
X-Google-Smtp-Source: ADKCNb67T9N3Jl7dAHU8Gx2pn2py988MWkbud2d1Jvvrx/5TeNcVUXR35qb4LIlS3xvahBro3QfSlw==
X-Received: by 10.84.210.35 with SMTP id z32mr3134273plh.65.1504389970216;
	Sat, 02 Sep 2017 15:06:10 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::2e06])
	by smtp.gmail.com with ESMTPSA id g1sm4998791pge.69.2017.09.02.15.06.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Sep 2017 15:06:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Sep 2017 15:05:58 -0700
Message-Id: <20170902220559.9784-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH 1/2] open-vm-tools: Add -Wno-address-of-packed-member for with clang
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
X-List-Received-Date: Sat, 02 Sep 2017 22:06:09 -0000

This option ignores a warning as following
 error: taking address of packed member 'actualSize' of class or structure 'HgfsReplyReadV3' may result in an unaligned pointer value

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
index f7746c8e3..dc8faa4ea 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
@@ -66,6 +66,7 @@ PACKAGECONFIG[x11] = ",${NO_X11_FLAGS},${X11_DEPENDS}"
 # fuse gets implicitly detected; there is no --without-fuse option.
 PACKAGECONFIG[fuse] = ",,fuse"
 
+CFLAGS_append_toolchain-clang = " -Wno-address-of-packed-member"
 FILES_${PN} += "\
     ${libdir}/open-vm-tools/plugins/vmsvc/lib*.so \
     ${libdir}/open-vm-tools/plugins/common/lib*.so \
-- 
2.14.1


