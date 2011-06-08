Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1QU8V4-0008SI-VU
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 04:28:07 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LMG006AA9CQNDJ2@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	07 Jun 2011 21:24:27 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 6B70314AF5D; Tue,
	07 Jun 2011 22:24:26 -0400 (EDT)
Date: Tue, 07 Jun 2011 22:24:26 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110608022426.GD2512@denix.org>
References: <2A3DCF3DA181AD40BDE86A3150B27B6B0375258FF2@dbde02.ent.ti.com>
MIME-version: 1.0
In-reply-to: <2A3DCF3DA181AD40BDE86A3150B27B6B0375258FF2@dbde02.ent.ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] qt-4.6.3: update qt's powervr graphics driver	plugin to work with SGX DDK v1.6
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
X-List-Received-Date: Wed, 08 Jun 2011 02:28:07 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Jun 05, 2011 at 06:52:24PM +0530, Balagopalakrishnan, Anand wrote:
> Can we include this patch in OpenEmbedded? This is a critical patch to 
> enable support for latest PowerVR drivers in Qt.
> 
> Regards,
> Anand

Anand,

Two comments:

1. When you move files around as [large] part of the patch, please use -M 
option for git-format-patch to avoid whole "remove-old-file-add-new-file". 
Below [1] is the example of how your re-applied patch looks like one-liner 
when generated with the above option.

2. Your MUA/MTA (Outlook/Exchange) mangled the patch, so it couldn't be 
applied anymore - I had to manually repeat the same steps to reproduce the 
patch. The problem was that in the original wsegl2-support patch there were 
some extra whitespaces, which got lost in the mail, as Outlook decided they 
were not needed... BTW, it wouldn't be a problem if you used -M option when 
creating the patch. Anyway, please consider sending patches directly using 
git-send-email or, if you absolutely cannot avoid Outlook/Exchange, please 
then attach them...

[1] Re-generated patch:

From e992a948b8a542e1f500342fca0a991f47bfbe9c Mon Sep 17 00:00:00 2001
From: Denys Dmytriyenko <denys@ti.com>
Date: Tue, 7 Jun 2011 21:54:58 -0400
Subject: [PATCH] qt-4.6.3: update qt's powervr graphics driver plugin to work with SGX DDK v1.6

* The wsegl2 patch is required to build Qt with the latest SGX PowerVR drivers
* Moved the wsegl2 patch from qt4/qt-4.7.3 to qt4/files
* Added the wsegl2 patch to qt-4.6.3

Note: This is the "massaged in" version of the original patch from Anand
Balagopalakrishnan <anandb@ti.com> as it was mangled and couldn't be applied.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../{qt-4.7.3 => files}/0001-wsegl2-support.patch  |    0
 recipes/qt4/qt-4.6.3.inc                           |    1 +
 2 files changed, 1 insertions(+), 0 deletions(-)
 rename recipes/qt4/{qt-4.7.3 => files}/0001-wsegl2-support.patch (100%)

diff --git a/recipes/qt4/qt-4.7.3/0001-wsegl2-support.patch b/recipes/qt4/files/0001-wsegl2-support.patch
similarity index 100%
rename from recipes/qt4/qt-4.7.3/0001-wsegl2-support.patch
rename to recipes/qt4/files/0001-wsegl2-support.patch
diff --git a/recipes/qt4/qt-4.6.3.inc b/recipes/qt4/qt-4.6.3.inc
index 36c6a56..1d5df70 100644
--- a/recipes/qt4/qt-4.6.3.inc
+++ b/recipes/qt4/qt-4.6.3.inc
@@ -15,6 +15,7 @@ SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.
            file://0010-no-simpledecoration-example.patch \
            file://fix-config-tests.patch \
            file://qt-config.patch \
+           file://0001-wsegl2-support.patch \
            file://g++.conf \
            file://linux.conf \
            "
-- 
1.7.0.4


