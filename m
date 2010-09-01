Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Oqgee-0007BU-9i
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 08:18:41 +0200
Received: by pvg6 with SMTP id 6so2888985pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Aug 2010 23:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=r5qIWf9K3NTxwmxFKKup79OG5ninr/eWzPkjSFZMSgc=;
	b=ikBSTMfVsBlOec1GU5GRQkGauk10RnseV6Q/FwaoZGhwozXGDqqAkBqWhmmHSlpdy8
	To1MI0uoyWMLeJJevGnE3Z8jrOXs7b2hMmHiIIqXwCdDtrqtKNLyeNzWXTc00sfB8cau
	f4n3saYkuSFNS3jiMt5WbP4izYo7+32cATAA0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=Oh8ZCSVOLUnSyfX0vD98/7FAL8hfJFIUk/ya8vsBR/0r+TMzRHWdngdxImZ7Os2OVP
	maY/qZihouq9Ne/XibDgXz9SnhcRG/m+EV7QeCQOM1/sYikM2LRhUMtQZzKWLP5Vcurc
	UUAu/cfDs7sRg1Vu74du+VIW/GMcBPP4tyoys=
Received: by 10.142.187.6 with SMTP id k6mr7007099wff.3.1283321885410;
	Tue, 31 Aug 2010 23:18:05 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	v38sm12032371wfh.12.2010.08.31.23.18.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 31 Aug 2010 23:18:04 -0700 (PDT)
Message-ID: <4C7DF016.1020707@gmail.com>
Date: Wed, 01 Sep 2010 15:47:58 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100721 Thunderbird/3.0.6
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
Subject: [PATCH] gst-plugins-bad_0.10.19.bb: add libmodplug to DEPENDS.
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
X-List-Received-Date: Wed, 01 Sep 2010 06:18:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Several images want gst-plugin-modplug (e.g. illume-image and the
fso images). They fail to find it without this.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/gstreamer/gst-plugins-bad_0.10.19.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/gstreamer/gst-plugins-bad_0.10.19.bb b/recipes/gstreamer/gst-plugins-bad_0.10.19.bb
index 0f0ff21..2351431 100644
--- a/recipes/gstreamer/gst-plugins-bad_0.10.19.bb
+++ b/recipes/gstreamer/gst-plugins-bad_0.10.19.bb
@@ -3,9 +3,9 @@ require gst-plugins.inc
 SRC_URI[archive.md5sum] = "368f72e2a1c7a6e8fe60394e4315259b"
 SRC_URI[archive.sha256sum] = "7b6c49f22caad3b573aee481381355b38ac9f2077f291d9f33a9a808a2568888"
 
-DEPENDS += "orc-native orc libcdaudio gst-plugins-base openssl directfb"
+DEPENDS += "orc-native orc libcdaudio gst-plugins-base openssl directfb libmodplug"
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 # We don't have vdpau headers in OE and it creates crosscompile badness
 EXTRA_OECONF_append = " --disable-vdpau --enable-sdl"
-- 
1.7.1



