Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A44C3271F
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 17:49:07 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.57463.1720028939058006014
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jul 2024 10:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=J4t5Q+ZI;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.215.179, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-726d9b3bcf8so4350970a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 10:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1720028938; x=1720633738; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jtQ36bzZXUHduqMVgZMoUe/YeGSOuMuHpXVQZNqlR4c=;
        b=J4t5Q+ZIilCFp2BgFsYrMVhVExsVoLhxWkTVcNXUgKEmKNOsDH4S0p0oCC3y/2w80A
         4utVMF/j/dEGm/71ljVTmrZjJ8PVnsgJaD+nUqCgkiPfHVZFypEMkXxytrcDHA8FE2kT
         fHBcjW2x7Tn/WkS1mA+6A2mo3Ujn/iVUot/MmMe00nnUxKYBShl+4CH+pagktYjuHjJx
         PMGGY9K3zkEhNO3OPGAXMj3FXbvPERsaeg9foF3mxJ5GxsHUwxi/tfCtmRiJiFhC2P4H
         DsOfkv+h4eMZhDGKASFfJxzsNPtZKjK0KLn4dxm3z3Mwp5vtWG6x35WR5q0nMjmvopnU
         NLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720028938; x=1720633738;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jtQ36bzZXUHduqMVgZMoUe/YeGSOuMuHpXVQZNqlR4c=;
        b=JJ4J3dRXbznOprfMrJbygSHJS260QlaUOJAySACEVU1mmZ6X4OlaxA/n0VyLzGlDWS
         uUol2nlxe3Yac34siI7mOytAh+8VLwmW5PoPbYvNOq+7Nv18W1uUU+RtI9ql41nWf0qz
         Ytyh1mOyHAh78J+PqHor+eduCI9vnjbOrXGiIQYau+dDxikxKaAYsOC67Ok7k6HW2wIP
         DtNhUhNeuRHMlo2E2sNHqBKcA1k1pMBehyKqZPaKTgyjE8fejHqaklk8weOwd280yNMn
         wT3YJXd2EF+aManzYu9bsaQd2LRCFMNjkJLTaNxszN/9fhXr4uauk6bWld28vAcuXkXv
         urog==
X-Gm-Message-State: AOJu0YxNx4t07cnkkKoqX91BcvcXU7URehaRr/EoBEYquClpzIs6XSzE
	RnmUcx1xc/VT/I5UGBSxm8zcv6TFQm+WTYutboJ13bq8KJOp6EwavPqs7gsfSlc3r0u8WIL3Tdi
	p
X-Google-Smtp-Source: AGHT+IH1qzuIp5WpF1nTdwDRBLcoaLYTCjjNjS+amZ9SR6c0nX/bg5OKCwkN8bCP6/plG4bFgHuHJw==
X-Received: by 2002:a05:6a20:a106:b0:1bd:2559:305e with SMTP id adf61e73a8af0-1bef610cecemr13122412637.30.1720028938200;
        Wed, 03 Jul 2024 10:48:58 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6c8ebf1asm8441044a12.74.2024.07.03.10.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 10:48:57 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [master][PATCH 1/1] xterm: CVE status update CVE-1999-0965
Date: Wed,  3 Jul 2024 10:48:52 -0700
Message-ID: <20240703174852.74580-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240703174852.74580-1-ninette@thehoodiefirm.com>
References: <20240703174852.74580-1-ninette@thehoodiefirm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 17:49:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111238

Current version (392) not affected. This was fixed in version X11R5-fix-26 (R11R6 from 1994)

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 meta-oe/recipes-graphics/xorg-app/xterm_392.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_392.bb b/meta-oe/recipes-graphics/xorg-app/xterm_392.bb
index 677f5c999..67bf8fe11 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_392.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_392.bb
@@ -47,3 +47,5 @@ ALTERNATIVE:${PN} = "resize x-terminal-emulator"
 ALTERNATIVE_TARGET[x-terminal-emulator] = "${bindir}/xterm"
 # rxvt-unicode defaults to priority 10. Let's be one point lower to let it override xterm.
 ALTERNATIVE_PRIORITY[x-terminal-emulator] = "9"
+
+CVE_STATUS[CVE-1999-0965] = "cpe-incorrect: Current version (392) not affected. This was fixed in version X11R5-fix-26 (R11R6 from 1994)"
-- 
2.44.0


