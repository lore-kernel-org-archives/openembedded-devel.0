Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1NJ0R5-0002oA-7n
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Dec 2009 09:01:14 +0100
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 7650FC48D7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2009 02:59:30 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Fri, 11 Dec 2009 02:59:30 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:message-id:mime-version:content-type;
	s=smtpout; bh=Y0+PdeTTsjGKhUGuJUkaTfWmViY=;
	b=k3Fg5iN/CF8qV04jE1ciPR+a3WOE9ti1rTfFn3XkQnpgp2/c7KevEwZr6o3CLfPN2EPA8RjICYHB9V0L/mhOrLwO+psrr1Zp07EcMM5H3fnObJQfuDFLNIOEb2iAZHW8DBvvs9XYnYRCJmM3wot1zyKcD4ZPqrJhja8eaeDlmUg=
X-Sasl-enc: No/gMP/JaVf5iUTE+kyeLA0jGZlmugf4TnrCIbJnY8Np 1260518369
Received: from [192.168.178.120] (p54838071.dip0.t-ipconnect.de
	[84.131.128.113])
	by mail.messagingengine.com (Postfix) with ESMTPSA id B44504ABB3F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2009 02:59:29 -0500 (EST)
Date: Fri, 11 Dec 2009 08:59:22 +0100 (CET)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <alpine.LNX.2.00.0912110857540.5053@asterix.crazy-teaparty.dyndns.org>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.25
X-SA-Exim-Mail-From: vjensen@gmx.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] linux_2.6.29.bb: update to kernel 2.6.29.6
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
X-List-Received-Date: Fri, 11 Dec 2009 08:01:14 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Version 2.6.29 fails on arch powerpc because of a syntax error.  See
http://lkml.indiana.edu/hypermail/linux/kernel/0906.1/00867.html

Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
 recipes/linux/linux_2.6.29.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes/linux/linux_2.6.29.bb b/recipes/linux/linux_2.6.29.bb
index f78193d..87599d4 100644
--- a/recipes/linux/linux_2.6.29.bb
+++ b/recipes/linux/linux_2.6.29.bb
@@ -1,6 +1,6 @@
 require linux.inc

-PR = "r9"
+PR = "r10"

 S = "${WORKDIR}/linux-2.6.29"

@@ -21,6 +21,9 @@ DEFAULT_PREFERENCE_stamp9g20evb = "1"
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.29.tar.bz2 \
            file://defconfig"

+# Bug fixes on the 2.6.29.x stable branch
+SRC_URI += "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-2.6.29.6.bz2;patch=1"
+
 SRC_URI_append_boc01 = "\
 	file://boc01.dts \
 	file://boc01.dts.v1 \
-- 
1.6.4.4


-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


