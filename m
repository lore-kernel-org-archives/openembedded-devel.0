Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48008.1795411810851430836
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=hrYCKqmh;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-385d8a00598so3933670eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411810; x=1796016610; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hp0GyZdFGowS7JDF594gBi1Dx712cmO1wSGFKCqH6ws=;
        b=hrYCKqmhWkEJlSPmn8WnTWj+7cPoRsgHA+ozmLnAIlpgdcL5+mgH+SMYD7hzlGI/Fb
         +FbStcLJIcI4MEzarJ6UyCfmeqz+BQKgC5cUGaZ0QPojF2VBJZrqCtG4gsIuenwOrSi0
         2GReRE+h1nJrn85XzWafKTFsM15935HitLOksorLoy4wefRFOOvgo41o8R+6COKg/tfS
         uHYuIiUupUcdQ5ip/FOpkl6mCcfSDkoTvyGOJ/jbhJXzvUaZuILtGhbFKXcEgpmfNVQR
         Z1QMouhhcuxHuzgYEAmRDR8wD//4iWdvfUijNxLbYexS+tPZV+wy+kHkg2wmz/Zo2C0n
         Htbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411810; x=1796016610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hp0GyZdFGowS7JDF594gBi1Dx712cmO1wSGFKCqH6ws=;
        b=Rj9Ah5fN71drFr9QAHpNpq43cp8jaYHeRT6uNrqaYw/TCR3aM3imnBfMbgJKwjXbi5
         ghBHRxbTL39M9jIaZokaYJwe/bYP3itueCohpu5Om0ESh8x2rV9Ump8ZQN4dOqvE1/C0
         +zeJ43RRJiH0R8h2svI/KFB34YQy/B05WIk6K5oXTzF8HrK+mOCLuliqv96J07dN8bvE
         z/JnAf4nukcC4aPlWRqNUTF4wLMr3aNlkQatcA1KgKlJO0zbUU5T6zGczrEv+Xcwnuzs
         yGbynFlIY3BFHRF2Jy3zbsuw0YXpNZS5GPCinLpQ8y4HcfJkWKi4g61uLHdvA5k8WuSS
         RW+w==
X-Gm-Message-State: APuU4Z932mWL4CZpCJaGf+wXdrxwQV/yKvRKHG/FR5ea2ef2k8DSQmeO
	RdilnakdJI/ZXTRpQDyfJVzNRzNEG99w7rSwO2SucZX/vs3OR/jMm5BPa6q7GHBZTSE=
X-Gm-Gg: AZFdTZc3XYdwlWGzq0K6VgppsoXWzqV/FKc507enmc6kdVs9wUMpUpCMbe1tFusrcOH
	i9gohtXOR+CPuB04y2xo+52Y3o3TfLvQ5a5UjGU9UoXSWhA84kMtfrRLWgkV+vYvYNdeAgyMA7+
	PeSt2ur6yjRriVhEd0kghhtop3mLZN9nyc0OCBvftQ2zUQ10sWeRlLPmUqZKaKQkREI3TYdi7h6
	c/LC1C2eteXwGglJr+U3yTrP2jUvGGdLhc+SqcuikDvmEzunxu5muGS86h51Gq8Z0AalnUdpTGN
	88zJXIseSDEiiEt+wNlVrkrOLjw29xd/nMERWMcHrGgZuvfxL0B71h4fll9dfI254PZNY9vJ5fj
	h51BkQEi7BIYCwpYkgmjv3b1GL2oJWI4DWoUT5o+N/XDYYybkTj8wcrAP1/kwguzCtWsdU5nts1
	okqvY5/SvdOYbz2ApZlmT+MqcHPZS2qrOAjPFUL4UYyRRwWGI1KPBrlGM+buT+taf6P4aCbkDQF
	QL2g8dy4is669U14fsQnGvbt1k90gUIkxmoV3ura3LNcyokDYdEvVkue3i7Bn1hOvbPsZZqHiXt
	lTCQ4ebk2y9wmPfpMbBNV57FbkO/sQiUlhWZhfjMB0BoYw3SS03VQxjomMARNcUaYm+oFx/elEw
	K45ZWLoLqyaP8gytQd6er6ijeKklth+q6G1NgjHqxp45Wa6PT4R+K+SI67abMav56jVNCbK97Ud
	3G5UBO79/1GaiihZH8y+vN4M71atsSXmIdOxbAX+gA1dTdWvc8qBkyKUSKj4AlcqRVJ+XS5Wx2e
	rTA7DAL970MeQWyH+6pI2hId9BQwo+uYKejEX8JccmzPlMBv3NnpyJZN8hSMpS0REeSlFdMMdvZ
	NfEvRb2LkAYZInjyGL76yWt6ng==
X-Received: by 2002:a05:693c:83cf:10b0:386:b526:24d1 with SMTP id 5a478bee46e88-386b52638e1mr1017014eec.9.1795411810187;
        Sun, 22 Nov 2026 21:30:10 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 0/6] Recipe upgrades and tinyalsa update
Date: Sun, 22 Nov 2026 21:28:27 -0800
Message-ID: <20261123052953.3658549-11-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132798
Content-Type: text/plain; charset="utf-8"

Upgrade dav1d, libsrtp, libupnp, mpd and ncmpc, and move tinyalsa to the tip of
master, dropping a patch that upstream now carries.

Tested in Yoe CI with world builds for qemuarm64, qemuriscv64 and qemux86-64 and
ptest images for qemuarm64 and qemux86-64, each with glibc/systemd and musl/sysvinit.

Khem Raj (6):
  dav1d: upgrade 1.5.4 -> 1.5.5
  libsrtp: upgrade 2.8.1 -> 2.8.2
  libupnp: upgrade 22.2.2 -> 22.2.4
  mpd: upgrade 0.24.19 -> 0.24.20
  ncmpc: upgrade 0.54 -> 0.55
  tinyalsa: Upgrade to tip of trunk

 .../{libupnp_22.2.2.bb => libupnp_22.2.4.bb}  |  2 +-
 .../dav1d/{dav1d_1.5.4.bb => dav1d_1.5.5.bb}  |  2 +-
 .../{mpd_0.24.19.bb => mpd_0.24.20.bb}        |  2 +-
 .../musicpd/{ncmpc_0.54.bb => ncmpc_0.55.bb}  |  2 +-
 ...ioctl-to-dispatch-through-plugin-ops.patch | 36 -------------------
 .../tinyalsa/tinyalsa_2.0.0.bb                |  7 ++--
 .../{libsrtp_2.8.1.bb => libsrtp_2.8.2.bb}    |  2 +-
 7 files changed, 9 insertions(+), 44 deletions(-)
 rename meta-multimedia/recipes-connectivity/libupnp/{libupnp_22.2.2.bb => libupnp_22.2.4.bb} (98%)
 rename meta-multimedia/recipes-multimedia/dav1d/{dav1d_1.5.4.bb => dav1d_1.5.5.bb} (91%)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.24.19.bb => mpd_0.24.20.bb} (98%)
 rename meta-multimedia/recipes-multimedia/musicpd/{ncmpc_0.54.bb => ncmpc_0.55.bb} (96%)
 delete mode 100644 meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa/0002-pcm-fix-pcm_ioctl-to-dispatch-through-plugin-ops.patch
 rename meta-multimedia/recipes-support/libsrtp/{libsrtp_2.8.1.bb => libsrtp_2.8.2.bb} (94%)

