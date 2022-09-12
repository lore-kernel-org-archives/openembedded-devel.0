Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0FC6C6FA8D
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 03:41:36 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.3707.1662954091476293841
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Sep 2022 20:41:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JlraAhTz;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 n23-20020a17090a091700b00202a51cc78bso4799163pjn.2
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Sep 2022 20:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=tnVFWYH7QfFVd3yQGenDn7I9+6K5g03K8Bz35mjX0+E=;
        b=JlraAhTz2Z18APZXndx8Hm++Y1hDZUMbRDLSHu1//isaf2tMInRIRgQhn4GeYGYhJv
         0bNAl0fbk06eFUdnGAUpfe88U7R8jq5NSA1T+5QwqW3nGIKZNSig+HF4IZlsPkS6+eRm
         OErCNAusWGLfgvZShFioifkV8FZAMk2iP9OJNJT8HXHEDqReat+QvllGdgYf6Wjkw8Lp
         hYgsLhWbwBoa+lwPWW5AVpLcvqEbP4EDBAslU1vWYhQDsyK1kdL+H1guKSkUVNkAQa8l
         2zG0Jui/duTIVBQKEFfQQmg9lSnk9KuHsZXJaxGFXurO5q06bFyvBCL7qlWmtv+PGt48
         4Kmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=tnVFWYH7QfFVd3yQGenDn7I9+6K5g03K8Bz35mjX0+E=;
        b=UXY/wJRhY5bTqlA1Sd4B7S6WLurOMnNIo2OqiP9pD/cEhkX+dl/ybkVBMkVhBShvNX
         7Gtuh+xz19XPVbo/0OBPElEA1yrbuv+6a4N2kmVRGoL3yXIHRoretcWkMkYUFinb85al
         8dlc4khjQdgTRm6MypxIb4l8KLBfEGPfCS7SitlMc5uHOXRCyM9lOe6U8DD1EElRfwcz
         DEp9v8+Tyoxxz/erLvQzD2fJluxnTN8PtsOSZUJyQgZba7UzhCxCSRmilmugHPCdxxlb
         KuD4M/o8Um140c/B5R54Bnzy0B+RrUgFv/+Ue496kv40rqWL0reBYOS1Z1l2QMIAbGXE
         5CXQ==
X-Gm-Message-State: ACgBeo1BOe0c4yTxV1TOrtflinmvcq9vQbi27V1rpUq6Hq01sP81klui
	kjiv6KBe0dbCCOspIcpGLaXA6/MMWhtLjg==
X-Google-Smtp-Source: 
 AA6agR4ZkWGF31EAeadPISa/C6tWG/Vgu3I7iy4lWY0XQVkM/WreAQeTW5CD1iQSQawc7q9j3vUOKg==
X-Received: by 2002:a17:90a:bf13:b0:202:78ee:addf with SMTP id
 c19-20020a17090abf1300b0020278eeaddfmr17819926pjs.22.1662954090596;
        Sun, 11 Sep 2022 20:41:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8fc7])
        by smtp.gmail.com with ESMTPSA id
 d7-20020a170902cec700b00176ea6ce0efsm4664940plg.109.2022.09.11.20.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 20:41:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-initramfs][meta-oe][PATCH 5/7] kexec-tools-klibc: Fix type
 mismatch in calls to dtb_set_initrd on mips
Date: Sun, 11 Sep 2022 20:41:21 -0700
Message-Id: <20220912034123.1885229-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220912034123.1885229-1-raj.khem@gmail.com>
References: <20220912034123.1885229-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Sep 2022 03:41:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98745

Fixes
kexec-elf-mips.c:163:42: error: incompatible pointer to integer conversion passing 'char *' to p
arameter of type 'off_t' (aka 'long long') [-Wint-conversion]
|                         dtb_set_initrd(&dtb_buf, &dtb_length, initrd_buf, initrd_buf + initrd_size);
|                                                               ^~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../140-mips_disable_devicetree_support.patch | 53 +++++++++----------
 1 file changed, 24 insertions(+), 29 deletions(-)

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/140-mips_disable_devicetree_support.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/140-mips_disable_devicetree_support.patch
index bd728ccb49..6e347c048e 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/140-mips_disable_devicetree_support.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/140-mips_disable_devicetree_support.patch
@@ -22,8 +22,6 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  kexec/arch/mips/kexec-mips.h           |  1 +
  4 files changed, 39 insertions(+), 28 deletions(-)
 
-diff --git a/kexec/arch/mips/include/arch/options.h b/kexec/arch/mips/include/arch/options.h
-index 416e224..18d2811 100644
 --- a/kexec/arch/mips/include/arch/options.h
 +++ b/kexec/arch/mips/include/arch/options.h
 @@ -5,6 +5,7 @@
@@ -44,11 +42,9 @@ index 416e224..18d2811 100644
  
  
  #define KEXEC_ARCH_OPT_STR KEXEC_OPT_STR ""
-diff --git a/kexec/arch/mips/kexec-elf-mips.c b/kexec/arch/mips/kexec-elf-mips.c
-index 849a7ba..5c0e535 100644
 --- a/kexec/arch/mips/kexec-elf-mips.c
 +++ b/kexec/arch/mips/kexec-elf-mips.c
