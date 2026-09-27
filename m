Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 686A8C98338
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 15:51:46 +0000 (UTC)
Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39665.1790524296913018732
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 08:51:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XXCvF2/k;
 spf=pass (domain: gmail.com, ip: 74.125.229.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-3468ec3097dso436022eec.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 08:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790524296; x=1791129096; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+rZf8WdghqgNhKFMV9VkEmNQcnNL7lxdZL3goe9xH9s=;
        b=XXCvF2/kpeA1ArdfH4ehEsjyXt9/L5uQLS+5cFnygdK02pBNuP7qya9YkbuRDcyc4v
         Gy+YPs6BFVBFXoYWciwF48ws1U8F4vSDMpuKZNt5RFcJEtie5Ft4ytOqOJUe2QUmC/kP
         L5v1IVMSkOepu4EXsMB9eZWlPB165xPgzXZsFQaLcKJ89x8s5VC6RmHAQ9jsSdviIhH9
         hCEykkyIIHRHYifFq3VehCcXzHXHlZ9V/z+tqqxj0weR5tx3Ot5mRmEk1sJzQ2Qcp19E
         G0tT2f3Thr+RSaealueUMoxRzs/gOqsGHvshl9rU8no/eWTgE2w6poHTY4q6MvCvAYBw
         Pxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790524296; x=1791129096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+rZf8WdghqgNhKFMV9VkEmNQcnNL7lxdZL3goe9xH9s=;
        b=H9EhHriICVEUnqmPpMxACHrde+d7Q0LpJQ2r2kEYnt15A5M0KN50uAhNOeN/xHKBNy
         I2rORmIHZAsHqfzQKD/1iD6NoVHLx7GZ8QetOKCfZdEbFpBKsK6Vug+CCm71OSDTL5ZT
         5OVQbX0QjB+83mYxaAlECZEqKkqyuQTOK1a0CDsJCbxnDWZF9HzoPQoee/2GF8QubrLN
         TCRDEtudcZG56ZKNsX8wd3c7QXld/QuKWKbrFBUjQ8BwIvUpWxNsKSKmViLAK2RHKEp3
         VF44yJMC1xusCsupu/09hhjTsigykR77+0JwOrbTdZwHHGzdv65Ys3Hz2rO2QaPYQJSq
         JJcA==
X-Gm-Message-State: AFuF++niMjuOBjAR1r7GCMYNY7VSKCHQSB7lQxquYxN50x3v7LzhLSzv
	XF9mfpcKqh4WAyLt6Iy2WdxnDMQ18pIJsHe2FBpmiNlx1z29smmS4VjcHoYUELZ6
X-Gm-Gg: AYBFou3DBkieH0JqK+KnChPkZfcF82kurDYobyPIKE4wpt5aRq1MlxW28L0W+lmcoWO
	Q3WtKRMo3GxjR/k9SQjSq8JJX2MNg0yYjmjBQ6kvcKpDq9DaPdc5PnmH0gdd8xkqp+80PBIccUS
	IwyeOEIDpjBFlXfxDMxGOqYhQZgMO0ABv8zef8X3S+rf1w+RaMc/CIpgM/5zy2r7Fr+h74LDC2T
	xhZJxpe6pGBv+OJFbrwH3GnMjM5TJX+ab9MQfV03w5JkGa1BzYUu4r6uyNwpt34RYMG+gbEYZPu
	vswUt8yqWnhfYGODrCgk+cIUKJ+XtOtMmZ88BuG6fAw2PA5ZGibIHpa0kcOktFTsH727Tp3Tgxo
	q4OUIoQLfmwBCIolI/owiMjkejZNU6YbltHjiD5Z8LuikOwNZGlDECKBU0CvkZulan7Y5Sd5H4G
	m7/rEJRuLppqPVjCP/JxFLHGLlkvqgn7+5IfxQPWN0DAKCVsUoscUoSFNK83r5SlCCd3rhWZAJr
	/eTBVI+fqaAyLPiPZv6OZKPWAkJUjwzJuDljLnHhbKHrV6E3I0hG6RfHrGogKvIc/eaXhNhBG8Y
	MBDOPWMHu/+iOl6iGLjPDiKK+YHVMyXj82qOOnZzPrKoVOiF50bYOMNK1F5hJDNPM50NEqkm5Up
	5Kn7SeweZfAxXvRLj2ydFc9O5EFgaHDrkajqWf5/XXuxOSYzW9COY7pRRQx4G3bNA7lsyX1aJ/P
	QYJd2qtx1C7aszgoG+Aq0NWOtQLCPxAHBTbF8YXA==
X-Received: by 2002:a05:7022:1406:b0:143:298f:33ba with SMTP id a92af1059eb24-146d0f34187mr6941165c88.46.1790524296235;
        Sun, 27 Sep 2026 08:51:36 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c3f8sm18790849c88.3.2026.09.27.08.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:51:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Areny <patrick.areny@notiloplus.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/3] v4l2rtspserver: new recipe
Date: Sun, 27 Sep 2026 08:51:31 -0700
Message-ID: <20260927155132.1277867-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927155132.1277867-1-khem.raj@oss.qualcomm.com>
References: <20260927155132.1277867-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 15:51:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130373

From: Patrick Areny <patrick.areny@notiloplus.com>

    v4l2rtspserver is an streamer feed from :
      - Video4Linux devices that support H264, HEVC, JPEG, VP8 or VP9 capture.
      - ALSA devices that support PCM S16_BE, S16_LE, S32_BE or S32_LE

Signed-off-by: Patrick Areny <patrick.areny@notiloplus.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../v4l2apps/v4l2rtspserver_0.3.8.bb                 | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l2rtspserver_0.3.8.bb

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l2rtspserver_0.3.8.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l2rtspserver_0.3.8.bb
new file mode 100644
index 0000000000..1a15a0cd0b
--- /dev/null
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l2rtspserver_0.3.8.bb
@@ -0,0 +1,12 @@
+SUMMARY = "V4L2rtsp streaming server"
+LICENSE = "Unlicense"
+LIC_FILES_CHKSUM = "file://UNLICENSE;md5=911690f51af322440237a253d695d19f"
+
+SRC_URI = "gitsm://github.com/mpromonet/v4l2rtspserver.git;branch=master;protocol=https"
+SRCREV = "b12cf350dc573ab0ff9d1b51a21daf3c218b614e"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig cmake
+
+DEPENDS += "live555 log4cpp"

