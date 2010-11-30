Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PNJr7-0004BA-Iw
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 07:38:26 +0100
Received: by pxi17 with SMTP id 17so866657pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 22:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=h447v2jta0LL0Sy2XkdWZr8p2Nh8RBj0NclLnKEfTec=;
	b=j8HJUQtOjF3k6aUB9298vHRrOmsHraGCtHJFH0pe9BvAtEoMV+9r/MWTNO1ltvTJWn
	Szwqo9lCfasEKXG0BmfBRZnZMi17xwmQBrw6PyeX/OxGfxQcKwfPaLj21SAASH454Z48
	82NsVyM0z4y0ZmYHsCp/NzeCEb62jf2GMpXFY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=NEWX87oop2uhs8/FCxGK6bOZapGSur3NwexoY2DKdUmwj0Wwt/tKDX1QiW/PHoUFLB
	kH+VvH2mW5ab5QBfyRtkbJ2vX2i1gRvusfotMeQwcLb7bWG3XpcfQFs8jKzLONdKf0PB
	tw5IOmKYmBOmUoA625sfbAbypErvwf6U4Qalg=
Received: by 10.142.140.15 with SMTP id n15mr6654579wfd.247.1291099023751;
	Mon, 29 Nov 2010 22:37:03 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id p8sm8521260wff.16.2010.11.29.22.37.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 29 Nov 2010 22:37:02 -0800 (PST)
Message-ID: <4CF49B89.5070808@gmail.com>
Date: Tue, 30 Nov 2010 17:06:57 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
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
Subject: [PATCH] syslog-ng.inc: Fix build when DISTRO_FEATURES lacks largefile and/or ipv6.
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
X-List-Received-Date: Tue, 30 Nov 2010 06:38:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

In file included from /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/limits.h:27:0,
                 from /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/lib/glib-2.0/include/glibconfig.h:11,
                 from /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/glib-2.0/glib/gtypes.h:34,
                 from /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/glib-2.0/glib/galloca.h:34,
                 from /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/glib-2.0/glib.h:32,
                 from syslog-ng.h:37,
                 from misc.h:27,
                 from misc.c:24:
/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/features.h:216:5: error: #error It appears you have defined _FILE_OFFSET_BITS=64. Unfortunately, uClibc was built without large file support enabled.

| afinet.c: In function 'afinet_setup_socket':
| afinet.c:205:42: error: 'IPV6_JOIN_GROUP' undeclared (first use in this function)
| afinet.c:205:42: note: each undeclared identifier is reported only once for each function it appears in
| afinet.c:206:42: error: 'IPV6_MULTICAST_LOOP' undeclared (first use in this function)
| afinet.c:211:44: error: 'IPV6_MULTICAST_HOPS' undeclared (first use in this function)
| afinet.c:217:40: error: 'IPV6_UNICAST_HOPS' undeclared (first use in this function)
| afinet.c: In function 'afinet_dd_construct_ipv6_packet':
| afinet.c:448:36: warning: dereferencing type-punned pointer will break strict-aliasing rules
| afinet.c:449:36: warning: dereferencing type-punned pointer will break strict-aliasing rules

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/syslog-ng/syslog-ng.inc |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/recipes/syslog-ng/syslog-ng.inc b/recipes/syslog-ng/syslog-ng.inc
index f12791d..452dd78 100644
--- a/recipes/syslog-ng/syslog-ng.inc
+++ b/recipes/syslog-ng/syslog-ng.inc
@@ -10,7 +10,12 @@ INC_PR = "r4"
 
 inherit autotools
 
-EXTRA_OECONF = "--with-libol=${STAGING_BINDIR_CROSS}/ --enable-dynamic-linking"
+noipv6 = "${@base_contains('DISTRO_FEATURES', 'ipv6', '', '--disable-ipv6', d)}"
+EXTRA_OECONF = "--with-libol=${STAGING_BINDIR_CROSS}/ --enable-dynamic-linking ${noipv6}"
+
+do_configure_prepend() {
+	eval "${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "s/-D_LARGEFILE_SOURCE//" -e "s/-D_FILE_OFFSET_BITS=64//" ${S}/configure.in', d)}"
+}
 
 do_install_append() {
         install -d ${D}/${sysconfdir}/${PN}
-- 
1.7.1



