Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 389CCD35E47
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:56 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.27724.1730831891912120724
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QYFUVSSz;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e3b7b3e9acso50506487b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831891; x=1731436691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgAXHWBw/gY+zCOd44we9nYgB8XaIJsHPIxp9eHmJLc=;
        b=QYFUVSSzUQQeXVZBrse7K9hdcSZt1PYSp9FSnRW5m3nVpnJ8trigferSBVYJp5RDsW
         AgBH3yjwjirw6ZTlVzs2QcmUt+mLxWkxKKb9pWiUnYeEisWKPj63lY5/xhjFwmfHv0R7
         YzlWDS1kNcpmtlqIujdCOZ1yDhJjWLBDGjyggSqjyJnf3qytX1o2qksCSsWjHBG4boZM
         z1y9scfGCJzDVjh9wiyjui4tRLb9q3584DUoRxcjrjrFyNPzO864iHZ4WYQEhpo54gLG
         U7KknPtSsBFXDvV1YWCwxb14DYh0PqlvMQPIMk2+O7VqTyC1SAVWOtp33216iBEnEt91
         jQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831891; x=1731436691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RgAXHWBw/gY+zCOd44we9nYgB8XaIJsHPIxp9eHmJLc=;
        b=MTgQD1c0X6nUWeG/kkNzKPnEttmjLng3KSgHjTUBW4AwN406egFAvDE0DZYA415ugO
         BLeajBv1jm72z6tMd8XRHyaww+nCfSi+D3TNa2u/b6eD2E8FQG9SWpvNSkoTloaTc41x
         Gx/O3uGbbNLEVbkHYyY5CNP9h9zh5R+37Bajb3c/f5HAq6dOtWgH971oJ8x9RUJsjz14
         v/GszVLSDFTfoaitsE0FcwVIj/ysE5HWk2VWWfMe0NE6rJ+sR1HdV4YiSO0PtMnM1iB6
         bl9w3b1jloXjR31sFKlnDZuon2Wbxin/tnPDM64k9ZUd286zrfwVgG+2WmNORU2gUCZ5
         /V5A==
X-Gm-Message-State: AOJu0Yza9VkOvtIrjm2kZiKGciDbLBxoVrd4IcOnzJzbNNGJ98tTdec2
	olOUaYHjArSFvvDtlv+8qiUgpZzCgZtoGqGul0TwfAO+7o+67DT2QYk8JucV
X-Google-Smtp-Source: AGHT+IG8PvtaObEQuj6vsofBs/SXfJhGiadGS2WzQxiT0Xov4wwS3kAQ4LvC5+dsf4fDMFtV4ljK+w==
X-Received: by 2002:a05:690c:6c8c:b0:6e3:3019:6aad with SMTP id 00721157ae682-6ea64b2f0f5mr167882437b3.20.1730831890572;
        Tue, 05 Nov 2024 10:38:10 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:10 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 017/161] obexftp: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:24:53 -0500
Message-ID: <20241105183658.34982-19-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113532

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb b/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb
index 018365907..a9a12f8e0 100644
--- a/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb
+++ b/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb
@@ -11,7 +11,6 @@ SRC_URI = "http://downloads.sourceforge.net/openobex/${BP}-Source.tar.gz \
            file://0001-apps-CMakeLists.txt-Explicitly-link-libbfb-and-libmu.patch \
            file://make_fuse_swig_optional.patch \
 "
-SRC_URI[md5sum] = "157a9d1b2ed220203f7084db906de73c"
 SRC_URI[sha256sum] = "d40fb48e0a0eea997b3e582774b29f793919a625d54b87182e31a3f3d1c989a3"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/openobex/files/obexftp/"
-- 
2.43.0


