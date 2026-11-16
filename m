Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22457.1794808937769835871
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 22:02:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=jIRQ3HYG;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so3989373eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 22:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808937; x=1795413737; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HdeL6R5ui+WkuA8hHiHv33g5nEu9aa001opOhHjs6Qo=;
        b=jIRQ3HYGJByD1S8/sdDHrO5rgX+vzvf19TuzWuyqqe99lFHq4G1UUPQ9LOyS40H7vz
         u5bB3bDIXgev9smdpT9eMOLuJfG3TKOmjzdkyeZMfukbJatgOugctnilQUnJ3lLmc3rJ
         ZGKhw2HFlFqXBDVEbRSYCmY+iAqUu5CpbVu2qLNSeSqvQ+8pJN6Ql4Rl9gazBYWeXDk0
         QVAeBbaLVqp5Jbl/YR/zW8oJ61LjaT5S+/USJiai4nv2mu4WwWPy5Fn5gXfOO7HIAFAv
         LRgnJrdDJLVE0Axwm9xKP09/YLAnR1+i02F48hP3JRTXrwmtVY0ky4E9aQH15w6H4rQ7
         QMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808937; x=1795413737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HdeL6R5ui+WkuA8hHiHv33g5nEu9aa001opOhHjs6Qo=;
        b=nGpDt8WqwADPsLv3QcwxlLlOJygGbh8h3XChXlMczqapkmnnMTwmCW10nKT5kT0lE1
         FPVPUfcw0/X1gqsrU6c/FLDkawzZZFt+otUOa2KxtPhI8/zIEk9gSQpIv+oWm8KwamSm
         aLNZBvzCLDEwLfkRe56bZTM2RzCsjS5r122nPaYam7O4Gk0SUUkwV3XUvD8Z+zrWBeTh
         +H9fdYX002tlsp62x1Rpp1hj/pmxd2nH8fATKZs/1P8uwQfxyVexYUgO0xCxMQODPxrD
         GOGGVKY9909F2niKeBVLOcL3ogsG9p/xGPx32zD68Oyl7oTK7wm6YOUXgwst31WJLaHY
         t1lg==
X-Gm-Message-State: APuU4Z8Ag+KSckfMSASLzoxd7Xa8ve0H+9/O426AD67FfFveeybv68dc
	/GQ91qHrGrtY50iJ6pspGSHYpjmahG4U2KUbRYBT07K624ySMxXHPKVS6W+LKYva
X-Gm-Gg: AYBFou2SPQx92b20oKhp2kfE/orBYNYg2F0wQ6pYXrF17+XUtdwrNlTp1YacNCRVYxa
	padbIFogKx1frhidTwPwqezK2UGHxuGJS9r7HwPuSW5anrT2QAPC7ouEToCFLhykU8SMzFgemdT
	8QDPlGUYOlOXwOtjBfhIRgEhIAw6l+HjHz17jy6eH3kbEb0SDT/dKEHc0NP3DeFgwOdTm5Zc2rI
	FcnhVP9kcVchA4SpgLRvycvZqxV+v1+u8TkCJ656jqVnc5/EGGyw6La93GFKFIHxwKgkNEExw6J
	lZ5aD2sMgeE5p/w687M3S/nBSj57xUFu/N5fcR6PoThNK32iVZw0HoniKgoC8DeBtubsSduEdfP
	7hvRw2Vd4X3s26KjUvCDz2qniZ8e+IeN20WoG5WUakS/2YvhezddcLUWYFWY3Nu64okYHYN4jNs
	mNWgm0QqC2Asok+N78wAUlppqhrz/VCEEw5VopIbNE7uSeY8VHqW4L4UAi3nn/wn8LYMOKncYht
	OnuFZM2b9WSLG41Eyfn86PVSkufR+9CHbPvvoQrQ9ed9sn9cRfc1+FF2iy/gVJNePsFuRKuGBGA
	OdCJIwAaUxDJw3UjnGaskp66cTFpuNBM+fWsPju6QZaUiv5qFywcgTwSK6fQOJXHBV2TlDMQ6OB
	KISzpZ6Tf3YywX0ArSoO7jG0852a00kWxXF8gcz7qi3WtISfNA1NGXgHDb8DlzNfJ0JtlNiXvjN
	MfZTKDfewo4otFvZzHnS1wqA488ocXjioH3/AHk1T5rU/6N2EZ9PKgINN8E4Q+vaReH9xjY+Dt/
	wfs+9lZn2p6O8kwAlQCZbvUKdAFl/CpnKqpZuZXh3q7nj9oe+XN7ku0bh1RtpeUCyQvlvrnLXde
	PeRc
X-Received: by 2002:a05:693c:2585:b0:369:ef63:ea95 with SMTP id 5a478bee46e88-37966e3a7e4mr8536730eec.6.1794808937072;
        Sun, 15 Nov 2026 22:02:17 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm31410262eec.5.2026.11.15.22.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:02:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 05/30] libcompress-raw-bzip2-perl: upgrade 2.218 -> 2.225
Date: Sun, 15 Nov 2026 22:01:43 -0800
Message-ID: <20261116060209.2916444-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
References: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 06:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132403
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-bzip2-perl_2.218.bb => libcompress-raw-bzip2-perl_2.225.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libcompress/{libcompress-raw-bzip2-perl_2.218.bb => libcompress-raw-bzip2-perl_2.225.bb} (90%)

diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.218.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.225.bb
similarity index 90%
rename from meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.218.bb
rename to meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.225.bb
index ddf7568e90..dbcdf134e9 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.218.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.225.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=7b6eb3b7380815648e5
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/Compress-Raw-Bzip2-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "89153e6a2ebda52349493b074fa4b7549ff1f9053de7613c18a5e05c5b415fa8"
+SRC_URI[sha256sum] = "5547dd4101411630e33fa04e9f43dfda06f55d6f3c3420d6207efaac7bc43633"
 
 DEPENDS += "bzip2"
 
