Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE8B5D25946
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 06:00:44 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3826.1769493642668288078
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 22:00:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KZeEhCJ4;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4801d21c411so27402015e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 22:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769493641; x=1770098441; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lsBJkI7Wrn161J4xXpgiK90YmzTFjRtZNll6BJ3UorI=;
        b=KZeEhCJ46SdNQAK3sSKu2O2nIL2yazf3QC67cg3lfUzEeNGOWuLhCXTOW8PqxF6J1Z
         WtMoTVecEV4+ZVCbF1CJjpQkFsazZqVxHA8CcbJX4i8iWCcw264hcfTIl5qwu/tAKukZ
         WxZPZLCNcpWzuLtRvBH5t0oHhOmmx/Vmd77IkZiUNTL9dmHdWr9VDBfcVkMlDRkzEbYj
         subxx56wRscxDvsI+sJQw/jKHwUmJdL1wrWRwakHU5AxSw/Tba/fR6O8xKkFqhWA099D
         LI7yyIu48tzWa3G7NgoEtuqobx5K0HEKSIZAhmAxhs17+2D2YxL+wgLtCHtVVa+eF5NV
         Yg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769493641; x=1770098441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lsBJkI7Wrn161J4xXpgiK90YmzTFjRtZNll6BJ3UorI=;
        b=uXJrkE/DXpy8MybN6/fBVCuO1+6Rwu9xsh1zpRM9lfYkIDHgRdCYU50NYBqSID4bRs
         V4Z6BBfJAPcoQzk4KOvhrO7k5SLoRGQbfWJSmmFQjVqgjDGXFy9IpQIal+xqaShrDIcf
         grIfQOLZITY62f/XitL8E8QesGYmJ01/b1ukyVRfXKGCuyRjy62ZaPLtQWH4FXYMtzoF
         MgwTvRhcFTbh8uAPh+e5I7HpQDPaoOtwo/ZWv+RfGQbeBcsvca+S3w9+m/dAJjKKbjyy
         eRswXmtVab5V7nvvAJfYshNoI+eDxX9TYXfcjb7DL1EHFhfWxocFiKTg273sXux9tLb3
         j7OQ==
X-Gm-Message-State: AOJu0YzGi06xY2QZPbnXt2G7OL1NxysUvc5cnWd/hmjIJOUPuIZjTeoD
	K79uueJ5WSniSI35vnI3w77mFhQU1fvsQ59PDOdvkYUnQjFQHZJEOPaD4HzPWw==
X-Gm-Gg: AZuq6aKDgxbTcXTR4EVX3K2a6N77GM9YSQQ92Yq2T2uwTFxFGhQPnXev7w5OMme7zK2
	b+FhKDvk4aDsofp5yuOFq8AF7KQI8RfaaB1fHIKv5L8YfL1je2uR5wN+YFsxyT5ZyOFOoiNDolR
	UYnVYIP2UWGUHzrnur0eXrS0xs+MyU5q12bF9LYqnQo2Tmqx4ZGZADI04hcA1Jecov+DyzTyG3l
	KBA5P5MfUCVvzzxyTG3iO+NA5NomuMueJ51cDkHsV3tRFlLO3rP4hWOmcPVLHQUlj1G1Uw+VJ03
	U+cE2+tGV/VnGhiSXxBXr2s2gzqAE3nqcbihVtxr08GQGxiSIQtP/KNHqsPhzvcPVOwHokvgoiO
	pDyd8akobtCfkvMQx0lwlrjKUUXllwGP2kZN8drwz6oY2J6YfS6pGdxjiUyKNIYlennznyTvahE
	2n9QdCO7cYBlHgiIp/0ys=
X-Received: by 2002:a05:600c:a07:b0:479:3a86:dc1f with SMTP id 5b1f17b1804b1-48069c73f73mr6433085e9.37.1769493635699;
        Mon, 26 Jan 2026 22:00:35 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d3ae17esm126122825e9.0.2026.01.26.22.00.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 22:00:34 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 1/5] gtk4: upgrade 4.6.2 -> 4.6.9
Date: Tue, 27 Jan 2026 07:00:30 +0100
Message-ID: <20260127060034.1301860-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 06:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123905

Changelog:

4.6.9:
* GtkText:
 - Prevent unexpected notify::direction emissions
* Wayland:
 - Fix button masks
* X11:
 - Fix some ordering problems with surface destruction
* Translation updates

4.6.8:
* Input:
 - Fix problems with input method interactions that caused
   dead keys not to work
* GtkText:
 - Respect the no-emoji input hint fully
* GtkNotebook:
 - Fix an infinite loop in accessibility code
 - Event handling fixes
