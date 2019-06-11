Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E917D605C3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 08:15:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5B8FKlL000805
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 01:15:20 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 11 Jun 2019 01:15:20 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 11 Jun 2019 04:15:16 -0400
Message-ID: <20190611081516.169741-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [meta-xfce][PATCH] xfce4-settings: set default theme Adwaita
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
X-List-Received-Date: Tue, 11 Jun 2019 08:15:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Kai Kang <kai.kang@windriver.com>

The pre-configured default theme Xfce doesn't work as expected. For
example, no layout in start menu and applications' menu bar. And
GtkColorButton is blank in config tab page from xfce4-terminal -> Edit
-> Preference -> Colors.

So set Adwaita as default theme instead.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../files/0001-xsettings.xml-Set-default-themes.patch  | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/files/0001-xsettings.xml-Set-default-themes.patch b/meta-xfce/recipes-xfce/xfce4-settings/files/0001-xsettings.xml-Set-default-themes.patch
index 67df05a79..0463d2ebd 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/files/0001-xsettings.xml-Set-default-themes.patch
+++ b/meta-xfce/recipes-xfce/xfce4-settings/files/0001-xsettings.xml-Set-default-themes.patch
@@ -9,6 +9,14 @@ Content-Transfer-Encoding: 8bit
 Upstram status:  Inappropriate [configuration]
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+
+Theme Xfce doesn't work as expected. For example, no layout in start
+menu and applications' menu bar. And GtkColorButton is blank in config
+tab page from xfce4-terminal -> Edit -> Preference -> Colors.
+
+So use Adwaita as default theme instead.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
  xfsettingsd/xsettings.xml | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
@@ -23,7 +31,7 @@ index 65ba1ee..9efb3cd 100644
    <property name="Net" type="empty">
 -    <property name="ThemeName" type="empty"/>
 -    <property name="IconThemeName" type="empty"/>
-+    <property name="ThemeName" type="string" value="Xfce"/>
++    <property name="ThemeName" type="string" value="Adwaita"/>
 +    <property name="IconThemeName" type="string" value="Adwaita"/>
      <property name="DoubleClickTime" type="int" value="400"/>
      <property name="DoubleClickDistance" type="int" value="5"/>
-- 
2.20.0


