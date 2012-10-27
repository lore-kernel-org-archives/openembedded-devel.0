Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <matteo.fortini@gmail.com>) id 1TS6lu-0004mo-6L
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Oct 2012 15:49:54 +0200
Received: by mail-oa0-f47.google.com with SMTP id h1so3461667oag.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Oct 2012 06:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=smzEbepobAuXqTXCNSIX//VzNPJ3AIXspZRd1BYOCew=;
	b=zLTEYSROI/4bfs3j/h1lf1yYtgLXMIrL4EKbuu/Ol03o0dUGVvmwblNEFFcdrlX5Pa
	1J9k/6lMezEACm/BtSu0Ti9VTiM6+MgJ+ZNp9KKynwN/HCHW5YRiyk3azNI3L1z9zkDq
	w+O8hCAiEFGnBcawr04YAgPDn/qF5rdhRC1AiZCiMWAA9E6ITy6Ccmn0aVJJyTTEitlE
	gkI1HUtJCbWpvL9vgnrL9kv1cauuIXakvR3VraCh56zJItbPfzjwCAhIDS2xt0lKJVUU
	+XisZsdXWKD4LPnEOMJf2NUy3mdklVL7njOjF7iFcu21fSVppEjqn3LJqTrlp6rnOetX
	q9EA==
Received: by 10.60.7.226 with SMTP id m2mr22596654oea.72.1351344982276; Sat,
	27 Oct 2012 06:36:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.60.95.73 with HTTP; Sat, 27 Oct 2012 06:36:02 -0700 (PDT)
From: Matteo Fortini <matteo.fortini@gmail.com>
Date: Sat, 27 Oct 2012 15:36:02 +0200
Message-ID: <CAC_9p+9kUhDG4dCo0Dvdhu0atZV=YxXQo3BOvMd72RsxQP9HUw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Building for armhf (RaspberryPI on Debian)
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
X-List-Received-Date: Sat, 27 Oct 2012 13:49:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,
I'm trying to build some OE deb packages using meta-raspberrypi, but my
wheezy Raspbian distro is complaining that the OE .deb was built for the
"arm" architecture and not for the "armhf" one.

To fix this, I tried to use an "armhf" machine, by changing the machine
definition in the following way. However, this didn't fix it, even if
bitbake is telling me it's using the hardware accelerated FPU.

Could you point me to a way of solving it?

Thank you in advance,
Matteo

diff --git a/conf/machine/include/tune-arm1176jzf-s.inc
b/conf/machine/include/tune-arm1176jzf-s.inc
index b52c161..9060f48 100644
--- a/conf/machine/include/tune-arm1176jzf-s.inc
+++ b/conf/machine/include/tune-arm1176jzf-s.inc
@@ -6,5 +6,5 @@ TUNEVALID[arm1176jzfs] = "Enable arm1176jzfs specific
processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "arm1176jzfs",
"-mtune=arm1176jzf-s", "", d)}"

 AVAILTUNES += "arm1176jzfs"
-TUNE_FEATURES_tune-arm1176jzfs = "${TUNE_FEATURES_tune-armv6} arm1176jzfs"
-PACKAGE_EXTRA_ARCHS_tune-arm1176jzfs = "${PACKAGE_EXTRA_ARCHS_tune-armv6}"
+TUNE_FEATURES_tune-arm1176jzfs = "${TUNE_FEATURES_tune-armv6hf}
arm1176jzfs"
+PACKAGE_EXTRA_ARCHS_tune-arm1176jzfs =
"${PACKAGE_EXTRA_ARCHS_tune-armv6hf}"

