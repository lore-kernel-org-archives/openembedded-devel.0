Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1MczUR-0000Lf-Ad
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 12:30:59 +0200
Received: from localhost.localdomain (unknown [192.168.1.187])
	by mail.altell.local (Postfix) with ESMTP id 6E7A8BBE39;
	Mon, 17 Aug 2009 14:13:34 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Aug 2009 14:13:05 +0400
Message-Id: <1250503985-9277-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.3.3
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-Spam-Status: No
Subject: [PATCH] site/ix86-common: fix grave bug in ac_cv_sizeof_unsigned_char
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
X-List-Received-Date: Mon, 17 Aug 2009 10:31:00 -0000

ac_cv_sizeof_unsigned_char definition accidentally redefines
ac_cv_sizeof_unsigned_int to 1. Luckily, not many packages are using that
but for example it completely breakes gnutls.

Fix that.
---
 site/ix86-common |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/site/ix86-common b/site/ix86-common
index a5c4b60..281ab91 100644
--- a/site/ix86-common
+++ b/site/ix86-common
@@ -1,5 +1,5 @@
 ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
-ac_cv_sizeof_unsigned_char=${ac_cv_sizeof_unsigned_int=1}
+ac_cv_sizeof_unsigned_char=${ac_cv_sizeof_unsigned_char=1}
 ac_cv_sizeof_char_p=${ac_cv_sizeof_char_p=4}
 ac_cv_sizeof_unsigned_char_p=${ac_cv_sizeof_unsigned_char_p=4}
 ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
-- 
1.6.3.3



