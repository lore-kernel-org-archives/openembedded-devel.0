Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
	[209.85.167.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8C9F37EC4C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 23:41:10 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id r22so14690068lfm.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 16:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=cjLLMYINKSo1K1k//QU36PLAE294bBNJwhgh+EXJNSE=;
	b=GpSdXnET8eKqmtU7+DiCEBHcQqTUOSVbL9aFIXdewtABUWwCC/4vR6dzwGfx00G39a
	QLLWVT7SiFd0qO9QeEULswpGXsZQ10MWxkF2sSVl5E1XXrk+xxA7oPvbREuM2jmnDnNO
	5+xYXIDHr/L2sJGZPYKPhuhRsJEjDozH0DIs8pDX8J9eVnN81dNv3kBaXpB/gbzYKGOZ
	xaA/d86ceTNwgVv6zgOd2uXDhpVQ+xP4CbRwWicoySbgFZO/Q9M0+i5R+GOKWmAVmCsh
	uCxaooLLiUh196MQMFfF21wPfGWKSaXYUbGCWCuypjDHWnJOPW2evkXJJyQhl8NICBXY
	/eQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cjLLMYINKSo1K1k//QU36PLAE294bBNJwhgh+EXJNSE=;
	b=mE25mgbk/N3fmymOlt4UvMPYxejeYTMqjJtgsdkwddux18IROx+Z7eQzxZfT0V1EAK
	0Q39q9bigoTXLBBb7vCbSkYB1Dn3CJZDVejTXCDvS17eaGJZIF/BI+1ndzgJOrCke841
	hwD501kzr+PrLKjdKzWDlRAFFu8gGT9YT/he+DwSrg5L9bhtW1BuqAPAUao5GE9IkdRU
	53/U1Y+x3WYeLv+vpCYVMRZR9pmN74HVtzmdYonKx55sA1SxfGx8ITlR2Kp8+IS2Pq0+
	WEgA11kfYUjqDdOclMnRsh2UueU9U0ui6Fj9KWoWymRhmqlB+WCMVSk3aLrIp6CqjyXM
	ATCg==
X-Gm-Message-State: APjAAAUtFhWctSfLQumadhTVhUyRw2kZb7AjHoThibu/qunpmGFOydyd
	u8GJo6GEfhTgSeOnbZAJ80aYXwVawgo=
X-Google-Smtp-Source: APXvYqxNVv21/AdcljtWIz7TIksPk3ldbI7GvPWLP3wGeYiLivXraStvFhUu82fuIH5vf/aYI9AxOw==
X-Received: by 2002:ac2:50c5:: with SMTP id h5mr6406108lfm.105.1568590870807; 
	Sun, 15 Sep 2019 16:41:10 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	y204sm3296233lfa.64.2019.09.15.16.41.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Sep 2019 16:41:10 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2019 01:41:04 +0200
Message-Id: <20190915234104.11809-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] zlog: update to 1.2.14
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
X-List-Received-Date: Sun, 15 Sep 2019 23:41:11 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...read_t-to-unsigned-long-instead-of-u.patch | 32 -------------------
 .../zlog/{zlog_git.bb => zlog_1.2.14.bb}      |  8 ++---
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/zlog/zlog/0001-event.c-Cast-pthread_t-to-unsigned-long-instead-of-u.patch
 rename meta-oe/recipes-extended/zlog/{zlog_git.bb => zlog_1.2.14.bb} (63%)

diff --git a/meta-oe/recipes-extended/zlog/zlog/0001-event.c-Cast-pthread_t-to-unsigned-long-instead-of-u.patch b/meta-oe/recipes-extended/zlog/zlog/0001-event.c-Cast-pthread_t-to-unsigned-long-instead-of-u.patch
deleted file mode 100644
index 71a989103..000000000
--- a/meta-oe/recipes-extended/zlog/zlog/0001-event.c-Cast-pthread_t-to-unsigned-long-instead-of-u.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From b97f62fdf3b78eb5cfcb3a1b12c6fd62f735717b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 15 Jul 2017 09:29:33 -0700
-Subject: [PATCH] event.c: Cast pthread_t to unsigned long instead of unsigned
- int
-
-On 64bit machines it ends up in errors
-
-event.c:85:67: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
-  a_event->tid_hex_str_len = sprintf(a_event->tid_hex_str, "0x%x", (unsigned int)a_event->tid);
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/event.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/event.c b/src/event.c
-index 8f988b5..c632c33 100644
---- a/src/event.c
-+++ b/src/event.c
-@@ -82,7 +82,7 @@ zlog_event_t *zlog_event_new(int time_cache_count)
- 	a_event->tid = pthread_self();
- 
- 	a_event->tid_str_len = sprintf(a_event->tid_str, "%lu", (unsigned long)a_event->tid);
--	a_event->tid_hex_str_len = sprintf(a_event->tid_hex_str, "0x%x", (unsigned int)a_event->tid);
-+	a_event->tid_hex_str_len = sprintf(a_event->tid_hex_str, "0x%lu", (unsigned long)a_event->tid);
- 
- 	//zlog_event_profile(a_event, ZC_DEBUG);
- 	return a_event;
--- 
-2.13.3
-
diff --git a/meta-oe/recipes-extended/zlog/zlog_git.bb b/meta-oe/recipes-extended/zlog/zlog_1.2.14.bb
similarity index 63%
rename from meta-oe/recipes-extended/zlog/zlog_git.bb
rename to meta-oe/recipes-extended/zlog/zlog_1.2.14.bb
index de7516457..b94664c33 100644
--- a/meta-oe/recipes-extended/zlog/zlog_git.bb
+++ b/meta-oe/recipes-extended/zlog/zlog_1.2.14.bb
@@ -3,12 +3,8 @@ HOMEPAGE = "https://github.com/HardySimpson/zlog"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-PV = "1.2.12+git${SRCPV}"
-
-SRCREV = "13904dab2878aa2654d0c20fb8600a3dc5f2dd68"
-SRC_URI = "git://github.com/HardySimpson/zlog \
-           file://0001-event.c-Cast-pthread_t-to-unsigned-long-instead-of-u.patch \
-           "
+SRCREV = "8fc78c3c65cb705953a2f3f9a813c3ef3c8b2270"
+SRC_URI = "git://github.com/HardySimpson/zlog"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


