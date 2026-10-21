Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8744.1792580519857157768
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:02:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=c9Lde9z4;
 spf=pass (domain: konsulko.com, ip: 209.85.221.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso471894f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580518; x=1793185318; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d0uZZ2iYBHsZmJ65b9GsFN0PqVo7dv/+wwM0E/86NEg=;
        b=c9Lde9z4ZP/vyn0P85ot3XmO+aAm8uM3zU1fmTWlh66uyXOKCuslNSk4l9zRCz0O2s
         0ZNsWl0uZ71Z13kridWtlHrb+P8uk2ln0tEwWt5+sFR7fou8FcX/mxc1eK+1zevTBzji
         1ZaUxdueYvhXwe35vSBfPSKSQ6XNA5qB8Eg7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580518; x=1793185318;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0uZZ2iYBHsZmJ65b9GsFN0PqVo7dv/+wwM0E/86NEg=;
        b=IussuK/uvhJp5Z3Me3bhoWG8T9i7ONga2m0Z8bj/IwYKPFxmuc+md3KR99Ig4/Mmqp
         f3FY+hhzUicl0a/Z2Cnnfe5n7NhxNxjCqZtiq6/AXhk0ZZSmvFYeDT8i1g2+XIqvM+It
         QcsNSqM0qMKYTfROGBhN2JEN9csmHGSEVy/6C6NMo+AHpNiTaKCDf/xW6bgdbxwpCaKR
         Zhfz6brv1YHGBrLglbAuwswai77EIvWtoltYWUZU7L1pmhflt1mvLGVoojbyzwHt4CNo
         4rgUknKFGyLuaRKtzADroK0lBpiDrWNwo7a80BsMRL2zeb+jcosPOWBkDvTUBxCmFZry
         3/9A==
X-Gm-Message-State: AFq9FYLvLYVagoGGs+rPd3aESbVl7xCsXR7Ih92C9Tss8V22xXqZLWvj
	wQ4iWy3SFMnOmI03jbGpr5lH9A3P4i1n+qNZRooVbSwaQcnbQ9pzhUjXpvKg1Xntp0PWYVIweQe
	tmcqx
X-Gm-Gg: AYBFou35K9qTCJR4aQea+wOKDOJDY4c4i/kOhnCaedOUDT/Jdp71GCZjZZznCyEf7gi
	K1U1zcHLyHWk86hDsu1iQ3wTljCQPnpu0mSOJVTGc8z++w/yrZhwtBUryv7zDWFXQtj/+JtjwjV
	8SIq4PkXR2TnbWgPeWfr4ZLv4IlckceQQ6bDuHZO06/7hBTR+USrjq/VIBGNHaPRqRNwLxB/X2F
	G4CLvpKWLIF7Lwy2tRleVv9nT5qOoBSH/49rZgDyXM0GLJKFj4LaXX7iuNfdtlgJ1gYuVlffRFe
	CYCsKXTjw0wjCVT7HNVE80iAME2QPjGneMIdhIOTEsJcuh3ipnJddVRSbZ/edD1TDwx3U7f1yry
	CN9u8uQB0iYPZROnAMhOBFDCLGVrz3ZNU1Z2loIs1lrPHpkkY40Z5kirdZ9MrRzOj9/mvo1H4fZ
	IwQOYHRVll7bx1nJ1DVkyfEJbc7ioM4ojeT+Yi0zmeRuhNteQJswcT4VBE0By5+Vp9e5fAOo6Dg
	ze6txMHwCasWK3Bef736WdSH5f8mD/rmfCOv+c4kPncxdE9QsFUedROwUMrlvur7aRTwoLPuHlK
	Icg5JIL5RJa9s4JLbzip4TdkSvHohKNrh3niiCP6nbv8NzkJgAn+aqemxWkWBm/Ik9U/Ceg+4+q
	b5Rmm
X-Received: by 2002:a05:6000:240f:b0:48d:fd1f:9a9b with SMTP id ffacd0b85a97d-48e264c08d9mr3606486f8f.34.1792580518015;
        Wed, 21 Oct 2026 04:01:58 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:01:57 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 30/36] python3-nodeenv: Upgrade 1.10.0 -> 1.11.0
Date: Wed, 21 Oct 2026 14:00:54 +0300
Message-ID: <20261021110103.1943456-30-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:02:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131289
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.11.0:

New Features:

- feat(certifi): optionally use certifi certificates
- feat(nodeenv): accept npm-style semver ranges in --node
- feat(nodeenv): add --prefer-system to use system node when
  available
- feat(nodeenv): add --isolate-npm to keep npm config inside the
  environment
- feat(nodeenv): install local packages from a requirements file
- feat(nodeenv): write the posix activate on Windows for git-bash

Fixed bugs:

- fix: repair Windows CI (ZipFile.extractall filter, test_smoke
  layout)
- fix(nodeenv): replace leftover debug print with logger.debug
- fix(nodeenv): stop -p from reinstalling node that is already
  there
- fix(nodeenv): let -p target a virtualenv nodeenv isn't installed
  in
- fix(nodeenv): report the url and proxy instead of a traceback
- fix(nodeenv): keep the python virtualenv's scripts under -p on
  Windows
- fix(nodeenv): report a missing node archive instead of a
  traceback
- fix(nodeenv): detect musl regardless of the host triplet vendor
- fix(nodeenv): read npm's parseable listing in freeze
- fix: allow zsh to source bin/activate
- fix(nodeenv): link nodejs.exe without mklink

Improvements:

- FEAT: Check if activate is called as script.
- address deprecation warning in tarfile.TarFile.extract all in
  Python …
- chore(ci): run the activation scripts in sh, dash, bash, zsh and
  fish
- chore(ci): give the integration smoke tests a home and stop
  running them 20 times
- feat(nodeenv): clean "src" directory by default

Documentation:

- docs(readme): document file:// mirrors as a local download source
- docs(changes): backfill the changelog from 1.3.2 to 1.10.0

Other Changes:

- chore(release): bump nodeenv version to 1.11.0

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-nodeenv_1.10.0.bb => python3-nodeenv_1.11.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nodeenv_1.10.0.bb => python3-nodeenv_1.11.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-nodeenv_1.10.0.bb b/meta-python/recipes-devtools/python/python3-nodeenv_1.11.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-nodeenv_1.10.0.bb
rename to meta-python/recipes-devtools/python/python3-nodeenv_1.11.0.bb
index 37b7c9c8d9..02963937db 100644
--- a/meta-python/recipes-devtools/python/python3-nodeenv_1.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nodeenv_1.11.0.bb
@@ -4,6 +4,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a9e238ffae5bb6447dbac6291e1dc3a3"
 
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "996c191ad80897d076bdfba80a41994c2b47c68e224c542b48feba42ba00f8bb"
+SRC_URI[sha256sum] = "3ce8fe5b71d16e8af7039ca65257354100bc772965d6bc549070649e53b1b146"
 
 DEPENDS += "python3-setuptools-scm-native"
-- 
2.47.3

