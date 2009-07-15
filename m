Received: from [212.18.0.10] (helo=mail-out.m-online.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mok@mnet-online.de>) id 1MR5Lj-0005vG-A9
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jul 2009 16:20:47 +0200
Received: from mail01.m-online.net (mail.m-online.net [192.168.3.149])
	by mail-out.m-online.net (Postfix) with ESMTP id B6EA51C0018B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jul 2009 16:07:23 +0200 (CEST)
Received: from localhost (dynscan2.mnet-online.de [192.168.1.215])
	by mail.m-online.net (Postfix) with ESMTP id 5F2F190193
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jul 2009 16:07:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.3.149])
	by localhost (dynscan2.mnet-online.de [192.168.1.215]) (amavisd-new,
	port 10024) with ESMTP id VNNPaa2SuH6W
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jul 2009 16:07:22 +0200 (CEST)
Received: from mrdenker.localdomain (ppp-93-104-40-112.dynamic.mnet-online.de
	[93.104.40.112])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jul 2009 16:07:22 +0200 (CEST)
From: "Klaus 'mrmoku' Kurzmann" <mok@mnet-online.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jul 2009 16:07:19 +0200
User-Agent: KMail/1.11.4 (Linux/2.6.29.5-191.fc11.x86_64; KDE/4.2.4; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <200907151607.19897.mok@mnet-online.de>
Subject: [RFC] patch for bluetooth audio.conf
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
X-List-Received-Date: Wed, 15 Jul 2009 14:20:47 -0000
X-Groupsio-MsgNum: 11951
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_XKeXKjizpzq7EVS"

--Boundary-00=_XKeXKjizpzq7EVS
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello all,

to get audio routing for bluetooth headsets correct on OpenMoko phones we need 
the attached patch to bluez.inc which changes audio.conf to enables the 
SCORouting=PCM option.

Is this something that can be done globally? Or will it break on other 
hardware? If it cannot be done globally, what is the correct way to do that? 
We (SHR distro) could do that with a distro override, but if it has the 
possibility to break other hardware we would not want that ;) We would rather 
add a machine override then. Right now bluez4 is *not* machine dependent and 
the config files are included in the base package. I see two ways to do that:

a) make bluez4 machine dependent and add overrides for om-gta01/2
b) extract the config files into some bluez4-config package and provide a 
different one for om-gta01/2

Thoughts?
-- 

Klaus 'mrmoku' Kurzmann



--Boundary-00=_XKeXKjizpzq7EVS
Content-Type: text/x-patch;
  charset="UTF-8";
  name="bluez4.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="bluez4.patch"

diff --git a/recipes/bluez/bluez4.inc b/recipes/bluez/bluez4.inc
index 4c3bfb8..4cb3bc8 100644
--- a/recipes/bluez/bluez4.inc
+++ b/recipes/bluez/bluez4.inc
@@ -41,6 +41,7 @@ EXTRA_OECONF = "\
 "
 
 do_install_append() {
+        sed -i 's/#SCORouting=PCM/SCORouting=PCM/' ${S}/audio/audio.conf
         install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
         install -m 0644 ${S}/network/network.conf ${D}/${sysconfdir}/bluetooth/
         install -m 0644 ${S}/input/input.conf ${D}/${sysconfdir}/bluetooth/

--Boundary-00=_XKeXKjizpzq7EVS--
