Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11474.1795005044396892234
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 04:30:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=HaPqCb9f;
 spf=pass (domain: konsulko.com, ip: 209.85.128.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so6407575e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 04:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795005042; x=1795609842; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUefm0Cf7n8YC2RpeUQcrg93vor2Dw+XdlpqTXJnjHY=;
        b=HaPqCb9fDzwBF2S/+WoMEJBvBlCPJ7czEwuer3N/4AIjfapEtRxz4g928UTV3eDdUr
         Z9im29bKsUPDUYUW2UQuoyq4SqFuZqtzvWK5ZGl0kyYWg5YEG3/nH+ooN/RVndg6oVth
         fii7CdFLQ4ctFQJMGiIud0/zjULm01mQgoWAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005042; x=1795609842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CUefm0Cf7n8YC2RpeUQcrg93vor2Dw+XdlpqTXJnjHY=;
        b=iyJA4gFc+ScdI5ZNIqWnD7cRNn4EiP1vJIlKdLdx6ukNKMbzYtyQXUod/9/KAlXgXg
         x5PbydEIDGTL+hJy2w5xkKRqV4EVb4vTm3dK3OM4TaRFoJWheYkOhTqJHX68mRbd11eI
         1Z5pGOY2v63rTi3xq9HPe/zgqHR+c2iSKQO2tSX2KEG2752pwfHpMFcLgxQ97J3G2wiH
         O8f16Pg0h+XIyXBmy2s9HcqRyJH1dNWHoBsCAEfkj3tiWZbF0fPkdN/SCV//XsbVY+yi
         Ra9Gsr+n4OnuGS7RTVqtLHCk+7qJcxu/wkzLKaWPdJJh0/T2aWc3UKWaBD6aj//hq7K4
         /ZPQ==
X-Gm-Message-State: APuU4Z/0/YkXXxJyVYHgmKZV8qUWtVeO//rwrRSFQYFUjCVO/0K6eeDp
	sbwKdLNWx+FjTvGJvdCxnWLX5dbFnjzXptT0ozPqJ8zQ0qnr2VO02lILvKVsXOweb+UBo/T4bF+
	XD6lO
X-Gm-Gg: AYBFou2UJTRQa0SrltofFK6xu2lY0+Z31JTRJB+TQ5TZxNlLgN+C2cgVVCN2b2biFF/
	U7l8rQb5VnToHcNFk6U3D61mKopdmvMnbqntbYytt01ocvk/AF+JBd3d06GTAnyQw++ns9XuTwj
	T+j89wy6BoyHtNfmmKBKDHkSV2ctPkvR5nL/lJI22XSlH2yfdXVShUh/e1liYs+xoiduJ+dDJAS
	0cVztJy3I8wVmaOQDmF9HNX9Zr5O9lSvyugHdwZEtbwXgERumi0i15zn/c7DaedGuYEamY2W0GU
	EIWkzuhCpLciHu/2JbiZdUln0vkAvMJqm5rQ8/21a7XR3U//I6I2PIcB7o567VA7oSeOW/cJxZE
	LcLKVJ0Fvt4CVSKY6Suk3QQsLXT2C7JlHsH2i13Mx8wY0t/zORgqc1A5EUvFU/Se8InFgkZxHN1
	RSM+jrAYVeLNDoyByQQaPdepSBHWbBIrIFgxRHG8PCziLyEGicbbShxOUqm6piWZXWSTI+JNWAm
	iLdjidxHXwnKlvrUqzcXqtAApGl0OrfxeBpBMAu+wR/jEgHJzkEXDS51uDQZGlOLTyinGL5drAz
	OtoCXbKCVuux7d3YiaLaCsE0NkzNbAvDWfAEGAfubAEcWDjAYjgn7kjdZh6RHLQUS2kNdZTwajI
	SkhWrMrBejGQDlHUPCQRttRuwGbivMudhzbvNuxJJ0UtNygBbYd3GyQ==
X-Received: by 2002:a05:600c:1d06:b0:4bb:6a5a:783d with SMTP id 5b1f17b1804b1-4bb7da25158mr46033365e9.18.1795005042628;
        Wed, 18 Nov 2026 04:30:42 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78346f4asm152248385e9.0.2026.11.18.04.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:30:42 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-networking][PATCH 2/2] meta-networking: README.md: Contributing
Date: Wed, 18 Nov 2026 14:30:38 +0200
Message-ID: <20261118123038.908150-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118123038.908150-1-leon.anavi@konsulko.com>
References: <20261118123038.908150-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 12:30:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132652
Content-Type: text/plain; charset="utf-8"

Add a new section "Contributing" with a similar text as for layer
meta-python, including a git send-email example.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-networking/README.md | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta-networking/README.md b/meta-networking/README.md
index f8337b0c5b..b6c4e98063 100644
--- a/meta-networking/README.md
+++ b/meta-networking/README.md
@@ -30,6 +30,20 @@
 subdirectory: meta-python
 branch: master
 
+Contributing
+-------------------------
+
+The meta-openembedded mailing list
+(openembedded-devel@lists.openembedded.org) is used for questions,
+comments and patch review. It is subscriber only, so please register
+before posting.
+
+Send pull requests to openembedded-devel@lists.openembedded.org with
+'[meta-networking]' in the subject.
+
+When sending single patches, please use something like:
+git send-email -M30% -C --find-copies-harder -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix='meta-networking][PATCH'
+
 Maintenance
 -----------
 Layer maintainers: Khem Raj <raj.khem@gmail.com>
-- 
2.47.3

