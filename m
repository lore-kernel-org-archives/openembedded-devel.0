Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id DE49F73166
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Sep 2016 10:04:56 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id l132so74979502wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Sep 2016 03:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5q4eyUjgm/L56TiC5r01FeOyfQFOjoamMv9ccDlnC+o=;
	b=muYDhHrhywbYqZqrPLPDnH8BBwAsYCqCfi5RE7MdFhsTWrf3vNPOvjkHC5GoV0P1il
	ps6knQxXEJFFYEV6ZZ0GvT7Ih88Pu+exJvvGHujr1f+fWQFS7hJrGCN1/sd29PQtKGt3
	11MAaD67f+j0fujMJOUCYa/i1fRTfPT/NRz6yaiD5t295s/FbO6dECOj2Fr40Nk8l88U
	Qsn5XoHX17s+bLyghRKOtSJPhVf7BtuUu/R/RTtMIi9w3bnlTdRn6MlDHsIjMi5NnRLv
	jyUjPE1y8UnqtDkQVdVB7mZ1nTeT53TJyAM/HVwL/HXOUWBKogpuoWBB9oHil+ULLc5x
	ifAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5q4eyUjgm/L56TiC5r01FeOyfQFOjoamMv9ccDlnC+o=;
	b=AAuQe/WQy9Al9pSNpxJT81Z1/j2b0z37gt+TG1XXyVsaSwhHIWxlGRxLfQ4cWgp5yk
	wdlUzUEALp4HKssc3iXwt104CKfnAE2H4rIENaaU7LjIzEpI2zE3YvJE4c7znu5tjzLd
	IJQbx9vvTEMXMsEQy1hI2gi0jSoyGm5phLOAORjbeonVqA2tK3Aw7QIX/Oo7+8POhFzp
	R1Itu/TEXCQ+gFuo/dL7nD7nv1+Ss/TQzctUdv6Ch6jT35mnaZ/bjVuPaZRN+3mjiszb
	WRAtQpcl1oiQFqTkUxi/f79UQFZCO8YJl8kHn6Joy0ctniylY8ZoshCVtAqmX+VWL7wJ
	xZEw==
X-Gm-Message-State: AE9vXwPRArwB1RO1CdBrba+yHVjIB401o5mltqfA2mCBgbfPoWyRKXEEvgWikLCmRNkB2Q==
X-Received: by 10.28.105.18 with SMTP id e18mr1394792wmc.14.1474106696664;
	Sat, 17 Sep 2016 03:04:56 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0635.dip0.t-ipconnect.de.
	[79.223.6.53]) by smtp.googlemail.com with ESMTPSA id
	o2sm12473330wjo.3.2016.09.17.03.04.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Sep 2016 03:04:56 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Sep 2016 12:04:36 +0200
Message-Id: <1474106682-20512-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH 0/6] updates++
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
X-List-Received-Date: Sat, 17 Sep 2016 10:04:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

samba patch should be applied on top of my last samba patch (if I am not
mistaken -> current master-next)

Andreas Müller (6):
  jack: update to 0.125.0rc1
  upower: don't start on boot by default - dbus does that on demand
  gimp: update to 2.8.18
  gvfs: update to 1.28.3
  ristretto: have tumbler back - it builds fine and is an important
    feature
  samba: replace pam packageconfig by hard dependency

 .../files/0001-Add-support-for-libsystemd.patch    | 49 ----------------
 .../gvfs/{gvfs_1.24.2.bb => gvfs_1.28.3.bb}        | 18 +++---
 .../recipes-connectivity/samba/samba_4.4.5.bb      |  7 +--
 .../gimp/{gimp_2.8.14.bb => gimp_2.8.18.bb}        | 22 ++++++-
 .../jack/jack/jack_fix_TWL4030_alsa_capture.patch  | 31 ----------
 .../jack/jack/remove-wrong-host-test.patch         | 68 ----------------------
 meta-oe/recipes-multimedia/jack/jack_0.121.0.bb    | 40 -------------
 meta-oe/recipes-multimedia/jack/jack_0.125.0rc1.bb | 49 ++++++++++++++++
 meta-oe/recipes-support/upower/upower_0.99.4.bb    |  2 +
 .../recipes-apps/ristretto/ristretto_0.8.0.bb      |  3 +-
 10 files changed, 81 insertions(+), 208 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gvfs/files/0001-Add-support-for-libsystemd.patch
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.24.2.bb => gvfs_1.28.3.bb} (78%)
 rename meta-oe/recipes-graphics/gimp/{gimp_2.8.14.bb => gimp_2.8.18.bb} (70%)
 delete mode 100644 meta-oe/recipes-multimedia/jack/jack/jack_fix_TWL4030_alsa_capture.patch
 delete mode 100644 meta-oe/recipes-multimedia/jack/jack/remove-wrong-host-test.patch
 delete mode 100644 meta-oe/recipes-multimedia/jack/jack_0.121.0.bb
 create mode 100644 meta-oe/recipes-multimedia/jack/jack_0.125.0rc1.bb

-- 
2.5.5


