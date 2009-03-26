Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lmypm-0002XG-Ql
	for openembedded-devel@openembedded.org; Fri, 27 Mar 2009 00:18:02 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Lmyo5-0001oB-8i
	for openembedded-devel@openembedded.org; Thu, 26 Mar 2009 23:16:19 +0000
Received: from 155.104.37.17 ([155.104.37.17])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 26 Mar 2009 23:16:17 +0000
Received: from jeremy.williams by 155.104.37.17 with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 26 Mar 2009 23:16:17 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Jeremy Williams <jeremy.williams@ngc.com>
Date: Thu, 26 Mar 2009 23:16:05 +0000 (UTC)
Message-ID: <loom.20090326T231434-944@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: main.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 155.104.37.17 (Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.9.0.7) Gecko/2009021910 Firefox/3.0.7 (.NET CLR 3.5.30729))
Sender: news <news@ger.gmane.org>
Subject: [PATCH] Busybox 1.13.2 - modprobe.patch checksum update
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
X-List-Received-Date: Thu, 26 Mar 2009 23:18:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Looks like busybox-1.13.2-modprobe.patch was modified, causing a checksum
failure.  Here's the patch:

-------------------------------------------------------------

diff --git a/conf/checksums.ini b/conf/checksums.ini
index be8f05f..aed6fd3 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -3051,8 +3051,8 @@ md5=a72d169e9545e26257032e0e367feb95
 sha256=fd4a64c6a83e07586de0360258162c5bf431f164b3980301185743e4029940df
 
 [http://busybox.net/downloads/fixes-1.13.2/busybox-1.13.2-modprobe.patch]
-md5=b2b9d0992b055816077ec9e0e4ee7775
-sha256=ba540cad8a029ff2eec7b078e31a308f408c074a13160aa7eba80f5ca18ee703
+md5=6eeb6efcd71e57082d6654a9a6a368eb
+sha256=a02007661cf2f318a66468456f8fc8ae1177e12c3c66c59ff2de4d98863a388e
 
 [http://busybox.net/downloads/fixes-1.13.2/busybox-1.13.2-tar.patch]
 md5=90d093817855bc63ad16fbb8524f80df




