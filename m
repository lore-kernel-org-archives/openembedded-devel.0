Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id A27B76C5D5
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Dec 2018 19:13:56 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id i12so5220295pfo.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Dec 2018 11:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=K0gEqgAOBSKquyEtpfrS+ZhKDsRtM0WVCOjp07UlGeI=;
	b=edRokDig4nz+r7oQCD2aBsix+mu9wSqIbDrmEsCpGWCv7I9/XbfjmH+5t9nILjKk/w
	FBPY2lStFNTxj8a62+0TqY10wMBAG/02KAkpVGvzQ9Y387bgxm5DOToUtYTwc3ER4x0I
	jBvcTRh7VUYYFMISPRT2sbohTG+HU1ERTL/d/73Vj7kqVQ/Vb24o/5+sEaf13KxsuyVh
	6dEJMv2jZcQJUqrwwpD4tCYLfB5eirEwi6zr+Gij9NfHlL7KOrDSKwOKQytPu/0WMrlr
	76TpTkJuuebVQbvxw2uDEDFQgvFr65A4+9acOsry1Y3w37ncXEaXFjROaRlFjZ7U718r
	IsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=K0gEqgAOBSKquyEtpfrS+ZhKDsRtM0WVCOjp07UlGeI=;
	b=EgRIb61TffFfm00W2aUjmbrvz1GhD1v19WrVyeSxBzG8vWY0J9wVG13c8g6SboSDye
	BlUKbxBoctQRiLRv1UbE4AiGyzOlMaR+/vNWqTCSJp9y86xVxW4VzIfXucXQ3f2tTWQZ
	MK8/IemPGEDxhWFlZjGAZrc/qUrT5sv8R7YXF9FOc5JeXlsvu2IiMAHmf6kq6HFL8Mha
	fdFNUbB2qzGp3RBUh0cb0GGA7+FIhzcpffsd5BcW2WOQ9wzI90QkMpDGJAp52e229BpB
	gpN/mtARW/TK9VjTXwnNENGwieyRm1Z+O4BgBNE+WOuh7tM6+KxhzRbOM33iwlFXKCKg
	hg1Q==
X-Gm-Message-State: AA+aEWamtq7oLubh7aNNlPP646w4cZ389gkKATmVFVFkUzs87boxAu0r
	wJihwwtXLbmBM/3PD2U9/+TaogG8H+I=
X-Google-Smtp-Source: AFSGD/UaDzK8WKzyOhYu1cmb+cK0nvlzAFXQ9dxKQfq+SvvxcmZE4wEAa5gNoDjlF6iiHhrSj8nLqw==
X-Received: by 2002:a63:ed15:: with SMTP id d21mr10973347pgi.305.1543778037376;
	Sun, 02 Dec 2018 11:13:57 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::26ab])
	by smtp.gmail.com with ESMTPSA id
	a10sm14367152pfi.138.2018.12.02.11.13.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 02 Dec 2018 11:13:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Dec 2018 11:13:46 -0800
Message-Id: <20181202191346.15104-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181202191346.15104-1-raj.khem@gmail.com>
References: <20181202191346.15104-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] packagegroup-meta-oe.bb: Exclude from world builds
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
X-List-Received-Date: Sun, 02 Dec 2018 19:13:56 -0000
Content-Transfer-Encoding: 8bit

It does not parse, since it has many unmet rdepends

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 08b4bbfc48..2d24653b1d 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -1,5 +1,7 @@
 SUMMARY = "Meta-oe ptest packagegroups"
 
+EXCLUDE_FROM_WORLD = "1"
+
 inherit packagegroup
 
 PROVIDES = "${PACKAGES}"
-- 
2.19.2


