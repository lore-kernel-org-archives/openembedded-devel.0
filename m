Received: from mail-qw0-f43.google.com ([209.85.216.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sylvain.pare@gmail.com>) id 1R0Tk8-000618-HX
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Sep 2011 09:37:20 +0200
Received: by qwm42 with SMTP id 42so4490650qwm.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Sep 2011 00:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=JN3PFbPDGmp758eiPtO8lDXoHxxPQC0HWwqQm/kSUoY=;
	b=AeTnWSX3Yglb38MHo3z6tzohmxyCN56Pzae5L5h/VtitqW0kKt52zjs4NHRemUl5ba
	BCklnE/bkRQ4aRq4T0ItrgoJJBlSHgK1Zee7O6FSqJ2IMXoaxb9QOShrskZR2f99r/Dw
	k4K/2/rFjo3eSRIkRtrbDCmIZiTXFRP8bGQ0M=
Received: by 10.229.21.20 with SMTP id h20mr1225943qcb.265.1315207940256; Mon,
	05 Sep 2011 00:32:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.88.144 with HTTP; Mon, 5 Sep 2011 00:32:00 -0700 (PDT)
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Mon, 5 Sep 2011 09:32:00 +0200
Message-ID: <CACrTVgKqqmT4VwbLbn29c4DF3f2kN7T8kbncxts1f+1R5MniAQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [PATCH] aurora.conf: set default locale for images
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
X-List-Received-Date: Mon, 05 Sep 2011 07:37:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

    * permit to use GLIBC_GENERATE_LOCALES =3D.. and avoid

    opkg_install_cmd: Cannot install package locale-base-.. message during
do_rootfs

Signed-off-by: Sylvain 'GarthPS' Par=E9 <sylvain.pare@gmail.com>
---
 conf/distro/aurora.conf |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/conf/distro/aurora.conf b/conf/distro/aurora.conf
index 1ea1691..976d8a2 100644
--- a/conf/distro/aurora.conf
+++ b/conf/distro/aurora.conf
@@ -11,6 +11,9 @@

 require conf/distro/minimal.conf

+# set default locale for images
+IMAGE_LINGUAS ?=3D "en-us"
+
 #
 # Header
 #
--=20
1.7.4.1

