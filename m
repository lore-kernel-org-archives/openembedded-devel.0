Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7CAF5616C8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 19:07:43 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id p9so334812wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 11:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=J3fWy07bKBXCgGbX/w1yGrBQ4RaKzVxA+a+B/OtPads=;
	b=Wyh8yDvx7ekuP3p8Zg5/fl9Nxs6j+ZzNux9GHvacnTe6cY0FZ91SbJBWLzJQZEegIa
	fWyX0CZ2BRMkT2FyxzSyE10/pTtCbMvoYOPvnSfpUT2Q+TQC2xyEf1vv1IiatVNFbJVT
	3f06rY7doUFNjJHAU9WsS7tpW4yUxKeSXzEgbNM/HWgbhv5iJ7gsBiSOxyqsOKe/2uBQ
	C7VURw2gBSwiq9ipk+pVk+VCGzWVv5Q2u4edRksd9plSH147WvpM/ts0e65Osk4UvnOo
	8sfd2UqBdQ61e8V3t4nQPhOewhGc5ebGJcuffT7zyVjmu2jLVU8+PG/j256alaYAgA0K
	Dp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=J3fWy07bKBXCgGbX/w1yGrBQ4RaKzVxA+a+B/OtPads=;
	b=p3Yo3yTWQGtuzQ/5qZSipAFy3JIw2Ojz1VuFocK7563moVSbZa8oyiFZMCn7Li2djf
	jNm8Z0ImjDJtaTecrFDlIG7Nx5ChosOqGs1uTiPWqLyVmSf4peRcqT85SopRa303zfYO
	X6QcVsj/C7jEOMv6bNdysNRU9BTLiY0an5+fkeWglGoYlWrhzTvwMbonu/KPeeqBXpnr
	wZt2aibf9Dv6UkdobfCo5C0Vx4uxffnpeKoBcWUsfF3ygcSo6FpPMnCBSH5DgcINC7tm
	/RaVwMCrA6bYUsGHCHj/RgROqKVz3MKHBSsIuna0IOPOr2BCrfbHY73uZHCqZJQzww53
	SVjQ==
X-Gm-Message-State: APjAAAU5yElkOEgerFmA4FiFBQ5kovYajj69dmIRgAm+y4ciPT4iPy6c
	bwH51suzsx4LRiEOxbHN3xe0nghI
X-Google-Smtp-Source: APXvYqxkEhwS4gW4k1tZ+Cv3YKYRvgMOdYjjcZGEA1oeGsraCTKEPQOuitmRh66yHQ92KH76lP+rTw==
X-Received: by 2002:a05:600c:2187:: with SMTP id
	e7mr634775wme.11.1582657663961; 
	Tue, 25 Feb 2020 11:07:43 -0800 (PST)
Received: from localhost ([109.238.218.228])
	by smtp.gmail.com with ESMTPSA id n2sm3108117wro.96.2020.02.25.11.07.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 11:07:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Feb 2020 20:07:39 +0100
Message-Id: <20200225190739.4056-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200225190739.4056-1-Martin.Jansa@gmail.com>
References: <20200225190739.4056-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [meta-python2][PATCH 2/2] python-networkmanager: skip when meta-networking isn't included
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
X-List-Received-Date: Tue, 25 Feb 2020 19:07:43 -0000
Content-Transfer-Encoding: 8bit

* fixes
  ERROR: Nothing RPROVIDES 'networkmanager' (but meta-python2/recipes-connectivity/python-networkmanager/python-networkmanager_2.1.bb RDEPENDS on or otherwise requires it)
  in world builds without meta-networking

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../python-networkmanager/python-networkmanager_2.1.bb       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-connectivity/python-networkmanager/python-networkmanager_2.1.bb b/recipes-connectivity/python-networkmanager/python-networkmanager_2.1.bb
index 3aa41f1..53e2f9d 100644
--- a/recipes-connectivity/python-networkmanager/python-networkmanager_2.1.bb
+++ b/recipes-connectivity/python-networkmanager/python-networkmanager_2.1.bb
@@ -11,3 +11,8 @@ PYPI_PACKAGE = "python-networkmanager"
 inherit pypi setuptools
 
 RDEPENDS_${PN} = "networkmanager python-dbus python-six"
+
+python() {
+    if 'networking-layer' not in d.getVar('BBFILE_COLLECTIONS').split():
+        raise bb.parse.SkipRecipe('Requires networking-layer to be present to provide networkmanager.')
+}
-- 
2.20.1


