Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PiABk-0006yf-Bb
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 19:33:52 +0100
Received: by bwz10 with SMTP id 10so1585444bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 10:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=dAo/IOO3AoVi1QmBChiWoaJbXCDeYCS1na92CkH2fHw=;
	b=mqXTybBwv0e9dX2ezgGa6ZHjzgMRXwRGMkfTFqCMJVOscdOKrJWolFWxJHoQIrtWi4
	gzTPLsidTsZeoDOakXRZjW+Pe9f27b4I4FzfU9etlENJZkMS4FR6ajdxFIca/0w6lPY5
	ZOR/SZ5mRwLrHSGLFEKCNSDBiVVXPSKDvErKo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Bbu6of6HEbusLgMtzHJFajya56jmUhSDxlMpbpVM+wYoQJHfScy779ThFJd4YuyUS3
	tOwUnsgOt0iydMKmJOjr9XcoczFfexdij6vVbjSAGbYgqtPVeAdSJBPv8LY3WMS9jZTU
	FLyDCaAqQEvWzV9FgyTp2oVyBZyOQIlaqf4QQ=
Received: by 10.204.67.140 with SMTP id r12mr705552bki.147.1296066119806;
	Wed, 26 Jan 2011 10:21:59 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id q18sm7652188bka.15.2011.01.26.10.21.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 Jan 2011 10:21:58 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PiA0C-0002jL-Uq; Wed, 26 Jan 2011 19:21:56 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Jan 2011 19:21:56 +0100
Message-Id: <1296066116-10466-2-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1296066116-10466-1-git-send-email-rep.dot.nop@gmail.com>
References: <1296066116-10466-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 2/2] busybox: 2.4 module support for kernel24 MACHINE_FEATURES
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
X-List-Received-Date: Wed, 26 Jan 2011 18:33:52 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/busybox/busybox-config.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/busybox/busybox-config.inc b/recipes/busybox/busybox-config.inc
index 723ec0e..d4454b1 100644
--- a/recipes/busybox/busybox-config.inc
+++ b/recipes/busybox/busybox-config.inc
@@ -18,6 +18,7 @@ def features_to_busybox_settings(d):
 	busybox_cfg('nls',  distro_features, 'CONFIG_LOCALE_SUPPORT', cnf, rem)
 	busybox_cfg('ipv4', distro_features, 'CONFIG_FEATURE_IFUPDOWN_IPV4', cnf, rem)
 	busybox_cfg('ipv6', distro_features, 'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem)
+	busybox_cfg('kernel24', machine_features, 'CONFIG_FEATURE_2_4_MODULES', cnf, rem)
 	return "\n".join(cnf), "\n".join(rem)
 # X, Y = ${@features_to_uclibc_settings(d)}
 # unfortunately doesn't seem to work with bitbake, workaround:
-- 
1.7.2.3