* GtkFileChooser:
 - Restore ~ and .functionality
* GtkTreeView:
 - Event handling fixes
* GtkTreeListModel:
 - Prevent possible crashes with collapsed nodes
* GtkGridView:
 - Fix issues with rubberband selection
* GtkEmojiChooser:
 - Fix navigation with arrow keys when filtered
* GtkPopover:
 - Fix problems with focus when dismissing popovers
 - Fix problems with focusing editable labels in popovers
* GtkStackSidebar:
 - Improve accessible presentation
* Wayland:
 - Make gtk_launch_uri more robust
 - Make monitor bounds handling more robust
 - Prevent shrinking clients due to wrong toplevel bounds
* Flatpak:
 - Fix file DND with the FileTransfer portal
* Translation updates

4.6.7:
* Miscellaneous memory leak fixes
* GtkTreeView:
 - Fix a problem with DND
 - Fix a problem with row selection
* GtkTreePopover:
 - Support scrolling
* GtkGridView:
 - Fix issues with rubberband selection
* GtkSnapshot:
 - Make GtkSnapshot work from bindings
* X11:
 - Fix preferred action for DND
* Windows:
 - Fix DND
* Translation updates

4.6.6:
* Fix translations in GTKs own ui files
* Wayland:
 - Fix a problem with the activation protocol
 - Don't force the HighContrast icontheme
* Windows:
 - Fix a problem with builtin icons if the
   hicolor icontheme is not installed
* Translation updates

4.6.5:
* GtkFileChooser:
 - Fix pasting text into the name field
* GtkText:
 - Remove an assertion that is sometimes hit
* Wayland:
 - Ensure that our cursor surfaces don't violate
   protocol constraints
* Accessibility:
 - Fix a problem in the accessibility tree
* Translation updates

4.6.4:
* GtkFileChooser:
 - Fix select button sensitivity in select_folder mode
 - Fix some fallout from list model porting
* GtkListView, GtkColumnView:
 - Optimize scrolling
* print-to-file:
 - Handle nonexisting files better in the dialog
* Avoid infinite loops in size allocation
* CSS:
 - Optimize a case of reparenting that is important in GtkListView
* GSK:
 - Check for half-float support before using it
* Wayland:
 - Ignore empty preedit updates This fixes a problem with
   textview scrolling
 - Freeze popups when hidden. This addresses a frame rate drop
* Translation updates

4.6.3:
* GtkOverlay:
 - Bring back positional style classes
* GtkFileChooser:
 - Prevent unwanted completion popups
 - Fix small problems in save mode
 - Fix buildable suport of GtkFileFilter
* GtkPopover:
 - Fix button positions in right-to-left locales
* GtkLabel:
 - Fix small issues with link handling
* Tooltips:
 - Don't restrict the minimum tooltip length
* Theme:
 - Don't use opacity for overlay scrollbars
 - Fix selection text color in  vertical spin buttons
* GSK:
 - Accept textures that are generated by webkit
 - Align offscreen rendering to the pixel grid
* Accessibility
 - Fix a crash in startup when orca is running
* Input:
 - Fix display changes in GtkIMMultiContext
 - Fix activating on-screen keyboards
 - Always propagate hold events in GtkEventControllerScroll
* Windows:
 - Fix a critical warning in clipboard handling
 - Report serial numbers for events
* MacOS:
 - Prevent fullscreen transition reentrancy
* Translation updates

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gnome/gtk4/{gtk4_4.6.2.bb => gtk4_4.6.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gtk4/{gtk4_4.6.2.bb => gtk4_4.6.9.bb} (98%)

diff --git a/meta-gnome/recipes-gnome/gtk4/gtk4_4.6.2.bb b/meta-gnome/recipes-gnome/gtk4/gtk4_4.6.9.bb
similarity index 98%
rename from meta-gnome/recipes-gnome/gtk4/gtk4_4.6.2.bb
rename to meta-gnome/recipes-gnome/gtk4/gtk4_4.6.9.bb
index fdfe3635cf..d0f2eb0d02 100644
--- a/meta-gnome/recipes-gnome/gtk4/gtk4_4.6.2.bb
+++ b/meta-gnome/recipes-gnome/gtk4/gtk4_4.6.9.bb
@@ -33,7 +33,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ff263af609a50eb76056653592d929459aef4819a444c436f6d52c6f63c1faec"
+SRC_URI[sha256sum] = "decad346d6a94141ab667c43483e7a4b97c7969c23d589dd63cd6a49498a43d0"
 
 S = "${WORKDIR}/gtk-${PV}"
 

