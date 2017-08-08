Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1DE62777FE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 21:38:38 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id y206so4715467wmd.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 14:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Ki/E7FxihGGyy0XxZsCraKzHxicvnC9R6lwb8AjzpLg=;
	b=hoBIexMXSrN1kimxEPSD7vjnoD+lLwooIccCBr+y3Ov3BIxENEKbBpYEqkR4NSfXsf
	vgBD5z0G2YX1CI8ffcio+BxOBh2uq+pXwyojfufW6YYop/TSN0CMUJn+ztHjHJyNDpwV
	PBKe1Bt28VjGYJegi19cmTzBI84y/CAEhQ9PGkJmhhQ1vOrfcO9Dt0Cwl8F21mLimw21
	jr2FZ8L8lul0eolhE1WPkxnpqxI8T3YFbGiqShDNopEBauXJa+Ptfcy88E8EZP+bL+kS
	lF2/fOlLlsCTpb3uwBiUjVPhiyRNn0q5zc/pQmoAza4d2ocup1MoYIKbkGwptcz+l75W
	wLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Ki/E7FxihGGyy0XxZsCraKzHxicvnC9R6lwb8AjzpLg=;
	b=WGfnOeaj4ZMsk6fLg/VlntafNdcUB3YWrqwig2+oeOZIgzfca0xihUf/EB4HfJYMcw
	Kj85RqfXzQ59erfznD7XmFvEHd4WzUHkOAf0lepMnQ4K63V17390aiNu5+iT6RtoD/fK
	O9QqlNlqXOu9czcuRACBCNv0i6HahoL7+p7aXtK++8kht1YIr3YJbD7kvx4dAZZixKTA
	3Pt9Nrmf5s36J7J0pZEItlkhDCrNIcMOrdmu63waLUPEUTragz9KDNcOmUqS36V0+Fi2
	m2yFZjE7PA98UG46Wzuexl/AxFKE8MAoIQW2+ZOOC76+HWAgIn1Ke3Micv+D/jDfbBmh
	sG4g==
X-Gm-Message-State: AHYfb5gBu6rP1V+tHMF5AoHZiQwx0vCetepU29QOq7IOMGPQFGC53YXE
	TzLY+pYnpdfvOCM8
X-Received: by 10.28.216.66 with SMTP id p63mr4331022wmg.17.1502228319108;
	Tue, 08 Aug 2017 14:38:39 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E90C29881E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e90c:2988:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	p68sm14587855wmf.0.2017.08.08.14.38.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Aug 2017 14:38:38 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 23:38:18 +0200
Message-Id: <20170808213821.17561-6-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170808213821.17561-1-schnitzeltony@googlemail.com>
References: <20170808213821.17561-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 6/9] xfce4-xkb-plugin: update 0.7.1 -> 0.8.0
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
X-List-Received-Date: Tue, 08 Aug 2017 21:38:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xkb/{xfce4-xkb-plugin_0.7.1.bb => xfce4-xkb-plugin_0.8.0.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-panel-plugins/xkb/{xfce4-xkb-plugin_0.7.1.bb => xfce4-xkb-plugin_0.8.0.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.7.1.bb b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.0.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.7.1.bb
rename to meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.0.bb
index 2fa1634..5e62c03 100644
--- a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.7.1.bb
+++ b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.0.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=496f09f084b0f7e6f02f769a84490c6b"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "2f68e0d53baf68ecc1a7165ad33c26a9"
-SRC_URI[sha256sum] = "61fe2e33fe99939d5d06a682e94e40e05ef844c930ad612154090d158b2ce681"
+SRC_URI[md5sum] = "e4e897741ebe2827192971c2aaad835d"
+SRC_URI[sha256sum] = "3b0d3b9f4b7c3e3e7be668e2f7c845b89b16e0ed3db2bacb544a17272682ced0"
 
-DEPENDS += "libxklavier libwnck librsvg garcon"
+DEPENDS += "libxklavier libwnck3 librsvg garcon"
 
 FILES_${PN} += "${datadir}/xfce4/xkb"
 
-- 
2.9.4


