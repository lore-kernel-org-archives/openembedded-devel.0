Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 30E79771EB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:46 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r18so15745272wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=cwjLeo4LRSJ2eD7ptQDWmdl06O0pa1ial26xyvugq5k=;
	b=J0oJQrRFrTL/MpkjLHvuNM31spNt57Mb7INbr89h4MjX8VbR2eXBiCcdH9P9LcIDOZ
	POAncDvsJm/ygUdrXmjRXJ7lmwFROvbpDalBYv3tkdrf5m7DQosqdmsT2keBk7z3Lm6b
	AZBniVOxHiiuXrGJEIO+lEq9yrCh1XIc7tg5VN4OmETU526fUER33cX78pz7TUWQz65x
	476TCXZ5V0wYjvvDcP/DMbqotTRSZOXeWNF0H1t2115s+fQIJQ4+fwJjOVvUCjSP22Gl
	z9WaqntHf+fWHBzObN7U80gn9ahZlFP0gDfaCFiguV72fCpH7T65miNwnaNaUfM9ffqF
	7uDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=cwjLeo4LRSJ2eD7ptQDWmdl06O0pa1ial26xyvugq5k=;
	b=i1UprDGAE3+hpSxh/jyZ2zwUd2aymigqWZJZY1Bfzy5msVSYxVGdqOKA4iXzezkkhM
	qGpd3xArOOmkCfBPwkUyrPW3WGg1pFWGcxpCRdDndBMN0+4yLCvRsAjVZpZibiolli8J
	adZcQ7iXEzVlARKqnnvOsWAAVoRG1lKb21ki9yEMumWV7cJjri5g9yIJdEvIh80wFDPQ
	NfiRy/MdfNIT81asH7HoFOuashu21WCPXtm/uoiFaz9FjsfeBPpVSibL17i0RiIWJvqV
	CwgvQTJcPn+3/q2cq6zBn5dNrai8edmQZ6ImlIhjw6cHb1Ycl41fqKDRJTiGKbJmWY3p
	BaZA==
X-Gm-Message-State: AMke39mEqrsa82ECxxlRTKXOhV31f2GL5nxHDpoQn0yLEb9OSwXT9TuiC8G2f6KFDLYO7A==
X-Received: by 10.28.105.68 with SMTP id e65mr11528668wmc.44.1487614066353;
	Mon, 20 Feb 2017 10:07:46 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:45 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:47 +0100
Message-Id: <20170220180700.29836-32-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 31/44] libqmi: unblacklist - libmbim is back
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb
index fa2e67d..679b102 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb
@@ -16,5 +16,3 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
            "
 SRC_URI[md5sum] = "4970c110f160b33637a3515004c637b2"
 SRC_URI[sha256sum] = "7ab6bb47fd23bf4d3fa17424e40ea5552d08b19e5ee4f125f21f316c8086ba2a"
-
-PNBLACKLIST[libqmi] ?= "Depends on blacklisted libmbim"
-- 
2.9.3


