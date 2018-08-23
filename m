Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3F03679567
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 11:21:46 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id s13-v6so2399929pfi.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 04:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cebTT97RlchBYLamsWS6a8pvW53ndWH/paJyOSK+7Gk=;
	b=neHQW8y0GJ17ZaJhajfhbl+RKKbKG3PlhFPuqaSYGYBA6lE3Xap94KmPxqYSLbHnWz
	Nm6aSgtEh52JpEf8ZSAhHe8Cc+idums3SWvdFNusrlqIHk4OuAuYQDCDMkhL1Tel2Rx8
	5PeRx6FuMh91/OBcRmG28tqcNsLqs4cA089xpUL5Jew4vnYgH8Fjh0p0C/R8MO6HDMsH
	WMbz2jJu2j3VWHJjqyNQPYso/Hd9/nzuw9pYcdi9l035VMS0eZJaLvrtPIzj90utKdBf
	He5Nlcq2e8SJ/rivp6fcI46eT4jXy39poc20ZuTe4HJoGEgHrSCXftYERsmhnqCkIdIJ
	oi6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cebTT97RlchBYLamsWS6a8pvW53ndWH/paJyOSK+7Gk=;
	b=Rjy3RpZLpFvzhUNijTGI6bGK5IL85ufEePeW3uZkOBWryseatt8+vaZhrEGdg5daxB
	RonF6RQSlsmUZ7djy+HdNQCAETpAvwkzy79DZ0Jxv5VND7VGRPQNJ3RZWnLeKPrJbVZZ
	ITRISeqPiYH0UjON6Zxmf1fIKIz4Dcv6ZSYq9vZR0AbFboccAq32gZrczz+TOSgJAstr
	L/VtTi9tsfU1qNltrRANH8UDUZKYGGawwZIa/HbLYWMVcfYvfNqQtmR+N5hCz07oRSkX
	WDlX1KY+iEgDpZ2GUPGzcn4P0wLyy6jRTik6f+ixjtyjpy8XhLM51CS2FSAoGnMW7DdT
	DrIA==
X-Gm-Message-State: AOUpUlHQ4snpetJo4JOfSVXyX8K1BMQhcUYJF7WdlCIgNDpS2SnAkQlM
	mjc1zGR7nIbHG5Q8BOQ5erdPFBhk3Y+8/g==
X-Google-Smtp-Source: AA+uWPwyv0rBrzVrjCYn0CZsTqQLSb62CpLIP7xIVXfy8AGyn2KtgadL37vAgzuWH7Go5IQG/E3Xvg==
X-Received: by 2002:a62:9992:: with SMTP id
	t18-v6mr62058177pfk.239.1535023307193; 
	Thu, 23 Aug 2018 04:21:47 -0700 (PDT)
Received: from jkrishnanjanappa-desktop.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	z5-v6sm5856811pfh.83.2018.08.23.04.21.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Aug 2018 04:21:46 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Aug 2018 16:51:23 +0530
Message-Id: <1535023284-8126-2-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535023284-8126-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1535023284-8126-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [meta-filesystems][ROCKO][SUMO][PATCH] fuse: CVE-2018-10906
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
X-List-Received-Date: Thu, 23 Aug 2018 11:21:46 -0000

* CVE-2018-10906-1:

fusermount: don't feed "escaped commas" into mount options

The old code permits the following behavior:

$ _FUSE_COMMFD=10000 priv_strace -etrace=mount -s200 fusermount -o 'foobar=\,allow_other' mount
mount("/dev/fuse", ".", "fuse", MS_NOSUID|MS_NODEV, "foobar=\\,allow_other,fd=3,rootmode=40000,user_id=1000,group_id=1000") = -1 EINVAL (Invalid argument)

However, backslashes do not have any special meaning for the kernel here.

As it happens, you can't abuse this because there is no FUSE mount option
that takes a string value that can contain backslashes; but this is very
brittle. Don't interpret "escape characters" in places where they don't
work.

* CVE-2018-10906-2:

fusermount: refuse unknown options

Blacklists are notoriously fragile; especially if the kernel wishes to add
some security-critical mount option at a later date, all existing systems
with older versions of fusermount installed will suddenly have a security
problem.
Additionally, if the kernel's option parsing became a tiny bit laxer, the
blacklist could probably be bypassed.

Whitelist known-harmless flags instead, even if it's slightly more
inconvenient.

Affects fuse < 2.9.8 and fuse < 3.2.5

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../fuse/files/CVE-2018-10906-1.patch              | 52 ++++++++++++++++++++++
 .../fuse/files/CVE-2018-10906-2.patch              | 48 ++++++++++++++++++++
 .../recipes-support/fuse/fuse_2.9.7.bb             |  2 +
 3 files changed, 102 insertions(+)
 create mode 100644 meta-filesystems/recipes-support/fuse/files/CVE-2018-10906-1.patch
 create mode 100644 meta-filesystems/recipes-support/fuse/files/CVE-2018-10906-2.patch

