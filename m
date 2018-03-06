Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8AC8F78AB7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Mar 2018 15:18:11 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id j2so6695043pff.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 07:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=xhExmsb4NpvFBdLOyuToIDoPcAcBzniJ2ZlfPe+zJfw=;
	b=tWAx0WPeAultW3FMVSPUpCMwSCxVO8kP+wIdt5DtPaw+J7b/Bt2wWgRZxvrqYZt24D
	SaVFdQlWYMdstdQhC3X97EjMoUXqiRwnFBIzgDk7kCvvr0GK+a110+BSANvFeZ5I6A6n
	j4HKZUPPpUpVTPlcoNARjfhHBvYGvGn7XO1dfG+asli5sPQszJm0OzmQ+YRJM9Vl2ocq
	xiv16phtLHjspBF9jYTR7S6aB9ygcGg+4aeBrv098VTrDhRKgRtf17MjiSz+mepaK6V6
	vR4fmVLueef4TIpKMr5eLoWabzNHeSkNvn4VtLOsi/gbGGj52ugj06RSdpFstw+sumIj
	ftAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=xhExmsb4NpvFBdLOyuToIDoPcAcBzniJ2ZlfPe+zJfw=;
	b=Kdr506aVCdGp+BNx2SM6/lx/qtBWXhoASWh1841Z+uWtgaQxo3Ta1Z+vYqPmD3jL65
	V+UIPk7Rd2BR5d36UTOAetoDGPEntRWJiCPmDxTG64na98xBLZEWNsX5jTeAoT8XlFhL
	8zYiYzHEpijmhZzk85xXeUFrazjcGQDry22KBtlJs78bieRCdezHyzrnoi94Dvkj3BfX
	+wxUF83U2todBO8qfJzr2CR52Lyx07YT7LOA9QKCZYdZlgW+9TbK3iJt2I+OPgLa1GsS
	izXlNOeZyYn3la2prQ/X/lF+XJNtj5Ybk8al6nOBJPGRdFllNmeYlMRkCxJKl9l3CCDQ
	ogHg==
X-Gm-Message-State: APf1xPCDNi05JZKLasr1zWRF16bcySSGoTUIK1VzmbtKRhHdMZz4UHGg
	dh7qntZonXAGeb+I0Ei4iiw=
X-Google-Smtp-Source: AG47ELthz/Az/OC6+6h8y7xSR95Saxgmx8ov16eO60BR63o49yI49DKpjJklZPVGRoPDDzSi5YVN8A==
X-Received: by 10.99.191.15 with SMTP id v15mr15416238pgf.396.1520349492727;
	Tue, 06 Mar 2018 07:18:12 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:19f8:73b2:93e:af3a])
	by smtp.gmail.com with ESMTPSA id z4sm23817068pgb.4.2018.03.06.07.18.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 07:18:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 07:18:08 -0800
Message-Id: <1520349489-9063-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520349489-9063-1-git-send-email-akuster808@gmail.com>
References: <1520349489-9063-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 2/3] meta-gnome: layer.conf remove gtk depends
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
X-List-Received-Date: Tue, 06 Mar 2018 15:18:11 -0000

commit ec9e5ed06256ad92c818474cdb490dc0d3a0d0a3
removed gnome-disk-utility so AVAHI_GTK_pn-avahi-ui = "gtk gtk3"
is no longer needed

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/conf/layer.conf | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index a138818..fb89c14 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -13,5 +13,3 @@ BBFILE_PRIORITY_gnome-layer = "7"
 LAYERVERSION_gnome-layer = "1"
 
 LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer"
-
-AVAHI_GTK_pn-avahi-ui = "gtk gtk3"
-- 
2.7.4


