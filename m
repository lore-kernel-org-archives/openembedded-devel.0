Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
	[209.85.208.45])
	by mail.openembedded.org (Postfix) with ESMTP id 081B97DE38
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 07:52:53 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id s49so25771036edb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 00:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=aDQHn5c2n00aAa5HLluxVgFo0N1WLJ5IE5OUu3wPCuk=;
	b=ewGMgTz/eOfZbtVJK6oTIJK2Y/qYFGw1x0771JBQ6eA5kd61zx4riJYsRmgWmmxhJe
	uzDTykWhbsJdQTfHmxRBfmsLS4nRWstqipeqAFR2nyPFIFdCChzg3Bi6xYmjeaelsbmK
	+iK8Yf1Q8OdU+73PIqAPCi26wE7ot5GjqW+imxuo3/NqvIdPTcUNJvz9ZFnD2+lg62HE
	iVXMEbv66GQJmRKWAbgIVBbsBnlFRzkxOyXnIvwOpyJQmt+4jI86lUz2817CsrkvGdRI
	7S0FF27PySZuJ5vEL9YcHfDSfOI2YtN03wML9gBo6km7/4emj2LGkk7F669aNKw8CNs8
	7LSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=aDQHn5c2n00aAa5HLluxVgFo0N1WLJ5IE5OUu3wPCuk=;
	b=g121bbxaCAn7YsCMqJMiczTCsV7thyiJg3GaTIxfbSSUpixJv2dcJqj9JzCFrsM9tg
	zzxiA6HiTcJm9YUeArgiwT/ie4s0uH4LF1ANqdPCdMwJPO9gYdyOyTHON4erd6xKKmkt
	ARDQHbepDkRvACNY/tXz6LGgd/tr6g7kjlTvayJBR9rlrWfdX/0GdI6Gd/hlesqKV+AM
	x34OVY7PSf+qAGoIA9sQrCH6tfE5wN8VfCd9BmCUGN5G5Dz7h+sH7f+/M5WIFxlTwiUo
	rskamo2iXESErY6ePI+e3f/TGOIqU/kLcI4nzApf/11iLcPZHgDMfEgRyntlX9U51cTz
	EiYg==
X-Gm-Message-State: APjAAAXhtm9daAgfv4k2tRxZ8FPM3qPFtpE3YDAAqCqJJVjqUUW/YpRh
	x2l3KJjtt9542U/RmF3zMSGMDY+I+Nc=
X-Google-Smtp-Source: APXvYqyaB/6rpV/zKDYKahjE261ITSE5r2TlFz5Jg7bb99x1FvMYTCgzcpj5FpL5Ie4G0K8XnVXN1g==
X-Received: by 2002:a50:9871:: with SMTP id h46mr150824031edb.69.1561449174303;
	Tue, 25 Jun 2019 00:52:54 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	y22sm4308640edw.94.2019.06.25.00.52.52
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 25 Jun 2019 00:52:52 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Jun 2019 09:52:20 +0200
Message-Id: <20190625075223.13585-21-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625075223.13585-1-ricardo@ribalda.com>
References: <20190625075223.13585-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH 20/23] poi: Do not build as all PACKAGE_ARCH
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
X-List-Received-Date: Tue, 25 Jun 2019 07:52:54 -0000
Content-Transfer-Encoding: 8bit

poi DEPENDS on non -native packages, which breaks multiconfig.

Fixes:

ERROR: mc:inteli7:poi-3.0-r0 do_packagedata: Command 'cd /workdir/build/tmp/work/all-poky-linux/poi/3.0-r0/pkgdata; find . -type d -print | tar --xattrs --xattrs-include='*' -cf - -S -C /workdir/build/tmp/work/all-poky-linux/poi/3.0-r0/pkgdata -p --no-recursion --files-from - | tar --xattrs --xattrs-include='*' -xhf - -C /workdir/build/tmp/pkgdata/inteli7' returned non-zero exit status 2
ERROR: mc:inteli7:poi-3.0-r0 do_packagedata: Function failed: sstate_task_postfunc
ERROR: Logfile of failure stored in: /workdir/build/tmp/work/all-poky-linux/poi/3.0-r0/temp/log.do_packagedata.27730
NOTE: recipe poi-3.0-r0: task do_packagedata: Failed
ERROR: Task (multiconfig:inteli7:/workdir/repo/poky/../meta-java/recipes-core/jakarta-libs/poi_3.0.bb:do_packagedata) failed with exit code '1'

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 recipes-core/jakarta-libs/poi_3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/jakarta-libs/poi_3.0.bb b/recipes-core/jakarta-libs/poi_3.0.bb
index f9178f2..e33f2f2 100644
--- a/recipes-core/jakarta-libs/poi_3.0.bb
+++ b/recipes-core/jakarta-libs/poi_3.0.bb
@@ -7,6 +7,8 @@ SRC_URI = "http://archive.apache.org/dist/jakarta/poi/release/src/${BPN}-src-${P
 
 S = "${WORKDIR}/${BPN}-3.0-rc4"
 
+PACKAGE_ARCH = "${TUNE_PKGARCH}"
+
 inherit java-library
 
 DEPENDS = "fastjar-native commons-collections3 commons-logging commons-lang commons-beanutils log4j1.2 xalan-j"
-- 
2.20.1


