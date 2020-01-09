Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 04DC07FE3E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 21:05:30 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p17so4391455wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jan 2020 13:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=TKkcYwG7KalV5hhZofI9Fi14FugX2calkCkNyC/pC3E=;
	b=Lj9XqhgOlO355Z1Ty5mC1veFyCEh6wBEQdx36lRDJx0P0bmW6G68AL2YawJjIZB1N/
	gwi8Gom75z+qdoGJlaXbYyG2fl8D1UqwyTyCYtlI6iSJygPYlBGgxN23kF2rwJ1BlN5E
	z5sJI3gEySyHntxQL60e7x/t6dc1s/6dYKOMeaiujXsaBRewEoXbY5p3mgJT8gexpVwt
	gLHItoHFwdwJnZaMEOLIG34a1rzEdnFcU98EU5O2bL87FGKC2LsGQ4/RZ3T9sMrKgQJa
	XohsfbOt/uR7ivzZdVMW5sndd30wwXeahJEhhGScaa2r3C573rjhRzEZttzeH2Q282ip
	vCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=TKkcYwG7KalV5hhZofI9Fi14FugX2calkCkNyC/pC3E=;
	b=JunixXhgJ9ouVSplo5YRxNjXUqf1EQmJXbEB8SFB9dT9TGlnbpvsJZnJWJi5zg4fGC
	pjKgA7pgONRtSfpyORLoRySk1zIJlB10ddV9noVqd0wdlPXovL+yr7230NpJEojitg/t
	Y6vDpMxdmgu+huXo813uww1SUv6wZFCtKPQCGNW9qvym2jk0rHX2mh7rBIN+P5+nVK3Z
	IhuUeU8N7Og8CfZK6imQv/8+JNlftCFzKTIatF10T1fTedNVeTvEFzYM3KV1vcL7R27I
	HON5YhqKh7BLXBaHujivHkecxqK2AlCgwJ31ogrXE+bA6iMeRcQQpgsTh1tGBnJdis8n
	Dz5g==
X-Gm-Message-State: APjAAAXy4BlNKVEHUpHKYA2NweO+htzMAqOUctD4DKHNSrVz3Pwh7+2e
	11khjlJrZYsKtGWOsMAwzD4QjLC5PSE=
X-Google-Smtp-Source: APXvYqxz/PsDaejL2aO4NNr47jYTZ5vWOVP3hoCGDzhj5YksKrrQYIkBk2LFdiKISeNTu5/Dyi14bw==
X-Received: by 2002:a1c:4907:: with SMTP id w7mr6705869wma.106.1578603931533; 
	Thu, 09 Jan 2020 13:05:31 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0446528B12EBEBA10192C2.dip0.t-ipconnect.de.
	[2003:f0:7f04:4652:8b12:ebeb:a101:92c2])
	by smtp.gmail.com with ESMTPSA id q6sm9825041wrx.72.2020.01.09.13.05.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 13:05:30 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jan 2020 22:05:16 +0100
Message-Id: <20200109210518.22451-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200109210518.22451-1-schnitzeltony@gmail.com>
References: <20200109210518.22451-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 7/9] gnome-desktop3: upgrade 3.34.2 -> 3.34.3
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
X-List-Received-Date: Thu, 09 Jan 2020 21:05:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From [1]:

==============
Version 3.34.3
==============

- seccomp is not supported ATM on riscv64 architecture, blacklist it for now (#128)

[1] http://ftp.gnome.org/pub/gnome/sources/gnome-desktop/3.34/gnome-desktop-3.34.3.news

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../0001-meson.build-Disable-libseccomp-for-all-archs.patch | 6 +++---
 .../{gnome-desktop3_3.34.2.bb => gnome-desktop3_3.34.3.bb}  | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop3_3.34.2.bb => gnome-desktop3_3.34.3.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop/0001-meson.build-Disable-libseccomp-for-all-archs.patch b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop/0001-meson.build-Disable-libseccomp-for-all-archs.patch
index e93d5b674..4b3894f05 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop/0001-meson.build-Disable-libseccomp-for-all-archs.patch
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop/0001-meson.build-Disable-libseccomp-for-all-archs.patch
@@ -18,14 +18,14 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
  1 file changed, 1 insertion(+), 6 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 83407b4..80eab84 100644
+index 2e7160d..f83677d 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -53,12 +53,7 @@ udev_dep = dependency('libudev', required: get_option('udev'))
+@@ -58,12 +58,7 @@ udev_dep = dependency('libudev', required: get_option('udev'))
  host_os = host_machine.system()
  host_cpu = host_machine.cpu()
  supported_os = ['linux']
--unsupported_cpus = ['alpha', 'ia64', 'm68k', 'sh4', 'sparc', 'sparc64']
+-unsupported_cpus = ['alpha', 'ia64', 'm68k', 'riscv64', 'sh4', 'sparc', 'sparc64']
 -if supported_os.contains(host_os) and not unsupported_cpus.contains(host_cpu)
 -  seccomp_dep = dependency('libseccomp')
 -else
diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.2.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.3.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.2.bb
rename to meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.3.bb
index 19f73a6e5..cdd11aa90 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.3.bb
@@ -14,8 +14,8 @@ inherit gnomebase itstool pkgconfig upstream-version-is-even gobject-introspecti
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 
-SRC_URI[archive.md5sum] = "a0fda8ee9283536e281405e94af15776"
-SRC_URI[archive.sha256sum] = "4081ba619733da33ec6ba98cd52170ee99a90439709df4df333e5c9e631f28ed"
+SRC_URI[archive.md5sum] = "cdcd3006f55d8c8813315bef6f4f6b71"
+SRC_URI[archive.sha256sum] = "acc2efc847574fd21d8f200679f111c2b1eb5ae2c041e0034e7c18450a7d9c6d"
 
 SRC_URI += " \
     file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch \
-- 
2.21.0


