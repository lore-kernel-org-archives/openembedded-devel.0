Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id D5E3E7C4C0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Feb 2019 17:37:07 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id 2so802010qtb.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Feb 2019 09:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:organization:content-transfer-encoding;
	bh=LbjwvYU2OoxbhckCrzyz2qMNAHCujY7vYpAr8Nm1aqU=;
	b=nMmDVCdV+SAW9YFOcVu5imlBXF2NJCRdf2iz9mk+VcMv70/uNtISKC1FYTpMYkOKF9
	fr6qsJ63ODYd0g/236LXns7QZ4VuB1JsSUvwFGXz22he2DAMdqwN8H14dQg7Wbt4J0r9
	k8uAX9yACYDsNU1ZGT0MhMXfRqXS6iX4WsI1eBGpwCpXEig6K+amIn9PKRj/2bO2n0Xa
	nLIOtVLSBbfvZ6/fsniXotnQASQpnqCvOquNaHjmACI/t9jZmH/nJ30mrETsnG+ViE8/
	kC8VK/cF55RqMO3WgubGP7IXV2JnPyK1TBH59sPFTOp690BaEv86WBk25SaYOh8JNk6O
	eRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=LbjwvYU2OoxbhckCrzyz2qMNAHCujY7vYpAr8Nm1aqU=;
	b=txXSc3Y4VryK+qO+/TB5uf+Rknb5HlFHg7qpCmoi5aiEQ+/l/iqo944LJKhrnBvhZw
	SnR9842nQdBYUqSSHMylWfTMDdQzy/qQhyKrNgne7iiEH1bCTVdvdM8wJjLt3jlAOwIJ
	3ZQep19WJBIEzskECXgh5qzczivWQf5B3sR4/cmAje5bvacOZzu4hlWO6eQ39P1O3oMc
	l1JhBp5XXvRhEOa8q/mh5jmSJEA5b7nWh8uAMUVk3/FUIxcrcWwCXJROUu5wgzi6taHX
	R132YM71zN/8n9QRZlI9c7WNS6PsT72RKn0KarpSLbl6VzGBX5iEyuXK8VDSFnX29i9r
	7HgA==
X-Gm-Message-State: AHQUAubpsb9AiHhKXAnHILc8cay8Zv1IztRtAFhxCRNEmsHw89pa+Thl
	J4+BmQyErdmDHQqG2x3/gT/FE0+lrvTdBw==
X-Google-Smtp-Source: AHgI3IbrIMFpzPdt/s0pw/kyJhEiNE76nwPguPQdSdeqJbgZo4IFQfJ0mr4XVbrywq1JnpYyW/BBrA==
X-Received: by 2002:a0c:e84f:: with SMTP id l15mr12692011qvo.124.1549561028665;
	Thu, 07 Feb 2019 09:37:08 -0800 (PST)
Received: from centrium.lab.ossystems ([181.220.86.121])
	by smtp.gmail.com with ESMTPSA id
	n9sm10983987qtn.59.2019.02.07.09.37.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Feb 2019 09:37:07 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Feb 2019 15:36:43 -0200
Message-Id: <20190207173643.20893-4-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190207173643.20893-1-fabio.berton@ossystems.com.br>
References: <20190207173643.20893-1-fabio.berton@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 4/4] python-protobuf: Add nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Thu, 07 Feb 2019 17:37:08 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-protobuf.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-protobuf.inc b/meta-python/recipes-devtools/python/python-protobuf.inc
index b617904d2..51037915d 100644
--- a/meta-python/recipes-devtools/python/python-protobuf.inc
+++ b/meta-python/recipes-devtools/python/python-protobuf.inc
@@ -28,4 +28,4 @@ RDEPENDS_${PN} += " \
 "
 
 # For usage in other recipies when compiling protobuf files (e.g. by grpcio-tools)
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


