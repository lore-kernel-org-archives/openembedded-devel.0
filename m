Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PNJfR-0003rN-PJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 07:26:22 +0100
Received: by pxi17 with SMTP id 17so865532pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 22:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=KiybKJ/Cl/2NzvZtyGx76/YbiDoSRLXWu974nruFK/k=;
	b=j4ymGLzbCRZGItdRCLHh5TiEjvbJ/Ea0lyWe/hP8p4yYTtYgDjtu5vDQWavp+yIjnf
	Ldwq3waVYLNufCZM1Oc+Vo/uX5mXDZk4d5qoIhyNGcZ2mAuFeCeP1pP5wBcC6S7aPjOa
	HC2H0tt20JYyC2MTR4+yU86ipcfEQdLQ47HiA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=lk6f7zfdi8veLuJ7aVThHAT8kAod3TCunwComrp1XpnDeAQi9+3Y9KkmWFRWnDnhHr
	SZHBycu5DgO5eLA83pUVVY/SBjU0pegs7bJseBDMHWGzReQCoOWCUlLScbrr+US6/aaL
	n3QI5+ziP8A7hNQRWgkzkeM7oU5IugFc+dKOg=
Received: by 10.142.210.5 with SMTP id i5mr6540456wfg.324.1291098299096;
	Mon, 29 Nov 2010 22:24:59 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	e14sm8511092wfg.20.2010.11.29.22.24.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 29 Nov 2010 22:24:58 -0800 (PST)
Message-ID: <4CF498B4.4070206@gmail.com>
Date: Tue, 30 Nov 2010 16:54:52 +1030
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
Subject: [PATCH] openjade_1.3.2.bb: Install catalog with the correct path.
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
X-List-Received-Date: Tue, 30 Nov 2010 06:26:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Openjade was doing the following:
install-catalog: addition of /mnt/oe/tmp/work/x86_64-linux/openjade-native-1.3.2-r4/image/mnt/oe/tmp/sysroots/x86_64-linux/share/sgml/openjade-1.3.2/catalog in /mnt/oe/tmp/sysroots/x86_64-linux/etc/sgml/openjade-1.3.2.cat

Which was causing lengthy errors like this one:
http://tinderbox.openembedded.org/packages/1149296/

Now I get:
install-catalog: addition of /mnt/oe/tmp/sysroots/x86_64-linux/share/sgml/openjade-1.3.2/catalog in /mnt/oe/tmp/sysroots/x86_64-linux/etc/sgml/openjade-1.3.2.cat

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/openjade/openjade_1.3.2.bb |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/recipes/openjade/openjade_1.3.2.bb b/recipes/openjade/openjade_1.3.2.bb
index a84e899..6c69173 100644
--- a/recipes/openjade/openjade_1.3.2.bb
+++ b/recipes/openjade/openjade_1.3.2.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "OpenJade is a suite of tools for validating, \
 processing, and applying DSSSL (Document Style Semantics and \
 Specification Language) stylesheets to SGML and XML documents."
 LICENSE = "BSD"
-PR = "r4"
+PR = "r5"
 SRC_URI = "${SOURCEFORGE_MIRROR}/openjade/openjade-${PV}.tar.gz \
 	   file://configure.patch \
 	   file://autoconf.patch \
@@ -42,8 +42,11 @@ do_install_append () {
        install -m 644 dsssl/catalog ${D}${datadir}/sgml/openjade-${PV}
        install -m 644 dsssl/*.{dtd,dsl,sgm} ${D}${datadir}/sgml/openjade-${PV}
 
+       # The catalog must live in the sysroot and it must be there for
+       # install-catalog to do its thing.
+       install -m 644 dsssl/catalog ${datadir}/sgml/openjade-${PV}
        install-catalog --add ${sysconfdir}/sgml/openjade-${PV}.cat \
-           ${D}${datadir}/sgml/openjade-${PV}/catalog
+           ${datadir}/sgml/openjade-${PV}/catalog
 
        install-catalog --add ${sysconfdir}/sgml/sgml-docbook.cat \
            ${sysconfdir}/sgml/openjade-${PV}.cat
-- 
1.7.1



