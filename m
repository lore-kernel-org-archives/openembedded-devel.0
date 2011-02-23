Received: from mail-gw0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PsETR-0000sC-16
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 14:09:45 +0100
Received: by mail-gw0-f50.google.com with SMTP id a20so1107689gwa.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 05:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=yJG27rRfOas1Yb40A2+OWsDQArlQx4iyzMIij9lpqMY=;
	b=mBVsLQwwsNNyqfjIlcteMTqVmL/H+aiR47ILfjTjGU92+LTdvAzzEBxuWfIaCM2rz1
	Z6uwL3kvqTQ75h3pEYy59z0Mj5IBrAed4Lif4msNC4b3Cn3r1wMAQwdV96W1oEh6luF9
	rv8Bmq6vlZ98yaN7d3+WRaE52Rn8iII9V8V/c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=qjOuer6umw8aLyMydxNX35euOp9aCjr/XhSVyivBppNxnek58rsWnAXwNdFtX7dYZ5
	MU68vw3Xhflu5pXxISmc+9IBcG8ltdQ5MLlQ1dP9Vh5Bge5o8ZKJMQOIMTVhV9FD/GoO
	1RNAMJSYiUORG6WvYZjh8jldXcZf1azLqwiJc=
Received: by 10.150.73.35 with SMTP id v35mr544yba.22.1298466507835;
	Wed, 23 Feb 2011 05:08:27 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n10sm2276929yhb.38.2011.02.23.05.08.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Feb 2011 05:08:26 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Feb 2011 13:07:21 +0000
Message-Id: <1298466445-16486-11-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1298466445-16486-10-git-send-email-otavio@ossystems.com.br>
References: <1298466445-16486-1-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-2-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-3-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-4-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-5-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-6-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-7-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-8-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-9-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-10-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 10/14] contrib/openembedded-essential (debian): depends on chrpath
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
X-List-Received-Date: Wed, 23 Feb 2011 13:09:45 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../debian/openembedded-essential/debian/changelog |    6 ++++++
 .../debian/openembedded-essential/debian/control   |    2 +-
 2 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/contrib/distro-packages/debian/openembedded-essential/debian/changelog b/contrib/distro-packages/debian/openembedded-essential/debian/changelog
index 8485f3e..afd198a 100644
--- a/contrib/distro-packages/debian/openembedded-essential/debian/changelog
+++ b/contrib/distro-packages/debian/openembedded-essential/debian/changelog
@@ -1,3 +1,9 @@
+openembedded-essential (1.5) unstable; urgency=low
+
+  * add chrpath as dependency.
+
+ -- Otavio Salvador <otavio@ossystems.com.br>  Fri, 18 Feb 2011 02:00:59 +0000
+
 openembedded-essential (1.4) unstable; urgency=low
 
   * remove gfortran from dependency after a5c7b007eaa675cc904f5285291d2f8a597efc84 caused controversy.
diff --git a/contrib/distro-packages/debian/openembedded-essential/debian/control b/contrib/distro-packages/debian/openembedded-essential/debian/control
index 9f1e095..f751672 100644
--- a/contrib/distro-packages/debian/openembedded-essential/debian/control
+++ b/contrib/distro-packages/debian/openembedded-essential/debian/control
@@ -7,7 +7,7 @@ Standards-Version: 3.7.3
 
 Package: openembedded-essential
 Architecture: all
-Depends: python (>= 2.3), ccache, build-essential, quilt, bison, wget, cvs, subversion, git-core, monotone, coreutils, unzip, texi2html, texinfo, libsdl1.2-dev, docbook-utils, gawk, bc, python-pysqlite2, help2man
+Depends: python (>= 2.3), ccache, build-essential, quilt, bison, wget, cvs, subversion, git-core, monotone, coreutils, unzip, texi2html, texinfo, libsdl1.2-dev, docbook-utils, gawk, bc, python-pysqlite2, help2man, chrpath
 Description: Metapackage to install all needed packages to start using OpenEmbedded
  OpenEmbedded is a full-featured development environment allowing users to
  target a wide variety of devices. Supporting multiple build, release paths and
-- 
1.7.2.3



