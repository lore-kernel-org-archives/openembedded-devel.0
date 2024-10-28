Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C460ED5B86B
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:26 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.1071.1730142305980903268
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 12:05:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cpH0ALbm;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e35fb3792eso43509177b3.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 12:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730142305; x=1730747105; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Eexyd6XTYT5HlxijugplJWxCpWTitFMhtTaGtCJrDQ=;
        b=cpH0ALbmQte27Rq/FO2opC1dJCAe8Pa2XcmpSJFkpFW3aPDRqTlnUwXHz+rLldBtL9
         hBEEHn2Y/Ba7pvy8p5gDGQxIHD3d48/OTSwuBkmV8948CxB+B+QALuNCRsl/ODN3DDbR
         0BAs9lnIJtr6rujX9tiJpS6OmmK+rgGeqNfPO10cy3zOiVPK65w43LSQHZNoc9DkF/Dd
         YcxPYDsMmt2heYENNW8yi7PZ18SdNwzf4xZ4+bniqU0KOA78xpoLQABFvIxZgsK6NC9N
         FwS9qG5NcZ2OzD5hBwBxmWMlHUpnc9QMEiggxNYvw9fFB7QAdF9H6YtYntxo+y/hyyFO
         DyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142305; x=1730747105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Eexyd6XTYT5HlxijugplJWxCpWTitFMhtTaGtCJrDQ=;
        b=nIHrABDC1jULNTTdz7OuYGaa90NsUUGUpLbEkOrzc8jZEOeGvojIVjF7WfJag31+le
         kai5ngkCrTDhtn08LP632ObUlP2J9BqbZ5JSHQ+CRaMKR9EJLf1cPTFw3TGjUvQojkw1
         LOBo1m4OoVVrsNyLQIIeYywH7D5RZzrf9BxPlOzXWtHU4xyLXGSZgkFpnEnbDcJn+7J9
         55Pa/+CWa2YnIsfcRKP8THnlIj1fMmUT2vmsRTIb9t2hknji1+wOmfZ5XYeDFBEORQKG
         yaeh6SsJacH0e/ajXFqIcOmLfHM8KF3iWzMhJwWhTWztsTSmwk1ViTEabVPeNrCt6OId
         Z9cQ==
X-Gm-Message-State: AOJu0YzJ8O74Dv4sUev9BAAEmL9rnPi6AgcklbzdBkfCVseeqaEqYVcz
	Pg/Tf1gtkXI9/1fN2AuTM+E+eO78UXL+CzUnm1V55rj11/CZw9rOpauAoQ==
X-Google-Smtp-Source: AGHT+IGBQTbdSVGEJ5/yqgJJel5jfcNB2Tsv+h8SzeB1iznNo9llvJcT04m8NlwaqsFiiWkw3dx+gg==
X-Received: by 2002:a05:690c:48c1:b0:6dd:beee:9218 with SMTP id 00721157ae682-6e9d8b1754amr91220797b3.30.1730142304652;
        Mon, 28 Oct 2024 12:05:04 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c187e4sm15557237b3.62.2024.10.28.12.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 12:05:04 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH v2 17/22] libnet-telnet-perl: Use ${CPAN_MIRROR}
Date: Mon, 28 Oct 2024 15:01:53 -0400
Message-ID: <20241028190444.10522-18-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028190444.10522-1-schonm@gmail.com>
References: <20241028190444.10522-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113307

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb b/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
index d5b1c504a..2e79a3b1c 100644
--- a/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
@@ -14,7 +14,7 @@ SECTION = "Development/Libraries"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=4;endline=7;md5=e94ab3b72335e3cdadd6c1ff736dd714"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/J/JR/JROGERS/Net-Telnet-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/J/JR/JROGERS/Net-Telnet-${PV}.tar.gz"
 SRC_URI[sha256sum] = "677f68ba2cd2a824fae323fa82e183bf7e3d03c3c499c91d923bd6283796a743"
 
 S = "${WORKDIR}/Net-Telnet-${PV}"
-- 
2.43.0


