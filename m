Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id C598F7FE5D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 11:53:48 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c9so7069387wrw.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jan 2020 03:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=CSBJ1DmWn+M8L+Z/XEVkziI3x1doELrK4LJ3F44udoM=;
	b=F39ZcR40fqjXrYhorLYXuLdZj9mNB5xUZxiG9N/nsfyGSkA49A79dnrbchgcypvCRM
	TqxlVwq72FbyVcCdJNctTmItejSxbupw3YaZMCJDsjMK41sCGPCL3zbTd1rrqNxFWit8
	1rlbKsBPeeChDfVRnJjnQit3stmcxJnzwQ5IP7yScj2WDsQMWcqub7n7xn/A04xj7wMU
	ZClai7tTeGfTVYh8pR2BxdAFAkBYulCKsPqAfzHX8L1RkNSZIib6ErMdulHhQ2y6WuUR
	dix1/Z4/iDqqfHL7Ya8Fs5nLvZrxUDnJ4WWZnfLRwqxBgDTya751/m9Q1pZ+ftnIOsZE
	S/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CSBJ1DmWn+M8L+Z/XEVkziI3x1doELrK4LJ3F44udoM=;
	b=GqVTzltW6MunwhT2kTqhzc9BJvcionHgkrkXTPJn8RUbJHATF9nVTaaQC5/r+bMl8H
	2lXg4Oimu/wEv2wWodSl1odA94sJ4lkvbagaKoULV/CMFkwt3RpJsG+eJ2hAx/S/lNIz
	uSBohRgGBPM+pDjzbquXq1RLpw05yFIXPV+16Yn7AQ7Pkb70Jgwj1rHaFHUJvNgyJbey
	7xNmC55MMtp3EfsxR1Uqzd2zwY3wCIB1c3PS4Sf1qBdQzsS9gyyMCyx/vxCV388LyplA
	IclyO86UvBBuCoY/e+9yVr6Z4ONC3ZEvv+U5/WxasAJFYvL2G9XB+JIj48LancCwHOn4
	ZqBg==
X-Gm-Message-State: APjAAAVxQIEUeFl1AmmOIrInmvVCIro3dUF+7aGBN1CE3ZAaOk60QlLu
	JUxniinPBMoge81sDLNkWpLoEDgJ4sQ=
X-Google-Smtp-Source: APXvYqwtj3RnBqDb+7UrKCDyuRZNvgnfkgXm/xRB9mDeFGBt4VCzsThVPsTbB8eags+gEuYCh3AWBw==
X-Received: by 2002:adf:dd52:: with SMTP id u18mr18957wrm.131.1578570829110;
	Thu, 09 Jan 2020 03:53:49 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:5d32:c012:51ed:b4fa:d66:b069])
	by smtp.gmail.com with ESMTPSA id
	q3sm2539030wmj.38.2020.01.09.03.53.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 03:53:48 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jan 2020 12:53:41 +0100
Message-Id: <20200109115341.13808-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] brotli: rename static libraries avoding the -static suffix.
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
X-List-Received-Date: Thu, 09 Jan 2020 11:53:49 -0000

This leads to link failures such as the ones described here:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=943321

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 meta-oe/recipes-extended/brotli/brotli_1.0.7.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-extended/brotli/brotli_1.0.7.bb b/meta-oe/recipes-extended/brotli/brotli_1.0.7.bb
index b4d4773ee..e4e454bda 100644
--- a/meta-oe/recipes-extended/brotli/brotli_1.0.7.bb
+++ b/meta-oe/recipes-extended/brotli/brotli_1.0.7.bb
@@ -12,3 +12,9 @@ SRCREV= "d6d98957ca8ccb1ef45922e978bb10efca0ea541"
 S = "${WORKDIR}/git"
 
 inherit cmake lib_package
+
+do_install_append () {
+	for lib in $(ls ${D}${libdir}/*-static.a); do
+		mv -v "${lib}" "$(echo ${lib} | sed s/-static//)"
+	done
+}
-- 
2.17.1


