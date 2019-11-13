Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 42AB47F827
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 22:58:24 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id h27so2346512pgn.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 14:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+ju+pAuYEjyQraAGQ+HqcWky/H26e6SOmVIZ+bw6VqU=;
	b=sLVn5YyCZLyvLHkpsaQ2Skxc87IZaHDnfK6mEKR4lY1k9fSrwLP4gpcAQkHFeNXjXO
	dj9PQYEIe94skyxBVtN17AH0E65qFbbH4XoChHyVY5A5VHyQmomzGOJS0Omy/flrEGFr
	02xokJQLuhDxegneCiWhtdaGXfAdRhCOpQjC7tCe5Ia8j5j1tyXmkjbDSJct9HE0NlX+
	Q67jqFBvUUqnLfYFylso3pTcPNPpn/OuHR3GpiGIxmzQa5WW9XUn2x0RE8mS8rgi2x4h
	A/6lQdBlVocqqvUQACqrX82K8o2syU0hgW9clTd9VmNzTUmkBP8KDk/GIaIsXAgJ2jp6
	ahuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+ju+pAuYEjyQraAGQ+HqcWky/H26e6SOmVIZ+bw6VqU=;
	b=HlSN2UPTZcEjB0mefUy53IczfCqQSLYRTG7Ybtj13I/5DkJX64j0/LHf/wz/WGc/be
	ENL7H6kHoY0ogR6GxYpDwmwYFRwhPN/MUb8TlX7BFQNIFpnDwpvbFW9JG5yUtiuVeoV7
	Nl/E9b7BmC6LnpZicgC+newLRbBuE/asv7pyiUxKPghTIltdAXf0uzt4Plr/2U69oQsF
	9ZzY6kWPwqn3E+awDfW7ZlwMokoopHOabZdSvBOUV0xTPrBoJ5BTVBLoDnpEXwzDUG83
	Y66I6VTSL4slVy00/wplRUodONFkb3ua4llceuCeoLWk15qgZMNXN7w8zVuznOxZAthg
	PhRQ==
X-Gm-Message-State: APjAAAVaDrp//RAfrNQXLvhv8QMklzVKQGbM0RdSCBmfrLagAg0UtFDf
	sCAWAme7GYwZlz6TLrmaQE2qojK93l0=
X-Google-Smtp-Source: APXvYqxp0BXNE+aHxPVhlDpWB6ebpba8nxty6Jg2nRHdkVq0a5dOLsfYyeTYYPgoeytL2Kj30okBIg==
X-Received: by 2002:aa7:848f:: with SMTP id u15mr7219236pfn.124.1573685904767; 
	Wed, 13 Nov 2019 14:58:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::30e8])
	by smtp.gmail.com with ESMTPSA id l93sm3557301pjb.6.2019.11.13.14.58.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 13 Nov 2019 14:58:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Nov 2019 14:58:11 -0800
Message-Id: <20191113225811.1535-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191113225811.1535-1-raj.khem@gmail.com>
References: <20191113225811.1535-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH] layer.conf: Add ttf-roboto->fontconfig to SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
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
X-List-Received-Date: Wed, 13 Nov 2019 22:58:24 -0000
Content-Transfer-Encoding: 8bit

it depends on fontcache which pulls in fontconfig into rdeps and results in errors
e.g.

ERROR: ttf-roboto different signature for task do_package_write_ipk.sigdata between qemux86copy and qemuarm
Hash for dependent task fontconfig/fontconfig_2.13.1.bb:do_packagedata changed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 2a17eef304..bad87850e9 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -71,6 +71,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   ttf-lklug->fontconfig \
   ttf-lohit->fontconfig \
   ttf-pt-sans->fontconfig \
+  ttf-roboto->fontconfig \
   ttf-mplus->fontconfig \
   ttf-sazanami->fontconfig \
   ttf-tlwg->fontconfig \
-- 
2.24.0


