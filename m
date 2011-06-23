Received: from na3sys009aob118.obsmtp.com ([74.125.149.243] helo=psmtp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@nanometrics.ca>) id 1QZvrt-0003Kg-Ft
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Jun 2011 04:12:07 +0200
Received: from mail-yx0-f182.google.com ([209.85.213.182]) (using TLSv1) by
	na3sys009aob118.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTgPxFCBFP2SrK9MWFAvnnTiD2xIDo34k@postini.com;
	Thu, 23 Jun 2011 19:08:00 PDT
Received: by yxl31 with SMTP id 31so1279677yxl.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2011 19:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=NR3uPKFZNgY0AYnuWlDfueamdwbUTaa9awjas92SuG4=;
	b=mhi2OqjvkRIOb0/svfWpUuEZYUUvONkM0Sxr1SEQhKYAYIh9YUmJraJ8FYKdNz7jnu
	LbP5Vi2MTW8Wr9VLZxhTYsiAJ9i/WKGsQzuA1tmZszncDmAN50Tgwn8rMyVn+U4IsVzl
	8pjosBC2C3geevmAn6/3Z9OHqnz3tPiiyyjdI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=nanometrics.ca; s=google;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=AFB6SSYHS9hOR/C4tyZPhjhsFV02W9FQFCWVwX6sAIWG6XzjDgwi05UkhJNgqGeXDn
	vFRooXbyFk5JmzHvBwP09fXvJ7Wc0+WJ7JdNXHSiA9RHc5+miTzrXq19kz3yTvOljBfT
	XCsbpjb4oKZhZa7XLYKQCYBqJkYRq6l0t38D8=
Received: by 10.151.87.14 with SMTP id p14mr2707795ybl.145.1308855409164;
	Thu, 23 Jun 2011 11:56:49 -0700 (PDT)
Received: from localhost.localdomain ([206.191.47.130])
	by mx.google.com with ESMTPS id m17sm24109ybg.22.2011.06.23.11.56.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Jun 2011 11:56:48 -0700 (PDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jun 2011 14:56:46 -0400
Message-Id: <1308855406-3914-1-git-send-email-bengardiner@nanometrics.ca>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] raptor: add libxml2 DEPENDS
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
X-List-Received-Date: Fri, 24 Jun 2011 02:12:07 -0000

The configure script of raptor allows either expat or libxml; the default is libxml.

Add libxml2 to DEPENDS of raptor to fix broken raptor build in clean-tree.

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>

---
Tested on the maintenance-2011.03 branch.

---
 recipes/raptor/raptor_1.4.21.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/raptor/raptor_1.4.21.bb b/recipes/raptor/raptor_1.4.21.bb
index edceff9..e14d75b 100644
--- a/recipes/raptor/raptor_1.4.21.bb
+++ b/recipes/raptor/raptor_1.4.21.bb
@@ -4,6 +4,7 @@ HOMEPAGE = "http://librdf.org/raptor/"
 LICENSE = "LGPL 2.1/GPL 2/Apache 2.0"
 PR = "r0"
 SRC_URI = "http://download.librdf.org/source/raptor-${PV}.tar.gz"
+DEPENDS = "libxml2"
 
 inherit autotools pkgconfig
 
-- 
1.7.4.1



