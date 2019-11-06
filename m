Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id CB2DE7FC0D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 20:54:15 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id e6so183454wrw.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Nov 2019 12:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ai0viyfDTMYgPJZ0EbrwBiyHpaIMLfn2lFBtAeDktwM=;
	b=KoM854T+J6tKbMi0LlmBC3hE+5h6SHsw4t6+jkEf8qogmH4wvCOn6/hzkXtJ6pr7K1
	CDLCriB414ffglM8QGKOCAlyV65BjCISqWNKXw2TMKnQq/HFq5KTGkzges6c9zJG5wDo
	zoz3eHBcyanMUgV55cyURb00nF6AM3IzaVXwEYDjLI93AHfxrHZfJQabS9aPXQfrxas9
	yQGSwhPRLM0Sm+NkKWN3rWycmbHBE6EZzxOer5Y4nD7tCZmh6m42lUpv1HYbTw4mQOzD
	jxiDxqIRgRteCXt5vzkIoJAk6lWJfvruLBvxMRMIP6xWtSMh807AF38iU5VuInAF073z
	Navw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ai0viyfDTMYgPJZ0EbrwBiyHpaIMLfn2lFBtAeDktwM=;
	b=VhK/sTklqvfMzIpT2YhvYuh+dqBsQ23xsXpqag9m3n9wm5IWD40mJwhbn7S/DGN0X5
	BWWTY9XIitPQkz0NlWjq7s6JEFfJPlG43QtSBXMlK4Kjqb1NPAJdz1/K6K0dNNph/aRU
	+4ixmq1qt8lyLvEFxOnwAWAumVtTZBXnEV1psx+oWdvnEH66EEBryvfI3TOzC/cEwGuE
	Swgia1QsjCJ1/m1bEMCq6nBiOKn1MjinmAZ/IJaGnndCEXqtUUaENhyjLFtqGlzIM6nq
	3NjNEV/vizCQnfd5gxp/Ve2p0K0xrQhfbNGcpnsuG1cI0rHbLbWR+W6WUComKAyk3GxW
	P3Dg==
X-Gm-Message-State: APjAAAWy5AtYnZFLaDMvxmMfNDi7qJKOZJJl67cLI5QI6OM8IC/csTds
	NnBNpJFhfCjYX1lIiGoFSzXIg9wi
X-Google-Smtp-Source: APXvYqy3XgXV8BkbrJlwUebPRsFQKH/IBS9Qq9pidOc0Prv1ZOrD2cm4mtB4v7Rg5wE4UqCKoocWHg==
X-Received: by 2002:adf:eacf:: with SMTP id o15mr492543wrn.24.1573073656121;
	Wed, 06 Nov 2019 12:54:16 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F438C581B49BA34826387FE.dip0.t-ipconnect.de.
	[2003:f0:7f43:8c58:1b49:ba34:8263:87fe])
	by smtp.gmail.com with ESMTPSA id
	i13sm17699440wrp.12.2019.11.06.12.54.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Nov 2019 12:54:15 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	zhengrq.fnst@cn.fujitsu.com
Date: Wed,  6 Nov 2019 21:54:06 +0100
Message-Id: <20191106205407.18957-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH v2 1/2] Add gnome help packages to image according to IMAGE_LINGUAS
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
X-List-Received-Date: Wed, 06 Nov 2019 20:54:16 -0000
Content-Transfer-Encoding: 8bit

In case

* 'helpfiles' is in DISTRO_FEATURES and
* PACKAGE_NO_HELP_SPLIT is not set to '1'

those help packages matching language selections in IMAGE_LINGUAS are added to
image automatically.

For more details see:

[1] https://github.com/openembedded/meta-openembedded/blob/master/meta-gnome/classes/gnome-help.bbclass
[2] https://github.com/openembedded/openembedded-core/commit/3a9e9585aeb67234901b2f842113dbe20c3801b3
---

v1 -> v2: Add IMAGE_LINGUAS_COMPLEMENTARY only if helpfiles is in DISTRO_FEATURES

 meta-gnome/conf/layer.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index 862d622ee..d381fdf07 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -8,6 +8,9 @@ BBFILE_COLLECTIONS += "gnome-layer"
 BBFILE_PATTERN_gnome-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_gnome-layer = "7"
 
+# auto-pack gnome help files
+IMAGE_LINGUAS_COMPLEMENTARY_append = " ${@bb.utils.contains('DISTRO_FEATURES','helpfiles','*-help-%s','',d)}"
+
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
 LAYERVERSION_gnome-layer = "1"
-- 
2.21.0


