Return-Path: <jpuhlman@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2E4326114E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2020 22:39:42 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id f8so3365plt.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2020 14:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=f4Can+rLnre410ybiEeRAoYYvPcGwqpOqxUTO0kNx44=;
	b=rQiLNSiZb6eO+xZAEyq7LvolrKabm+UXp/jcXD1GLyYo5cIuISE+XlZRZl/iLhcmpR
	WPh++5LEMkG9+5ZlpK4CHXzhTSL17ntz4+iAidkH22j48DThRjEd94/FNqDL0jDKdIIf
	TNXESRRbDHEZALuNIUuDKc22ixXzU7B81D7GY2XCehWCyBZyNkBO3qbXsPvuSBkM4RdO
	TAfnO65mMUAxeN3sHNl7BsArE5Ze49lOU9BT4T94T415GelerF4ckxFwt4eO5IhoQhh8
	wRt8OA+MAbuxCJ+GAv5Kh8pPLXed4Xr7C2zGs6Mt2oLEBUF6WP5OnjyFB0VAh6RGXkXt
	ffZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=f4Can+rLnre410ybiEeRAoYYvPcGwqpOqxUTO0kNx44=;
	b=esZ3N4hlAsjZDrcX6R+1fpP4nkzVlW1YuSMVcKubSO3avIFvNbqbkGYlPekMxY/mec
	4D9a1LsV6RWmhncE3vM7lVwDbVHiRaID6ELhpwqmQQsJKQ8qx5Ay2bJoheV5brSvMvCY
	KRgKdqMud0I6qBVpik6pVBiCqDydZSaCJS8m6Hp14aUVFhyeEkaIv7T5TtONDF9MPpcV
	p9VEgGcH5r1GBGOj1k1MMzqrozpBbZxRz6ciPjH9s01RD8U4Hystz5CID0qCy2GcnlfF
	K0Q5sopBfWOlCy9tT9zL2sI5HTVffZNeWB6jhrPd2b6k8BANcdPY7xNKRPQcV1eAet/z
	CJBg==
X-Gm-Message-State: ANhLgQ3cc6xkEEWEWrCr7oHeWbSoIrvBeGolAuu7tZVx+ISAkgw5j9zj
	1xHSEECT0g1cOYmz4mFfn0WpLeBr4DM=
X-Google-Smtp-Source: ADFU+vu0oV5P2FlCD8aZbUHvdmyURXIMdr4EdxXjZ50b0J6qqHxUONtbaYCvZIpMpI6hNA/b/T9m/g==
X-Received: by 2002:a17:90a:1747:: with SMTP id 7mr375179pjm.154.1583447983014;
	Thu, 05 Mar 2020 14:39:43 -0800 (PST)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id a13sm936442pfc.24.2020.03.05.14.39.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Mar 2020 14:39:42 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id B6C152A05DF; Thu,  5 Mar 2020 14:39:41 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Mar 2020 14:39:33 -0800
Message-Id: <20200305223937.12418-3-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200305223937.12418-1-jpuhlman@mvista.com>
References: <20200305223937.12418-1-jpuhlman@mvista.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 3/7] libdnet: make dnet-config a multilib_script
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
X-List-Received-Date: Thu, 05 Mar 2020 22:39:43 -0000
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

Script encodes library paths.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb b/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
index 5b6e45c7b..5b27cfe15 100644
--- a/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
+++ b/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
@@ -11,8 +11,10 @@ UPSTREAM_CHECK_GITTAGREGEX = "libdnet-(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
 
-inherit autotools
+inherit autotools multilib_script
 
 acpaths = "-I ./config/"
 
 BBCLASSEXTEND = "native"
+
+MULTILIB_SCRIPTS = "${PN}:${bindir}/dnet-config"
-- 
2.20.1


