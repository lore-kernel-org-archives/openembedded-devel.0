Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ6LL-0000Bl-Hq
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 19:05:33 +0100
Received: by mail-wi0-f171.google.com with SMTP id hn17so8145255wib.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 10:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=sakGhZ1XRge3jn6hICiJp9qYKNUKAoeMyHBrUhMVxLQ=;
	b=Z2HLmfwRgoOPtlXFRgOzjPZ4ksrZaSTwGgG4xCJa6O4VPSYobzdFNigE4/x+q/+v9v
	HnLxqhUOvpy6+AyU1PLP9JZdmCNLlb9jza/u0CPvB0NpniWecmVnBGJNTSig09xMXkZn
	HScI0m/aMJv5lk/Y+lhV79CvW/ZpyeBmqVfmvVLkm2HBrmjlCi5CphMmM7niB1HYwf5L
	LSp6MiUwkdwJatYZZEPTYdiz3SE7FBzFxW+F/wSClpUsc4Lp37UpB6npcxk1p8jASWpa
	y9rZbx/ZP20voZeVEbVeZlmk+R10prrYjM3LHy7OXjQ8OPC373yr8BzXJEE0Ub0o3W82
	R21A==
X-Received: by 10.180.185.204 with SMTP id fe12mr4680366wic.2.1363974119182;
	Fri, 22 Mar 2013 10:41:59 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm12260880wib.3.2013.03.22.10.41.58
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 10:41:58 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 17:38:42 +0000
Message-Id: <0e1da1e227c8e52087f7a52f8501a81cd28e76c7.1363973088.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnvRW/xxui6gyc1/I6s8x06iFugxnzcSOGOfGMJfnR+WacPLk3r6oK3kZaYrDFyZh5KoYz7
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 22/22] systemd: recommend systemd-compat-units
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Mar 2013 18:06:16 -0000

These are more than useful as they ensure some services are not started twice,
and cause the first-boot postinstalls to run.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_197.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index d07fa95..5ba3a23 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -180,7 +180,7 @@ FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ $
 
 RDEPENDS_${PN} += "dbus"
 
-RRECOMMENDS_${PN} += "systemd-serialgetty \
+RRECOMMENDS_${PN} += "systemd-serialgetty systemd-compat-units \
                       util-linux-agetty \
                       util-linux-fsck e2fsprogs-e2fsck \
                       kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
-- 
1.7.10.4



