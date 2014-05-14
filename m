Return-Path: <oram.embedded@gmail.com>
X-Greylist: delayed 995 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 14 May 2014 04:01:17 UTC
Received: from mail-yh0-f41.google.com (unknown [209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3CB2560196
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 May 2014 04:01:17 +0000 (UTC)
Received: by mail-yh0-f41.google.com with SMTP id f73so1221840yha.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 21:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=DKrwa2IG65XUiY7fwXUSAnQMbhqY31JGE7+BJUh37pE=;
	b=eZfOXtAXUyJkAxq5B+KIalGs53pu/7Uit8eW+YoyXtAakZBFY1cKs1aBOzUA1vfAf6
	Jqbb8nTf7SehsxdNivI7l5QwepNnBguu13j4ivEJyWBUknr6FbwC+nDKxagdrkOXWE86
	7Y69T/IP13eepNHYRIWT0p3POW0I03Yq9UZ3nezg7ttg3xTCLIGfPDT/6cT2qZOCetp7
	TmflJ5dmH8FYRLEhJYsuORj+beXifRYUlPM47lodmC5zijPvW49bVRJNBXtg4y13qMfZ
	tZTvk/z2Du12P3BZzcdf9wBMA0UrDLODtAMRWPoME39TMqt2ZWwm1+iib+PViRL+NnfC
	d0iw==
MIME-Version: 1.0
X-Received: by 10.236.119.99 with SMTP id m63mr1277960yhh.65.1400038605906;
	Tue, 13 May 2014 20:36:45 -0700 (PDT)
Sender: oram.embedded@gmail.com
Received: by 10.170.229.84 with HTTP; Tue, 13 May 2014 20:36:45 -0700 (PDT)
Date: Wed, 14 May 2014 15:36:45 +1200
X-Google-Sender-Auth: R8EOGZIeohSJlqMITffzdEnwPAc
Message-ID: <CAGw0TDPa+=xgdYL_WG5sSFtBOtbKZM0VNC-tUhNH+M5z5NTwjA@mail.gmail.com>
From: Charles Oram <charles@oram.co.nz>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-oe] [PATCH] libmtp_1.1.5.bb : Fix 'Makefile.am: No such file or directory' build error.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 May 2014 04:01:18 -0000
Content-Type: text/plain; charset=UTF-8

libmtp_1.1.5.bb : Fix "Makefile.am: No such file or directory" build error.

skip_udev_rules_generation() needs to reference Makefile.am in the recipe
source directory.

Signed-off-by: Charles Oram <charles at oram.co.nz>

---
 meta-oe/recipes-connectivity/
libmtp/libmtp_1.1.5.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bbb/meta-oe/recipes-connectivity/libmtp/
libmtp_1.1.5.bb
index f4ea800..e164f49 100644
--- a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
+++ b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
@@ -29,7 +29,7 @@ do_unpack[vardeps] += "skip_udev_rules_generation"
 do_unpack[postfuncs] += "skip_udev_rules_generation"

 skip_udev_rules_generation () {
-       sed -i -e '/^noinst_DATA=/,/util\/mtp-hotplug -H/d' Makefile.am
+       sed -i -e '/^noinst_DATA=/,/util\/mtp-hotplug -H/d' ${S}/Makefile.am
        cp ${WORKDIR}/69-libmtp.rules ${S}/
 }


--
1.7.10.4

