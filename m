Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC31C433EF
	for <webhook@archiver.kernel.org>; Sat, 30 Oct 2021 18:06:23 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web09.22147.1635617183479004445
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 11:06:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cQVAGY3U;
 spf=pass (domain: gmail.com, ip: 209.85.215.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id s136so13078203pgs.4
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 11:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GoSDPWf4N9kZUGZUaQc2xbNm3cvrUgTboZppdfMSTm8=;
        b=cQVAGY3Uyi6NILqhs/D0SRGD5g1TMp6PnO/eOzOrVcERgEqtw8jBPiYVcqk0mE1RUA
         HAu1uPqLrAgwGvEzgJJOdi9E/Lf9PNBHWeKL4XYFT1d2As1AaMY8i6GTieVh0KUL2BgB
         XJuQEDxX7CzUcWuty0IHcgJHLpw1h81zXxqovXryK2vP0xO7w9cGFABwd/K1ax8Q9a2a
         NslQFniabcJsn9E0L5wwfZkQZz4EQzcMAp9nS/8Dwkk0jbA2ZyRBdT4tRCAgE/WXZQFR
         U0w7hGVZIPbyere3C3nJhRffv+jJYAxTRtbqt68UdZLsZ98jHGNsivgkXTgpjQ/Gy03Y
         DUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GoSDPWf4N9kZUGZUaQc2xbNm3cvrUgTboZppdfMSTm8=;
        b=tZ4sKmZPehVGfrEmsrLQ794jSbBj1yVmE/lW6NIGuQuAKNyyO7FmfOIQjAGmlb4ybY
         fBwJJeY9vmzF2jMwetsjLTaY2RiuOGGhpx9TXp2BfOHZA1WcReSEF3uXxTS66e1sz7M7
         Y2/llH+s30xU8OLj4aEJM4GMqVStzD42iFfAU0/3q8EPuMwhAzqXjBOvUaYHQrQQAaTh
         e2F4zRU1qcgEeLkF2/5eSO5rAEr6/s3SdpbWtjfFlx5PF9vXu0KlajUrm+KInLlwvJtr
         lPCNywn4LQpkmIe+CJeqplkqe/TgANhTBj144bUeIuYxbcmgUfGYhWKeJZZH4tCfKXgB
         jOPQ==
X-Gm-Message-State: AOAM532OUfYz+VuinnWTxxganbqJfXFNmIEiAYI4+p/bHtcMbTBDJ0NL
	AjgoHadKAoxwf0vtKzmaafHHxMDu7Kw=
X-Google-Smtp-Source: 
 ABdhPJye7Xkk3YD69ItuCsGOaq4glaMb+9BtUQBp+ROw3XTNX653G4R+fOTcPwUq4+8iyWqJmuofeA==
X-Received: by 2002:a62:e510:0:b0:44c:e06e:80dd with SMTP id
 n16-20020a62e510000000b0044ce06e80ddmr18686157pff.48.1635617182779;
        Sat, 30 Oct 2021 11:06:22 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id y6sm217346pfa.70.2021.10.30.11.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 11:06:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/8] sysdig: Fix build with ncurses 6.3+
Date: Sat, 30 Oct 2021 11:06:14 -0700
Message-Id: <20211030180618.2200698-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211030180618.2200698-1-raj.khem@gmail.com>
References: <20211030180618.2200698-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Oct 2021 18:06:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93675

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ot-of-Werror-format-security-errors-.patch | 155 ++++++++++++++++++
 meta-oe/recipes-extended/sysdig/sysdig_git.bb |   1 +
 2 files changed, 156 insertions(+)
 create mode 100644 meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-Fix-a-lot-of-Werror-format-security-errors-.patch

diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-Fix-a-lot-of-Werror-format-security-errors-.patch b/meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-Fix-a-lot-of-Werror-format-security-errors-.patch
new file mode 100644
index 0000000000..055b0c1c29
--- /dev/null
+++ b/meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-Fix-a-lot-of-Werror-format-security-errors-.patch
@@ -0,0 +1,155 @@
+From a5c8e2676b94d2ea41b44b4e05943bee6459f337 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 30 Oct 2021 09:46:35 -0700
+Subject: [PATCH] libsinsp: Fix a lot of -Werror=format-security errors with
+ mvprintw/mvwprintw
+
+In all these places a non-constant is used as a format string which
+compiler complains about. Fix by using "%s" as format.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ userspace/libsinsp/cursescomponents.cpp |  4 ++--
+ userspace/libsinsp/cursesspectro.cpp    |  2 +-
+ userspace/libsinsp/cursestable.cpp      |  6 +++---
+ userspace/libsinsp/cursesui.cpp         | 14 +++++++-------
+ 4 files changed, 13 insertions(+), 13 deletions(-)
+
+diff --git a/userspace/libsinsp/cursescomponents.cpp b/userspace/libsinsp/cursescomponents.cpp
+index 4003cb4e..372b4526 100644
+--- a/userspace/libsinsp/cursescomponents.cpp
++++ b/userspace/libsinsp/cursescomponents.cpp
+@@ -877,7 +877,7 @@ void curses_textbox::print_no_data()
+ 	string wstr = "No Data For This Selection";
+ 	mvprintw(m_parent->m_screenh / 2,
+ 		m_parent->m_screenw / 2 - wstr.size() / 2,
+-		wstr.c_str());
++		"%s", wstr.c_str());
+ 
+ 	refresh();
+ }
+@@ -1100,7 +1100,7 @@ void curses_textbox::render()
+ 		attrset(m_parent->m_colors[sinsp_cursesui::LARGE_NUMBER]);
+ 		mvprintw(0,
+ 			m_parent->m_screenw / 2 - wstr.size() / 2,
+-			wstr.c_str());
++			"%s", wstr.c_str());
+ 	}
+ 
+ 	//
+diff --git a/userspace/libsinsp/cursesspectro.cpp b/userspace/libsinsp/cursesspectro.cpp
+index 6858bc95..32012963 100644
+--- a/userspace/libsinsp/cursesspectro.cpp
++++ b/userspace/libsinsp/cursesspectro.cpp
+@@ -227,7 +227,7 @@ void curses_spectro::print_error(string wstr)
+ 	mvwprintw(m_tblwin, 
+ 		m_parent->m_screenh / 2,
+ 		m_parent->m_screenw / 2 - wstr.size() / 2, 
+-		wstr.c_str());	
++		"%s", wstr.c_str());	
+ }
+ 
+ void curses_spectro::update_data(vector<sinsp_sample_row>* data, bool force_selection_change)
+diff --git a/userspace/libsinsp/cursestable.cpp b/userspace/libsinsp/cursestable.cpp
+index 69c2aa32..54667554 100644
+--- a/userspace/libsinsp/cursestable.cpp
++++ b/userspace/libsinsp/cursestable.cpp
+@@ -254,7 +254,7 @@ void curses_table::print_line_centered(string line, int32_t off)
+ 		mvwprintw(m_tblwin, 
+ 			m_parent->m_screenh / 2 + off,
+ 			m_parent->m_screenw / 2 - line.size() / 2, 
+-			line.c_str());
++			"%s", line.c_str());
+ 	}
+ 	else
+ 	{
+@@ -268,7 +268,7 @@ glogf("2, %d %s\n", spos, ss.c_str());
+ 			mvwprintw(m_tblwin, 
+ 				m_parent->m_screenh / 2 + off + j,
+ 				0,
+-				ss.c_str());
++				"%s", ss.c_str());
+ 
+ 			spos += m_parent->m_screenw;
+ 			if(spos >= line.size())
+@@ -328,7 +328,7 @@ void curses_table::print_error(string wstr)
+ 	mvwprintw(m_tblwin, 
+ 		m_parent->m_screenh / 2,
+ 		m_parent->m_screenw / 2 - wstr.size() / 2, 
+-		wstr.c_str());	
++		"%s", wstr.c_str());	
+ }
+ 
+ void curses_table::render(bool data_changed)
+diff --git a/userspace/libsinsp/cursesui.cpp b/userspace/libsinsp/cursesui.cpp
+index 1eeb0864..69652edc 100644
+--- a/userspace/libsinsp/cursesui.cpp
++++ b/userspace/libsinsp/cursesui.cpp
+@@ -825,7 +825,7 @@ void sinsp_cursesui::render_header()
+ 		attrset(m_colors[sinsp_cursesui::LARGE_NUMBER]);
+ 		mvprintw(0,
+ 			m_screenw / 2 - wstr.size() / 2, 
+-			wstr.c_str());	
++			"%s", wstr.c_str());	
+ 	}
+ 
+ 	//
+@@ -1123,7 +1123,7 @@ void sinsp_cursesui::render_filtersearch_main_menu()
+ 
+ 		m_cursor_pos = cursor_pos;
+ 
+-		mvprintw(m_screenh - 1, m_cursor_pos, str->c_str());
++		mvprintw(m_screenh - 1, m_cursor_pos, "%s", str->c_str());
+ 
+ 		m_cursor_pos += str->size();
+ 	}
+@@ -2189,7 +2189,7 @@ void sinsp_cursesui::print_progress(double progress)
+ 	string wstr = "Processing File";
+ 	mvprintw(m_screenh / 2,
+ 		m_screenw / 2 - wstr.size() / 2, 
+-		wstr.c_str());	
++		"%s", wstr.c_str());	
+ 
+ 	//
+ 	// Using sprintf because to_string doesn't support setting the precision 
+@@ -2199,7 +2199,7 @@ void sinsp_cursesui::print_progress(double progress)
+ 	wstr = "Progress: " + string(numbuf);
+ 	mvprintw(m_screenh / 2 + 1,
+ 		m_screenw / 2 - wstr.size() / 2, 
+-		wstr.c_str());
++		"%s", wstr.c_str());
+ 
+ 	refresh();
+ }
+@@ -2308,7 +2308,7 @@ sysdig_table_action sinsp_cursesui::handle_textbox_input(int ch)
+ 						attrset(m_colors[sinsp_cursesui::FAILED_SEARCH]);
+ 						mvprintw(m_screenh / 2,
+ 							m_screenw / 2 - wstr.size() / 2, 
+-							wstr.c_str());	
++							"%s", wstr.c_str());	
+ 
+ 						//
+ 						// Restore the cursor
+@@ -2363,7 +2363,7 @@ sysdig_table_action sinsp_cursesui::handle_textbox_input(int ch)
+ 
+ 					mvprintw(m_screenh / 2,
+ 						m_screenw / 2 - wstr.size() / 2, 
+-						wstr.c_str());
++						"%s", wstr.c_str());
+ 
+ 					render();
+ 				}
+@@ -2436,7 +2436,7 @@ sysdig_table_action sinsp_cursesui::handle_textbox_input(int ch)
+ 
+ 				mvprintw(m_screenh / 2,
+ 					m_screenw / 2 - wstr.size() / 2, 
+-					wstr.c_str());
++					"%s", wstr.c_str());
+ 
+ 				render();
+ 			}
+-- 
+2.33.1
+
diff --git a/meta-oe/recipes-extended/sysdig/sysdig_git.bb b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
index a12f8ba5e1..90f375b665 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig_git.bb
+++ b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
@@ -24,6 +24,7 @@ RDEPENDS:${PN} = "bash"
 SRC_URI = "git://github.com/draios/sysdig.git;branch=dev \
            file://0001-fix-build-with-LuaJIT-2.1-betas.patch \
            file://aarch64.patch \
+           file://0001-libsinsp-Fix-a-lot-of-Werror-format-security-errors-.patch \
           "
 SRCREV = "67833b2aca06bd9d11cff7cb29f04fbf4ef96cad"
 PV = "0.27.1"
-- 
2.33.1


