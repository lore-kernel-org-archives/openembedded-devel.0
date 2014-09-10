Return-Path: <pierluigi.passaro@phoenixsoftware.it>
X-Greylist: delayed 429 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 10 Sep 2014 16:09:58 UTC
Received: from smtpcmd01217.aruba.it (smtpcmd01217.aruba.it [62.149.158.217])
	by mail.openembedded.org (Postfix) with ESMTP id DAFC760DD7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Sep 2014 16:09:58 +0000 (UTC)
Received: from [192.168.1.71] ([94.33.39.20])
	by smtpcmd01.ad.aruba.it with bizsmtp
	id pU2n1o0090S5K6601U2nov; Wed, 10 Sep 2014 18:02:47 +0200
Message-ID: <54107627.9060100@phoenixsoftware.it>
Date: Wed, 10 Sep 2014 18:02:47 +0200
From: Pierluigi Passaro <pierluigi.passaro@phoenixsoftware.it>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [meta-qt5] [daisy] qtwayland fetch fail
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Sep 2014 16:10:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,
working on daisy, it looks like the fetching url of qtwayland is no 
longer available.

The following patch helped me to solve the problem, hope it will help...

Regards
Pierluigi

===============

diff --git a/recipes-qt/qt5/qtwayland-native_git.bb 
b/recipes-qt/qt5/qtwayland-native_git.bb
index 988aa98..64485de 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -4,4 +4,5 @@ require ${PN}.inc
  # qtwayland wasn't released yet, last tag before this SRCREV is 
5.0.0-beta1
  # qt5-git PV is only to indicate that this recipe is compatible with 
qt5 5.2.1

-SRCREV = "a237778666666ab77c4e8e6b501cf0fbe7c9223e"
+QT_MODULE_BRANCH = "dev"
+SRCREV = "573d0ee5ba86d99095f217ea9e19172bfc5e75fd"
diff --git a/recipes-qt/qt5/qtwayland_git.bb 
b/recipes-qt/qt5/qtwayland_git.bb
index 789a882..c192914 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -4,6 +4,7 @@ require ${PN}.inc
  # qtwayland wasn't released yet, last tag before this SRCREV is 
5.0.0-beta1
  # qt5-git PV is only to indicate that this recipe is compatible with 
qt5 5.2.1

+QT_MODULE_BRANCH = "dev"
  SRCREV = "573d0ee5ba86d99095f217ea9e19172bfc5e75fd"

  SRC_URI += " \


