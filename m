Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10378.1795753120014116947
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:18:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=FPajcc/1;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33fb4680717so3951318eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753119; x=1796357919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CL6xs8cKi6Bq9wajebfhqMFr/A7HA2GZnRELKN8R1fE=;
        b=FPajcc/1LmbwXEBgNJLFW7cHGg3HsvGlzdFJHsOWLs3Cndk++f1IIswtfqUgZS6CNr
         sO3iDPSS4+3s4k8jo5sPygMpVp71oRwjtusZ1ln3gqFGS71oQQWJf0bRoYCzTQGh1enN
         Eg3wL9Rf2+XCM/OwdG/52h9TXwUUOO+VhZUOFwYu94RilXsufY9NFC/FxQGaPce/tbDM
         RR/0IZCmc80IabGXntp1I6CRHX3WBhamT4mOm4mZ8SovaHfPJ7eNHv4dTfWOlAdvPFgP
         5es6r0dpWmQfnFCfEozYatORO/gGhhyP7PeUm4PCm2xtWMMiZjCLN1YHKSxPxFog6hSd
         POSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753119; x=1796357919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CL6xs8cKi6Bq9wajebfhqMFr/A7HA2GZnRELKN8R1fE=;
        b=juwqj7yPcprHjGUuPVrCK2gYPrqA/ABiczumVA/GNxt6lPK1uUSNhzHC0FahVY0ZES
         XvDBpitLp1gvIgdyhAoBuh5Mccw1K9fxE8amPI/jNtqmwV4oheHmKig/tw6P5KS9NmeG
         s5lAVIIlRFOK9lJXvmhxNJW1Wytj5VnFTQnroQPq0jym0jqP8tVWz/ZWIIxV5YQ9T4NF
         KJGtffzyeYNFRQTMm5gavsnD2GtwENtlvXkRwU1ae9uYOI+8b07vpRML4cbbPH+h3fp2
         LoZ2ZHtfbnlsQDgkCI/HIfLHUWEhK7ImWdrtM19OT1yFKfIraIxQi19YUoE2EDnEcAUW
         wruA==
X-Gm-Message-State: APuU4Z8Qbga6a4PNzGxBXxz4VT+ZFNkh+QDlLgDiYuqXSEVo9nGqBM+G
	nNP+8GQZfrnEvydGNxbxKebVruGysq2Ym5E8ePEjDPntbjJoEgfDLg43hPuGbHrV
X-Gm-Gg: AZFdTZceqCEkfaoiwUfkMGwkW4cFfeWop35vFTXhhFBgJAbXzhDLHI05ZtvEkx/LjLt
	b/32FV5AKy5YlGbvK4jiPu1+IQ5eXK3aFXLa9IbV2x9m0qe7QCJoFgoM763eHGhN2PjkkvR163g
	SPxjO9Xo/bUY17WIleCWrG/qOdkf9rrsOtd04TcSSlkjE7jrhYhxEkuYGG9qrOsO8/CAK6sgfsz
	GCT1teFQ5CMzqKEx9zBvxlMTCKUpsieWVCHES9LTitXMTTMz21E20qOs85jTHHqBc40g84930hp
	y/iHm9hSvSbJh8wJSdjxfoFZdAtcvIS4ZjBO7cnrrf6n0rhndUnrHhrNu3x7/p9iAGtrBAZtjdU
	EllynD7K32Z5tz/0sl9vgCKWtdBM845/1WWQwJiptDwaoatRkEyH7HxXaXad2dIfnWNdyiy/ADy
	p6NVbO8sBTYwTmG66i9dOp8B76qSsmEpYQQoPkksQrzIW+D7jc5R7IQnGWoyohLlKSuGEGJWhi/
	T8J141BSoVCzdu8Unr/QC+xD1SwZ4csjsCr/RNUIo9vrTJF8z4uXuij5knXp4cbPLL044VpyLhX
	N5maCoN1v+KYSIkG8zCYznliQJZXp5LDZ0AJuhZUeBMgvfbw34Gl5yH9a1BCTOIFf+4+0rc2A2R
	2M/hPmHyUZKKdrOz6i2PTqDI8O3WuZRB6mLKWnlDZOxaeMv1iwWQA+Dh6QSTh8c/m6wYY3svkvz
	KSMjMUHPwWLqo3Z0cpKshBfCtIkDI/gZirhFsK3czIo6Py4C5pGmyHH8LU4M/dw5jjUdohnOm53
	zC6a9buzKjp8gA5p5JzCPLYeT0sq7dPBo/48JVYWXk1DizzQZLgQ1sqiVRZmusASRIjm+HG5R8X
	OM9xtw==
X-Received: by 2002:a05:693c:65c3:b0:386:e9bb:d9d3 with SMTP id 5a478bee46e88-386e9bbda7dmr1784840eec.28.1795753119298;
        Thu, 26 Nov 2026 20:18:39 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm56941116eec.25.2026.11.26.20.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:18:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 09/15] tcpreplay: upgrade 4.6.2 -> 4.6.4
Date: Thu, 26 Nov 2026 20:18:21 -0800
Message-ID: <20261127041827.1778052-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041827.1778052-1-khem.raj@oss.qualcomm.com>
References: <20261127041827.1778052-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133297
Content-Type: text/plain; charset="utf-8"

- 4.6.4: require --user-dlink with --dlt=user to avoid a buffer
  underwrite (GHSA-qqfw-8w7m-fmxx); set the L2 length for Juniper
  frames with JUNIPER_FLAG_NO_L2 (GHSA-vvvj-v4jv-xqg8); apply each
  edit once with --fuzz-seed; reject negative IPv4 prefix lengths;
  tcpcapinfo rejects pcap versions other than 2.4
- 4.6.3: fix several fragroute, tcpedit and tcpreplay-edit bounds
  checks and leaks found by OSS-Fuzz, AF_XDP over-read fix, and
  --dualfile captures must now share a DLT to be edited

The recipe needs no changes. The existing patch still applies without
fuzz, and the upstream check still matches the release tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../tcpreplay/{tcpreplay_4.6.2.bb => tcpreplay_4.6.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.6.2.bb => tcpreplay_4.6.4.bb} (93%)

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.6.2.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.6.4.bb
similarity index 93%
rename from meta-networking/recipes-support/tcpreplay/tcpreplay_4.6.2.bb
rename to meta-networking/recipes-support/tcpreplay/tcpreplay_4.6.4.bb
index 6896a2b6da..70456e7b22 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.6.2.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.6.4.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://github.com/appneta/${BPN}/releases/download/v${PV}/${BP}.tar.
     file://0001-libopts.m4-set-POSIX_SHELL-to-bin-sh.patch \
 "
 
-SRC_URI[sha256sum] = "ac4cbc58b4121edb273bc7d4603dfd6a762e7d344981233c8a253425d9dddd8f"
+SRC_URI[sha256sum] = "2cee57d7177fa50f56dd414fb666d9135353d6d9dd59711378966d8e125d4008"
 
 UPSTREAM_CHECK_URI = "https://github.com/appneta/tcpreplay/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
