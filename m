Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 93DFE6E672
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Apr 2018 21:15:02 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id f15so2340428pfn.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Apr 2018 14:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Eq7BUvT5nSFdMVki2V0+xf9uTzKst25AllYDaalZ92Y=;
	b=KXMT/SL3BzxPqrSlGMSO4wqPqRMtz2au41ujN8BX3+QlUgFYDTxxLiX/Mm/7591ocf
	8Cs6cW2q62TAVEnon39381RxKenma9EF8rMEjDtl+LF7UJLnCMq8L3GfRQGAR66mfUHl
	YI5deGXXYWyZE4Ujw7NEnyjd/i4em7rdR76m8HfyrODE4XlhrDCrKEFPaMgm6F2KYMfh
	7FoSm5njeDvpdhcP3WPiWdYawsrV5eDgwlmmcCUGGuQakL6O+6EVpMkPtoFHeFYU1ARe
	nn1AkOTkHB9B9B620fduHYnF/vl+qrmEYMNwvMFPeoFVyD8VZWUyLS6yM/v7LQVMZqnC
	ZWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Eq7BUvT5nSFdMVki2V0+xf9uTzKst25AllYDaalZ92Y=;
	b=gehTrkQ9ScfyyXrS0wKV8+RZZ1oJLwY2pITaK03wYCytwhDSV5z3n7cekmNqQuH3dz
	Be5wUqf6k50FdUTNn6UYAhT1469Ya6OSqETwaACgltE54pVDTdrI4sH7rPudJx9s9p8Q
	ThpChDA5ATn/MW54lX78ERYBY7VOXnBpSmSF0qLKs3VHztZ6/93ByEr2+gUVe12yxz2p
	DT0/xP/YX6vr00f9KorFAMsfUcudsr3eDopRSHU53xaSAcl9UV+BKPlh3p0mjH2qjXOc
	QNdeIl41+3yEqtK+cen89WB4NGnNkLvBBxYEksDOaNgV/kjUoLBwSjpwzOh0rk9kn2t0
	dXvQ==
X-Gm-Message-State: ALQs6tAhcNMnG8FpZqlSEzmbwEyQX8N9tOhKSf930Kb5zU0FYHVbJvR9
	jUxXQndmNF/KW6Ry8n9YWm6YgQ==
X-Google-Smtp-Source: AB8JxZrApctXj11m6FXY3KawEGwet9ZatcBufGdD6I2No8kwrFJRhUV0qHONQZROYvD/kOehdREfpw==
X-Received: by 2002:a17:902:60cd:: with SMTP id
	k13-v6mr3750134pln.44.1524863703179; 
	Fri, 27 Apr 2018 14:15:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::ddd5])
	by smtp.gmail.com with ESMTPSA id
	o123-v6sm3750304pga.76.2018.04.27.14.15.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Apr 2018 14:15:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Apr 2018 14:14:53 -0700
Message-Id: <20180427211454.35441-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [meta-networking][PATCH 1/2] lftp: Fix useless-rpaths QA issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Apr 2018 21:15:02 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/lftp/lftp_4.8.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.8.3.bb b/meta-networking/recipes-connectivity/lftp/lftp_4.8.3.bb
index 08d89b8c5..c6e37277e 100644
--- a/meta-networking/recipes-connectivity/lftp/lftp_4.8.3.bb
+++ b/meta-networking/recipes-connectivity/lftp/lftp_4.8.3.bb
@@ -16,7 +16,7 @@ inherit autotools gettext pkgconfig
 
 acpaths = "-I ./m4"
 
-EXTRA_OECONF += "--with-modules"
+EXTRA_OECONF += "--with-modules --disable-rpath"
 
 PACKAGECONFIG ??= "openssl zlib gnutls readline expat"
 PACKAGECONFIG[openssl] = "--with-openssl, --without-openssl, openssl"
-- 
2.17.0


