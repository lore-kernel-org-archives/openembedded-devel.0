Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PNZCN-0000lj-A2
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 00:01:24 +0100
Received: by pxi17 with SMTP id 17so1010518pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Nov 2010 15:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=xNG01plzhakIN5B21VZBPtANtsGyLUK2sXRKYCK5ZTE=;
	b=R/s+dqwKWq5FnKLjXSlas6ZYxfhNZ65fkY2QDK/Af0WmdOoZfyZ/GpEy9fgF6ty7Sb
	OL/o7HrsYzPBIxlqGkQDo4fEGJskweobxU3nXjLDzPh5yo2xTRk7j4H5Ndn4pGP6JAJw
	gL6eUo67hcgVWmnywFlZNmAhicdN0JvnUN6rw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=O5Tj6n62XnXUWL9TOkkqwMpg0xzD1/Sv83lXZkD5Y7S04+Ds/n87kZ/CYVfcjyEdFA
	2jx+05kVCXR+wBisu2OVzij3jy23SYRS9rjsytfgDAHleLZI6Ok7/I5kW0NIZqr+lRLb
	MASk6nIsi+yHbg2nqgQXq8bqwTzsqHVT5l8I0=
Received: by 10.143.163.19 with SMTP id q19mr7954227wfo.289.1291158000908;
	Tue, 30 Nov 2010 15:00:00 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id q13sm9580633wfc.5.2010.11.30.14.59.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 30 Nov 2010 14:59:59 -0800 (PST)
Message-ID: <4CF581EA.2030206@gmail.com>
Date: Wed, 01 Dec 2010 09:29:54 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] procps.inc: Fix do_install for DISTRO=micro.
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
X-List-Received-Date: Tue, 30 Nov 2010 23:01:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

mv: cannot stat `/mnt/oe/tmp/work/mipsel-oe-linux-uclibc/procps-3.2.8-r12.1/image/bin/uptime': No such file or directory

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/procps/procps.inc |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/recipes/procps/procps.inc b/recipes/procps/procps.inc
index fbad8e7..4557596 100644
--- a/recipes/procps/procps.inc
+++ b/recipes/procps/procps.inc
@@ -9,7 +9,7 @@ LICENSE = "GPL"
 DEPENDS = "ncurses"
 RDEPENDS_${PN} = "ncurses-terminfo"
 
-INC_PR = "r12"
+INC_PR = "r13"
 
 SRC_URI = "http://procps.sourceforge.net/procps-${PV}.tar.gz;name=tarball \
 	   file://sysctl.conf \
@@ -30,7 +30,10 @@ EXTRA_OEMAKE = "CFLAGS=-I${STAGING_INCDIR} \
                 LDFLAGS="${LDFLAGS}" \
                 CURSES=-lncurses \
                 install='install -D' \
-                ldconfig=echo"
+                ldconfig=echo \
+                usr/bin=${D}${bindir}/ \
+                usr/proc/bin=${D}${bindir}/ \
+                "
 
 do_install_append () {
 	install -d ${D}${sysconfdir}/init.d
-- 
1.7.1



