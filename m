Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE8D7C9832F
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 19:55:40 +0000 (UTC)
Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43776.1790538935693386342
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 12:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OYmKOLrk;
 spf=pass (domain: gmail.com, ip: 74.125.229.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-344447f9c3dso433264eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 12:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790538935; x=1791143735; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RhLGd6/M0yVo6Ld5JWK6VZriayMft6PqvqQRRA1QK5I=;
        b=OYmKOLrkTxJtRB+q9BxpZ7Vbe1zewUGNCFNsQHC7eR+B+chWA0TylOnv67UN5JMrle
         c2utuGAwGM3CkrnA6Y5ZmzDrJPL/ezLFaYKovGwA6I9v963JBE7S/Zr4HpH+Dl9Zc92u
         YLKG6Am6vooLOFdjIb9Pw7MfMiHpvGgGk6Rdo6dgccKxTliyAjAeRdXBPMjJwQrvT08y
         jJLWOMhTeVwH5ME7hkZZVLlPcyX4+MQvnCztJxLuPhgS0caWSg30OdM01aAa01ILjYV9
         u8L9bwYQJDXxXEhuB3FgvZ8e/IUpaYafcdklVJ/+b/PzGv41ZUfR5iVRierz0FAmJOmS
         Fqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790538935; x=1791143735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RhLGd6/M0yVo6Ld5JWK6VZriayMft6PqvqQRRA1QK5I=;
        b=ArsyeUQvjao4SGgl5VTUduQKqY3/9pSObo91Vggyymdp1i1jkfc5sG0HQeVF96Cmi0
         EzRUxdrpEXxGviOHwsdu+izA6OVP2g9jSUBB2fChdOj6Ly0x3iBLiQphhgvKlSULwpyC
         QG+fAyqeUZm1M+o6VHKM5trY1VWprhjoP5UABaesHZuu0Jle67QYp3UcOWBYV2gconbC
         OOHHZlsbdWHvKFOgSCP6TYZUNdcCOtgvq6c4UGQH3LoPxKoJVA5VVhcewBS7EKHp3zuR
         XmfjvDU5090U/RCvutv3B9sh3t/7h/lYFvJZtAlnc7ew3LD4IuMaE0mKT5VDLoisbnop
         q+qQ==
X-Gm-Message-State: AFq9FYIxx5jR+Durcoa4J1OXm7VnC4lF6ozSH/G68+Ikq1h0d4SoFQGz
	S3rSpkU91WT90op1xshOswZnNolWP6iJT/lQQR5RC9AEktjbZf5Ft3pmmkC4OBaL
X-Gm-Gg: AYBFou0pZ0FapgMNyG5xc9ZwXldL08009a4AI3Hh7xn7xcXxr6+3HeWdBaiDCRfd9hI
	f3gg+z+IVcZZu3Pir9B53Esid8j9gbumJovcYveo5TGwmxaeTIDGYZQMjwtKGKCjCVS/kfYv7Kp
	53zHXk2Af9/09QIQkU1v6UTy8tA+3o/ztvG7AOZDrD86vh7tvzeaZhtCvA1WA3hBJxz78IWGKki
	mSleZWywem1j/OJOwxWO/3ox8sToiTTAwVFienV3U216VzRfL2gd3+PW89uFXh9voFsCbWSZwmY
	l0QvhPvT7wkVP5hjSXZnloB4sf0nct//DaAp4hzwl+QbWZfEzQaXJw0F/209DTKpVbuwBHJoJi2
	Zh8NAG85E+hGnC/VpmK70PPpdCPqmw7B16yc1ok+/1VOnmL+PxozMTIzmbvJSCnvrjH06y/yiMZ
	eVMJcvd9jtg2qhU1CKPjKXyIlW/ZSU1cDx6FTVIyn7LLkfeeEeZWPaH4KGtMOHgAfnvyoeMCNZ+
	Io6a+ARm164XTafjrL+YZD6YJNRJBlBpSa/Q+IBx7g7UU/iN0tf/8QbcV42CbpAyQdntn4JDfwu
	8b2EoiihC4g1QaFiEaiRgttUnd1qFswnAwsfNUum5Zrkie351e8YGMUSQhtLPZEjEXjGNDrcSAE
	yVmknVOib/VhjvAOv553iH828S6iPqoFCBnQd7SVQA6xcBfWKKCeBM6hvqNKaWlGQ8CAfVTmL3C
	jGLNq/3MnqsYxTVMY7JVwWV/1e7sODnvijX4deTQ==
X-Received: by 2002:a05:7301:1610:b0:328:3cce:4b3b with SMTP id 5a478bee46e88-3426fcc8279mr6435044eec.4.1790538934932;
        Sun, 27 Sep 2026 12:55:34 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-342c9c245a7sm14932928eec.11.2026.09.27.12.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 12:55:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 1/2] python3-pyzmq: skip test_close_all_fds ptest on musl
Date: Sun, 27 Sep 2026 12:55:30 -0700
Message-ID: <20260927195531.101194-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 19:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130378

test_close_all_fds closes the socket through the IOLoop's shadow socket
and then reads s.closed. pyzmq implements that by calling
zmq_getsockopt() on the handle, which libzmq's reaper thread may already
have freed. With glibc the memory stays mapped, libzmq's tag check fails
and ENOTSOCK comes back; musl's allocator can unmap it, so the ptest run
segfaults intermittently and loses every result after it:

  File ".../tests/test_future.py", line 319 in test_close_all_fds
  Segmentation fault (core dumped)

Closing a socket via a shadow and then querying .closed on the original
segfaults on musl every time in a standalone reproducer and survives on
glibc. Skip the test for musl.

Tested with meta-python-image-ptest-python3-pyzmq on qemux86-64 with
yoe-musl-systemd-wayland.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-pyzmq_27.2.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_27.2.0.bb b/meta-python/recipes-devtools/python/python3-pyzmq_27.2.0.bb
index 606e34e69f..bbce601f3f 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_27.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_27.2.0.bb
@@ -61,3 +61,9 @@ do_install_ptest() {
         cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
         install -m 0644 ${S}/pytest.ini ${D}${PTEST_PATH}/pytest.ini
 }
+
+do_install_ptest:append:libc-musl() {
+        sed -i -e "s/ and not test_process_teardown'/ and not test_process_teardown and not test_close_all_fds'/" \
+            ${D}${PTEST_PATH}/run-ptest
+        grep -q "not test_close_all_fds'" ${D}${PTEST_PATH}/run-ptest || bbfatal "failed to skip test_close_all_fds in run-ptest"
+}

