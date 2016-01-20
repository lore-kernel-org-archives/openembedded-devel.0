Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 522CF6010B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2016 08:32:56 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u188so2481311wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2016 00:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=vBb48hGTt1OLOaKErwTHEB9YbmjVo7eUGpLPQFJpvjA=;
	b=bEAeMoAmMOHMPdt86ATq1FVUwLyeU7qvvZmssObvfc2HEkiLD0CmeMz0FQQ0gqCXFI
	wjtcLtSRznS1ZoITN1+0TV6VqZndI2Klxs45RIdbhEvcQ3oNQ62XNU1r/qca79Ff5PUG
	QW8y0kImfXljLHH6PMZ3KHgMIj4Ro//INVJaddBbKt7hNbY+ieGN+DtdJf+swxr6eX66
	dnR7T2rAgkRp2zUKyIzS+jFwXPeAOW9/8R6uhVkM0IHib0PIkgA0lHdW7uJQI9tgIO0+
	RZ2Gufjax9xYN5x2lnodV+flxDMBmNF99t6pAHJNL6jFZ3YZbblQTc8HylwSHDDwLZgF
	+HmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=vBb48hGTt1OLOaKErwTHEB9YbmjVo7eUGpLPQFJpvjA=;
	b=AMtpUhK9jYc6bBeazU3e4KxD97aJ1bL2PBaWDFwpd8ov1UgIaH2GsytTURksizKQv8
	VGZnMTCNBtna+g8BqAbBI5W7iQwooBQqOmzJOnDSCNZxgf+R+q/N2cg24DaCTvEu3oEp
	qB7igPKB12h2KYToHEDrVYULwXBTiVPGaXmVbo48p5T9gnSsTXfeNrS4P7C1n/N0HweZ
	ec9eX2Ma2/yhODQTI9GJ7gzA7xXmsioUVS2Zd7msXZxmUL7F6g4DAkLiDGNGscX/GMqx
	0w93cVg/I3+6bP65BWtvKlDsxnjbHU1WVhI6SqWiLPXtOzJA9PGiOI2X/wOCodo5aeAZ
	wkWg==
X-Gm-Message-State: ALoCoQm3F1pTcKSUqXUtFdH3o8+SiQS5lnxkHsnvRTL/0ybh1XhIV+IqNEMRiqIWMJ9NbC8nVXf/6F2w4rnaadWJwZnY68UWYQ==
X-Received: by 10.194.117.68 with SMTP id kc4mr34206954wjb.111.1453278777003; 
	Wed, 20 Jan 2016 00:32:57 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-253-155.hsi05.unitymediagroup.de. [176.198.253.155])
	by smtp.googlemail.com with ESMTPSA id
	p9sm31982342wjy.41.2016.01.20.00.32.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Jan 2016 00:32:56 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jan 2016 09:32:26 +0100
Message-Id: <1453278746-22646-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1453278746-22646-1-git-send-email-schnitzeltony@googlemail.com>
References: <1453278746-22646-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gvfs: disable build of documentation to fix build in some envirionments
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jan 2016 08:32:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

man/Makfile.am make is trying to download

http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl

which sometimes fails with:

make[2]: Entering directory `/home/peter/oe-core/tmp-glibc/work/cortexa9t2hf-vfp-neon-angstrom-linux-gnueabi/gvfs/1.24.2-r0/build/man'
/home/peter/oe-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/xsltproc --nonet --stringparam man.output.quietly 1 --stringparam funcsynopsis.style ansi --stringparam man.th.extra1.suppress 1 --stringparam man.authors.section.enabled 0 --stringparam man.copyright.section.enabled 0 http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl /home/peter/oe-core/tmp-glibc/work/cortexa9t2hf-vfp-neon-angstrom-linux-gnueabi/gvfs/1.24.2-r0/gvfs-1.24.2/man/gvfs-cat.xml
/home/peter/oe-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/xsltproc --nonet --stringparam man.output.quietly 1 --stringparam funcsynopsis.style ansi --stringparam man.th.extra1.suppress 1 --stringparam man.authors.section.enabled 0 --stringparam man.copyright.section.enabled 0 http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl /home/peter/oe-core/tmp-glibc/work/cortexa9t2hf-vfp-neon-angstrom-linux-gnueabi/gvfs/1.24.2-r0/gvfs-1.24.2/man/gvfs-copy.xml
/home/peter/oe-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/xsltproc --nonet --stringparam man.output.quietly 1 --stringparam funcsynopsis.style ansi --stringparam man.th.extra1.suppress 1 --stringparam man.authors.section.enabled 0 --stringparam man.copyright.section.enabled 0 http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl /home/peter/oe-core/tmp-glibc/work/cortexa9t2hf-vfp-neon-angstrom-linux-gnueabi/gvfs/1.24.2-r0/gvfs-1.24.2/man/gvfs-info.xml
/home/peter/oe-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/xsltproc --nonet --stringparam man.output.quietly 1 --stringparam funcsynopsis.style ansi --stringparam man.th.extra1.suppress 1 --stringparam man.authors.section.enabled 0 --stringparam man.copyright.section.enabled 0 http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl /home/peter/oe-core/tmp-glibc/work/cortexa9t2hf-vfp-neon-angstrom-linux-gnueabi/gvfs/1.24.2-r0/gvfs-1.24.2/man/gvfs-ls.xml
I/O error : Attempt to load network entity http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
warning: failed to load external entity "http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl"
cannot parse http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
I/O error : Attempt to load network entity http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
warning: failed to load external entity "http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl"
cannot parse http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
make[2]: *** [gvfs-cat.1] Error 4
make[2]: *** Waiting for unfinished jobs....
make[2]: *** [gvfs-copy.1] Error 4
I/O error : Attempt to load network entity http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
warning: failed to load external entity "http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl"
cannot parse http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
make[2]: *** [gvfs-info.1] Error 4
I/O error : Attempt to load network entity http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
warning: failed to load external entity "http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl"
cannot parse http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
make[2]: *** [gvfs-ls.1] Error 4
make[2]: Leaving directory `/home/peter/oe-core/tmp-glibc/work/cortexa9t2hf-vfp-neon-angstrom-linux-gnueabi/gvfs/1.24.2-r0/build/man'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/peter/oe-core/tmp-glibc/work/cortexa9t2hf-vfp-neon-angstrom-linux-gnueabi/gvfs/1.24.2-r0/build'
make: *** [all] Error 2
ERROR: oe_runmake failed

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.24.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.24.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.24.2.bb
index 080fd86..aa62070 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.24.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.24.2.bb
@@ -15,6 +15,7 @@ SRC_URI += " \
 EXTRA_OECONF = " \
     --disable-gdu \
     --enable-udisks2 \
+    --disable-documentation \
     --with-archive-includes=${STAGING_INCDIR} \
     --with-archive-libs=${STAGING_LIBDIR} \
 "
-- 
2.5.0


