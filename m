Received: from [209.85.221.197] (helo=mail-qy0-f197.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sakoman@gmail.com>) id 1MVWj4-0006en-HQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Jul 2009 22:23:14 +0200
Received: by qyk35 with SMTP id 35so4120580qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2009 13:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=qn8Msmr1MxQxvtWEP2PSbmdRpLfpk3hwFtoYgFym0p0=;
	b=vvUp0fobpkrxlkeiBMHsvbRLy/CXlEsJrA6ovw0c3zdPLXP1BZ7pyqn709zzf6FDw2
	F1kvbIbN3J/cbI5rpex1XeUC7R1XBjkUOzmmlWHrJ+/sBePzTONXm6RPn0jtcYFZwz3y
	RmFQILKM26RvZYxZqL1jnG5x3KGuKl1zX4t48=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=dbMTCYczmuUyRR2p6T3top9KmG/MFVF+mHClvdZc0rTEq8uOZIyKF5p+yaAyjsXxne
	qp9LoTaIrJfnUpPeQWMyEYGGbWsz167VSaLBaP27wO0RnmXCKXAOCIyIboQJk8bQzajY
	UIyuhhx/eimVEdIkSmS2FeujtyJov/bzUxMfU=
MIME-Version: 1.0
Received: by 10.229.85.11 with SMTP id m11mr1533300qcl.96.1248725308930; Mon, 
	27 Jul 2009 13:08:28 -0700 (PDT)
Date: Mon, 27 Jul 2009 13:08:28 -0700
Message-ID: <5e088bd90907271308ne490195n3fe08b0b21102b40@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] gtksourceview: package was missing a few important files, add 	them
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
X-List-Received-Date: Mon, 27 Jul 2009 20:23:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 27 Jul 2009 19:29:43 +0000 (-0700)
Subject: gtksourceview: package was missing a few important files, add them
X-Git-Url: http://www.sakoman.net/cgi-bin/gitweb.cgi?p=openembedded.git;a=commitdiff_plain;h=0f3cf96e2103a8e6abe810d221781b6032d927e8

gtksourceview: package was missing a few important files, add them
---

diff --git a/recipes/gtksourceview/gtksourceview2_2.6.0.bb
b/recipes/gtksourceview/gtksourceview2_2.6.0.bb
index ee9f654..f7889c8 100644
--- a/recipes/gtksourceview/gtksourceview2_2.6.0.bb
+++ b/recipes/gtksourceview/gtksourceview2_2.6.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Portable C library for multiline text editing"
 HOMEPAGE = "http://projects.gnome.org/gtksourceview/"
 LICENSE = "LGPL"
 DEPENDS = "gtk+ libgnomeprint"
-PR = "r0"
+PR = "r1"
 PNAME = "gtksourceview"

 S = "${WORKDIR}/${PNAME}-${PV}"
@@ -16,3 +16,5 @@ do_stage() {
 autotools_stage_all
 }

+FILES_${PN} += " ${datadir}/gtksourceview-2.0"
+


