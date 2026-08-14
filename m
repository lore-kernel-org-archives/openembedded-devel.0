Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C279EC5DF74
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:21 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24540.1786747641259870029
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:47:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gWiIg5Ji;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbedf6a6fe8so1087887a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747641; x=1787352441; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qrCLPog2jxWXfDhN2OjQGPB6VGmpLsv7+67FVQKgoz0=;
        b=gWiIg5Jijrd4tXS9hK9rJzEd/FlzlA3pMGEoo8QU6nZjlyVnYI+WNNdmTPkfrJpL6e
         ruYp8z4DPewN/M8X+Ri0dyFFuJfIapJxmWZ7inBISe+tRiLIb+HfiDyr/h+cQsKsvmqV
         PkizQpNOW/1C9k6QsFZCMBa252sVD4VLgftP/WmwsDTmnukWRQ/j4asLWAKMfG35XeCB
         Zi3qjPFzi8yn4O5Db3dkWT0MqJIefAceuVuHjJbmowVhaFsvd8PltyR5Y/6AS7SHD53h
         O3FQdweWDTffx2qydC/j+sx6Jp7yStNxz6u2rh9Dw858f38ql4f8VgiabbbvAGDNvSTy
         M15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747641; x=1787352441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qrCLPog2jxWXfDhN2OjQGPB6VGmpLsv7+67FVQKgoz0=;
        b=L/M4q6QSKMR4ZB2qL5jZDtoLWtUpBNpTVFg54Sume165v8M47KB76bl/ZePO+9sfXI
         /kTjaqpowcZYH6Ge6XKu9uLu/0ria4OzvBbW1pHs2jN5ZuMNKvMI9V/c3di/piAe8f5k
         kUYkOLgsz4AqucGnBQnxG4IwuH8pFVwM5oOdhA6bfKV6rvpYHzkMqLYkmfrAeXIgnBMr
         isiR0C5FxF/eRX7no/nnTnz4k+lddoedMHOhjZ0A1Sjt/sWgyb4L4iiU87qiQZQoRVMh
         dC6CYYGsVMgQ4F/SYHHzDUhL0fHPirs6MxCe1HvI1jdAG+nMb5t6K58VA3DKdvatf+68
         j8tg==
X-Gm-Message-State: AOJu0Yxs55gBYLw8MV0WsW/pRTVqnA7PC3TJHxKuIDpnJqI0x+xD8hxd
	8aBHtoL1abFDFX/2iClQQ596KA0Hp8eR0SjhlRG7ptx6uJkBd7DApE2U5cY6McN3
X-Gm-Gg: AR+sD10azdPz7cK/+Kp6B5/e3EkOKFMZpDICQdRlrL5HOdKXrs4AcM3ycH/aAI57kex
	Pfsd9tq8qQze0n8bx1Pr2CAmk7zKIBQnaJMy4swnBNOAupqXwnDVGrB4/aoYolpTznDubuF1svK
	SBYqM+IUHa2BhYR6zNxnYTQGagdOkmjcxJdWduIwV8Efl8WxQtq4FA6pofX40Yc7WaeUgYBnOs3
	Ks7SEXcjKAvceUCphqomb0PGf64ljgOaeJEOyIBCudlHzqsQmcgjWminIRKC24PwH3/XnuSYLoq
	xyZzHMTWUC7pJGDtN7pYeJEd+Q6zeu3UjqGdjGITTPwHHOCOKzdHg65BrYSB6A3LGvwa9wYQjXC
	9WadrDaTBvstMRMOL6UQ9gMsv+RHHaXw762lyKxtf+dKBfQ4FXeBc4Q5ot2QmzL9987w2kQ3jgW
	+Er7QxEw2sgE8A3rcukJ+NKCsfnkDe0XCnMY9CUU+pBPcVjXvKyfSaCTwN5pOHyqgT5tRsSuWDj
	z9IMdm5xKPSTpzkyPY96NRVu//iyO+t64dbBqQ5kswY4cyiuGAJ4Uz+nfTz1GGJ46LY/1Z/XBF2
	Ae3L929KZEn9tILS6WQARVe6JwxwaeG9hT+KcrIP1ZNOXqL4i0zDSYe37MINVANeEjvUK4IPljV
	e2XDYw1Az/3GY87JxZBBwcWHfdJh6GsgCdxRPRF74Hre82A==
X-Received: by 2002:a05:6a20:9f9b:b0:3c3:8044:8b0d with SMTP id adf61e73a8af0-3cc71cee0f8mr12736271637.12.1786747640349;
        Fri, 14 Aug 2026 15:47:20 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:47:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 084/109] libusbgx: uprev git -> 0.3.0
Date: Fri, 14 Aug 2026 15:45:10 -0700
Message-ID: <20260814224539.1523174-84-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129148

Move to the tagged libusbgx-v0.3.0 release instead of tracking an
untagged master SHA. Both OE-local patches
(0001-fix-stack-buffer-overflow-in-usbg_f_foo_attr_val-pro.patch and
0001-libusbgx-Add-interface-name-for-NCM-Feature-Descript.patch) are
already merged upstream by this tag, so drop them.

Build-verified for qemux86-64 (do_package_qa green, no patch fuzz).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-overflow-in-usbg_f_foo_attr_val-pro.patch | 796 ------------------
 ...erface-name-for-NCM-Feature-Descript.patch |  52 --
 .../recipes-support/libusbgx/libusbgx_git.bb  |   8 +-
 3 files changed, 3 insertions(+), 853 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libusbgx/libusbgx/0001-fix-stack-buffer-overflow-in-usbg_f_foo_attr_val-pro.patch
 delete mode 100644 meta-oe/recipes-support/libusbgx/libusbgx/0001-libusbgx-Add-interface-name-for-NCM-Feature-Descript.patch

