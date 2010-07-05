Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OVfRv-0006rj-CH
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Jul 2010 08:46:41 +0200
Received: by pxi12 with SMTP id 12so2292861pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Jul 2010 23:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=cyF71hvvC0z2trCVCITUdOI/QSXPL9yYbzNvIbR/Tsk=;
	b=IpN7LsUqXnLi18Zxj6Hny+2uX2QspUSZ31alcLwUTPRH7Wao4tfqzBH0wsTzcMKlYe
	ZA/mUGzN4TFddGOJCCuyxTiM8UU7zrz0YVFiI1vWX0Z0aebRXK3EcsIYXTO7grDT9+fo
	LAxMUo9t2+z9/3t0/JwsYlcer9KgSviYWqJHU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=LTw/qCFISq962HpfimWZ0+abnCXLvEZ5WWbHfk0nxHmr2H/yM17hfCks5lnV3sQqTG
	CYqOIbG5hiJ6ocKYn5IpOoaBo0VNlCLAaw7HGfKyjbb7A5cNrRZzsdTO4Qc7BQTuYe0Q
	SGuu/s4wp7v2jkKzrPnuaHGCv6c1AYfP9GaFQ=
Received: by 10.142.194.1 with SMTP id r1mr2809687wff.260.1278312106939;
	Sun, 04 Jul 2010 23:41:46 -0700 (PDT)
Received: from [10.0.0.4] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id 33sm4203934wfd.6.2010.07.04.23.41.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 04 Jul 2010 23:41:46 -0700 (PDT)
Message-ID: <4C317EA5.5070801@gmail.com>
Date: Mon, 05 Jul 2010 16:11:41 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100401 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] ltrace_0.5.3.bb: Fix build for mipsel.
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
X-List-Received-Date: Mon, 05 Jul 2010 06:46:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/ltrace/ltrace_0.5.3.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/ltrace/ltrace_0.5.3.bb b/recipes/ltrace/ltrace_0.5.3.bb
index 368fca2..c856788 100644
--- a/recipes/ltrace/ltrace_0.5.3.bb
+++ b/recipes/ltrace/ltrace_0.5.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel"
 DEPENDS = "libelf binutils"
 LICENSE = "GPLv2"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "\
   ${DEBIAN_MIRROR}/main/l/ltrace/ltrace_${PV}.orig.tar.gz;name=archive \
@@ -23,7 +23,7 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 do_configure_prepend() {
 	case ${TARGET_ARCH} in
 		arm*)  ln -sf ./linux-gnu sysdeps/linux-gnueabi ;;
-		mips)  ln -sf ./mipsel sysdeps/linux-gnu/mips ;;
+		mips*)  ln -sf ./mipsel sysdeps/linux-gnu/mips ;;
 	esac
 	sed -e 's:uname -m:echo @HOST_CPU@:' \
 		sysdeps/linux-gnu/Makefile > sysdeps/linux-gnu/Makefile.in
-- 
1.7.1



