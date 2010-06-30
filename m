Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OTov6-0007Ub-HO
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 06:29:11 +0200
Received: by pvg13 with SMTP id 13so206273pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 21:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=sC8sbAOy6AJk98GPo1Pzz17bRRsRApRqaJEeikAiies=;
	b=oTq6oNMh/MYZEN7Cz1i4wK55VWMKUk6gZwwMw1mG8hSLI2Wjz+4h65awLPpMuQRIGQ
	mLzO9NViy6r5E46k+/92XQyD511oneke9yqrpFyb2fKNPYjGCdeljwr//TqIZYBmm+za
	Ph8c8L29vQG1f4rdAtuGyg07Tpt/Q359d0peg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=pc35/pTA+92kJ7IbIeTH/Ox43bf0J6WLGkQtmuy1znW9gCseACn9DFQw0Bzofb0yCz
	PoXZ7IINkM5v/gRtqrs2+KcvOYHYQMv/gFb20urrjyblzqaQcbnxP5zleBz/owffWCh6
	N88HHEHQ0SVaeSavWHFakk48FQwN8s6durWq0=
Received: by 10.114.165.18 with SMTP id n18mr8911496wae.3.1277871864105;
	Tue, 29 Jun 2010 21:24:24 -0700 (PDT)
Received: from [10.0.0.4] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	s29sm58021106wak.14.2010.06.29.21.24.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 29 Jun 2010 21:24:23 -0700 (PDT)
Message-ID: <4C2AC6F3.3090603@gmail.com>
Date: Wed, 30 Jun 2010 13:54:19 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100401 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] dbus: fix building for mipsel.
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
X-List-Received-Date: Wed, 30 Jun 2010 04:29:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Mipsel lives in a bizarro world where the following error happens:

|   CCLD   dbus-daemon-launch-helper
| /home/grg/oe2/tmp/cross/mipsel/lib/gcc/mipsel-oe-linux/4.4.4/../../../../mipsel-oe-linux/bin/ld: can not make stub section: File format not recognized
| /home/grg/oe2/tmp/cross/mipsel/lib/gcc/mipsel-oe-linux/4.4.4/../../../../mipsel-oe-linux/bin/ld: failed to set dynamic section sizes: File format not recognized
| collect2: ld returned 1 exit status

Fix as noted by the openwrt folks:
https://dev.openwrt.org/changeset/18308

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/dbus/dbus.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes/dbus/dbus.inc b/recipes/dbus/dbus.inc
index ec66960..41ec9d1 100644
--- a/recipes/dbus/dbus.inc
+++ b/recipes/dbus/dbus.inc
@@ -38,6 +38,9 @@ EXTRA_OECONF = "\
 do_compile_prepend_mipsel() {
 	sed -i -e 's/\-fPIE//' -e 's/\-pie\ \-Wl\,\-z\,relro//' bus/Makefile
 }
+do_configure_prepend_mipsel() {
+	sed -i -e 's/-Wl,--gc-sections/--gc-sections/' ${S}/configure
+}
 
 do_install_append() {
         install -d ${D}${sysconfdir}/init.d
-- 
1.7.1



