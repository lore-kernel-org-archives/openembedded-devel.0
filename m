Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5BFF16BD2B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 23:11:36 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id n15so554212ead.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=D/mWn1tHNwXYc4DXQXjkc7NVGzRD6BPpk2CLQCOfhPc=;
	b=CJPZ+33qqm764AwWHHuDYAI59tzuViuN98IHQnfBgXAPu5cvwfOMz3nAxYnSohQmo+
	7h6yakrhXlJ65FJWYM63lgQBdrga6njs9RRrjGjlcl0eH9TCFE1A44VfN5XV9nBKnpF/
	fBDwVp385aq0IOFaKLfPvUAVYTamBFnj1K4FScyI683M7Kjq4BbMBeXzNNwqKeqpvWAA
	/NAAzbImWbwGGfEz1ak90DzD06kplhBNSX93AmG11vBbPo8CHRZWqlLkwbUaDfwXOXhv
	Azn+IjNI8Jj8VEUYBm2w8HWqBNcRTbay/eSAfJN6DGJsN7YKR4dASB6RxORks9tSXKJc
	0tnQ==
X-Received: by 10.14.89.72 with SMTP id b48mr7497111eef.43.1377817896778;
	Thu, 29 Aug 2013 16:11:36 -0700 (PDT)
Received: from mizar.localdomain
	(host202-221-dynamic.17-79-r.retail.telecomitalia.it.
	[79.17.221.202])
	by mx.google.com with ESMTPSA id a6sm49952754eei.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 16:11:36 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Aug 2013 01:11:28 +0200
Message-Id: <cover.1377817383.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-initramfs][PATCH 0/3] klibc: fix hardcoded symlinks to linux-libc-headers
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Aug 2013 23:11:37 -0000

One (fixed) bug in sstate.bbclass has exposed absolute symlinks
pointing to the linux-libc-headers.

To fix this bug properly it is necessary to take care of exec_prefix
in order to create a proper symlink.

Andrea Adami (3):
  klibc_2.0.2: refactor recipe to respect exec_prefix
  klcc-cross_2.0.2: refactor recipe to respect exec_prefix
  kexec-tools-klibc: fix includes now that klibc respects exec_prefix

 .../recipes-devtools/klibc/klcc-cross_2.0.2.bb     | 11 ++++------
 .../klibc/klibc-2.0.2/klcc_prefix.patch            | 24 ----------------------
 .../klibc/klibc-2.0.2/klibc-linux-libc-dev.patch   |  2 +-
 .../klibc/klibc-2.0.2/prefix.patch                 | 14 -------------
 .../klibc/klibc-2.0.2/staging.patch                |  2 +-
 meta-initramfs/recipes-devtools/klibc/klibc.inc    |  4 +++-
 .../recipes-devtools/klibc/klibc_2.0.2.bb          | 22 +++++++++-----------
 .../kexec/kexec-tools-klibc_2.0.2.bb               |  4 ++--
 8 files changed, 21 insertions(+), 62 deletions(-)
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klcc_prefix.patch
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/prefix.patch

-- 
1.8.1.5


