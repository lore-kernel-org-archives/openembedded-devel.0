Received: from [74.125.46.153] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M2arh-0000U7-0M
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 May 2009 02:56:33 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1075455ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2009 17:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=YM+xX7J5sNrGsfL4aFB7F5ZpDvRE5nup2Gr6M/yiZHA=;
	b=fc77mAU9h+wwNbV3lXp00EJjLJEuL3ffs2QpG48VSX+ys6EYiZ2WeZQ1RwKKOLgWdT
	aNtkZw4lRUPqOKIDTUlIGWDX48KPiCj/Nm7P/gDnH26jj22uuB0kIHpWwW9YyGVDlGo7
	JunU7omu8iIPOWxyUeWgzQknfr4/Hv4DG+WEQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=cdhKrRnvnJrhpNnBXk9L4YR0875Xm2fKaBOQfIwpCS+aOOJd/Px76RppWcOh1G53tJ
	hDEi5bdhRWsk88kOeaKy+fiSyklxKm5EX9qEg+8h3HOA6bJp1/whLosIc4FY+fnvBVjo
	e5S1Y/g4sKUNmpa0rrVwajWQIF19pBZk22Sfs=
Received: by 10.100.166.10 with SMTP id o10mr9460990ane.126.1241830217692;
	Fri, 08 May 2009 17:50:17 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 6sm1674582ywn.7.2009.05.08.17.50.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 May 2009 17:50:16 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id DB5736101A1; Fri,  8 May 2009 21:50:52 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 May 2009 21:50:32 -0300
Message-Id: <1241830239-5594-17-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.rc1.51.gea0b7
In-Reply-To: <1241830239-5594-16-git-send-email-otavio@ossystems.com.br>
References: <1241830239-5594-1-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-2-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-3-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-4-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-5-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-6-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-7-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-8-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-9-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-10-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-11-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-12-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-13-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-14-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-15-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-16-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 16/23] s/IPKG_INSTALL/PACKAGE_INSTALL/
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
X-List-Received-Date: Sat, 09 May 2009 00:56:33 -0000

From: Mario Domenech Goulart <mario@ossystems.com.br>

According to the git log (e.g.,
7302c6263934c237da66719bd42505b6c05d10cc), there was a change in the
variable naming.  IPKG_INSTALL was renamed to PACKAGE_INSTALL some time
ago. classes/rootfs_ipk.bbclass currently uses PACKAGE_INSTALL instead
of IPKG_INSTALL.

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 docs/usermanual/reference/class_rootfs_ipkg.xml |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/usermanual/reference/class_rootfs_ipkg.xml b/docs/usermanual/reference/class_rootfs_ipkg.xml
index b60adf8..98e6e25 100644
--- a/docs/usermanual/reference/class_rootfs_ipkg.xml
+++ b/docs/usermanual/reference/class_rootfs_ipkg.xml
@@ -41,7 +41,7 @@
 
     <listitem>
       <para>Installs the list of requested <command>.ipkg</command> packages,
-      <command>${IPKG_INSTALL}</command>;</para>
+      <command>${PACKAGE_INSTALL}</command>;</para>
     </listitem>
 
     <listitem>
@@ -89,7 +89,7 @@
 
   <variablelist>
     <varlistentry>
-      <term>IPKG_INSTALL</term>
+      <term>PACKAGE_INSTALL</term>
 
       <listitem>
         <para>The list of packages which will be installed into the root
@@ -212,4 +212,4 @@
   which is executed without <xref linkend="fakeroot" /> and therefore can be
   used from other classes, such as <xref linkend="image_class" />, that
   are already running under the control of <xref linkend="fakeroot" />.</para>
-</section>
\ No newline at end of file
+</section>
-- 
1.6.3.rc1.51.gea0b7



