Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 489BC77EE4
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Jun 2017 04:58:47 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id v18so489442pgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Jun 2017 21:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yCEJW+9x+EEH1dcgcq+9Q93U6Nh4VtO9txCPICDbNEM=;
	b=h4rzus64U0BTAKQ/wZikPnEgBJq4PIOWg3f7x/L53kOFgPbmry1hAXXZGxk0rzhtG9
	t7xbIqNzXw2W8nSWGEm8eUF89EZq/yKV5sJuIU8Wf+oj8AKycirxRTzeX8e6tugGiypk
	+wrWQayHSeFtaMeo+OGMRWr+pJHSyJsxLOg0Vmd99HWW3FmPxlYD3JLD2++Rlrrg51cV
	bkYs7seZifAoZbo2u+gIrpvnJYk3T6BTBiz+J1Rpw7vtzkATD6YYFGtgQyDQ2DBhbJmm
	RfTLk9uQUcllfeGfoKixK8qAIT7TcsUtqFZV41MTswdNJ/3s0WFs0ZONC8PyvpgSar7D
	V5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yCEJW+9x+EEH1dcgcq+9Q93U6Nh4VtO9txCPICDbNEM=;
	b=F31uNEBIqOaqIdyzj5mMSTfp2tgh/j0wtpVh8vkhuBcuGj9zrCX1pjj+P4ynZ99Ym8
	E7RlkzwjmXL/alswNqnKIUh1gWi8TRdrVSZj3n0TWSKXwCURvJaGpOuq/yIGEk08OF4+
	cztffp8UtzGFzVQTGVZhj46P+DB28+YHWbiso3zrM5Sl/ay7oEVH6ZxhAWSbBGliZEE4
	q9KOLovM2mHHEYZ27IeV5ogOw4d3wc8j0Qs4X//zplVul/NO7hHs3jDMoBjnIKnvwXWj
	DDaFDh1Hf9vC3Y6MF8XXJL1YozN7feOX6mDwJaoI/eKv6x4StOBIKxEOrAhdxc0rkV8W
	EiEQ==
X-Gm-Message-State: AODbwcA60O6dLddZUeZQpnem3MfKZpCAk9rFk6Y2sGcoS2pM5wTiPzhQ
	VqfGyEzsh2GpNdOe
X-Received: by 10.84.129.65 with SMTP id 59mr3450943plb.166.1496465929025;
	Fri, 02 Jun 2017 21:58:49 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::cf4])
	by smtp.gmail.com with ESMTPSA id
	o29sm40732836pgc.27.2017.06.02.21.58.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Jun 2017 21:58:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Jun 2017 21:58:33 -0700
Message-Id: <20170603045833.8120-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170603045833.8120-1-raj.khem@gmail.com>
References: <20170603045833.8120-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 4/4] samba: Fix build with musl
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
X-List-Received-Date: Sat, 03 Jun 2017 04:58:48 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/samba/samba/glibc_only.patch | 15 +++++++++++++++
 .../samba/samba/netdb_defines.patch                   | 19 +++++++++++++++++++
 .../recipes-connectivity/samba/samba_4.6.2.bb         |  2 ++
 3 files changed, 36 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/glibc_only.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/netdb_defines.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/glibc_only.patch b/meta-networking/recipes-connectivity/samba/samba/glibc_only.patch
new file mode 100644
index 000000000..894bc8bb2
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/glibc_only.patch
@@ -0,0 +1,15 @@
+Index: samba-4.6.2/ctdb/tests/src/test_mutex_raw.c
+===================================================================
+--- samba-4.6.2.orig/ctdb/tests/src/test_mutex_raw.c
++++ samba-4.6.2/ctdb/tests/src/test_mutex_raw.c
+@@ -166,8 +166,10 @@ int main(int argc, const char **argv)
+ 			if (ret == 0) {
+ 				pthread_mutex_unlock(mutex);
+ 			}
++#ifdef __GLIBC__
+ 		} else if (ret == EBUSY) {
+ 			printf("pid=%u\n", mutex->__data.__owner);
++#endif
+ 		} else if (ret == 0) {
+ 			pthread_mutex_unlock(mutex);
+ 		}
diff --git a/meta-networking/recipes-connectivity/samba/samba/netdb_defines.patch b/meta-networking/recipes-connectivity/samba/samba/netdb_defines.patch
new file mode 100644
index 000000000..eb06866f4
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/netdb_defines.patch
@@ -0,0 +1,19 @@
+Index: samba-4.6.2/nsswitch/wins.c
+===================================================================
+--- samba-4.6.2.orig/nsswitch/wins.c
++++ samba-4.6.2/nsswitch/wins.c
+@@ -39,6 +39,14 @@ static pthread_mutex_t wins_nss_mutex =
+ #define INADDRSZ 4
+ #endif
+ 
++#ifndef NETDB_INTERNAL
++#define NETDB_INTERNAL (-1)
++#endif
++
++#ifndef NETDB_SUCCESS
++#define NETDB_SUCCESS  0
++#endif
++
+ NSS_STATUS _nss_wins_gethostbyname_r(const char *hostname,
+ 				     struct hostent *he,
+ 				     char *buffer,
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.6.2.bb b/meta-networking/recipes-connectivity/samba/samba_4.6.2.bb
index 38876c2c3..7574aefb4 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.6.2.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.6.2.bb
@@ -18,6 +18,8 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://21-add-config-option-without-valgrind.patch \
            file://0001-packaging-Avoid-timeout-for-nmbd-if-started-offline-.patch \
            file://0006-avoid-using-colon-in-the-checking-msg.patch \
+           file://netdb_defines.patch \
+           file://glibc_only.patch \
            file://volatiles.03_samba \
           "
 SRC_URI_append_libc-musl = " \
-- 
2.13.0


