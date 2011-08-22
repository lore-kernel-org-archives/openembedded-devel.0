Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shanevolpe@gmail.com>) id 1QvZoW-0006vc-7O
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Aug 2011 21:05:36 +0200
Received: by ewy5 with SMTP id 5so1947999ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2011 12:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=+q89ET51pQpAYrfcyeoRJ602M3CNAaUuCqbenME+cRY=;
	b=uuVlrn3095klFNfKrNuB0rhYoZ7hAmNnVA+34XXcjN39+mA/XDguujH8DFL9xGMNYm
	oKHjTD0LXgylk0yua+TPbfDNEO/xkRPAZ/OeebR2Jz72gOKI/RXGAbO4gKk5MeTYd1tg
	vsqMSyzrygaZK5xhZfb/+18rgQ5MXH3Qnqlt8=
Received: by 10.14.147.143 with SMTP id t15mr639264eej.76.1314039651241; Mon,
	22 Aug 2011 12:00:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.98.129 with HTTP; Mon, 22 Aug 2011 11:55:10 -0700 (PDT)
From: Shane Volpe <shanevolpe@gmail.com>
Date: Mon, 22 Aug 2011 14:55:10 -0400
Message-ID: <CAMgc3zPd-dAKAkhb=r5Uys52ohM5-9rANSz_hkSDiEQzPS0eWg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: enabling c6run custom app recipes patch
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
X-List-Received-Date: Mon, 22 Aug 2011 19:05:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I've been putting together some custom bitbake recipes to build dsp
apps using c6run. =A0The ti-c6run generates its own compiler to compile
the dsp code and I was able to greatly simplify my recipe if I applied
the following patch to the ti-paths.inc file in oe.

**************************************************************************
diff --git a/recipes/ti/ti-paths.inc b/recipes/ti/ti-paths.inc
index 755fcf1..bab2c7e 100644
--- a/recipes/ti/ti-paths.inc
+++ b/recipes/ti/ti-paths.inc
@@ -1,6 +1,7 @@
=A0installdir =3D "${datadir}/ti"

=A0# This is where do_install will put it
+export C6RUN_INSTALL_DIR_RECIPE =A0 =A0 =A0=3D "${installdir}/ti-c6run-tre=
e"
=A0export CODEGEN_INSTALL_DIR_RECIPE =A0 =A0=3D "${installdir}/ti-cgt6x-tre=
e"
=A0export XDC_INSTALL_DIR_RECIPE =A0 =A0 =A0 =A0=3D "${installdir}/ti-xdcto=
ols-tree"
=A0export XDAIS_INSTALL_DIR_RECIPE =A0 =A0 =A0=3D "${installdir}/ti-xdais-t=
ree"
@@ -27,6 +28,7 @@ export AUDIO_SOC_INSTALL_DIR_RECIPE =A0=3D
"${installdir}/ti-audio-soc-example-tree"
=A0export C6ACCEL_INSTALL_DIR_RECIPE =A0 =A0=3D "${installdir}/ti-c6accel-t=
ree"

=A0# This is where the tools will end up in staging provided
PACKAGE_ARCH =3D ${MACHINE_ARCH} is set
+export C6RUN_INSTALL_DIR =3D
"${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${C6RUN_INSTALL_DIR_RECIPE}"
=A0export CODEGEN_INSTALL_DIR =A0 =A0=3D
"${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${CODEGEN_INSTALL_DIR_RECIPE}"
=A0export XDC_INSTALL_DIR =A0 =A0 =A0 =A0=3D
"${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${XDC_INSTALL_DIR_RECIPE}"
=A0export XDAIS_INSTALL_DIR =A0 =A0 =A0=3D
"${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${XDAIS_INSTALL_DIR_RECIPE}"
***************************************************************************=
*

This causes all of the native compiling bin tools for the c6run to be
installed with all the ti related tools.  It also provides a global
variable "C6RUN_INSTALL_DIR" that can be used in a custom bitbake
recipe to access those tools.  The interesting thing is the current
ti-c6run recipe file in OE already uses "C6RUN_INSTALL_DIR_RECIPE" if
it exists so the ti-path.inc is really the only file that needs to be
modified for this all to work.

Regards,
Shane


