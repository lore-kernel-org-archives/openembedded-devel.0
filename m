Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17656.1794787856718731360
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 16:10:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=rwRzivpS;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15ea896ddc8so4199817c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 16:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794787856; x=1795392656; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sT98NYaucjfOedggY98iP3rHQdTO6aqs6q9Yy//wsio=;
        b=rwRzivpSOT6thHXZMGZ3FyLDNc/xVO022nw+52Xuv7MvLyT4wsYF1OWLRXdjxWHbf7
         zuP//JYR3hxH6Jyhpcfp65kBoxgDl5+yM+iQv+qlxqJUKRt8f2G9i93H5Dii6ApRhbtr
         sYIECqtIogr0wLIt0GEe5JWNFxO8yHS277YWd3dtySyz9jbdF6kY04+QD/3D32Q/pss9
         m3dZgQqAVY89Shh36zLSL9h/gzO8YZacWThB39+phxrw45wavedRU+fxkSPFwBFyV5p8
         85La7wA/xqECJ5t47K+jhBnIRC6Vi0JIid9khyQlAZFdLezQX+Teb1NGmD7guzJYebgz
         r49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794787856; x=1795392656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sT98NYaucjfOedggY98iP3rHQdTO6aqs6q9Yy//wsio=;
        b=jp7vfCLGm53Cx7qFX7J0jNv4sZ4m33LBBW44HwJhcBQwKj2whUXJAlnbl7SwHsVbA4
         /UdGvyp1BceMtfvHdcwJHi6zVD2OtyynvmK1TTd7xbahQcbO+qPRc5CX6jUXzfs79TR9
         V+tBAhqlqfaMsORO2LLHr5db8dtXY3nRyGkSYGy5ip5+IUouoUSQHLzQ5jhYkprOfsZt
         afn6ixbr4doZon2OtEI8CoA/+zUrmRl72U72WYYCot4m4Ug0gzTTomOId6Ukhi3dsLPE
         GE20iA8N/j5zDGrBNoicKtFLpeII5Qaj3L4+o2cXykNSxQn5MqR5KAWQEFHKNRxm5C38
         pCiA==
X-Gm-Message-State: APuU4Z/4dbzXDa3rbIkSqZeM0TjnApDLwBiqThw1Mk5prhpWrtS8dxTH
	ai7spR9eFc91e2MvalRy/KkRyq23tiLi+bEj4ye4OqRJMTfeDAAGNkhlBEr9eZVf
X-Gm-Gg: AYBFou0jDCf6BWytakPNQx0TUndlvDSI20SJYEuGjrp8BJEtIcW4o9Nij5Se6JgKjYz
	qUzlGWgMfLw3apy+IZZ00x//ase1JooMfan/M2tYbsfwJPjp6hT/4o9AIjP/4etInbfHysR6Bam
	YJRXVPeN609Ra3zufXEVpfKy1o8981VFMrCsmTtJaKzQ/bbOEVv1sBFxst7H3m0ggRmR6a738Wj
	N8GdXe59qzb9VzEJo3NOGMeEDQMd9eJRyMftN9RdZHISwkAdisHmNp1tUMZBd0R46/J279vQ+kf
	NMN9wcacZCYd/MXXeOciRNgN1mexJFmM/eYQPW5QvZnTNm5MMklinJoWrqVufDVb2QKtdQFxv2C
	yv6QxaBKYAYPMVs+5HxJDFNGHkbSe/6gZ013SK0Rjy84YMqKkYK3+ofW/fLn8eGfj+cr7YUXqm1
	KXMlf4h+fQt47unLbdBOFuotZtI6gAVPvhDNd9BJ4P8GMqFzhaYVxzaFCQyYSsVYWfQR+tmhhdM
	vTztmkcKdfeQpWWhv8EYx4Fg9PqZhy0/wNeRJ190OymRTOeuYE1fAgupM7QT0KYMR2GLIL7v8Ct
	9TFimgRyaDjPbM0cMmU7MWWOLK8rv4x5KLNA8uhnw3mMRgU9T25pypZ0GZjwFTkpLR4XOjNr0kd
	zhOcdYedFmFwrPB2/ZC2lhlX6wM2YFdZokGejcqEuPSmrJUH+0ZM50E157HFH/YyytOK/LQcQja
	9zn3Wem9DH2fak1qinFe2IddbvUuxTM81QpLRCDZ32oGyTNOvmp4HxPWxA80b0q0DVCwZppvewB
	k1qdxPGxByZ1nv5aVSkIYsVz/XECTWklMpso6GDMq2+pKm0Clgdc9snQyMVn93CC0nXFYKGBWT8
	9FwA
X-Received: by 2002:a05:7022:1583:b0:1b5:dc3:209b with SMTP id a92af1059eb24-1b50dc32734mr6858204c88.22.1794787856012;
        Sun, 15 Nov 2026 16:10:56 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm24163844c88.7.2026.11.15.16.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 16:10:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 14/16] android-tools: Drop ineffective class-nativesdk override
Date: Sun, 15 Nov 2026 16:10:36 -0800
Message-ID: <20261116001038.440763-14-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116001038.440763-1-khem.raj@oss.qualcomm.com>
References: <20261116001038.440763-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 00:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132395
Content-Type: text/plain; charset="utf-8"

The recipe only extends to native, so CC:append:class-nativesdk never
applies.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
index be23faf10c..045642a683 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
@@ -105,7 +105,6 @@ LDFLAGS:append = " -fPIC -L${STAGING_LIBDIR}/android"


 CC:append:class-native = " -I${STAGING_INCDIR}"
-CC:append:class-nativesdk = " -I${STAGING_INCDIR}"

 PREREQUISITE_core = ""
 PREREQUISITE_core:class-target = "liblog libbase libcutils libcrypto_utils libadb"
