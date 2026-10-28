Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3618.1793212371424606720
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2026 11:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nkent-net.20260707.gappssmtp.com header.s=20260707 header.b=N6Z8Lnq1;
 spf=none, err=SPF record not found (domain: nkent.net, ip: 209.85.218.45, mailfrom: nate@nkent.net)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4326803b54so95125566b.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 11:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nkent-net.20260707.gappssmtp.com; s=20260707; t=1793212369; x=1793817169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3rySgoE1OLT3UCb8cbUvjPwzKRMpTDOPSJe5DCl4+Dw=;
        b=N6Z8Lnq1JhEaYPdoBmBUWW1O52qvd1VTbw9G2vm0qJOL9NqI3plddye44eAKMIC4pE
         5IcmxoWfPfzk58of1Cvv1iHB7onZlpD1wOWyXJMkO+UouSroNKMdCP/PHZxQd7i6qBcu
         pPEJkvOVjxromnJklraanDpH1gcUSkpxR2kJXR8dFrMlg5BPFFzvQC7SUU9iptiS7EC5
         K5BcP3HZACa9JtG2ucbA9obigkFGdwxoXg11/1QUhGcuYBnkPQHJq9P2ksu1fjBMx+36
         zGpz3kDbKcDg0EK5346HeuDcejCO47yS4ZQ5IwFTxavFTBkJTMOMOVNJqtUywiNHnwcC
         vCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793212369; x=1793817169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3rySgoE1OLT3UCb8cbUvjPwzKRMpTDOPSJe5DCl4+Dw=;
        b=YsgOSon0KIrQ8ENhO+BXPiWHHh4YcOEiyH1hxzJGVaPlM6RYcFZUSqAjmG2HyXGBlN
         J85igggdw8ri4kQUMyi36c7ZIcrF+y7RrVOWPr9kf22EH76jgBC3TnI5bUrSQU9DSN4U
         jspmuwliC/InaxLfTaCYchM12KVAIGAcTMoy4GVb/IxXg5WKWdqCqtzmHPOqNAIhmdwD
         alj3aOHVuMfhyiyU+cEu8YG3LOr0hAUGB5C5o+Yx+BHepy6o0Q7zPOGhHZLadL2qDEqd
         oHWah2tu6CDcS3fZ/3WR9RD9fChzUbaFoceXqJ9hsoa5arRpbXpfkI4veyPK2K1tEw3n
         mf9A==
X-Gm-Message-State: AFq9FYJfFdPh3I/V9DUQyghP7wJHJdibCSUpyuHw26aF0SEwA/LJvEl5
	pQ/l8GBAMgmd77VdV6rZH9YmnDuVcU36PZtojKlCNCPxzX7ElVmLYSXJDStErsGBektLK34s/L6
	/Kpfri/D7iS3H
X-Gm-Gg: AYBFou24E/FM8Rek3cg3+s/oIH7kyn1wTPLPArqx89iy70ikNTLg28fV30hCWyDFQ+Y
	k6x72GOjkjTfjPbNKDQwEMzQTXXdhiacM4nRAdBlfK/38m3Lgi6ibPKXOClvrTk1f0W0SO00EvH
	tucvrrKTJq7vviTxBzkrmrCaCIdwxMDrdN0V8HSfaD1QEQoesy6nN6t8ML6uRdEnCjgux/+YWC+
	WSvjKtjWRvN3RdB4krOFn4T7qMs5moENJJB9MwOX4s1Om07y5Qiofm8mRZ7ag7XCzZXL693ZxPd
	om8YHew8TQMoVQgzJeYM3KLKBB634QCP4EtbE+aSvCMuL3exsVhayr5RMrQhZcIqbLabzN8wQv8
	Ji7bzL7FsAW80dvFsWjxqqGQD2aPlXSV/yZbLbl8nPX4g8wc7mET72AbuJ5qYyfijf5tlJ+JDO9
	xN6zZRv+ASAdee1c4+bmwn/mf18Ttn3FgpJkM11blbXEh7JV7kuOf4OKg/eeH9Yb0zsyPkE8u9D
	kifcHFGYRWtTr8dey9pqwgwiJDzanx+B5xYrQvuUrzFUjWv2P7nlDnC7mT2LiDhFnxKuyAjFjS2
	xTNYirxu/RlO16vzpGUXd84YS6m2zCSPJscXtzodakTJ0LeEUYNlFtcEGedfpTpcdZtHaKXGNeI
	wL21SIBaWa1QxRiji/TpRtyOb0JazGC+L+s+OmjC0CZqfKS3IFi7ftRgz5GRfEZBd
X-Received: by 2002:a05:6000:2885:b0:48e:1421:ed63 with SMTP id ffacd0b85a97d-48e5d58efd8mr7409508f8f.15.1793211963870;
        Wed, 28 Oct 2026 11:26:03 -0700 (PDT)
Return-Path: <nate@nkent.net>
Received: from akatosh.telenet.be (2a02-1811-e507-d800-9ae4-d494-8afd-3e84.ip6.access.telenet.be. [2a02:1811:e507:d800:9ae4:d494:8afd:3e84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48e0sm30243029f8f.38.2026.10.28.11.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:26:03 -0700 (PDT)
From: Nate Kent <nate@nkent.net>
To: openembedded-devel@lists.openembedded.org
Cc: Nate Kent <nate@nkent.net>
Subject: [meta-networking][PATCH 0/2] Upgrade NNG from v1 to v2
Date: Wed, 28 Oct 2026 19:24:50 +0100
Message-ID: <20261028182452.3594321-1-nate@nkent.net>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 18:53:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131626
Content-Type: text/plain; charset="utf-8"

This is a breaking change that will cause build issues for users of
nngpp. Since the nngpp repository hasn't been touched in over six years,
it seemed more appropriate to simply remove the recipe rather than patch
it (and hope upstream accepts). If we have reason to think anybody is
depending on that package, I would be perfectly willing to add it back
and maintain it myself - I just don't want to do that if nobody is using
it.

This probably doesn't matter but, for the record, I did have to use
  QB_MEM = "-m 1024"
to run the NNG tests inside of qemu (all of which passed). The tests do
allocations that are too large for the default settings. As far as I
know, NNG is not included in any automated tests, so I would be
surprised if this was an issue.

Nate Kent (2):
  nngpp: remove recipe
  nng: upgrade 1.12.3 -> 2.1.0

 .../nanomsg/nng/run-ptest                     |  3 +--
 .../nanomsg/{nng_1.12.3.bb => nng_2.1.0.bb}   |  7 +++---
 ...1-cmake-Bump-minimum-version-to-3.10.patch | 25 -------------------
 .../recipes-connectivity/nanomsg/nngpp_git.bb | 13 ----------
 .../packagegroup-meta-networking.bb           |  1 -
 5 files changed, 5 insertions(+), 44 deletions(-)
 rename meta-networking/recipes-connectivity/nanomsg/{nng_1.12.3.bb => nng_2.1.0.bb} (77%)
 delete mode 100644 meta-networking/recipes-connectivity/nanomsg/nngpp/0001-cmake-Bump-minimum-version-to-3.10.patch
 delete mode 100644 meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb

-- 
2.55.0

