Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4D6B1787C7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Nov 2017 18:32:06 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id r62so7634993pfd.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Nov 2017 10:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=kSz/HB3RG6NGRU71gygPFAXts+hlpMDi3cwvSJSA+1E=;
	b=aiOZvcItzohIudpkBKrdA/7PrxIZNOAwY+v+GNabOWXZ+WXvqMWjqi9s7eEqbJPkz0
	wFKQsKGiDjwknIJyEQOZEkOE958Y/thLDodV5McTvobqpKe4z2XwntVs9y1eQ/lhm2nc
	VnYijMdSJBcfdAqE9ATQTtbTM0PrqIfJvSF7+qVlZbs9J9HyxoB7fU9IMxCSHpZ0gj0w
	8jxUMwtAQD/N4/nhoRvKzPjMyik/b9aTs+HFa5Rv8bvgSPYS6Y7JJby+4FaPgQSeNDG8
	KAHdj1tSt9QmlQgJxtsOPGjVVItLJ6GPiKyrLCRP+mYADez6NTMDjfnuNF6AyS5GTKcd
	pzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=kSz/HB3RG6NGRU71gygPFAXts+hlpMDi3cwvSJSA+1E=;
	b=op0N98wgPr8dfHmv7hwqpXF+WLctTWwKmJjg7Q1RLUZqGhXfOe6tZAoIeSRXqAZ9LV
	2bIeF+QzRuw1dJ+v4YXHVOqIdpOtvJmFsQewUCehlgjzzSKrbGDqHqctFKXbWW3XgN5G
	fbSJXUCEfD45YW63YUj4oBUSHE9olESv1OdhnawA7ufM7skIBDJyXHjUeghP9Ca0SlEH
	JJNTPtqAp9Z5llEOkkKhXvbiOqKEsIhJiF+IVxpgUS9Ck3OQ9sMgqhtl2DC4tuSXaHJs
	aa9fYpD6Su1X3hH6rwpsT2xLeBfDG7jEKDsbKRgXeiY2SNxnOYKM6sIjx1ZRe5gEqWNP
	debQ==
X-Gm-Message-State: AJaThX7lrBRIfyylfQ6yCo0UsVvzas6hOKU7o/FJjYp+TeawmywnAP77
	yrHXXE8JEoB88nhTNSSOszE8KA==
X-Google-Smtp-Source: AGs4zMZkr2kmXDcwTgRU+aTjrdIdIz9tPP1WxnHWRpaNCIQeMN1azDdKIkpXCid9eMSXVgR8si5gMA==
X-Received: by 10.101.91.137 with SMTP id i9mr2545267pgr.313.1510857127941;
	Thu, 16 Nov 2017 10:32:07 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:a90f:c0e3:b57a:b8e0])
	by smtp.gmail.com with ESMTPSA id
	s14sm3975736pfe.36.2017.11.16.10.32.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Nov 2017 10:32:07 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Thu, 16 Nov 2017 10:32:04 -0800
Message-Id: <1510857125-8109-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510857125-8109-1-git-send-email-akuster808@gmail.com>
References: <1510857125-8109-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][morty 2/3] flite-alsa: Fix QA issue
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
X-List-Received-Date: Thu, 16 Nov 2017 18:32:06 -0000

ERROR: flite-alsa-1.3-r1 do_package_qa: QA Issue: No GNU_HASH in the elf binary: '/build/build_artifacts/morty/tmp/work/i586-poky-linux/flite-alsa/1.3-r1/packages-split/libflite-alsa/usr/lib/libflite_cmulex.so.1.3'

ERROR: flite-alsa-1.3-r1 do_package_qa: QA Issue: No GNU_HASH in the elf binary: '/build/build_artifacts/morty/tmp/work/i586-poky-linux/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox8/usr/lib/libflite_cmu_us_kal.so.1.3' [ldflags]

ERROR: flite-alsa-1.3-r1 do_package_qa: QA Issue: No GNU_HASH in the elf binary: '/build/build_artifacts/morty/tmp/work/i586-poky-linux/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox16/usr/lib/libflite_cmu_us_kal16.so.1.3' [ldflags]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/flite/flite-alsa_1.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/flite/flite-alsa_1.3.bb b/meta-oe/recipes-support/flite/flite-alsa_1.3.bb
index 51012e6..19d789e 100644
--- a/meta-oe/recipes-support/flite/flite-alsa_1.3.bb
+++ b/meta-oe/recipes-support/flite/flite-alsa_1.3.bb
@@ -10,3 +10,7 @@ SRC_URI = "http://www.speech.cs.cmu.edu/flite/packed/flite-${PV}/flite-${PV}-rel
 
 SRC_URI[md5sum] = "ae0aca1cb7b4801f4372f3a75a9e52b5"
 SRC_URI[sha256sum] = "922225f7001e57a0fbace8833b0a48790a68f6c7b491f2d47c78ad537ab78a8b"
+
+INSANE_SKIP_libflite-alsa = "ldflags"
+INSANE_SKIP_libflite-alsa-vox8 = "ldflags"
+INSANE_SKIP_libflite-alsa-vox16 = "ldflags"
-- 
2.7.4


