Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M6yJR-0005ca-GR
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 04:47:17 +0200
Received: by mail-fx0-f172.google.com with SMTP id 20so805174fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2009 19:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=imkfufZBJtHDeLUjVGzPn2//xftpcnAXJ1Y1APEaNpQ=;
	b=O24oUW0J3jK33Qq/6ULdbJjHyv1E9jcWNhGBucENfnx1KY3/HXzo08TAM0ahdX5hYY
	tA/7U4H9LuLuLz2Wsx++Y3eCtLCXuM44Yq4GZzDjAWlmBcDfWtEpb9IEdYfB5CalAG/6
	QfWVB6kAGlmi124i77BotntN8QFCFNBr7q/+8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=UBdZEAfSy2A3pBSd+38Q6CguGKx7nGQw8+74ZMSiEa4IRY/Sr40DGFqMiQ3Nx+49F0
	moCpTvxvFOL0gfRvgnkDb84AqNfbmhEz5Z6Mx1c+cELMFLWIrAy23Ht4Q/sfuAa9wlU3
	2qCeENNlbqAifejcsIu7NGKYUJpS0rAvOtZlM=
Received: by 10.103.168.12 with SMTP id v12mr1061575muo.130.1242873586011;
	Wed, 20 May 2009 19:39:46 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 14sm1192811muo.33.2009.05.20.19.39.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 May 2009 19:39:44 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 9CD776103AE; Wed, 20 May 2009 23:39:42 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 May 2009 23:39:29 -0300
Message-Id: <1242873578-17444-15-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.1.54.g99dd
In-Reply-To: <1242873578-17444-14-git-send-email-otavio@ossystems.com.br>
References: <1242873578-17444-1-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-2-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-3-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-4-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-5-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-6-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-7-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-8-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-9-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-10-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-11-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-12-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-13-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-14-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 14/23] s/IPKG_INSTALL/PACKAGE_INSTALL/
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
X-List-Received-Date: Thu, 21 May 2009 02:47:17 -0000

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
1.6.3.1.54.g99dd



