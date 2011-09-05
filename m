Received: from mail-qw0-f43.google.com ([209.85.216.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sylvain.pare@gmail.com>) id 1R0Tu8-0006GO-56
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Sep 2011 09:47:40 +0200
Received: by qwm42 with SMTP id 42so4500972qwm.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Sep 2011 00:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=rYbkpajqXBl58wtv/2BfqlvtXGwLSJx/0UTizSQ86wk=;
	b=TJgYZveWewDeoXpux85GziRyV/sDOkk45cRBFLlc6Br6pLYDfQ5MpKeoWYVwoQ8g0H
	F4cVlUQmYId57B7XGppd/HvXV+qTBD2gyC0TthqmyLUqZEUdy8kqoVP8O6N9sxSoVoFv
	IA+dniWwfFzl8I9GKgwO0B0xHe29o/LHbxacw=
Received: by 10.229.21.20 with SMTP id h20mr1232260qcb.265.1315208559686; Mon,
	05 Sep 2011 00:42:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.88.144 with HTTP; Mon, 5 Sep 2011 00:42:19 -0700 (PDT)
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Mon, 5 Sep 2011 09:42:19 +0200
Message-ID: <CACrTVgKPJz=TzZP1qpArdaScCrTV=tba=XzEJ_urCs6b-v_CzQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [PATCH] initscripts-shr: add a palmpre specific umountfs script
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
X-List-Received-Date: Mon, 05 Sep 2011 07:47:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Sylvain 'GarthPS' Par=E9 <sylvain.pare@gmail.com>
---
 recipes/shr/initscripts-shr/palmpre/umountfs |   14 ++++++++++++++
 recipes/shr/initscripts-shr_0.0.1.bb         |    2 +-
 2 files changed, 15 insertions(+), 1 deletions(-)
 create mode 100644 recipes/shr/initscripts-shr/palmpre/umountfs

diff --git a/recipes/shr/initscripts-shr/palmpre/umountfs
b/recipes/shr/initscripts-shr/palmpre/umountfs
new file mode 100644
index 0000000..98ac3c2
--- /dev/null
+++ b/recipes/shr/initscripts-shr/palmpre/umountfs
@@ -0,0 +1,14 @@
+#! /bin/sh
+#
+# umountfs    Turn off swap and unmount all local filesystems.
+#
+
+PATH=3D/sbin:/bin:/usr/sbin:/usr/bin
+
+# We leave /proc mounted.
+echo "Unmounting local filesystems..."
+grep -q /mnt/ram /proc/mounts && mount -o remount,ro /mnt/ram
+
+mount -o remount,ro /
+
+: exit 0
\ No newline at end of file
diff --git a/recipes/shr/initscripts-shr_0.0.1.bb b/recipes/shr/
initscripts-shr_0.0.1.bb
index 02e2205..b45296a 100644
--- a/recipes/shr/initscripts-shr_0.0.1.bb
+++ b/recipes/shr/initscripts-shr_0.0.1.bb
@@ -8,7 +8,7 @@ RDEPENDS_${PN} =3D "procps ${EXTRA_DEPS}"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D
"file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de20420=
"
 PV =3D "0.0.1"
-PR =3D "r29"
+PR =3D "r30"

 RCONFLICTS_${PN} =3D "initscripts"

--=20
1.7.4.1

