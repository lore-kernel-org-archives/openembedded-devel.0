Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D22E65D26
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 04:12:13 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.16895.1732248721903631943
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 20:12:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mg85wWNN;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6ee994218d9so15982577b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 20:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732248721; x=1732853521; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZV2+Sbf7WBE8Evqw+aGpZ+XhaL3IjH6uCh3qaAOGRo=;
        b=mg85wWNNA+HRKmPk+C5MXP3aLCGSJe3nq3a2W2/yaSXHt77m5OvBTGNzxTC+NsoRO9
         eRcU3J4rBRS2z59/d6AnRtJyvBdQH18AyDTyLaYGXfcak2mO77RHQf4N9Wpzim9ZOnP2
         7PHtOEhGF8gaIuBW5+E8zFN+dgrRKPZ25LN1NaLSkEit5B8bDytxvSj7Qm/L+TnVNTlH
         Pv+CusmObV3hiQU+iN15gNGnoBg75YTxblFg1Efe9RULEGUyuK89BkkYDGFVRbjE9lQ2
         dtuVLC5thb3P1waN9BjY6FsYmczRkkCvT4yk0mT9gTpkjAYggnJ+xOctIgslMR+uy90E
         oy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732248721; x=1732853521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZV2+Sbf7WBE8Evqw+aGpZ+XhaL3IjH6uCh3qaAOGRo=;
        b=wKvCsSW1z0eynnBDAMPoyGkVjCek/veHxnwW4D1sX6SI+6Bv2inz3T3LukjbWzjYE6
         kDkSgs+Z01ShZXGhFvR0uOXvxRexsSnxaozFCX/jHw3KxIoVwa8V1tsED1Ll2ojPeJ9a
         ODyJKUJvLMB6nVo6E/PygC031qPMSkUyKeT/ituKfF9TeDA3PFvMoC3HaAo/h7ALsULS
         /vN5gjr932MWvN55dqfLGL2S2MoSG3/0HjwtsuIy/wXH5WROuP21XB1AArykvDiWyWCL
         Z8/25QYPaY93gPVFeKjNKA8zrUkB8BvaUlxIUbrgvYLqpEt1JwHRUbCW9N5WyOO0gYE/
         MN1g==
X-Gm-Message-State: AOJu0Yw2c/dvZpSKBBj9KOHWLigCmejd0evrj31KVmKTFHHRlGz2xdPS
	IwvcC18KRjp1YigiRO8GilEafQp8JR9osz29TuZwU2KEHZ/OLEBOFcTNyWrp
X-Gm-Gg: ASbGncvsGDMTLEn5yo/OMOtsP4k9xC69/rc4MgvysEDHz1C2oSi5bTAOIEvfBmShp6g
	15YcqYVjni5q40kMKRrjQL/7Ket+6OjEqm6I85Fj5YQis2GNR40Akcl3+HJszIhIGtMwmojRby+
	Bl36N6i9K7xpcWYvX9LQXlUc2TsxXjY4EX8Eq+zWyBEhdAO9M1rv/t/jQP2b+B6OM9zOfFq3Uzr
	Rbo9FlAx5MYkN24+IvJImI3vr4qy5YCaAki9r3lcKlsQhnVFWDk21/f
X-Google-Smtp-Source: AGHT+IH2cvydOWZVe3tRjDbaRgqtFYhWzJHTXr5BEmA3vrlRqXa0VETIzY0F3+wGIc3f8MKQaUkJ9A==
X-Received: by 2002:a05:690c:9a8b:b0:6e5:9cb7:853c with SMTP id 00721157ae682-6eee0a50e1cmr23273127b3.31.1732248720276;
        Thu, 21 Nov 2024 20:12:00 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eedfe42061sm2828877b3.54.2024.11.21.20.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 20:12:00 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 6/7] libmozilla-ca-perl: Upgrade 20240313 -> 20240730
Date: Thu, 21 Nov 2024 23:10:43 -0500
Message-ID: <20241122041044.1111236-6-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241122041044.1111236-1-schonm@gmail.com>
References: <20241122041044.1111236-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 04:12:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113986

Changelog: https://metacpan.org/release/LWP/Mozilla-CA-20240730

    Update from Mozilla repository to 2024-07-30
    Added certificates:
        FIRMAPROFESIONAL CA ROOT-A WEB sha256: bef256daf26e9c69bdec1602359798f3caf71821a03e018257c53c65617f3d4a
    Removed certificates:
        GLOBALTRUST 2020 sha256: 9a296a5182d1d451a2e37f439b74daafa267523329f90f9a0d2007c334e23c9a

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...zilla-ca-perl_20240313.bb => libmozilla-ca-perl_20240730.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libmozilla/{libmozilla-ca-perl_20240313.bb => libmozilla-ca-perl_20240730.bb} (88%)

diff --git a/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20240313.bb b/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20240730.bb
similarity index 88%
rename from meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20240313.bb
rename to meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20240730.bb
index ca5fe3d34..d94b4eeaf 100644
--- a/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20240313.bb
+++ b/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20240730.bb
@@ -10,7 +10,7 @@ LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://README;beginline=32;endline=39;md5=51e666dce556490a1132e937ad3f8729"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LW/LWP/Mozilla-CA-${PV}.tar.gz"
-SRC_URI[sha256sum] = "624873939e309833894f881464a95dfe74ab77cab5d557308c010487161698e7"
+SRC_URI[sha256sum] = "55bbee1875a905616e0c39457245f94f8173227fbe906f643673f5adadedf863"
 
 S = "${WORKDIR}/Mozilla-CA-${PV}"
 
-- 
2.43.0


