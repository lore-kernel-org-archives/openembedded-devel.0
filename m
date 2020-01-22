Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4B1EC7FFCA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 00:59:43 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id n9so2399152pff.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 16:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=R1UqSPrekbpXMGl+sYZdGpTuy18EzFXIHZQQq5/ZYhQ=;
	b=m+LxD4LkH1oItLXC/BY5hEfCkSA2yDT1dQytgxQsOQbElp75ZU9pbsds/YyEzb9QX1
	c7WcswPEtkKxbzfrFfNUwT1OMaYaQByYR8g4B1PD/NVfSLvgplxUk+Um7WclOVgjuORv
	/OWWyN/Riymfi+xZ4jvIU2ePxKdIUpF1lcErrrGTM8KLsmJNhAZmFKB/OVv6MgQCwnW0
	C4MG4nQ8bAZUtIXyNPrBmv3D5G3yiBI7GtfbDdAUfRtPGwoAxSlqMx7nlf6FBvKfi/D6
	vZHkE4ZeH8rNYeavyZyob6NkGHS3mfMjKLPEGyWIVCRQSJE2F5Op9jgA5osGOETnNIzw
	jxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=R1UqSPrekbpXMGl+sYZdGpTuy18EzFXIHZQQq5/ZYhQ=;
	b=naPZuAFncoYrw3fTZEX9qE/ES2rjiYGQe3r6t69BpfgByVOCMSh+CIcVdrOfg+MVVJ
	BxUbart7P7QHMO6g9Oi32hGDOpFdFECWt9HV9O1fse0XbyW1uZNSJg7OFjbPas0Rccrn
	5G7gn8z/1lHIJS8FBTfzN+VFUYyA3Eft1UsRyjwlYspzCLI/2dx1xUu4UdgXDksNlG3O
	JBRKWZB+b6kJn68A2lvDLD9DJ+XxdEjg4UEbgAVgeMedNq5dfoRQzspCnhXDGGQu2iuk
	a+EGE55/nSYRrN5IMxN1SA1vNqunR2+WMTVfdnHd/RJbXn6ka0qhXHRIVNzoEPRH6+oV
	GHlw==
X-Gm-Message-State: APjAAAWjHR/BfvoixCRTUN9lg/ambmaOlQeIyYOFIBmLOfd+jgBnmZCH
	Cg+R5TmZ8Gz8MazsP5eUbdzaV516+cQ=
X-Google-Smtp-Source: APXvYqyXHbaK9Ay8EdkBNUE5fpk7M6N09VxYXxEn6p4mJP9QHnsCyIdEhAWJFh1QD4JySVE1uitN5A==
X-Received: by 2002:aa7:8193:: with SMTP id g19mr252366pfi.172.1579654783963; 
	Tue, 21 Jan 2020 16:59:43 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	z26sm46107269pfa.90.2020.01.21.16.59.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 16:59:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jan 2020 16:59:37 -0800
Message-Id: <20200122005941.3706171-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122005941.3706171-1-raj.khem@gmail.com>
References: <20200122005941.3706171-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 3/7] python3-pyatspi: Upgrade to 2.34.0
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
X-List-Received-Date: Wed, 22 Jan 2020 00:59:43 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...{python3-pyatspi_2.32.1.bb => python3-pyatspi_2.34.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyatspi_2.32.1.bb => python3-pyatspi_2.34.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb b/meta-python/recipes-devtools/python/python3-pyatspi_2.34.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb
rename to meta-python/recipes-devtools/python/python3-pyatspi_2.34.0.bb
index 4f52ac70d0..3bdb86b453 100644
--- a/meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyatspi_2.34.0.bb
@@ -3,12 +3,12 @@ DESCRIPTION = "AT-SPI2 is a protocol over DBus, toolkit widgets use to provide c
 SECTION = "devel/python"
 HOMEPAGE = "https://www.freedesktop.org/wiki/Accessibility/AT-SPI2/"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=db29218e6ba3794c56df7d4987dc7e4d \
                     file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "python3-dbus-native glib-2.0 dbus-glib libxml2 atk gtk+ python3-pygobject"
 
-SRC_URI = "git://github.com/GNOME/pyatspi2.git;protocol=https;branch=gnome-3-32"
-SRCREV = "dc4565208fca00da06b972915a080ad3c63f640d"
+SRC_URI = "git://github.com/GNOME/pyatspi2.git;protocol=https;branch=mainline"
+SRCREV = "cc99d68db66174f4499b9b325bc788393b972edd"
 S = "${WORKDIR}/git" 
 
 # Same restriction as gtk+
-- 
2.25.0


