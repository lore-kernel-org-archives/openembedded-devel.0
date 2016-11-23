Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 99D1D719E5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:53 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id x23so664522pgx.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=X64OmgB1K8E0QoV0lf3QC4n5C8Pg3pfs3eRHeFuY6ek=;
	b=qU804ntYNJsFtS4UXYUuFMuyxqChfE2HkrUkCiIHe0dCaK0xgDJt2rC3hQdXUBZiFP
	G6mBxCaTkC61n2B006ukdvSCKnNxfR/IHl3foyjAFGDxuw9cDtoqlNNFLr2+GZMD0wx4
	zIK2aNFTQWbDnnyfzSaj//P7lvo5ARxKxDYXTcSM8aWnD/3wDHLegFpLHZUK1Hr0FOee
	RgFKnsFQjBNKkjrPo/nIX/fEcbcPf+KmVgYba9RKVvfeO6khUf8e2VLzP57iw/ZfU3ma
	j4wblCjrskm4kgNE9+PE0CKW8Kr0ohALCa6DYn/hEQ1yCx1K3WjOggW6Ew52NpSJ+3gk
	kQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=X64OmgB1K8E0QoV0lf3QC4n5C8Pg3pfs3eRHeFuY6ek=;
	b=FohlutUVyzAE5UQk2/wPDxjzn6je7EPyyBJUSdBnX5uyXF13HoRXGT9NwkHeLK4WBG
	HIPU49XAlL+ORkh4HoPkirnot9MNivt5rFhviB1V4SEuRUNZImwmWp6mwhlgNvRJrpMh
	y4I1wehlxtxW25/7Et0xhdNyIxlL0bBQvfoRHvRqlDARFIAA2fbu/FV551lRKqAAjNGr
	fxoBaixvkV8a4KS+AuqXqSEsUA+sMQQZmtjkok60N3FFDM25NALP6qJdXNc0KJbF9Dr4
	3oMchGBvaWmVEOl90AjBwn1jacEBcilEK4odneUWQG4rD/bpFoj7zrbmNdf23fSRcpTk
	DlXA==
X-Gm-Message-State: AKaTC00408tIpvCY+Noxc9xCwXupDDsrID6yfLKhtimNX/NtSQOdBRKmObrxQeYV30w1Bw==
X-Received: by 10.99.116.92 with SMTP id e28mr3560734pgn.162.1479892975144;
	Wed, 23 Nov 2016 01:22:55 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:22:09 -0800
Message-Id: <20161123092209.23699-49-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 49/49] mpv: Add libvdpau to DEPENDS
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:53 -0000

Fixes
WARNING: mpv-0.15.0-r0 do_package_qa: QA Issue: mpv rdepends on libvdpau, but it isn't a build dependency, missing libvdpau in DEPENDS or PACKAGECONFIG? [build-deps]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
index 292c701..c49811c 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "mpv is a fork of mplayer2 and MPlayer. It shares some features wi
 SECTION = "multimedia"
 HOMEPAGE = "http://www.mpv.io/"
 DEPENDS = "zlib ffmpeg jpeg virtual/libx11 xsp libxv \
-           libxscrnsaver libv4l libxinerama \
+           libxscrnsaver libv4l libxinerama libvdpau \
 "
 
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.10.2


