Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 799A7731BF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2016 22:45:06 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id l65so19350498wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2016 14:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zQS2wE/E3isunAVWjdOydjV+ZLqh6wr6zVvmUOlSv2A=;
	b=M2NeRs87bOUJhLTNXW/li6KVW0OSku2Fp34AuPg1QOfk1TkSnbBX978HeAc0OQgCPY
	SCAQrOCeL5mFI02c/j1ZNLs8/ASeHm4RhVch+LcFEPACh5nDHwzP5zWE8x2dE6xAuLNT
	M4PJLmAj0cC1pb0VPbz4n8Sw/8ti24mSUG4sENzg5texxNesuBFYUWEc2HlP7kpS1Ur8
	URekypFUgHcr2SSwkmxgBWBAalswJ3gSRP6LNZqg8OG/2clhcFTMkpScD4uLxP+RH9K0
	uQoybrA2+A0Byjl5JM3+hfegdIoDXXL1+dXZJzLJnYcdK2gX1iZ/dsxxXPm5c0ygupwY
	H92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zQS2wE/E3isunAVWjdOydjV+ZLqh6wr6zVvmUOlSv2A=;
	b=FeP+DKtDdLCH7J4/jSzrTCf8jWsWeuMxJ4oLLIk2UhvHsDKGzhURB/IvyeCeA3tip6
	o27Ql/IH2pytpr8LuxLNQCtLMxWhHQl3chmfSMXzl9zRubU5Pi/95jKxInkcURfPUrDU
	fLFqcmfyY4nBRpqnpXlN/S/32nb15nym++LR8QngmBEozPySme6Wo7VFOByQTOKAugGb
	tfrrbdZc9Vhr8Y36n2ZJ7vQoqQGzW7Hf8A361W0OLFFLP9yPUZbLDcLkhxlbLYiXmgTN
	83JQOqxSKUP8RuEKzFkD4QHj8VdrhHd9o8LqBi3j1BeGhy/id1VgRuQNmF4crD9L9DLp
	mVFA==
X-Gm-Message-State: ALoCoQk5IdaCuUQnPXijE0tlPxBrjMRcDksueMCZ4KhwcMZIOsOJ17axbFLK2gMjTtbxTu0IifbrOBASILnpgAIVzVT3hBciAg==
X-Received: by 10.194.82.36 with SMTP id f4mr29253775wjy.87.1453157107064;
	Mon, 18 Jan 2016 14:45:07 -0800 (PST)
Received: from wsadrian.local (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	df10sm25734738wjb.44.2016.01.18.14.45.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jan 2016 14:45:06 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Jan 2016 23:44:07 +0100
Message-Id: <1453157047-6614-4-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1453157047-6614-1-git-send-email-adrian.freihofer@gmail.com>
References: <1453157047-6614-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH v4 3/3] networkmanager-openvpn: Update to 1.0.8
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
X-List-Received-Date: Mon, 18 Jan 2016 22:45:06 -0000

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 ...etworkmanager-openvpn_1.0.6.bb => networkmanager-openvpn_1.0.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/networkmanager/{networkmanager-openvpn_1.0.6.bb => networkmanager-openvpn_1.0.8.bb} (83%)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.8.bb
similarity index 83%
rename from meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.6.bb
rename to meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.8.bb
index 8334123..258ee68 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.6.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.0.8.bb
@@ -10,8 +10,8 @@ inherit gnomebase useradd gettext systemd
 
 SRC_URI = "${GNOME_MIRROR}/NetworkManager-openvpn/${@gnome_verdir("${PV}")}/NetworkManager-openvpn-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "02931c0302310d06e43d413b5a7a3261"
-SRC_URI[sha256sum] = "c982b644fa43d3019cb654a17e692bb3a7175a86d28065ea51f55ae7dfe45d8c"
+SRC_URI[md5sum] = "758a9951ad5e20a37c72cc7326c9c750"
+SRC_URI[sha256sum] = "1b979519d72ba4d78e729d4856c5b53fad914ca7ee3ca91209ce489ba78912ac"
 
 S = "${WORKDIR}/NetworkManager-openvpn-${PV}"
 
-- 
2.5.0


