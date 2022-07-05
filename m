Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41875CCA47F
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 06:39:16 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.81444.1657003149113641542
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 23:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=vmXDgQqr;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657003147; i=@fujitsu.com;
	bh=HX9gIHhoiKvjYBf62YNXivXBpByZRyGXWwYEiqnMjso=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=vmXDgQqrluZmJj5Qdg49prY7577lxZXRNxpejwpmKjL9Rhp17ryOFLP8X5d8Urulz
	 soIyOV4v9PMufxSPDBzgvPCUHxbrGxR4rl4sH9niUtaB2xpKIK75UkayMKXbVEJl5m
	 eDbERTITxKM/mECiSRZPwdzDco7rKs/TobuHrizoqu86XdHvHDzfnbzPK/TW9wW/IH
	 7hR+5v6yKQDeuP6urcdi6brtGEe55nwSnml9ruiCYLDl62u1I1tPLCYsgd7Kh5ujgu
	 QUpLhPmpGwdT68fG3j7UNLO8F6BZ35LXAXbydOKp1VDfIIBf6RE13IZQI2+ttJHv5i
	 sfKF2d9AUmm+g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRWlGSWpSXmKPExsViZ8MxSbfrzuE
  kg+PdMhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ahxg/MBbslKiacXsXewDhJtIuRi0NI4Amj
  xNOmRjYI5zqTRNevi4wQzm5GiSUL/jF1MXJysAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgKXHt63mwOAtQ/Er7ObB6XgEniauPprKA2BICChJTHr4Hq+EUcJZ4O+sl0GYOoGVOEg
  cbSiHKBSVOznzCAjFeU6J1+292CFteonnrbGaIMYoSsy83Q42skJgxYxsbhK0mcfXcJuYJjEK
  zkIyahWTULCSjFjAyr2K0TSrKTM8oyU3MzNE1NDDQNTQ0BdLGuoYmRnqJVbqJeqmlunn5RSUZ
  uoZ6ieXFeqnFxXrFlbnJOSl6eaklmxiBoZ9SnN63g3Hjvl96hxglOZiURHnjrh5OEuJLyk+pz
  EgszogvKs1JLT7EKMPBoSTBy3wFKCdYlJqeWpGWmQOMQ5i0BAePkgjvitNAad7igsTc4sx0iN
  QpRkUpcd7dt4ASAiCJjNI8uDZY7F9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMzLdRtoCk9
  mXgnc9FdAi5mAFt+oOgCyuCQRISXVwFQ8XXSjfDjv/u+sMc7VeSuXxOjN6/GIerXb9q/5lYbW
  wJLJWznbWw3lGu7XH/g1X0b7ZG/akcvzN4kIHrox/2Ex/yKZCdcaf3gpBXpcDlgkvYB/mvNCD
  esTjbL/+Gcf4U9YrXbX4Mnj1V9kJEun/g26nn2qsp7NfKLgjSOzt/38aNM861pUfF2vd1R2m/
  sOvme7bgYlRDrVvpBxyAotyeL5MfWk4jbVZz0B6/b7arnIJ9x+/feprD/L/NmbXlez8B93eb5
  x07EnP6VMrm+9JqOyxe9ADc/+rO0MhvZGGaJn5T5VZh/SKBbqYuUt/zdXTkjpketWS5ZNgqVF
  2VMe+vO6fLkqZbdqYp71ioULApRYijMSDbWYi4oTATwob8B4AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-732.messagelabs.com!1657003146!201627!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7450 invoked from network); 5 Jul 2022 06:39:06 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-20.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Jul 2022 06:39:06 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id CCDA31000C2
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Jul 2022 07:39:05 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id BFDDB100077
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Jul 2022 07:39:05 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 5 Jul 2022 07:39:03 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gtksourceview5: upgrade 5.4.1 -> 5.4.2
Date: Tue, 5 Jul 2022 14:38:35 +0800
Message-ID: <1657003117-14465-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657003117-14465-1-git-send-email-wangmy@fujitsu.com>
References: <1657003117-14465-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Jul 2022 06:39:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97710

News in 5.4.2, 2022-06-12
-------------------------

 * Updated languages: c.lang, perl.lang
 * Updated style-schemes: Adwaita-dark, solarized-light, solarized-dark
 * Updated translations: Friulian
 * Gutter renderers are now provided a prelight quark for lines when the
   pointer is over the gutter.
 * Hover assistants now avoid synthesized motion which is used much more
   often in GTK 4 when dealing with crossing-events.
 * Hover assistants will now dismiss themselves when the cursor moves.
 * GtkSourceMap has reduced how often it needs to do allocation by ignoring
   spurious notify::upper and value-changed signals from GtkTextView's
   vertical GtkAdjustment.
 * The testsuite has gained some correctness improvements thanks to
   issues pointed out by S=C3=A9bastien Wilmet.
 * The Vim emulation's register implementation is now shared between buffers
   as it would be expected in Vim.
 * Snippets have gained some robustness improvements including the ability
   to simplify results from the snippet parser, more defensive behavior,
   and being lazier when possible.
 * Tabbing through focus-positions in snippets will now immediately jump
   to the new position if scrolling is required instead of animating as
   it results in better placement of tooltip assistants.
 * Assistants including completion, hover, and interactive tooltips now
   reduce how often they request presentation and position calculation from
   GDK and ultimately display servers such as Wayland.
 * Completion windows now take the size of the gutter into account when
   calculating their position relative to the parent GtkWindow so that the
   typed-text column remains aligned with typed text in the source view.
 * Completion has gained robustness improvements to do less work when
   possible and avoid spinning the frame-clock which could happen in
   certain scenarios.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gtksourceview5_5.4.1.bb =3D> gtksourceview5_5.4.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview5_5.4.1.bb =3D> gtksourceview5_5.4.2.bb} (90%)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.1.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.2.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.1.bb
rename to meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.2.bb
index f667238e6..52c270e6a 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.1.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.2.bb
@@ -25,7 +25,7 @@ inherit gnomebase lib_package gettext features_check gtk-doc gtk-icon-cache gobj
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 
 SRC_URI =3D "https://download.gnome.org/sources/gtksourceview/5.4/${PNAME}-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "eb3584099cfa0adc9a0b1ede08def6320bd099e79e74a2d0aefb4057cd93d68e"
+SRC_URI[sha256sum] =3D "ad140e07eb841910de483c092bd4885abd29baadd6e95fa22d93ed2df0b79de7"
 
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
-- 
2.25.1