diff --git a/meta-filesystems/recipes-support/fuse/files/CVE-2018-10906-1.patch b/meta-filesystems/recipes-support/fuse/files/CVE-2018-10906-1.patch
new file mode 100644
index 0000000..83bef30
--- /dev/null
+++ b/meta-filesystems/recipes-support/fuse/files/CVE-2018-10906-1.patch
@@ -0,0 +1,52 @@
+From 28bdae3d113ef479c1660a581ef720cdc33bf466 Mon Sep 17 00:00:00 2001
+From: Jann Horn <jannh@google.com>
+Date: Fri, 13 Jul 2018 15:15:36 -0700
+Subject: [PATCH] fusermount: don't feed "escaped commas" into mount options
+
+The old code permits the following behavior:
+
+$ _FUSE_COMMFD=10000 priv_strace -etrace=mount -s200 fusermount -o 'foobar=\,allow_other' mount
+mount("/dev/fuse", ".", "fuse", MS_NOSUID|MS_NODEV, "foobar=\\,allow_other,fd=3,rootmode=40000,user_id=1000,group_id=1000") = -1 EINVAL (Invalid argument)
+
+However, backslashes do not have any special meaning for the kernel here.
+
+As it happens, you can't abuse this because there is no FUSE mount option
+that takes a string value that can contain backslashes; but this is very
+brittle. Don't interpret "escape characters" in places where they don't
+work.
+
+CVE: CVE-2018-10906
+Upstream-Status: Backport [https://github.com/libfuse/libfuse/commit/28bdae3d113ef479c1660a581ef720cdc33bf466]
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ util/fusermount.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/util/fusermount.c b/util/fusermount.c
+index 0e1d34d..143bd4a 100644
+--- a/util/fusermount.c
++++ b/util/fusermount.c
+@@ -29,6 +29,7 @@
+ #include <sys/socket.h>
+ #include <sys/utsname.h>
+ #include <sched.h>
++#include <stdbool.h>
+ 
+ #define FUSE_COMMFD_ENV		"_FUSE_COMMFD"
+ 
+@@ -754,8 +755,10 @@ static int do_mount(const char *mnt, char **typep, mode_t rootmode,
+ 		unsigned len;
+ 		const char *fsname_str = "fsname=";
+ 		const char *subtype_str = "subtype=";
++		bool escape_ok = begins_with(s, fsname_str) ||
++				 begins_with(s, subtype_str);
+ 		for (len = 0; s[len]; len++) {
+-			if (s[len] == '\\' && s[len + 1])
++			if (escape_ok && s[len] == '\\' && s[len + 1])
+ 				len++;
+ 			else if (s[len] == ',')
+ 				break;
+-- 
+2.13.3
+
diff --git a/meta-filesystems/recipes-support/fuse/files/CVE-2018-10906-2.patch b/meta-filesystems/recipes-support/fuse/files/CVE-2018-10906-2.patch
new file mode 100644
index 0000000..597e12b
--- /dev/null
+++ b/meta-filesystems/recipes-support/fuse/files/CVE-2018-10906-2.patch
@@ -0,0 +1,48 @@
+From 5018a0c016495155ee598b7e0167b43d5d902414 Mon Sep 17 00:00:00 2001
+From: Jann Horn <jannh@google.com>
+Date: Sat, 14 Jul 2018 03:47:50 -0700
+Subject: [PATCH] fusermount: refuse unknown options
+
+Blacklists are notoriously fragile; especially if the kernel wishes to add
+some security-critical mount option at a later date, all existing systems
+with older versions of fusermount installed will suddenly have a security
+problem.
+Additionally, if the kernel's option parsing became a tiny bit laxer, the
+blacklist could probably be bypassed.
+
+Whitelist known-harmless flags instead, even if it's slightly more
+inconvenient.
+
+CVE: CVE-2018-10906
+Upstream-Status: Backport [https://github.com/libfuse/libfuse/commit/5018a0c016495155ee598b7e0167b43d5d902414]
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ util/fusermount.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/util/fusermount.c b/util/fusermount.c
+index 4e0f51a..2792407 100644
+--- a/util/fusermount.c
++++ b/util/fusermount.c
+@@ -819,10 +819,16 @@ static int do_mount(const char *mnt, char **typep, mode_t rootmode,
+ 						flags |= flag;
+ 					else
+ 						flags  &= ~flag;
+-				} else {
++				} else if (opt_eq(s, len, "default_permissions") ||
++					   opt_eq(s, len, "allow_other") ||
++					   begins_with(s, "max_read=") ||
++					   begins_with(s, "blksize=")) {
+ 					memcpy(d, s, len);
+ 					d += len;
+ 					*d++ = ',';
++				} else {
++					fprintf(stderr, "%s: unknown option '%.*s'\n", progname, len, s);
++					exit(1);
+ 				}
+ 			}
+ 		}
+-- 
+2.13.3
+
diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb
index 202d4c3..1eb9b70 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb
@@ -15,6 +15,8 @@ SRC_URI = "https://github.com/libfuse/libfuse/releases/download/${BP}/${BP}.tar.
            file://aarch64.patch \
            file://0001-fuse-fix-the-return-value-of-help-option.patch \
            file://fuse.conf \
+           file://CVE-2018-10906-1.patch \
+           file://CVE-2018-10906-2.patch \
 "
 SRC_URI[md5sum] = "9bd4ce8184745fd3d000ca2692adacdb"
 SRC_URI[sha256sum] = "832432d1ad4f833c20e13b57cf40ce5277a9d33e483205fc63c78111b3358874"
-- 
2.7.4


