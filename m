Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id DD18D795F7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 15:32:51 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id c190-v6so21293825oig.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 08:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:from:date:subject:to;
	bh=ObNzWj8TZbT++ZAwq0XB5AQLH7KkeGHBdFRstrGr+OY=;
	b=I6EE8PFCoPW74rBZfwX6/bDWvRhRWwK3Z8hNPD3j35XretXUnDBqeyFhlY0bmqrzsF
	0ITd/lAtRjFDLGNXs3DUJheksgQkB5r04wkiFkAnmjBEb3WgRciNl19feZLRcCM97Lpj
	0zKeqB3R1J+FUDcZz83sJ4QILwsoeZAi1D+vVCXsHRsOAOPQIUbkgElxoZ/G2g0Epd/p
	y5sxEEeExML6v3XB2hk+mOv0gCAEvWu0aHVkR34auf3wvqFHkq3CQnDmT9R5EPL2mE0o
	hS8xjfncx7vJPkKH/8ud4YDGzR/ec4WB8Py52z4GucO4mjs6m6x09dL2oweNr2U4nOxD
	7xpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:from:date:subject:to;
	bh=ObNzWj8TZbT++ZAwq0XB5AQLH7KkeGHBdFRstrGr+OY=;
	b=bMPMFB4vzjrPRYY6OfJSC549v6rcx/IjMxd5wesvkwh7MoaFgpGJcmGmwrSrB9kNnA
	5/Pf+uoFhr22gN4lrYuz0+47LMtBUV2SnsKZQpyb47A1Ay/HTa61AHKyvCYw178yKJcF
	xCOdgojNWu+vJic9xZJTpIi8sMwzaAu4eft95zNVzd9hybVGUtf8IoIPNLbJMTSeOXXk
	AhvXAJrPe9JHJ5bEnHYic2HQBcVzVU4JL9Iqd4DCQ0eZ4CFF556ITc28daqOJLAfMUt4
	pxD/hfIl2Wd3fHbVYt+WNsAJ7DUypa32GfIr6oALGQ4+AuH24nxxYLflAVpPv1gCHuK3
	IjOw==
X-Gm-Message-State: APzg51D3cjhtXxgOKGP4Ia2Klwa3WYBxV/TbSGlbDx8vbmfADIqOFBU0
	bKVKf9KZrvfnfTBTZhutrgUcHUpj
X-Google-Smtp-Source: ANB0VdaXjnZI0UVpep1Yi/0wFTEDcxh5e6HNCpBygJBe0dlKiG60QJZbaZA7NSfU28XPEFunSttlEg==
X-Received: by 2002:aca:2c02:: with SMTP id
	s2-v6mr3594696ois.305.1536247972720; 
	Thu, 06 Sep 2018 08:32:52 -0700 (PDT)
Received: from akuster-ThinkPad-T460s ([2601:202:4180:c33:a9a3:ce31:52a9:bd5c])
	by smtp.gmail.com with ESMTPSA id
	r187-v6sm3259393oie.43.2018.09.06.08.32.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 08:32:52 -0700 (PDT)
Message-ID: <5b9148a4.1c69fb81.f91e6.f65f@mx.google.com>
From: Armin Kuster <akuster808@gmail.com>
X-Google-Original-From: "Armin Kuster" <akuster@akuster-ThinkPad-T460s>
Received: by akuster-ThinkPad-T460s (sSMTP sendmail emulation);
	Thu, 06 Sep 2018 08:32:50 -0700
Date: Thu, 06 Sep 2018 08:32:50 -0700
To: <openembedded-devel@lists.openembedded.org>
X-Mailer: mail (GNU Mailutils 2.99.99)
Subject: Rocko merge request
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
X-List-Received-Date: Thu, 06 Sep 2018 15:32:52 -0000

The following changes since commit 352531015014d1957d6444d114f4451e241c4d23:

  protobuf: Fix fetcher failure for rocko. (2018-06-07 06:43:47 -0700)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded rocko-next

for you to fetch changes up to eae996301d9c097bcbeb8046f08041dc82bb62f8:

  glm: update 0.9.8.5 -> 0.9.9-a2 to fix x86_64 (sse-simd) build (2018-09-05 08:48:59 -0700)

----------------------------------------------------------------
Andreas Müller (1):
      glm: update 0.9.8.5 -> 0.9.9-a2 to fix x86_64 (sse-simd) build

Armin Kuster (1):
      wireshark: update to 2.2.16

Jagadeesh Krishnanjanappa (3):
      apache2: CVE-2018-1333
      fuse: CVE-2018-10906
      lftp: CVE-2018-10916

Khem Raj (1):
      python-evdev: Use target header to generate ecodes.c

Martin Jansa (1):
      rarpd, sblim-sfcb, openct: inherit systemd unconditionally

 .../fuse/files/CVE-2018-10906-1.patch              | 52 ++++++++++++++
 .../fuse/files/CVE-2018-10906-2.patch              | 48 +++++++++++++
 .../recipes-support/fuse/fuse_2.9.7.bb             |  2 +
 .../lftp/files/CVE-2018-10916.patch                | 82 ++++++++++++++++++++++
 .../recipes-connectivity/lftp/lftp_4.7.7.bb        |  1 +
 .../{wireshark_2.2.12.bb => wireshark_2.2.16.bb}   |  4 +-
 meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb   |  8 +--
 .../sblim-sfcb/sblim-sfcb_1.4.9.bb                 |  8 +--
 .../glm/{glm_0.9.8.5.bb => glm_0.9.9-a2.bb}        |  6 +-
 meta-oe/recipes-support/openct/openct_0.6.20.bb    |  8 +--
 .../recipes-devtools/python/python-evdev_0.7.0.bb  |  7 ++
 .../recipes-httpd/apache2/apache2-native_2.4.27.bb |  1 +
 .../recipes-httpd/apache2/apache2_2.4.27.bb        |  1 +
 .../apache2/files/CVE-2018-1333.patch              | 44 ++++++++++++
 14 files changed, 252 insertions(+), 20 deletions(-)
 create mode 100644 meta-filesystems/recipes-support/fuse/files/CVE-2018-10906-1.patch
 create mode 100644 meta-filesystems/recipes-support/fuse/files/CVE-2018-10906-2.patch
 create mode 100644 meta-networking/recipes-connectivity/lftp/files/CVE-2018-10916.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.12.bb => wireshark_2.2.16.bb} (95%)
 rename meta-oe/recipes-graphics/glm/{glm_0.9.8.5.bb => glm_0.9.9-a2.bb} (68%)
 create mode 100644 meta-webserver/recipes-httpd/apache2/files/CVE-2018-1333.patch

