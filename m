Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 837F877711
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 22:34:04 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id m203so38498132wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=oSmhQ/hWAK7DeMrEb2jCMIimm4VmxwCuPlJcu1GOwV4=;
	b=bSl+e5QvcbGdDvpJE1bUU1sNZmFrC0AjRLxcz6pATd8Dp6NEaItg82fzsZJ32sRCte
	qYRLeEgPOs14DTUto57aOfsb615o5jkUE/MF9EKgCt4yBN50fvUH9SeRYtv54vX2SyO+
	PfwKzvlgI/0Pe4WcQ/R1hRuyRzX4m7/L1bVWbGlUUwOKT1aCOLDHS7BmqU/liYsZpShx
	U0QeoyzZhg3rIRND3AFGWcY2IYlxOSLmVSIU1mS5Sa6W4Gw5JGZDi6h1ETcT0N/wQI8Q
	CTO626WPxgy1Hn65+tqKXBo/mztgoYB0VlGAq+teB2Ww3qAc1qYjaWBqdwhb+adJ4ePD
	tVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=oSmhQ/hWAK7DeMrEb2jCMIimm4VmxwCuPlJcu1GOwV4=;
	b=AEkrAX87fRkhPj4GqlTyGWC5XYzrD8Z3WiKLIeTrfmDm9Zq4CFTHk/mBSPO7hw1uP6
	tp3sWqNmkNoJTGyoTZJ8KfKYrYIO0yezLh/wswM6WtCEr4pVa9sjkIwf6jPQcgzFEQDM
	odTIMwK2U5UNraTF+qBBnFsZWQ5iAFfhYXn9XZxD7wOcWBfMM9yJvqPDZTk+WALmsCKy
	auZ2cBpUWAeot9Tyek03srz3ZcksTe/T9M/u9LwXP1pdPliObsGxrQ9rQQmr6q/GIrW9
	E+8IQ5CT7zJ3HnHpgz8oPocH0mIUAehi+222YADe/q8hcafsdO/Gvi29M2DaoKzdO51o
	zZzA==
X-Gm-Message-State: AIkVDXLHQ9D3EvYiZoPMzmh7yylCBlog3k+F0xsk59GwjUQsJkEZ3mBmc71fszKBCbDmog==
X-Received: by 10.28.107.77 with SMTP id g74mr12874232wmc.109.1482446045562;
	Thu, 22 Dec 2016 14:34:05 -0800 (PST)
Received: from localhost.localdomain (p579F7B0D.dip0.t-ipconnect.de.
	[87.159.123.13]) by smtp.googlemail.com with ESMTPSA id
	m145sm34179574wma.3.2016.12.22.14.34.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Dec 2016 14:34:04 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Dec 2016 23:33:38 +0100
Message-Id: <1482446018-17187-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1482446018-17187-1-git-send-email-schnitzeltony@googlemail.com>
References: <1482446018-17187-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] mpd: add PACKAGECONFIG for libcdio-paranoia
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
X-List-Received-Date: Thu, 22 Dec 2016 22:34:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| WARNING: mpd-0.19.21-r0 do_package_qa: QA Issue: mpd rdepends on libcdio-paranoia, but it isn't a build dependency, missing libcdio-paranoia in DEPENDS or PACKAGECONFIG? [build-deps]

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb
index 0071b89..82518d6 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb
@@ -18,6 +18,7 @@ EXTRA_OECONF = "enable_bzip2=yes"
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
 PACKAGECONFIG[audiofile] = "--enable-audiofile,--disable-audiofile,audiofile"
+PACKAGECONFIG[cdioparanoia] = "--enable-cdio-paranoia,--disable-cdio-paranoia,libcdio-paranoia"
 PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
 PACKAGECONFIG[id3tag] = "--enable-id3,--disable-id3,libid3tag"
 PACKAGECONFIG[lame] = "--enable-lame-encoder,--disable-lame-encoder,lame"
-- 
2.5.5


