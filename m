Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OyDPm-00073a-Mz
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 02:42:29 +0200
Received: by mail-pv0-f175.google.com with SMTP id 6so3526pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 17:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=HdcJNzhjgR3GdTbE/M6JkaUrwiEd4I0H6Lp7jO+HD0k=;
	b=m1TKepHI2w/BMeDZ11ozPqppUo4Oy9mu1xAvhfmjB8JLngl5FKftscresneABVrZk2
	peT12ljb5/SVRX5t+hz6f9L/RQVwh2QfoRYBdVyQj1SZTEMJrn+BhW8hV7PlptW8xo4e
	r0XimpBsqfQrZAqNv1+uI3SaWUCJk8eoXP1LQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=SIUbuQfsSRJzJllFaG5Ww/Ayu47q/rPPBpag9h5XS4lsFGsM0LYqkd/vKwJHUA+XUl
	qEnSxQnp06KQSf+fE0DwjXa2+dP1Qm8qRsTubUPWlHuPkFIx0bCFGljVsiGIWnGRTvDZ
	b31D86CeWcQk8kPMNbPY2M/PEU1ztQ4astEhA=
Received: by 10.142.148.12 with SMTP id v12mr9847429wfd.21.1285116142993;
	Tue, 21 Sep 2010 17:42:22 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id o9sm9173707wfd.4.2010.09.21.17.42.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 21 Sep 2010 17:42:22 -0700 (PDT)
Message-ID: <4C9950EA.2070306@gmail.com>
Date: Wed, 22 Sep 2010 10:12:18 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100909 Thunderbird/3.0.7
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
Subject: [PATCH] mythfront-config.bb: Fix do_unpack for machines other than epia.
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
X-List-Received-Date: Wed, 22 Sep 2010 00:42:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/mythfront/mythfront-config.bb |   14 ++++++++------
 1 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/recipes/mythfront/mythfront-config.bb b/recipes/mythfront/mythfront-config.bb
index b87e0be..79ba428 100644
--- a/recipes/mythfront/mythfront-config.bb
+++ b/recipes/mythfront/mythfront-config.bb
@@ -1,11 +1,12 @@
 PV = "1.10"
-PR = "r0"
+PR = "r1"
 
 RDEPENDS_${PN} = "font-misc-misc"
 LICENSE = "MIT"
-SRC_URI = "file://tftp.sh file://xorg.conf"
+SRC_URI = "file://tftp.sh"
 
-SRC_URI_append_epia = " file://serial.sh"
+SRC_URI_append_epia = " file://serial.sh \
+			file://xorg.conf"
 
 do_install() {
 	install -d ${D}${sysconfdir}/udhcpc.d/
@@ -14,9 +15,6 @@ do_install() {
 	install -d ${D}${sysconfdir}/mythtv
 	ln -sf /var/lib/config/mysql.txt ${D}${sysconfdir}/mythtv
 
-	install -d ${D}${sysconfdir}/X11
-	install -m 0644 ${WORKDIR}/xorg.conf ${D}${sysconfdir}/X11
-
 	ln -sf /var/lib/config/lircd.conf ${D}${sysconfdir}/lircd.conf
 
 	install -d ${D}/dev
@@ -30,3 +28,7 @@ do_install() {
 	fi
 }
 
+do_install_append_epia() {
+	install -d ${D}${sysconfdir}/X11
+	install -m 0644 ${WORKDIR}/xorg.conf ${D}${sysconfdir}/X11
+}
-- 
1.7.1



