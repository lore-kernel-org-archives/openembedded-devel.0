Received: from [74.125.44.156] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M2arl-0000Ua-Nc
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 May 2009 02:56:37 +0200
Received: by yx-out-1718.google.com with SMTP id 36so1077916yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2009 17:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=rfXz5H4Eb6hT6QsWdqmzxa425eoszspOaouj/IrCF5M=;
	b=vbFjqh6LnaPOiBPTexLX0PgRtbS5ng8MqJhhKl9eImpArcVFFMNwCJbyokZjySzO8u
	HdBQwcsXHq8wLoAjnJHDBtJPYza8b6kTIpQ6ZyYLzb5m2+kKPXyIZ2n57aWay4BATrTu
	qgNWRrBINW5ZAAjzPH1f02eJc86xmPefPcbIg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=OYZ1w2cQH3ENNgaf3We1sLEI0V2/eUERPzjsaPVrWpLuxf6J7IMNIH3f9EDfAkolWd
	jrjQ6HVt4ZbgQ0NIVDKoIbN6PNIt70LZQGOyTgMCreI9gchhmUacOSe4ZXzAUHk7KJX2
	zEwwDF4wu61mlg+YjBD8aoun1Hb+WaGhtxFuI=
Received: by 10.100.43.1 with SMTP id q1mr8457254anq.53.1241830222427;
	Fri, 08 May 2009 17:50:22 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 5sm402182ywl.9.2009.05.08.17.50.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 May 2009 17:50:22 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 12CDC6101AA; Fri,  8 May 2009 21:50:52 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 May 2009 21:50:33 -0300
Message-Id: <1241830239-5594-18-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.rc1.51.gea0b7
In-Reply-To: <1241830239-5594-17-git-send-email-otavio@ossystems.com.br>
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
	<1241830239-5594-17-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 17/23] Documentation for PACKAGE_ARCH is actually for PACKAGE_ARCHS
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
X-List-Received-Date: Sat, 09 May 2009 00:56:38 -0000

From: Mario Domenech Goulart <mario@ossystems.com.br>

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 docs/usermanual/reference/class_rootfs_ipkg.xml |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/usermanual/reference/class_rootfs_ipkg.xml b/docs/usermanual/reference/class_rootfs_ipkg.xml
index 98e6e25..fde8a38 100644
--- a/docs/usermanual/reference/class_rootfs_ipkg.xml
+++ b/docs/usermanual/reference/class_rootfs_ipkg.xml
@@ -114,7 +114,7 @@
     </varlistentry>
 
     <varlistentry>
-      <term>PACKAGE_ARCH</term>
+      <term>PACKAGE_ARCHS</term>
 
       <listitem>
         <para>Defines the list of architectures that are support by the target
-- 
1.6.3.rc1.51.gea0b7