-@@ -141,35 +141,37 @@ int elf_mips_load(int argc, char **argv, const char *buf, off_t len,
+@@ -141,45 +141,49 @@ int elf_mips_load(int argc, char **argv,
  	else
  		cmdline_addr = 0;
  
@@ -63,9 +59,22 @@ index 849a7ba..5c0e535 100644
 -	} else {
 -		create_flatten_tree(&dtb_buf, &dtb_length, cmdline_buf + strlen(CMDLINE_PREFIX));
 -	}
- 
+-
 -	if (arch_options.initrd_file) {
 -		initrd_buf = slurp_file(arch_options.initrd_file, &initrd_size);
+ 
+-		/* Create initrd entries in dtb - although at this time
+-		 * they would not point to the correct location */
+-		dtb_set_initrd(&dtb_buf, &dtb_length, initrd_buf, initrd_buf + initrd_size);
+-
+-		initrd_base = add_buffer(info, initrd_buf, initrd_size,
+-					initrd_size, sizeof(void *),
+-					_ALIGN_UP(kernel_addr + kernel_size + dtb_length,
+-						pagesize), 0x0fffffff, 1);
+-
+-		/* Now that the buffer for initrd is prepared, update the dtb
+-		 * with an appropriate location */
+-		dtb_set_initrd(&dtb_buf, &dtb_length, initrd_base, initrd_base + initrd_size);
 +	if (!arch_options.no_dtb) {
 +		/* MIPS systems that have been converted to use device tree
 +		 * passed through UHI will use commandline in the DTB and
@@ -78,39 +87,29 @@ index 849a7ba..5c0e535 100644
 +		} else {
 +			create_flatten_tree(&dtb_buf, &dtb_length, cmdline_buf + strlen(CMDLINE_PREFIX));
 +		}
- 
--		/* Create initrd entries in dtb - although at this time
--		 * they would not point to the correct location */
--		dtb_set_initrd(&dtb_buf, &dtb_length, initrd_buf, initrd_buf + initrd_size);
++
 +		if (arch_options.initrd_file) {
 +			initrd_buf = slurp_file(arch_options.initrd_file, &initrd_size);
- 
--		initrd_base = add_buffer(info, initrd_buf, initrd_size,
--					initrd_size, sizeof(void *),
--					_ALIGN_UP(kernel_addr + kernel_size + dtb_length,
--						pagesize), 0x0fffffff, 1);
++
 +			/* Create initrd entries in dtb - although at this time
 +			 * they would not point to the correct location */
-+			dtb_set_initrd(&dtb_buf, &dtb_length, initrd_buf, initrd_buf + initrd_size);
- 
--		/* Now that the buffer for initrd is prepared, update the dtb
--		 * with an appropriate location */
--		dtb_set_initrd(&dtb_buf, &dtb_length, initrd_base, initrd_base + initrd_size);
--	}
++			dtb_set_initrd(&dtb_buf, &dtb_length, (off_t)initrd_buf, (off_t)initrd_buf + initrd_size);
++
 +			initrd_base = add_buffer(info, initrd_buf, initrd_size,
 +						initrd_size, sizeof(void *),
 +						_ALIGN_UP(kernel_addr + kernel_size + dtb_length,
 +							pagesize), 0x0fffffff, 1);
- 
++
 +			/* Now that the buffer for initrd is prepared, update the dtb
 +			 * with an appropriate location */
 +			dtb_set_initrd(&dtb_buf, &dtb_length, initrd_base, initrd_base + initrd_size);
 +		}
-+	}
+ 	}
  
+-
  	/* This is a legacy method for commandline passing used
  	 * currently by Octeon CPUs only */
-@@ -177,9 +179,11 @@ int elf_mips_load(int argc, char **argv, const char *buf, off_t len,
+ 	add_buffer(info, cmdline_buf, sizeof(cmdline_buf),
  			sizeof(cmdline_buf), sizeof(void *),
  			cmdline_addr, 0x0fffffff, 1);
  
@@ -125,8 +124,6 @@ index 849a7ba..5c0e535 100644
  
  	return 0;
  }
-diff --git a/kexec/arch/mips/kexec-mips.c b/kexec/arch/mips/kexec-mips.c
-index 415c2ed..e557f8b 100644
 --- a/kexec/arch/mips/kexec-mips.c
 +++ b/kexec/arch/mips/kexec-mips.c
 @@ -89,6 +89,7 @@ void arch_usage(void)
@@ -137,7 +134,7 @@ index 415c2ed..e557f8b 100644
  	);
  }
  
-@@ -121,6 +122,9 @@ int arch_process_options(int argc, char **argv)
+@@ -121,6 +122,9 @@ int arch_process_options(int argc, char
  		case OPT_RAMDISK:
  			arch_options.initrd_file = optarg;
  			break;
@@ -147,8 +144,6 @@ index 415c2ed..e557f8b 100644
  		default:
  			break;
  		}
-diff --git a/kexec/arch/mips/kexec-mips.h b/kexec/arch/mips/kexec-mips.h
-index 222c815..90b21c3 100644
 --- a/kexec/arch/mips/kexec-mips.h
 +++ b/kexec/arch/mips/kexec-mips.h
 @@ -22,6 +22,7 @@ struct arch_options_t {
-- 
2.37.3


