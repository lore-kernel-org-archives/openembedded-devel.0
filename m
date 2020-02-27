Return-Path: <jpuhlman@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 83ED36188A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 22:17:56 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id j16so780791otl.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 14:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ryb6/J6929jDFpSmY7uGp2DK1xAHdZ9ta0nF18meysA=;
	b=pY7kV4A4pdokgUsFtvYqMKiM97YifCu623X0H8Iln3LTNx7Gypvf5ebhPcTBBAtHdA
	YoPwR0SSoxmWM/nBC5LlvaHxHAgDRayN7zWimXHpcPUJcZh+wT/Mxz+ZJu573uTa0HNA
	TvobDOq/BlJfy9xxbLJ/6wu988u6bCCCPdAA8BqR0QlDf3hVZVb1f9dVTJYssAqqfyuK
	kvr7IbMp9VqG3isKziVQECtKfeEgLwlnQn807E29yuEoQJqk1fv9p8IJLnfwPE8vt4sR
	D1l+YeY988fg/n4gvUDW2hSS/cVL6XpKUW8cjbVPnP415x+cwLdMC5/h6E84epSbpPaB
	/xoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=ryb6/J6929jDFpSmY7uGp2DK1xAHdZ9ta0nF18meysA=;
	b=KJgLo4fsmtNfY7OYNQttvgYKS9wAKa+23OG2jL6ptL+7facHuhRG+HqgkAGebB+rSq
	M7WpSYPftnnwgbAHqIEX9n0ttO83z21Eq/fH4LUh5OeKKhPFL8y+CwTIvEVFfkxSp9Bn
	NfmHNdRPu7nBA5/hemSFv8TVL4fFFfbL3b4V/WXhi2LJ0iomcDzte8g68aw2M1HZ5wye
	mu1pQwGS1s3U/02PkGtDfLx95T//ZyQO9Z5SZT120e9ySgHthqTCjqXjCDykJeQ5QZ0e
	03sTndnzePAbUbC8n46WDJ+wzSTMn9VFYX7nSjysw+OBTdHRnBFE0Okpqp3t3PMa9f93
	rH9Q==
X-Gm-Message-State: APjAAAUFDfq4t8ZONm+eoS+FNcI81OMe9C8anCaTixDsE9NwHUPrjOl8
	3oT2B2QfYMBOqJCKbmvHDt2Ge5AP
X-Google-Smtp-Source: APXvYqyH1GK5XR7/3L7Om4GbrXOyPoprxcVpBog9I5hfT5HlEEI8gMkXiq0rMIQ7/6Kz0ZVaJODnEA==
X-Received: by 2002:a9d:7590:: with SMTP id s16mr787830otk.89.1582841877217;
	Thu, 27 Feb 2020 14:17:57 -0800 (PST)
Received: from workhorse.localdomain
	([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
	by smtp.gmail.com with ESMTPSA id
	t22sm2434186otq.18.2020.02.27.14.17.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 14:17:56 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id C17B22A05A0; Thu, 27 Feb 2020 14:17:55 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2020 14:17:48 -0800
Message-Id: <20200227221748.8856-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] netkit-ftp: clean in configure step broken
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
X-List-Received-Date: Thu, 27 Feb 2020 22:17:56 -0000
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

| DEBUG: Executing shell function autotools_preconfigure
| NOTE: make clean
| (cd  ftp && make clean)
| make[1]: Entering directory '/project/tmp/work/i586-oe-linux/netkit-ftp/0.17-r0/netkit-ftp-0.17/ftp'
| Makefile:3: ../MCONFIG: No such file or directory
| make[1]: *** No rule to make target '../MCONFIG'.  Stop.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb b/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb
index 65c20c072..cf306ec82 100644
--- a/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb
@@ -18,6 +18,8 @@ SRC_URI[patch31.sha256sum] = "4edd46a32d70daa7ba00f0ebf0118dc5d17dff23d6e46aa21a
 
 inherit autotools-brokensep
 
+CLEANBROKEN = "1"
+
 do_configure () {
     ./configure --prefix=${prefix}
     echo "LDFLAGS=${LDFLAGS}" >> MCONFIG
-- 
2.20.1


