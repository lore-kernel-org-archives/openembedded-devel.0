Received: from mail-wg0-f52.google.com ([74.125.82.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ6ET-0007fb-Gq
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 18:58:27 +0100
Received: by mail-wg0-f52.google.com with SMTP id 15so3297881wgd.31
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 10:41:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=pwre65hhnjj7bEr2xRVSKF2Xt0EDlEzEYEtdK0M0hHM=;
	b=jsTzJJai016GZCwDz90Kfj1B+Kod9GfjhcvCXrxGHGelzJY0AyPlNKktQiNErg4qw5
	TV9UOSfSltV1VhUsqW9Gg/GlwZbUgdWA3oyKg9/1x2jbHHWoosJRXJdThrr0DzIC5NML
	pwXDwz+HQSAm6GZokVUqjNV/nXienfun7zYqgtNgykmVoTjxt4X8uVL6SwewSv4NdDTq
	VjsdRD33zJPc6ouy0zH20DwpLq0eZNZQUg1cbmPDmnXK6kyodKtSSC8FvqbSexRvjeBi
	dDEm54s/MVI2FuWzQ8+oYs38KV6vF+3MsyS30LwPiFggLc6XT3cobkywePBsT8OUgApF
	B00w==
X-Received: by 10.180.103.40 with SMTP id ft8mr12959029wib.28.1363974088987;
	Fri, 22 Mar 2013 10:41:28 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm12260880wib.3.2013.03.22.10.41.27
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 10:41:28 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 17:38:23 +0000
Message-Id: <b62fe05e5ddff46aa5f542baee8a98b5cd90b06f.1363973088.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlKarx8eQQOAgPbNKaXyeJPp6VUCJyBKfYUZRNlsoLVBSGeZdb98K9mO4pAVb3RrcN7WeuA
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 03/22] systemd: make xz support (compressed journal) optional, defaulting to on.
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
X-List-Received-Date: Fri, 22 Mar 2013 17:58:35 -0000

Compressed journals means using liblzma, sf the journal isn't going to be used
this can be disabled.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_197.bb |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index 5180eef..dc54f36 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -11,7 +11,7 @@ PROVIDES = "udev"
 PE = "1"
 PR = "r4"
 
-DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0"
+DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SECTION = "base/shell"
@@ -43,9 +43,11 @@ LDFLAGS_libc-uclibc_append = " -lrt"
 
 GTKDOC_DOCDIR = "${S}/docs/"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "xz"
 # Sign the journal for anti-tampering
 PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
+# Compress the journal
+PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
 
 CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
 
-- 
1.7.10.4



