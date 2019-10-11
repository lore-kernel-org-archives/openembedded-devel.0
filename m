Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 687FB7F37D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2019 18:44:07 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id q21so6568043pfn.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2019 11:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=juzzwkBgVimyzHOW26sxxXqtJ+Tiy1XyM3MZxbKpofM=;
	b=ValbFY2Yf2pi/zu2qAXpgLu3xsAHG6AkA8Rqo+sASru8iAkdWVv7hj8N3Hl5Epw6jw
	7ZtW1AqyUZHQgkg2uWPVgOs/HJKJxdLFuHdPdfknHCgmK3t/dU+Er20+NnSUJ4YMaZHo
	obiMnA3lJ+GJDTQkVKdAULF+TgfwT8fn3G+dfJHddyc6Pf4g6Ww1O0Llpebq1eIedI8A
	H8a2LMf57jPTgsAiq053XPrV4uHvAqNr3gZO2U2iCJOdlEDUgo8V8E4XKilpeRlBlVYl
	aep7sFqQD0M5ljUsy2GeEPQ6fSss7URQBll7RVBBZmZE06DOVciwKU3iFE/KFPdjMuba
	M42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=juzzwkBgVimyzHOW26sxxXqtJ+Tiy1XyM3MZxbKpofM=;
	b=NMclRHUR8HMHe/BTPoEjJ7VkRhmY1jfwk9N5hA4TFdgs5iTX3SQKWoQBM58C2yAlcA
	hwjZ7VSARkQh0R5KVaHGcHzo27dIoZuqaeMJcvUnyaX8/RTm/h0T5Gs8G6zQNRIBQzXg
	yCAvTmdwV8+ZfOFxZuG622UwvNpJcjgVMC4WJ2/x4bx4lIwov48Pj63fuAx8aH2obAAe
	XC4pvlmLDj2QdvxRPBkz3VKltSJ2ThOemTc2wK/lIvFQzGOHUd4VL4mjWhlYQlAVYDMO
	PJ49Bw9oh75/64C02Fat8NI1bpUU8j0mh8rw2lagVUyIbUFczckWLWnD3HBEF6d/h5K8
	5TGw==
X-Gm-Message-State: APjAAAVH5a4PcIBT3AVw+hI7vtlu5ek5Z2sCYyRVARTjvzeZOpZ+7Uje
	J5s/fvsp80ZrEGiavXkjdnSAjXOrB1o=
X-Google-Smtp-Source: APXvYqytQpAQDHnzW6M5kIbuz4Wf9cZPJlIfyKLYBq0jbblVziUI4pTy6Qs9Wwr+GlPFLhDXEb9c4g==
X-Received: by 2002:a63:a055:: with SMTP id u21mr18068250pgn.102.1570819447922;
	Fri, 11 Oct 2019 11:44:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::7275])
	by smtp.gmail.com with ESMTPSA id
	a13sm15395535pfg.10.2019.10.11.11.44.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 11:44:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Oct 2019 11:43:57 -0700
Message-Id: <20191011184357.760697-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191011184357.760697-1-raj.khem@gmail.com>
References: <20191011184357.760697-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 2/2] packagegroup-meta-multimedia: Remove libsquish from rdeps
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
X-List-Received-Date: Fri, 11 Oct 2019 18:44:07 -0000
Content-Transfer-Encoding: 8bit

libsquish builds a static library alone which is primarily used during
build only. There is no runtime component to it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-multimedia.bb               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index 365618d958..cef45f9d6d 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -27,7 +27,7 @@ RDEPENDS_packagegroup-meta-multimedia = "\
     fluidsynth cdparanoia vorbis-tools tremor caps libao libavc1394 \
     opusfile gerbera libdvdcss webrtc-audio-processing \
     rtmpdump libopenmpt schroedinger mpd mpc libmpdclient \
-    ncmpc libmpd libsquish dcadec libiec61883 \
+    ncmpc libmpd dcadec libiec61883 \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "", "", d)} \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "minidlna gst-fluendo-mpegdemux vlc", "", d)} \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "vo-aacenc sox libde265 gst-openmax", "", d)} \
-- 
2.23.0