diff --git a/meta-oe/recipes-support/libusbgx/libusbgx/0001-fix-stack-buffer-overflow-in-usbg_f_foo_attr_val-pro.patch b/meta-oe/recipes-support/libusbgx/libusbgx/0001-fix-stack-buffer-overflow-in-usbg_f_foo_attr_val-pro.patch
deleted file mode 100644
index 24a2760d11..0000000000
--- a/meta-oe/recipes-support/libusbgx/libusbgx/0001-fix-stack-buffer-overflow-in-usbg_f_foo_attr_val-pro.patch
+++ /dev/null
@@ -1,796 +0,0 @@
-From 421b366cafdf954b7e1cd2bbb78b55e04d73c082 Mon Sep 17 00:00:00 2001
-From: Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
-Date: Mon, 28 Nov 2022 08:29:54 +0100
-Subject: [PATCH] fix: stack-buffer-overflow in usbg_f_foo_attr_val processing.
- Changed ABI version from 2 to 3.
-
-Upstream-Status: Submitted [https://github.com/linux-usb-gadgets/libusbgx/pull/72]
-
-Signed-off-by: Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
-Signed-off-by: Ming Liu <liu.ming50@gmail.com>
----
- include/usbg/function/hid.h  | 28 ++++++++++++----------------
- include/usbg/function/midi.h | 35 +++++++++++++----------------------
- include/usbg/function/ms.h   | 30 +++++++++++-------------------
- include/usbg/function/net.h  | 34 ++++++++++++++--------------------
- include/usbg/function/uac2.h | 29 +++++++++++++----------------
- include/usbg/usbg_internal.h | 10 +++++-----
- src/Makefile.am              |  2 +-
- src/function/ether.c         | 10 +++++-----
- src/function/hid.c           | 12 ++++++------
- src/function/midi.c          | 10 +++++-----
- src/function/ms.c            | 10 +++++-----
- src/function/uac2.c          | 10 +++++-----
- src/function/uvc.c           | 10 +++++-----
- src/usbg_common.c            |  2 +-
- 14 files changed, 101 insertions(+), 131 deletions(-)
-
-diff --git a/include/usbg/function/hid.h b/include/usbg/function/hid.h
-index 3463140..3b3907b 100644
---- a/include/usbg/function/hid.h
-+++ b/include/usbg/function/hid.h
-@@ -56,11 +56,6 @@ union usbg_f_hid_attr_val {
- 	unsigned int subclass;
- };
- 
--#define USBG_F_HID_UINT_TO_ATTR_VAL(WHAT)			\
--	USBG_TO_UNION(usbg_f_hid_attr_val, protocol, WHAT)
--
--#define USBG_F_HID_RDESC_TO_ATTR_VAL(WHAT)			\
--	USBG_TO_UNION(usbg_f_hid_attr_val, report_desc, WHAT)
- /**
-  * @brief Cast from generic function to hid function
-  * @param[in] f function to be converted to hid funciton.
-@@ -137,7 +132,7 @@ int usbg_f_hid_get_attr_val(usbg_f_hid *hf, enum usbg_f_hid_attr attr,
-  * @return 0 on success usbg_error if error occurred.
-  */
- int usbg_f_hid_set_attr_val(usbg_f_hid *hf, enum usbg_f_hid_attr attr,
--			    union usbg_f_hid_attr_val val);
-+			    const union usbg_f_hid_attr_val *val);
- 
- /**
-  * @brief Get the minor and major of corresponding character device
-@@ -173,8 +168,9 @@ static inline int usbg_f_hid_get_protocol(usbg_f_hid *hf,
- static inline int usbg_f_hid_set_protocol(usbg_f_hid *hf,
- 					  unsigned int protocol)
- {
--	return usbg_f_hid_set_attr_val(hf, USBG_F_HID_PROTOCOL,
--				       USBG_F_HID_UINT_TO_ATTR_VAL(protocol));
-+
-+	union usbg_f_hid_attr_val val = {.protocol = protocol};
-+	return usbg_f_hid_set_attr_val(hf, USBG_F_HID_PROTOCOL, &val);
- }
- 
- /**
-@@ -199,8 +195,8 @@ static inline int usbg_f_hid_get_report_desc(usbg_f_hid *hf,
- static inline int usbg_f_hid_set_report_desc(usbg_f_hid *hf,
- 					     struct usbg_f_hid_report_desc report_desc)
- {
--	return usbg_f_hid_set_attr_val(hf, USBG_F_HID_REPORT_DESC,
--				       USBG_F_HID_RDESC_TO_ATTR_VAL(report_desc));
-+	union usbg_f_hid_attr_val val = {.report_desc = report_desc};
-+	return usbg_f_hid_set_attr_val(hf, USBG_F_HID_REPORT_DESC, &val);
- }
- 
- /**
-@@ -242,8 +238,8 @@ static inline int usbg_f_hid_set_report_desc_raw(usbg_f_hid *hf,
- 		.len = len,
- 	};
- 
--	return usbg_f_hid_set_attr_val(hf, USBG_F_HID_REPORT_DESC,
--				       USBG_F_HID_RDESC_TO_ATTR_VAL(report_desc));
-+	union usbg_f_hid_attr_val val = {.report_desc = report_desc};
-+	return usbg_f_hid_set_attr_val(hf, USBG_F_HID_REPORT_DESC, &val);
- }
- 
- /**
-@@ -268,8 +264,8 @@ static inline int usbg_f_hid_get_report_length(usbg_f_hid *hf,
- static inline int usbg_f_hid_set_report_length(usbg_f_hid *hf,
- 					  unsigned int report_length)
- {
--	return usbg_f_hid_set_attr_val(hf, USBG_F_HID_REPORT_LENGTH,
--				       USBG_F_HID_UINT_TO_ATTR_VAL(report_length));
-+	union usbg_f_hid_attr_val val = {.report_length = report_length};
-+	return usbg_f_hid_set_attr_val(hf, USBG_F_HID_REPORT_LENGTH, &val);
- }
- 
- /**
-@@ -294,8 +290,8 @@ static inline int usbg_f_hid_get_subclass(usbg_f_hid *hf,
- static inline int usbg_f_hid_set_subclass(usbg_f_hid *hf,
- 					  unsigned int subclass)
- {
--	return usbg_f_hid_set_attr_val(hf, USBG_F_HID_SUBCLASS,
--				       USBG_F_HID_UINT_TO_ATTR_VAL(subclass));
-+	union usbg_f_hid_attr_val val = {.subclass = subclass};
-+	return usbg_f_hid_set_attr_val(hf, USBG_F_HID_SUBCLASS, &val);
- }
- 
- #ifdef __cplusplus
-diff --git a/include/usbg/function/midi.h b/include/usbg/function/midi.h
-index 39df047..b9d9d4f 100644
---- a/include/usbg/function/midi.h
-+++ b/include/usbg/function/midi.h
-@@ -53,15 +53,6 @@ union usbg_f_midi_attr_val {
- 	unsigned int qlen;
- };
- 
--#define USBG_F_MIDI_INT_TO_ATTR_VAL(WHAT)		\
--	USBG_TO_UNION(usbg_f_midi_attr_val, index, WHAT)
--
--#define USBG_F_MIDI_UINT_TO_ATTR_VAL(WHAT)		\
--	USBG_TO_UNION(usbg_f_midi_attr_val, qlen, WHAT)
--
--#define USBG_F_MIDI_CCHAR_PTR_TO_ATTR_VAL(WHAT)		\
--	USBG_TO_UNION(usbg_f_midi_attr_val, id, WHAT)
--
- /**
-  * @brief Cast from generic function to midi function
-  * @param[in] f function to be converted to midi funciton.
-@@ -126,7 +117,7 @@ int usbg_f_midi_get_attr_val(usbg_f_midi *mf, enum usbg_f_midi_attr attr,
-  * @return 0 on success usbg_error if error occurred.
-  */
- int usbg_f_midi_set_attr_val(usbg_f_midi *mf, enum usbg_f_midi_attr attr,
--			    union usbg_f_midi_attr_val val);
-+			    const union usbg_f_midi_attr_val *val);
- 
- /**
-  * @brief Get the index value of MIDI adapter
-@@ -148,8 +139,8 @@ static inline int usbg_f_midi_get_index(usbg_f_midi *mf, int *index)
-  */
- static inline int usbg_f_midi_set_index(usbg_f_midi *mf, int index)
- {
--	return usbg_f_midi_set_attr_val(mf, USBG_F_MIDI_INDEX,
--					USBG_F_MIDI_INT_TO_ATTR_VAL(index));
-+	union usbg_f_midi_attr_val val = {.index = index};
-+	return usbg_f_midi_set_attr_val(mf, USBG_F_MIDI_INDEX, &val);
- }
- 
- /**
-@@ -188,8 +179,8 @@ int usbg_f_midi_get_id_s(usbg_f_midi *mf, char *buf, int len);
-  */
- static inline int usbg_f_midi_set_id(usbg_f_midi *mf, const char *id)
- {
--	return usbg_f_midi_set_attr_val(mf, USBG_F_MIDI_ID,
--					USBG_F_MIDI_CCHAR_PTR_TO_ATTR_VAL(id));
-+	union usbg_f_midi_attr_val val = {.id = id};
-+	return usbg_f_midi_set_attr_val(mf, USBG_F_MIDI_ID, &val);
- }
- 
- /**
-@@ -212,8 +203,8 @@ static inline int usbg_f_midi_get_in_ports(usbg_f_midi *mf, unsigned *in_ports)
-  */
- static inline int usbg_f_midi_set_in_ports(usbg_f_midi *mf, unsigned in_ports)
- {
--	return usbg_f_midi_set_attr_val(mf, USBG_F_MIDI_IN_PORTS,
--					USBG_F_MIDI_UINT_TO_ATTR_VAL(in_ports));
-+	union usbg_f_midi_attr_val val = {.in_ports = in_ports};
-+	return usbg_f_midi_set_attr_val(mf, USBG_F_MIDI_IN_PORTS, &val);
- }
- 
- /**
-@@ -236,8 +227,8 @@ static inline int usbg_f_midi_get_out_ports(usbg_f_midi *mf, unsigned *out_ports
-  */
- static inline int usbg_f_midi_set_out_ports(usbg_f_midi *mf, unsigned out_ports)
- {
--	return usbg_f_midi_set_attr_val(mf, USBG_F_MIDI_OUT_PORTS,
--					USBG_F_MIDI_UINT_TO_ATTR_VAL(out_ports));
-+	union usbg_f_midi_attr_val val = {.out_ports = out_ports};
-+	return usbg_f_midi_set_attr_val(mf, USBG_F_MIDI_OUT_PORTS, &val);
- }
- 
- /**
-@@ -264,8 +255,8 @@ static inline int usbg_f_midi_get_buflen(usbg_f_midi *mf, int *buflen)
-  */
- static inline int usbg_f_midi_set_buflen(usbg_f_midi *mf, unsigned buflen)
- {
--	return usbg_f_midi_set_attr_val(mf, USBG_F_MIDI_BUFLEN,
--					USBG_F_MIDI_UINT_TO_ATTR_VAL(buflen));
-+	union usbg_f_midi_attr_val val = {.buflen = buflen};
-+	return usbg_f_midi_set_attr_val(mf, USBG_F_MIDI_BUFLEN, &val);
- }
- 
- /**
-@@ -288,8 +279,8 @@ static inline int usbg_f_midi_get_qlen(usbg_f_midi *mf, unsigned *qlen)
-  */
- static inline int usbg_f_midi_set_qlen(usbg_f_midi *mf, unsigned qlen)
- {
--	return usbg_f_midi_set_attr_val(mf, USBG_F_MIDI_QLEN,
--					USBG_F_MIDI_UINT_TO_ATTR_VAL(qlen));
-+	union usbg_f_midi_attr_val val = {.qlen = qlen};
-+	return usbg_f_midi_set_attr_val(mf, USBG_F_MIDI_QLEN, &val);
- }
- 
- #ifdef __cplusplus
-diff --git a/include/usbg/function/ms.h b/include/usbg/function/ms.h
-index 780464c..f52eb78 100644
---- a/include/usbg/function/ms.h
-+++ b/include/usbg/function/ms.h
-@@ -56,14 +56,6 @@ union usbg_f_ms_lun_attr_val {
- 	const char *file;
- };
- 
--#define USBG_F_MS_LUN_BOOL_TO_ATTR_VAL(WHAT)		\
--	USBG_TO_UNION(usbg_f_ms_lun_attr_val, cdrom, WHAT)
--
--#define USBG_F_MS_LUN_CCHAR_PTR_TO_ATTR_VAL(WHAT)		\
--	USBG_TO_UNION(usbg_f_ms_lun_attr_val, file, WHAT)
--
--
--
- /**
-  * @brief Cast from generic function to mass storage function
-  * @param[in] f function to be converted to ms funciton.
-@@ -157,7 +149,7 @@ int usbg_f_ms_get_lun_attr_val(usbg_f_ms *mf, int lun_id,
-  */
- int usbg_f_ms_set_lun_attr_val(usbg_f_ms *mf, int lun_id,
- 			       enum usbg_f_ms_lun_attr lattr,
--			       const union usbg_f_ms_lun_attr_val val);
-+			       const union usbg_f_ms_lun_attr_val *val);
- 
- /**
-  * @brief Get the value which determines if lun is visible as a cdrom
-@@ -183,8 +175,8 @@ static inline int usbg_f_ms_get_lun_cdrom(usbg_f_ms *mf, int lun_id,
- static inline int usbg_f_ms_set_lun_cdrom(usbg_f_ms *mf, int lun_id,
- 					  bool cdrom)
- {
--	return usbg_f_ms_set_lun_attr_val(mf, lun_id, USBG_F_MS_LUN_CDROM,
--					  USBG_F_MS_LUN_BOOL_TO_ATTR_VAL(cdrom));
-+	union usbg_f_ms_lun_attr_val val = {.cdrom = cdrom};
-+	return usbg_f_ms_set_lun_attr_val(mf, lun_id, USBG_F_MS_LUN_CDROM, &val);
- }
- 
- /**
-@@ -209,8 +201,8 @@ static inline int usbg_f_ms_get_lun_ro(usbg_f_ms *mf, int lun_id, bool *ro)
-  */
- static inline int usbg_f_ms_set_lun_ro(usbg_f_ms *mf, int lun_id, bool ro)
- {
--	return usbg_f_ms_set_lun_attr_val(mf, lun_id, USBG_F_MS_LUN_RO,
--					  USBG_F_MS_LUN_BOOL_TO_ATTR_VAL(ro));
-+	union usbg_f_ms_lun_attr_val val = {.ro = ro};
-+	return usbg_f_ms_set_lun_attr_val(mf, lun_id, USBG_F_MS_LUN_RO, &val);
- }
- 
- /**
-@@ -239,8 +231,8 @@ static inline int usbg_f_ms_get_lun_nofua(usbg_f_ms *mf, int lun_id,
- static inline int usbg_f_ms_set_lun_nofua(usbg_f_ms *mf, int lun_id,
- 				bool nofua)
- {
--	return usbg_f_ms_set_lun_attr_val(mf, lun_id, USBG_F_MS_LUN_NOFUA,
--					  USBG_F_MS_LUN_BOOL_TO_ATTR_VAL(nofua));
-+	union usbg_f_ms_lun_attr_val val = {.nofua = nofua};
-+	return usbg_f_ms_set_lun_attr_val(mf, lun_id, USBG_F_MS_LUN_NOFUA, &val);
- }
- 
- /**
-@@ -267,8 +259,8 @@ static inline int usbg_f_ms_get_lun_removable(usbg_f_ms *mf, int lun_id,
- static inline int usbg_f_ms_set_lun_removable(usbg_f_ms *mf, int lun_id,
- 				bool removable)
- {
--	return usbg_f_ms_set_lun_attr_val(mf, lun_id, USBG_F_MS_LUN_REMOVABLE,
--					  USBG_F_MS_LUN_BOOL_TO_ATTR_VAL(removable));
-+	union usbg_f_ms_lun_attr_val val = {.removable = removable};
-+	return usbg_f_ms_set_lun_attr_val(mf, lun_id, USBG_F_MS_LUN_REMOVABLE, &val);
- }
- 
- /**
-@@ -313,8 +305,8 @@ int usbg_f_ms_get_lun_file_s(usbg_f_ms *mf, int lun_id,
- static inline int usbg_f_ms_set_lun_file(usbg_f_ms *mf, int lun_id,
- 			   const char *file)
- {
--	return usbg_f_ms_set_lun_attr_val(mf, lun_id, USBG_F_MS_LUN_FILE,
--					  USBG_F_MS_LUN_CCHAR_PTR_TO_ATTR_VAL(file));
-+	union usbg_f_ms_lun_attr_val val = {.file = file};
-+	return usbg_f_ms_set_lun_attr_val(mf, lun_id, USBG_F_MS_LUN_FILE, &val);
- }
- 
- /**
-diff --git a/include/usbg/function/net.h b/include/usbg/function/net.h
-index b0409f1..06cee30 100644
---- a/include/usbg/function/net.h
-+++ b/include/usbg/function/net.h
-@@ -56,12 +56,6 @@ union usbg_f_net_attr_val {
- 	unsigned int protocol;
- };
- 
--#define USBG_F_NET_ETHER_ADDR_TO_ATTR_VAL(WHAT)		\
--	USBG_TO_UNION(usbg_f_net_attr_val, dev_addr, WHAT)
--
--#define USBG_F_NET_INT_TO_ATTR_VAL(WHAT)		\
--	USBG_TO_UNION(usbg_f_net_attr_val, qmult, WHAT)
--
- /**
-  * @brief Cast from generic function to net function
-  * @param[in] f function to be converted to net funciton.
-@@ -125,7 +119,7 @@ int usbg_f_net_get_attr_val(usbg_f_net *nf, enum usbg_f_net_attr attr,
-  * @return 0 on success usbg_error if error occurred.
-  */
- int usbg_f_net_set_attr_val(usbg_f_net *nf, enum usbg_f_net_attr attr,
--			    const union usbg_f_net_attr_val val);
-+			    const union usbg_f_net_attr_val *val);
- 
- /**
-  * @brief Get the value of device side MAC address
-@@ -136,7 +130,7 @@ int usbg_f_net_set_attr_val(usbg_f_net *nf, enum usbg_f_net_attr attr,
- static inline int usbg_f_net_get_dev_addr(usbg_f_net *nf,
- 					  struct ether_addr *addr)
- {
--	union usbg_f_net_attr_val val = { .dev_addr = *addr, };
-+	union usbg_f_net_attr_val val = {.dev_addr = *addr};
- 	return usbg_f_net_get_attr_val(nf, USBG_F_NET_DEV_ADDR, &val);
- }
- 
-@@ -149,8 +143,8 @@ static inline int usbg_f_net_get_dev_addr(usbg_f_net *nf,
- static inline int usbg_f_net_set_dev_addr(usbg_f_net *nf,
- 			     const struct ether_addr *addr)
- {
--	return usbg_f_net_set_attr_val(nf, USBG_F_NET_DEV_ADDR,
--				       USBG_F_NET_ETHER_ADDR_TO_ATTR_VAL(*addr));
-+	union usbg_f_net_attr_val val = {.dev_addr = *addr};
-+	return usbg_f_net_set_attr_val(nf, USBG_F_NET_DEV_ADDR, &val);
- }
- 
- /**
-@@ -175,8 +169,8 @@ static inline int usbg_f_net_get_host_addr(usbg_f_net *nf,
- static inline int usbg_f_net_set_host_addr(usbg_f_net *nf,
- 					   const struct ether_addr *addr)
- {
--	return usbg_f_net_set_attr_val(nf, USBG_F_NET_HOST_ADDR,
--				       USBG_F_NET_ETHER_ADDR_TO_ATTR_VAL(*addr));
-+	union usbg_f_net_attr_val val = {.host_addr = *addr};
-+	return usbg_f_net_set_attr_val(nf, USBG_F_NET_HOST_ADDR, &val);
- }
- 
- /**
-@@ -226,8 +220,8 @@ static inline int usbg_f_net_get_qmult(usbg_f_net *nf, int *qmult)
-  */
- static inline int usbg_f_net_set_qmult(usbg_f_net *nf, int qmult)
- {
--	return usbg_f_net_set_attr_val(nf, USBG_F_NET_QMULT,
--				       USBG_F_NET_INT_TO_ATTR_VAL(qmult));
-+	union usbg_f_net_attr_val val = {.qmult = qmult};
-+	return usbg_f_net_set_attr_val(nf, USBG_F_NET_QMULT, &val);
- }
- 
- /**
-@@ -250,8 +244,8 @@ static inline int usbg_f_net_get_class(usbg_f_net *nf, unsigned int *class_)
-  */
- static inline int usbg_f_net_set_class(usbg_f_net *nf, unsigned int class_)
- {
--	return usbg_f_net_set_attr_val(nf, USBG_F_NET_CLASS,
--				       USBG_F_NET_INT_TO_ATTR_VAL(class_));
-+	union usbg_f_net_attr_val val = {.class_ = class_};
-+	return usbg_f_net_set_attr_val(nf, USBG_F_NET_CLASS, &val);
- }
- 
- /**
-@@ -274,8 +268,8 @@ static inline int usbg_f_net_get_subclass(usbg_f_net *nf, int *subclass)
-  */
- static inline int usbg_f_net_set_subclass(usbg_f_net *nf, unsigned int subclass)
- {
--	return usbg_f_net_set_attr_val(nf, USBG_F_NET_SUBCLASS,
--				       USBG_F_NET_INT_TO_ATTR_VAL(subclass));
-+	union usbg_f_net_attr_val val = {.subclass = subclass};
-+	return usbg_f_net_set_attr_val(nf, USBG_F_NET_SUBCLASS, &val);
- }
- 
- /**
-@@ -298,8 +292,8 @@ static inline int usbg_f_net_get_protocol(usbg_f_net *nf, int *protocol)
-  */
- static inline int usbg_f_net_set_protocol(usbg_f_net *nf, unsigned int protocol)
- {
--	return usbg_f_net_set_attr_val(nf, USBG_F_NET_PROTOCOL,
--				       USBG_F_NET_INT_TO_ATTR_VAL(protocol));
-+	union usbg_f_net_attr_val val = {.protocol = protocol};
-+	return usbg_f_net_set_attr_val(nf, USBG_F_NET_PROTOCOL, &val);
- }
- 
- #ifdef __cplusplus
-diff --git a/include/usbg/function/uac2.h b/include/usbg/function/uac2.h
-index 6fc4d24..80918ef 100644
---- a/include/usbg/function/uac2.h
-+++ b/include/usbg/function/uac2.h
-@@ -110,9 +110,6 @@ union usbg_f_uac2_attr_val {
- 	const char * function_name;
- };
- 
--#define USBG_F_UAC2_INT_TO_ATTR_VAL(WHAT)			\
--	USBG_TO_UNION(usbg_f_uac2_attr_val, c_chmask, WHAT)
--
- /**
-  * @brief Cast from generic function to uac2 function
-  * @param[in] f function to be converted to uac2 funciton.
-@@ -172,7 +169,7 @@ int usbg_f_uac2_get_attr_val(usbg_f_uac2 *af, enum usbg_f_uac2_attr attr,
-  * @return 0 on success usbg_error if error occurred.
-  */
- int usbg_f_uac2_set_attr_val(usbg_f_uac2 *af, enum usbg_f_uac2_attr attr,
--			     union usbg_f_uac2_attr_val val);
-+			     const union usbg_f_uac2_attr_val *val);
- 
- /**
-  * @brief Get the capture channel mask of UAC2 adapter
-@@ -194,8 +191,8 @@ static inline int usbg_f_uac2_get_c_chmask(usbg_f_uac2 *af, int *c_chmask)
-  */
- static inline int usbg_f_uac2_set_c_chmask(usbg_f_uac2 *af, int c_chmask)
- {
--	return usbg_f_uac2_set_attr_val(af, USBG_F_UAC2_C_CHMASK,
--					USBG_F_UAC2_INT_TO_ATTR_VAL(c_chmask));
-+	union usbg_f_uac2_attr_val val = {.c_chmask = c_chmask};
-+	return usbg_f_uac2_set_attr_val(af, USBG_F_UAC2_C_CHMASK, &val);
- }
- 
- /**
-@@ -218,8 +215,8 @@ static inline int usbg_f_uac2_get_c_srate(usbg_f_uac2 *af, int *c_srate)
-  */
- static inline int usbg_f_uac2_set_c_srate(usbg_f_uac2 *af, int c_srate)
- {
--	return usbg_f_uac2_set_attr_val(af, USBG_F_UAC2_C_SRATE,
--					USBG_F_UAC2_INT_TO_ATTR_VAL(c_srate));
-+	union usbg_f_uac2_attr_val val = {.c_srate = c_srate};
-+	return usbg_f_uac2_set_attr_val(af, USBG_F_UAC2_C_SRATE, &val);
- }
- 
- /**
-@@ -242,8 +239,8 @@ static inline int usbg_f_uac2_get_c_ssize(usbg_f_uac2 *af, int *c_ssize)
-  */
- static inline int usbg_f_uac2_set_c_ssize(usbg_f_uac2 *af, int c_ssize)
- {
--	return usbg_f_uac2_set_attr_val(af, USBG_F_UAC2_C_SSIZE,
--					USBG_F_UAC2_INT_TO_ATTR_VAL(c_ssize));
-+	union usbg_f_uac2_attr_val val = {.c_ssize = c_ssize};
-+	return usbg_f_uac2_set_attr_val(af, USBG_F_UAC2_C_SSIZE, &val);
- }
- 
- /**
-@@ -266,8 +263,8 @@ static inline int usbg_f_uac2_get_p_chmask(usbg_f_uac2 *af, int *p_chmask)
-  */
- static inline int usbg_f_uac2_set_p_chmask(usbg_f_uac2 *af, int p_chmask)
- {
--	return usbg_f_uac2_set_attr_val(af, USBG_F_UAC2_P_CHMASK,
--					USBG_F_UAC2_INT_TO_ATTR_VAL(p_chmask));
-+	union usbg_f_uac2_attr_val val = {.p_chmask = p_chmask};
-+	return usbg_f_uac2_set_attr_val(af, USBG_F_UAC2_P_CHMASK, &val);
- }
- 
- /**
-@@ -290,8 +287,8 @@ static inline int usbg_f_uac2_get_p_srate(usbg_f_uac2 *af, int *p_srate)
-  */
- static inline int usbg_f_uac2_set_p_srate(usbg_f_uac2 *af, int p_srate)
- {
--	return usbg_f_uac2_set_attr_val(af, USBG_F_UAC2_P_SRATE,
--					USBG_F_UAC2_INT_TO_ATTR_VAL(p_srate));
-+	union usbg_f_uac2_attr_val val = {.p_srate = p_srate};
-+	return usbg_f_uac2_set_attr_val(af, USBG_F_UAC2_P_SRATE, &val);
- }
- 
- /**
-@@ -314,8 +311,8 @@ static inline int usbg_f_uac2_get_p_ssize(usbg_f_uac2 *af, int *p_ssize)
-  */
- static inline int usbg_f_uac2_set_p_ssize(usbg_f_uac2 *af, int p_ssize)
- {
--	return usbg_f_uac2_set_attr_val(af, USBG_F_UAC2_P_SSIZE,
--					USBG_F_UAC2_INT_TO_ATTR_VAL(p_ssize));
-+	union usbg_f_uac2_attr_val val = {.p_ssize = p_ssize};
-+	return usbg_f_uac2_set_attr_val(af, USBG_F_UAC2_P_SSIZE, &val);
- }
- 
- #ifdef __cplusplus
-diff --git a/include/usbg/usbg_internal.h b/include/usbg/usbg_internal.h
-index 1d8dfe2..d6a3e3a 100644
---- a/include/usbg/usbg_internal.h
-+++ b/include/usbg/usbg_internal.h
-@@ -322,7 +322,7 @@ void usbg_cleanup_function(struct usbg_function *f);
- 	}
- 
- typedef int (*usbg_attr_get_func)(const char *, const char *, const char *, void *);
--typedef int (*usbg_attr_set_func)(const char *, const char *, const char *, void *);
-+typedef int (*usbg_attr_set_func)(const char *, const char *, const char *, const void *);
- 
- static inline int usbg_get_dec(const char *path, const char *name,
- 			   const char *attr, void *val)
-@@ -331,7 +331,7 @@ static inline int usbg_get_dec(const char *path, const char *name,
- }
- 
- static inline int usbg_set_dec(const char *path, const char *name,
--			   const char *attr, void *val)
-+			   const char *attr, const void *val)
- {
- 	return usbg_write_dec(path, name, attr, *((int *)val));
- }
-@@ -343,7 +343,7 @@ static inline int usbg_get_bool(const char *path, const char *name,
- }
- 
- static inline int usbg_set_bool(const char *path, const char *name,
--			   const char *attr, void *val)
-+			   const char *attr, const void *val)
- {
- 	return usbg_write_bool(path, name, attr, *((bool *)val));
- }
-@@ -355,7 +355,7 @@ static inline int usbg_get_string(const char *path, const char *name,
- }
- 
- static inline int usbg_set_string(const char *path, const char *name,
--			      const char *attr, void *val)
-+			      const char *attr, const void *val)
- {
- 	return usbg_write_string(path, name, attr, *(char **)val);
- }
-@@ -364,7 +364,7 @@ int usbg_get_ether_addr(const char *path, const char *name, const char *attr,
- 			void *val);
- 
- int usbg_set_ether_addr(const char *path, const char *name, const char *attr,
--			void *val);
-+			const void *val);
- 
- int usbg_get_dev(const char *path, const char *name, const char *attr,
- 		 void *val);
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 634209f..ac97bc8 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -7,6 +7,6 @@ else
- libusbgx_la_SOURCES += usbg_schemes_none.c
- endif
- libusbgx_la_LDFLAGS = $(LIBCONFIG_LIBS)
--libusbgx_la_LDFLAGS += -version-info 2:0:0
-+libusbgx_la_LDFLAGS += -version-info 3:0:0
- libusbgx_la_CFLAGS = $(LIBCONFIG_CFLAGS)
- AM_CPPFLAGS=-I$(top_srcdir)/include/ -I$(top_builddir)/include/usbg
-diff --git a/src/function/ether.c b/src/function/ether.c
-index a9eaf33..a1d20f1 100644
---- a/src/function/ether.c
-+++ b/src/function/ether.c
-@@ -124,7 +124,7 @@ static int ether_libconfig_import(struct usbg_function *f,
- 		if (ret < 0)
- 			break;
- 
--		ret = usbg_f_net_set_attr_val(nf, i, val);
-+		ret = usbg_f_net_set_attr_val(nf, i, &val);
- 		if (ret)
- 			break;
- 	}
-@@ -258,8 +258,8 @@ int usbg_f_net_set_attrs(usbg_f_net *nf,
- 			continue;
- 
- 		ret = usbg_f_net_set_attr_val(nf, i,
--					       *(union usbg_f_net_attr_val *)
--					       ((char *)attrs
-+					       (const union usbg_f_net_attr_val *)
-+					       ((const char *)attrs
- 						+ net_attr[i].offset));
- 		if (ret)
- 			break;
-@@ -277,12 +277,12 @@ int usbg_f_net_get_attr_val(usbg_f_net *nf, enum usbg_f_net_attr attr,
- }
- 
- int usbg_f_net_set_attr_val(usbg_f_net *nf, enum usbg_f_net_attr attr,
--			    union usbg_f_net_attr_val val)
-+			    const union usbg_f_net_attr_val *val)
- {
- 	return net_attr[attr].ro ?
- 		USBG_ERROR_INVALID_PARAM :
- 		net_attr[attr].set(nf->func.path, nf->func.name,
--				   net_attr[attr].name, &val);
-+				   net_attr[attr].name, val);
- }
- 
- int usbg_f_net_get_ifname_s(usbg_f_net *nf, char *buf, int len)
-diff --git a/src/function/hid.c b/src/function/hid.c
-index 4d075cf..895c2c6 100644
---- a/src/function/hid.c
-+++ b/src/function/hid.c
-@@ -69,9 +69,9 @@ static int hid_get_report(const char *path, const char *name, const char *attr,
- }
- 
- static int hid_set_report(const char *path, const char *name, const char *attr,
--			  void *val)
-+			  const void *val)
- {
--	struct usbg_f_hid_report_desc *report_desc = val;
-+	const struct usbg_f_hid_report_desc *report_desc = val;
- 	char *buf = report_desc->desc;
- 	int len = report_desc->len;
- 	int ret;
-@@ -239,7 +239,7 @@ static int hid_libconfig_import(struct usbg_function *f,
- 		if (ret < 0)
- 			break;
- 
--		ret = usbg_f_hid_set_attr_val(hf, i, val);
-+		ret = usbg_f_hid_set_attr_val(hf, i, &val);
- 		if (ret)
- 			break;
- 	}
-@@ -327,7 +327,7 @@ int usbg_f_hid_set_attrs(usbg_f_hid *hf,
- 			continue;
- 
- 		ret = usbg_f_hid_set_attr_val(hf, i,
--					       *(union usbg_f_hid_attr_val *)
-+					       (union usbg_f_hid_attr_val *)
- 					       ((char *)attrs
- 						+ hid_attr[i].offset));
- 		if (ret)
-@@ -346,11 +346,11 @@ int usbg_f_hid_get_attr_val(usbg_f_hid *hf, enum usbg_f_hid_attr attr,
- }
- 
- int usbg_f_hid_set_attr_val(usbg_f_hid *hf, enum usbg_f_hid_attr attr,
--			    union usbg_f_hid_attr_val val)
-+			    const union usbg_f_hid_attr_val *val)
- {
- 	return hid_attr[attr].ro ?
- 		USBG_ERROR_INVALID_PARAM :
- 		hid_attr[attr].set(hf->func.path, hf->func.name,
--				  hid_attr[attr].name, &val);
-+				  hid_attr[attr].name, val);
- }
- 
-diff --git a/src/function/midi.c b/src/function/midi.c
-index 1cedb97..2318b49 100644
---- a/src/function/midi.c
-+++ b/src/function/midi.c
-@@ -100,7 +100,7 @@ static int midi_libconfig_import(struct usbg_function *f,
- 		if (ret < 0)
- 			break;
- 
--		ret = usbg_f_midi_set_attr_val(mf, i, val);
-+		ret = usbg_f_midi_set_attr_val(mf, i, &val);
- 		if (ret)
- 			break;
- 	}
-@@ -185,8 +185,8 @@ int usbg_f_midi_set_attrs(usbg_f_midi *mf,
- 
- 	for (i = USBG_F_MIDI_ATTR_MIN; i < USBG_F_MIDI_ATTR_MAX; ++i) {
- 		ret = usbg_f_midi_set_attr_val(mf, i,
--					       *(union usbg_f_midi_attr_val *)
--					       ((char *)attrs
-+					       (const union usbg_f_midi_attr_val *)
-+					       ((const char *)attrs
- 						+ midi_attr[i].offset));
- 		if (ret)
- 			break;
-@@ -204,10 +204,10 @@ int usbg_f_midi_get_attr_val(usbg_f_midi *mf, enum usbg_f_midi_attr attr,
- }
- 
- int usbg_f_midi_set_attr_val(usbg_f_midi *mf, enum usbg_f_midi_attr attr,
--			    union usbg_f_midi_attr_val val)
-+			    const union usbg_f_midi_attr_val *val)
- {
- 	return midi_attr[attr].set(mf->func.path, mf->func.name,
--				    midi_attr[attr].name, &val);
-+				    midi_attr[attr].name, val);
- }
- 
- int usbg_f_midi_get_id_s(usbg_f_midi *mf, char *buf, int len)
-diff --git a/src/function/ms.c b/src/function/ms.c
-index 519b012..5cdd814 100644
---- a/src/function/ms.c
-+++ b/src/function/ms.c
-@@ -207,7 +207,7 @@ static int ms_import_lun_attrs(struct usbg_f_ms *mf, int lun_id,
- 		if (ret < 0)
- 			break;
- 
--		ret = usbg_f_ms_set_lun_attr_val(mf, lun_id, i, val);
-+		ret = usbg_f_ms_set_lun_attr_val(mf, lun_id, i, &val);
- 		if (ret)
- 			break;
- 	}
-@@ -605,8 +605,8 @@ int usbg_f_ms_set_lun_attrs(usbg_f_ms *mf, int lun_id,
- 
- 	for (i = USBG_F_MS_LUN_ATTR_MIN; i < USBG_F_MS_LUN_ATTR_MAX; ++i) {
- 		ret = usbg_f_ms_set_lun_attr_val(mf, lun_id, i,
--					       *(union usbg_f_ms_lun_attr_val *)
--					       ((char *)lattrs
-+					       (const union usbg_f_ms_lun_attr_val *)
-+					       ((const char *)lattrs
- 						+ ms_lun_attr[i].offset));
- 		if (ret)
- 			break;
-@@ -633,7 +633,7 @@ int usbg_f_ms_get_lun_attr_val(usbg_f_ms *mf, int lun_id,
- 
- int usbg_f_ms_set_lun_attr_val(usbg_f_ms *mf, int lun_id,
- 			       enum usbg_f_ms_lun_attr lattr,
--			       union usbg_f_ms_lun_attr_val val)
-+			       const union usbg_f_ms_lun_attr_val *val)
- {
- 	char lpath[USBG_MAX_PATH_LENGTH];
- 	int ret;
-@@ -644,7 +644,7 @@ int usbg_f_ms_set_lun_attr_val(usbg_f_ms *mf, int lun_id,
- 		return USBG_ERROR_PATH_TOO_LONG;
- 
- 	return 	ms_lun_attr[lattr].set(lpath, "",
--				       ms_lun_attr[lattr].name, &val);
-+				       ms_lun_attr[lattr].name, val);
- }
- 
- int usbg_f_ms_get_lun_file_s(usbg_f_ms *mf, int lun_id,
-diff --git a/src/function/uac2.c b/src/function/uac2.c
-index 9ca8b66..fc06c1d 100644
---- a/src/function/uac2.c
-+++ b/src/function/uac2.c
-@@ -125,7 +125,7 @@ static int uac2_libconfig_import(struct usbg_function *f,
- 		if (ret < 0)
- 			break;
- 
--		ret = usbg_f_uac2_set_attr_val(af, i, val);
-+		ret = usbg_f_uac2_set_attr_val(af, i, &val);
- 		if (ret)
- 			break;
- 	}
-@@ -210,8 +210,8 @@ int usbg_f_uac2_set_attrs(usbg_f_uac2 *af,
- 
- 	for (i = USBG_F_UAC2_ATTR_MIN; i < USBG_F_UAC2_ATTR_MAX; ++i) {
- 		ret = usbg_f_uac2_set_attr_val(af, i,
--					       *(union usbg_f_uac2_attr_val *)
--					       ((char *)attrs
-+					       (const union usbg_f_uac2_attr_val *)
-+					       ((const char *)attrs
- 						+ uac2_attr[i].offset));
- 		if (ret)
- 			break;
-@@ -229,8 +229,8 @@ int usbg_f_uac2_get_attr_val(usbg_f_uac2 *af, enum usbg_f_uac2_attr attr,
- }
- 
- int usbg_f_uac2_set_attr_val(usbg_f_uac2 *af, enum usbg_f_uac2_attr attr,
--			     union usbg_f_uac2_attr_val val)
-+			     const union usbg_f_uac2_attr_val *val)
- {
- 	return uac2_attr[attr].set(af->func.path, af->func.name,
--				    uac2_attr[attr].name, &val);
-+				    uac2_attr[attr].name, val);
- }
-diff --git a/src/function/uvc.c b/src/function/uvc.c
-index f39594b..947b94e 100644
---- a/src/function/uvc.c
-+++ b/src/function/uvc.c
-@@ -303,7 +303,7 @@ int usbg_f_uvc_get_config_attr_val(usbg_f_uvc *uvcf, enum usbg_f_uvc_config_attr
- }
- 
- int usbg_f_uvc_set_config_attr_val(usbg_f_uvc *uvcf, enum usbg_f_uvc_config_attr iattr,
--			       union usbg_f_uvc_config_attr_val val)
-+			       const union usbg_f_uvc_config_attr_val *val)
- {
- 	char ipath[USBG_MAX_PATH_LENGTH];
- 	int nmb;
-@@ -314,7 +314,7 @@ int usbg_f_uvc_set_config_attr_val(usbg_f_uvc *uvcf, enum usbg_f_uvc_config_attr
- 		return USBG_ERROR_PATH_TOO_LONG;
- 
- 	return uvc_config_attr[iattr].set(ipath, "",
--				       uvc_config_attr[iattr].name, &val);
-+				       uvc_config_attr[iattr].name, val);
- }
- 
- int usbg_f_uvc_get_config_attrs(usbg_f_uvc *uvcf, struct usbg_f_uvc_config_attrs *iattrs)
-@@ -341,8 +341,8 @@ int usbg_f_uvc_set_config_attrs(usbg_f_uvc *uvcf, const struct usbg_f_uvc_config
- 
- 	for (i = USBG_F_UVC_FRAME_ATTR_MIN; i < USBG_F_UVC_FRAME_ATTR_MAX; ++i) {
- 		ret = usbg_f_uvc_set_config_attr_val(uvcf, i,
--					       *(union usbg_f_uvc_config_attr_val *)
--					       ((char *)iattrs
-+					       (const union usbg_f_uvc_config_attr_val *)
-+					       ((const char *)iattrs
- 						+ uvc_config_attr[i].offset));
- 		if (ret)
- 			break;
-@@ -774,7 +774,7 @@ static int uvc_import_config(struct usbg_f_uvc *uvcf, config_setting_t *root)
- 		if (ret < 0)
- 			break;
- 
--		ret = usbg_f_uvc_set_config_attr_val(uvcf, i, val);
-+		ret = usbg_f_uvc_set_config_attr_val(uvcf, i, &val);
- 		if (ret)
- 			break;
- 	}
-diff --git a/src/usbg_common.c b/src/usbg_common.c
-index 5f7f4e5..7234649 100644
---- a/src/usbg_common.c
-+++ b/src/usbg_common.c
-@@ -337,7 +337,7 @@ int usbg_get_ether_addr(const char *path, const char *name,
- }
- 
- int usbg_set_ether_addr(const char *path, const char *name,
--			      const char *attr, void *val)
-+			      const char *attr, const void *val)
- {
- 	char str_addr[USBG_MAX_STR_LENGTH];
- 
--- 
-2.42.0
-
diff --git a/meta-oe/recipes-support/libusbgx/libusbgx/0001-libusbgx-Add-interface-name-for-NCM-Feature-Descript.patch b/meta-oe/recipes-support/libusbgx/libusbgx/0001-libusbgx-Add-interface-name-for-NCM-Feature-Descript.patch
deleted file mode 100644
index cc122c844c..0000000000
--- a/meta-oe/recipes-support/libusbgx/libusbgx/0001-libusbgx-Add-interface-name-for-NCM-Feature-Descript.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 4f3f2ad08e6ca132bd1dd388e02b57223bf4219d Mon Sep 17 00:00:00 2001
-From: Ming Liu <liu.ming50@gmail.com>
-Date: Sun, 11 Dec 2022 14:11:49 +0100
-Subject: [PATCH] libusbgx: Add interface name for NCM Feature Descriptors
-
-In commit: abf422bffca4a4767e7e242c44910dbf5ef7094f
-[
-Author: Stefan Agner <stefan.agner@toradex.com>
-Date:   Tue Jan 24 14:22:25 2017 -0800
-
-    libusbgx: Add interface name for Feature Descriptors
-
-    This adds interface name required for "Feature Descriptors". If
-    specified, we can assume that a Feature Descriptor with the
-    interface name of the specified string is understood by the
-    kernel (e.g. interface.rndis).
-]
-
-it only added Feature Descriptors for RNDIS, NCM also needs that, or
-else it could not be recognized by Windows systems.
-
-Add Feature Descriptors interface name for NCM.
-
-Upstream-Status: Submitted [https://github.com/linux-usb-gadgets/libusbgx/pull/73]
-
-Signed-off-by: Ming Liu <liu.ming50@gmail.com>
----
- src/function/ether.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/src/function/ether.c b/src/function/ether.c
-index b1fe1d2..a9eaf33 100644
---- a/src/function/ether.c
-+++ b/src/function/ether.c
-@@ -184,8 +184,14 @@ struct usbg_function_type usbg_f_type_subset = {
- 	ETHER_FUNCTION_OPTS
- };
- 
-+static char *ncm_os_desc_ifnames[] = {
-+	"ncm",
-+	NULL
-+};
-+
- struct usbg_function_type usbg_f_type_ncm = {
- 	.name = "ncm",
-+	.os_desc_iname = ncm_os_desc_ifnames,
- 	ETHER_FUNCTION_OPTS
- };
- 
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
index 31453cf304..8e2f07db63 100644
--- a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
+++ b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
@@ -5,13 +5,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 inherit autotools pkgconfig systemd update-rc.d update-alternatives
 
-PV = "0.2.0+git"
-SRCREV = "ec0b01c03fdc7893997b7b32ec1c12c6103f62f3"
+PV = "0.3.0"
+SRCREV = "dbedf16f80c5b4e1807ea4f80cc89d1f15d36f0a"
 SRCBRANCH = "master"
 SRC_URI = " \
-    git://github.com/libusbgx/libusbgx.git;branch=${SRCBRANCH};protocol=https \
-    file://0001-libusbgx-Add-interface-name-for-NCM-Feature-Descript.patch \
-    file://0001-fix-stack-buffer-overflow-in-usbg_f_foo_attr_val-pro.patch \
+    git://github.com/libusbgx/libusbgx.git;branch=${SRCBRANCH};protocol=https;tag=libusbgx-v${PV} \
     file://gadget-start \
     file://gadget-stop \
     file://usbgx.initd \

