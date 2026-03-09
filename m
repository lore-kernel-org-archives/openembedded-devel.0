Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 787C1EFCD65
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 09:15:03 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9877.1773047692836918539
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 02:14:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i5IledK7;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3597df496f6so4856835a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 02:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773047692; x=1773652492; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAPfeRi3sYfqAUGgva1ldU2ya5Bbgio8vlSp5tQwdfI=;
        b=i5IledK7r4Xr8omALuSomBZP62+I6afhfHoTB6akJ3J2hw7afiDNIf6rmeiFM+m8mp
         9nY8uR/HSAjLQyXTpcE77umvQEwAni5A0I+Mx44Zwk92mn/fmbTfpPwVoGBYmTV5meDh
         wWMIUliXBxPKoYbSes0ikEa75mbqItE0s0cwTeZm257oZCdeSZDiZQdSUYlZscLtcWQH
         159Bl0/3H5bWLv1CXpj6JAtQ/2qGwzE+KbPLMNjtfCs2otVOcdRw6iqWa22v03f4lgMR
         SydkB7NOE+7hUCRNB9ViNC6Yny/uB1jg4rkksIhi/rd6st6QTs0lcmzEDLEgDLPDrzwj
         dMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773047692; x=1773652492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vAPfeRi3sYfqAUGgva1ldU2ya5Bbgio8vlSp5tQwdfI=;
        b=LVaGLRzLuzflKQM7GvKT7Qaekmo30zRnlmhRU76L6KxURaDaaVmax4WIujvvp3fQlG
         s7mGjaqEnuoWrazaLvqfPYAXBsjTK/Dn5YcN8fhg3ePLi0lFnXrKo9kgEkiOU9A/4XAY
         7fndjdZWXz2RjorOYk0GbkwoG17k9wCm8zFAtUSbT/oRIvN2149OVmNbq0eCbtH54XEk
         Z8MO6+uiFTl+nO40VK6oM79F//VsxZsjrXssiUszWggBXAu9sGgcGDO3ta5nUvg1DE1A
         Pu9IF/f2QTCWGI10UvZDPeZMJQjWYXkJsNoQoaEzKTpqo22ju6rJiXdPR+lpuUVDQRuN
         aPVA==
X-Gm-Message-State: AOJu0YyL5PXZ2YsFOURAhx21kqhWl4bNHyyQMmo5QJiazdAL2oa8/2/h
	7elkPkCmNXHlZaxwiu0q43FJ+JC9ZG42aLIBqiye3zx90Gzf++SFLk7K9/JxCA==
X-Gm-Gg: ATEYQzzAy95FOIjOZsKbW2tObeWfco0qCFb2MkPLL8yhJCVaRxE5J1IBj0Lppx0jC3y
	Ecyhb2Zo7q3ZxUUJ4+5oVknLVkVjzZIYT0dkj6uUth+YBN256w7dE70iZmp+SnP/IaVe3N8LkXc
	RRBliG9XrpFUs3q1fjcy9oftdH32EUA3Qe3TlnpSS9FUpJXI48jGH6T/EaedqouWt+CWOealf9M
	Ea78uEkOzudii0c5ng6ZROhkmYxiWFSl74bEb9HVueB4N0nBd9FCBmQi66+oihpfcMfRtUSp87l
	H1XBlVjWMNOKzxOoh0VosBMXrDkPVgMkzQqlHcp9xFp+pwQoPXy6zuBgM7ZsgSNM9GTosofElrx
	g3XWthmtWGgDVl00KJmkqupQWImW+fYGQJXf1Qfn1H+F8DmxgacWBD8mUCEQlqVSgNDgJu+QWGP
	Gk3mbnx6FvcKaDaXbmWoF7WFV1Md4WhUvctKo=
X-Received: by 2002:a17:90b:3d8f:b0:354:a065:ec3e with SMTP id 98e67ed59e1d1-359be31b732mr9784165a91.26.1773047692020;
        Mon, 09 Mar 2026 02:14:52 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.26])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2d60767sm13822583a91.8.2026.03.09.02.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:14:50 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][whinlatter][PATCH 2/3] libmediaart-2.0: upgrade 1.9.6 -> 1.9.7
Date: Mon,  9 Mar 2026 22:14:14 +1300
Message-ID: <20260309091415.393661-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309091415.393661-1-ankur.tyagi85@gmail.com>
References: <20260309091415.393661-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 09:15:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124963

From: Gyorgy Sarvari <skandigraun@gmail.com>

This is a bugfix release, fixing some memory leaks and compiler warning
(and it also has a couple of commits related to the project's own CI system,
which doesn't affect the application)

Changelog: https://gitlab.gnome.org/GNOME/libmediaart/-/blob/master/NEWS

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3f6b25f18a00e46bc3b0a72fb8c2f39b28e191a3)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{libmediaart-2.0_1.9.6.bb => libmediaart-2.0_1.9.7.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-support/libmediaart/{libmediaart-2.0_1.9.6.bb => libmediaart-2.0_1.9.7.bb} (90%)

diff --git a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.7.bb
similarity index 90%
rename from meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb
rename to meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.7.bb
index c5d497c468..e52ee61b74 100644
--- a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb
+++ b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.7.bb
@@ -11,7 +11,7 @@ DEPENDS = "glib-2.0 gdk-pixbuf"
 inherit gnomebase gobject-introspection vala features_check
 
 SRC_URI = "${GNOME_MIRROR}/libmediaart/1.9/libmediaart-${PV}.tar.xz"
-SRC_URI[sha256sum] = "c3bc5025d7db380587f9c8eb800c611f6b5a16d6b4b78fcff93f62876a677f17"
+SRC_URI[sha256sum] = "2b43dd9f54f0d8d0b89e2addb83341ab06d7b98cb1b2e704383584af9c560f6b"
 
 S = "${UNPACKDIR}/libmediaart-${PV}"
 

