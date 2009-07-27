Received: from [209.85.221.197] (helo=mail-qy0-f197.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sakoman@gmail.com>) id 1MVWhO-0006I8-9H
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Jul 2009 22:21:30 +0200
Received: by qyk35 with SMTP id 35so4118714qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2009 13:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=rnVjlYy1U5RWkzADsxsDITEH8s01MJIh2sbsB0l8erI=;
	b=hwyquGw8I7VkT6cN0J3wlG1WuKGEyY6xa9Hv275QebIpZcytN1yBXWnzz60i2n2i+f
	i/4U2Z2WxqUslwgaJtfVf9eiBey5TPG4lHJY+fjeOrHushGtMCw5Ae5ao8ash2Q+Us3F
	63o9pHlgQ3ikAvAhWGQwgZqfo0of18OdDq8q4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=VX4ZitlZelfDBJFRzWsvUEoqoIMwjk3+4Xyn2YucP0W6XOTY/871e1dXIUljIDj+7o
	CCIFAdJbOa2+xVtzEx3K1vIRrkrsFvL+e92lrdIFTXBMyDbSbhSj904dTzouNbwsZCZP
	wzv/cvTn2xjQa8OuIbEXfXG7e78D1oVlWAcok=
MIME-Version: 1.0
Received: by 10.229.99.135 with SMTP id u7mr1517790qcn.44.1248725204877; Mon, 
	27 Jul 2009 13:06:44 -0700 (PDT)
Date: Mon, 27 Jul 2009 13:06:44 -0700
Message-ID: <5e088bd90907271306i61178f98s64e2c813ffc1334a@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] gnome-power-manager: fix typos in specification of FILES for doc package
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
X-List-Received-Date: Mon, 27 Jul 2009 20:21:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 27 Jul 2009 19:26:55 +0000 (-0700)
Subject: gnome-power-manager: fix typos in specification of FILES for
doc package
X-Git-Url: http://www.sakoman.net/cgi-bin/gitweb.cgi?p=openembedded.git;a=commitdiff_plain;h=c943345e45bc20fa3d461ac09aa327ee4db33b01

gnome-power-manager: fix typos in specification of FILES for doc package
---

diff --git a/recipes/gnome/gnome-power-manager_2.24.2.bb
b/recipes/gnome/gnome-power-manager_2.24.2.bb
index 904cd39..59e1f6f 100644
--- a/recipes/gnome/gnome-power-manager_2.24.2.bb
+++ b/recipes/gnome/gnome-power-manager_2.24.2.bb
@@ -31,6 +31,6 @@ FILES_${PN} += "${datadir}/icons \
 		${datadir}/gnome/autostart \
 		"

-FILE_{PN}-doc += "${datadir}/omf \
-                  ${datadir}/gnome/help "
+FILES_${PN}-doc += "${datadir}/omf \
+                    ${datadir}/gnome/help "


