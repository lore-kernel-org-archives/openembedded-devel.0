Return-Path: <sumit.garg@linaro.org>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 49F937FD63
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 08:56:38 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id y8so1034681pll.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 00:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=vqYOYE08bTuLLT0TJjOtRLexOufLnbZ0xn7g0ObEUQI=;
	b=VFXlVOEF7jbxSpbAKcbwQQ9SDX+OGgN1HRQt0moXRfzRZOheRpyBC7Hsaare8oL2PD
	iCeUOKTU9lRaxCXl7SicbU5R9skLGERtYWBaMWcSOWL+KYuSIgKhAXDy0VY9F5MrSZIB
	VV/IUDLDPYT41avVK6Ooic8u5kgi6nlDQUbaSDEx5BO/bnd8Xurn/aqdA/JtlD6RW/r3
	COMjYecrEVax+7wiawPxqaP7VPcRvCAj/0TWJXLw8wXVornzwh2Gy5tV59XnxDCbi0Rr
	WmM4IdGBn3C71pn9mt4GljpxEUph+roZ2sghvGpB7oE5Dss88TwJ83mZyh75t/koxmKm
	vyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vqYOYE08bTuLLT0TJjOtRLexOufLnbZ0xn7g0ObEUQI=;
	b=AI1Dqo/Ha49WttZTm5lLElNcMsJeBFLrgcvuEM+kXEMkzs3Tw10Qlk5HKSZRYt99qq
	8dzdJig4UmHKyyUcvoXaggrX47P2TBWCkuIWkCnlTpDDrYSuzWXwVDVxwUesJ0E4DRvl
	5QNhq518k80j4QK7NvkFqVgGOmFiydyL/ainp/yWiBQ2amXIv5zlTFRf1Wzt9QZ3vbU9
	1Jz7bV+kQe+WNmh9TZf2nMK/xL0Lf2TqDThmSVHdloVaP9mcimc824apBFkmT5SKBFr4
	+RbCNw/8Wgt0KQvNCC0j0QyYM8S3I2LbyzCwgK+nkljQ6nSrcrGVrQzDegMYGC8UG+wX
	5C4A==
X-Gm-Message-State: APjAAAWPAylybnsj/THuOdrEkzn/Q7hgX3sMdqURScHWnP8AgkMHgR7h
	L5UXg4sK06ZLLS/aymmpOHboVBOxve0=
X-Google-Smtp-Source: APXvYqwJYsKvp0HVTvmUymUiou55oTar4UtgzlvlNzmL+0VDf5UR8G/sFi4/LRG65P/dYe6RukGpkQ==
X-Received: by 2002:a17:902:708c:: with SMTP id
	z12mr4197200plk.15.1579596998870; 
	Tue, 21 Jan 2020 00:56:38 -0800 (PST)
Received: from localhost.localdomain ([117.252.69.227])
	by smtp.gmail.com with ESMTPSA id
	m22sm42546378pgn.8.2020.01.21.00.56.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Jan 2020 00:56:37 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jan 2020 14:26:07 +0530
Message-Id: <1579596971-24752-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
Cc: daniel.thompson@linaro.org
Subject: [meta-networking][PATCH v2 0/4] Fix some native tools dependencies
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
X-List-Received-Date: Tue, 21 Jan 2020 08:56:38 -0000

Some native tools dependency issues were seen while building with
external GCC tool-set rather than source GCC tool-set. While building
with source tool-set these dependencies were implicitly met which is not
the case with external tool-set. So explicitly state these native tools
dependencies.

Use HOST_SYS instead of TARGET_PREFIX for libtool in unbound recipe as
TARGET_PREFIX may vary from source GCC tool-set to external GCC tool-set.

Changes in v2:
- Split into recipe specific patches.
- Add native tools dependency fixes for dovecot and ndisc6 recipes.

Sumit Garg (4):
  drbd-utils: fix flex-native tool dependency
  unbound: Use HOST_SYS instead of TARGET_PREFIX for libtool
  dovecot: fix gettext tool dependency
  ndisc6: fix coreutils-native tool dependency

 meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb | 2 +-
 meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb   | 2 ++
 meta-networking/recipes-support/ndisc6/ndisc6_git.bb        | 2 ++
 meta-networking/recipes-support/unbound/unbound_1.9.4.bb    | 2 +-
 4 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.7.4


