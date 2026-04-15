Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 901DEF42113
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 18:03:19 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.517.1776273696937387158
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 10:21:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wbinvd.org header.s=wbinvd header.b=iaD6pnrD;
 spf=pass (domain: wbinvd.org, ip: 209.85.210.176, mailfrom: calvin@wbinvd.org)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82a655cfab5so5756271b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 10:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1776273696; x=1776878496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Iav/OyJ/W67tQDDh1fpN2U504LXPQIkJFFrM3HDXi0=;
        b=iaD6pnrDlF0xI2sBBM9CnSG6NMFo2ITG51xOWI3YoQwdvkWVg3rRgR33qb4CBmDSCS
         voTpNr+BOVS47OxxWqfaAKjz4LdmUbYHmGbXPSlUB64IJe3+1gBR2DJHTANoTbGS0o4I
         1K2XMSlsBfR3rUGR9J4nLla4pFl+YBiBXRz9PLUUXFf4s27qag8LkIXzmpzOcCK5X17A
         2A/qKlG1tv8lFo1osUaQbp3bmOb31ZBBdg1hkIuCS/folGNX/dTCMklTFkvO4FGGsQDq
         Yz6ekseM/gxBo3bWR9L/uIbhEK+swAIhshtvomr276318OZQd+ALkyJKUGT6iyJX1FRF
         yYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776273696; x=1776878496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Iav/OyJ/W67tQDDh1fpN2U504LXPQIkJFFrM3HDXi0=;
        b=GPKgt7ETszdjYwk7IJUeKWk7lqmbZBqhclImzODCYzJuNwRcGtDtHfY2bS8vs274YK
         5eYI1yzZWkaa+HXKrdm8KEzS/4vynsv1EoqFwq3PydirtarDPbVDryvLqIJYVp9yfI9W
         B8wNn7POcSfpRP/7bOSvawCK1ibuodPvPyVLPwkRFKh4sm/v7JLudeWJ07WlcFPqGhp8
         BVvFLF/NH7hDMzX4iXOCHKi3rDVG2Hq1LZUhZg9HuHubzdiyN7La119Iqfz3KW6EM1zb
         ZBjohmk38Ftik2GpKfbcPlQxtjTqCjOanqXpotdEBnzlHDGya68JY6wd0Kl6qp7yapat
         62Jg==
X-Gm-Message-State: AOJu0YwffuWjQClzx3ufIKOo4JF1YWChM1x9U28nQxFA0DBMS46dg/in
	HrEp5KELcwGo4gsgwS7p7+48yKl5olaDzMilURnabGjSwXOkNBdDTkpqnOc3Zo1CvPj1YpcacRu
	7y2Je
X-Gm-Gg: AeBDieumEDahTzeBKr121DanL8dLCskMXn3ZWMUS1wNA0viuMvHDfoVem7dp4C+z0i0
	JLuecW+m2ZAAbt8sG8LSV0YLEBAU8jqgebs13h7+JK8RoxFOEGkmSM6MEu7shtZZ0DASrA45IdL
	hEyy0Nf2RQn7MKbdKXhEY1e6+0cAjHRG/Ic94wiwach0vYnrwvRvEOEqhJ6apHhNGCOGJAroAoo
	WECTMh39v/tRdtDr/kya8cE5d0qdQQSqR4rHcw4BHk7sOdK9OiZWcxOGx7QrW1+/nKXOOXNKS7g
	awFyUJ+BaxORwH3zj9QGsVLVWh002KUJX5fhjVXdtwJLnj+HNg8JBevbQLtmAYlLkBElH9G1UgP
	5Z6Qb3tvVE3gf78e/wM96Cwm1A4Gao9whhMUj6wX+4cOkBRmon4Z9dH/9sjnOQyao6tUrIQHmp6
	wbO4rLALdtXfUCnXH96ibQJXsTjg==
X-Received: by 2002:a05:7301:7c0c:b0:2c7:2cac:8123 with SMTP id 5a478bee46e88-2d5863806b0mr12072308eec.4.1776273282101;
        Wed, 15 Apr 2026 10:14:42 -0700 (PDT)
Received: from mozart.vkv.me ([2001:5a8:468b:d015:4408:1d89:c0da:7de7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8c50cee8sm3647589eec.7.2026.04.15.10.14.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 10:14:41 -0700 (PDT)
From: Calvin Owens <calvin@wbinvd.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gedit: Use gitsm in SRC_URI for new gdlib submodule
Date: Wed, 15 Apr 2026 10:14:31 -0700
Message-ID: <3a59b53e992a96aa12697237eded7e1955e311e3.1776273056.git.calvin@wbinvd.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 18:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126368

Upstream now uses a submodule for gdlib, so the build attempts to clone
the submodule over the network and fails. Fix by cloning the submodule
via SRC_URI.

Signed-off-by: Calvin Owens <calvin@wbinvd.org>
---
 meta-gnome/recipes-gnome/gedit/gedit_50.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_50.0.bb b/meta-gnome/recipes-gnome/gedit/gedit_50.0.bb
index 92685f085a..d15ab8665d 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_50.0.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_50.0.bb
@@ -23,7 +23,7 @@ inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk-doc get
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI = "git://gitlab.gnome.org/World/gedit/gedit.git;protocol=https;branch=master;tag=${PV}"
+SRC_URI = "gitsm://gitlab.gnome.org/World/gedit/gedit.git;protocol=https;branch=master;tag=${PV}"
 SRCREV = "25d0bf0c3c40b0866fc23ec875f0af6c67f728ef"
 
 # gobject-introspection is mandatory and cannot be configured
-- 
2.47.3


