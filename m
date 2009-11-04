Received: from [89.151.113.230] (helo=srv02.nortechonline.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Simon.Hodgson@nortechonline.co.uk>)
	id 1N5nSl-00084d-OP for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 22:32:22 +0100
Received: from srv02.nortechonline.net ([89.151.113.230]) by
	srv02.nortechonline.net ([89.151.113.230]) with mapi; Wed, 4 Nov 2009
	21:31:09 +0000
From: "Hodgson, Simon" <Simon.Hodgson@nortechonline.co.uk>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 4 Nov 2009 21:30:33 +0000
Thread-Topic: [oe] Mono
Thread-Index: Acpdjyut79VocGQoSxy1DSyPUN5tegABt68Z
Message-ID: <B44D4D5BF344094DABB900C4E0F6E3533945A88B80@srv02.nortechonline.net>
References: <B44D4D5BF344094DABB900C4E0F6E3533945A88B7F@srv02.nortechonline.net>,
	<hcsola$kqd$1@ger.gmane.org>
In-Reply-To: <hcsola$kqd$1@ger.gmane.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 89.151.113.230
X-SA-Exim-Mail-From: Simon.Hodgson@nortechonline.co.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Mono
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
X-List-Received-Date: Wed, 04 Nov 2009 21:32:23 -0000
Content-Language: en-GB
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

________________________________________
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] On Behalf Of Koen Kooi [k.kooi@student.utw=
ente.nl]
Sent: 04 November 2009 20:36
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] Mono

On 04-11-09 21:11, Hodgson, Simon wrote:
> I've built Mono for OpenEmbedded to run on an arm processor. But when I t=
ry to run just a simple Hello World test I get:
>
> mini-codegen.c:1073:mono_local_regalloc: assertion failed: (ins->dreg !=
=3D -1)
>
> Does anyone have any suggestion as to what I might be doing wrong?

I'm building locally with:

koen@dominion:/OE/org.openembedded.dev/recipes/asio$ git diff ../mono
diff --git a/recipes/mono/mono_2.4.2.3.bb b/recipes/mono/mono_2.4.2.3.bb
index 5e659f3..261d090 100644
--- a/recipes/mono/mono_2.4.2.3.bb
+++ b/recipes/mono/mono_2.4.2.3.bb
@@ -2,7 +2,7 @@ require mono-${PV}.inc

  DEPENDS =3D "mono-native mono-mcs-intermediate glib-2.0 perl-native"

-PR =3D "${INC_PR}.1"
+PR =3D "${INC_PR}.2"

  # mono makes use of non-thumb-compatible inline asm.
  ARM_INSTRUCTION_SET =3D "arm"
@@ -10,7 +10,7 @@ ARM_INSTRUCTION_SET =3D "arm"
  SRC_URI +=3D "file://configure.patch;patch=3D1\
             file://mini-arm.patch;patch=3D1\
              file://0001-remove-docs-dir-from-build.patch;patch=3D1 \
-            file://mono-cross-compilation-for-amd64.patch;patch=3D1 \
+#            file://mono-cross-compilation-for-amd64.patch;patch=3D1 \
             "

  # Per http://www.mono-project.com/Mono:ARM

That seems to fix most issues for me. I suspect it breaks for amd64
targets, but I don't care about those (yet).

regards,

Koen


That fixed it - thanks!

Simon=


