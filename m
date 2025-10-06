Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04725CCD183
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 01:48:35 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.web11.24002.1759715307672233789
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Oct 2025 18:48:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E5iP1Doh;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-63bcdf5f241so1844683d50.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 18:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759715307; x=1760320107; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9M3sgFCvILAukq+RI7Rc9xXZkMYMMIETm46H2FRJRJA=;
        b=E5iP1DohcDpECVL96SmSovsUGq/PgSK2bB/o3+jWpUXSGY+GrK3krN54mu8Ky4+SG/
         BwGsiZmDlts7uAkWsNSgyIIIADWHBZMgN/BkN4TYr77bKoQWHTdEsExpwrzS43WTLwGC
         Jj8PQuFipW/ygF/YlUVpM/A1r64S3U9sEzQnJ/mkCW9hXTM9sXTDUHGerOVCpvxM0vCD
         TyLo6+uRkawaDy5i8sThwORC8XwmewM0JTw1fhwVVnDt38d3gGMDslbQbNV0OM0gJLmt
         9hqYwTym1VhL2Fe/iUcA6kOWi4+9gKZKnUGQKWtn3QtR65mA+GARfSg0sKRVg7ZC907R
         0LcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759715307; x=1760320107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9M3sgFCvILAukq+RI7Rc9xXZkMYMMIETm46H2FRJRJA=;
        b=azWLuU2nAGIzcUp9SIB0P2WcMvSVquJWZHR5HKUy6UyMBh6ahcnRl3t0Wso87pQ0TH
         trjCGOGsLg0oR9Dn7t+pXr+f0ddtg8g67OfKoNiYlOr4dRYJejNRelSNFnMsZ+GtJXn7
         KjTAljD3PCRxVtOG8d6V2xEMxw7ZjLpFrvknlqxsLD3iTO889Hoj3/TDPNleklxUbYru
         UOsJBNOv+6M4tqfgsgfrMsuB9MoeI/E/hKVWqYlHP5kX8vZxltT8x3FCexvFaen/OYdH
         jtP8dFqrC/OeYEK+5YXgTAbKbytoNjaNlNk1+/qHi/rcIuogC5oUP3bq34LEknF/je/9
         7VZA==
X-Gm-Message-State: AOJu0YxOIz6bkF6c5H7A/1eDdVC+VZOTk5UhYubAXokTPAW1pVqmPh8X
	0yc19o1o2ombuwAfZPCDg2rGxh+RJDUWq62o08MQMCcQv6DEl2B/ZaygHp/vgWZ8
X-Gm-Gg: ASbGncsH3KKDm2OHLWhH3RCf0hHiE2MfY4q8mB8lSwAoj64sptZaAeMJfY3HGmVWb14
	ly00HYKCreo6mDNIC4P1Jq5vKOgyD8n+WZrHXjaYf75xWmyIFb54Am7N8ZOcPoLijO/z4kD1h5W
	zdERDgZvNDNqdlDTxvMYJU30M+emwSR+pLiKjiPk3e+yii4tTyb/IngaiYDSyTZ0rJ1CpeCOkxV
	RP+VR73HiaYVHuhLq3Xgk7VbgLCNPZHWzXIjgx2QjauRtATblkriEGQcc9UcOohzkiDYLrFeiah
	3SJ7Wvn1IwafOSgrlbWYeWxmlVJghL7pw1A4a8CAM0Qw84I3Rli/ztUU+9SqfiTE8Ql6fth9lww
	3ED4WtCzR5mCxb1IhZCbniiN0wn0/MILCa/QpTk6vPSr6+S3MAxUb
X-Google-Smtp-Source: AGHT+IEEWS0GxWgT35e6r1Mdf8/lP9ekx+0/Ke+C2CCIhWdERBEjF8X0IndZfMnsg2SaWmjs1P298g==
X-Received: by 2002:a05:690e:2505:10b0:633:a6fa:386b with SMTP id 956f58d0204a3-63b9947b94dmr9531588d50.9.1759715306287;
        Sun, 05 Oct 2025 18:48:26 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-77f81aad051sm39177337b3.0.2025.10.05.18.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 18:48:26 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 07/10] xfce4-fsguard-plugin: upgrade 1.1.4 -> 1.2.0
Date: Sun,  5 Oct 2025 21:47:24 -0400
Message-ID: <20251006014727.58960-7-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006014727.58960-1-schonm@gmail.com>
References: <20251006014727.58960-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 01:48:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120264

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-fsguard-plugin/-/tags/xfce4-fsguard-plugin-1.2.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...-fsguard-plugin_1.1.4.bb => xfce4-fsguard-plugin_1.2.0.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/fsguard/{xfce4-fsguard-plugin_1.1.4.bb => xfce4-fsguard-plugin_1.2.0.bb} (74%)

diff --git a/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.4.bb b/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.2.0.bb
similarity index 74%
rename from meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.4.bb
rename to meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.2.0.bb
index d94ccadb5f..91e8adfdb0 100644
--- a/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.4.bb
+++ b/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.2.0.bb
@@ -3,6 +3,8 @@ HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-fsguard-plugin/start"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3434d79d62df09abf5f78bb76d6cd21b"
 
+XFCE_COMPRESS_TYPE = "xz"
+
 inherit xfce-panel-plugin
 
-SRC_URI[sha256sum] = "24b3789be6de92678e7036678530c4da4b3838aa3cda428439aa8d140704a4a6"
+SRC_URI[sha256sum] = "9e40cf3ce7b34e1c27d6b442f3a067886c35154b5d0c4d644a239038611da64f"
-- 
2.43.0


