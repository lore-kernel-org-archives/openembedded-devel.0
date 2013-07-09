Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 7FAD3608C6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jul 2013 10:48:23 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1UwVT6-0005ml-46 from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Jul 2013 03:48:24 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 9 Jul 2013 03:48:24 -0700
Received: from EU-MBX-01.mgc.mentorg.com ([169.254.1.178]) by
	SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) with mapi id
	14.02.0247.003; Tue, 9 Jul 2013 11:48:22 +0100
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-gnome][PATCH V2] gvfs: Handle samba dependency based on
	GPLv3 license.
Thread-Index: AQHOa0ukiBZjN9X1U0apcEEFoOBS5ZlcTPFw
Date: Tue, 9 Jul 2013 10:48:21 +0000
Message-ID: <365E1805BC95084CBE82381A0B869994DE4D3DB2@EU-MBX-01.mgc.mentorg.com>
References: <1371467502-9395-1-git-send-email-noor_ahsan@mentor.com>
In-Reply-To: <1371467502-9395-1-git-send-email-noor_ahsan@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
X-OriginalArrivalTime: 09 Jul 2013 10:48:24.0579 (UTC)
	FILETIME=[D62E6530:01CE7C91]
Subject: Re: [meta-gnome][PATCH V2] gvfs: Handle samba dependency based on GPLv3 license.
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
X-List-Received-Date: Tue, 09 Jul 2013 10:48:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

Kindly apply this patch. Thanks.

Noor

-----Original Message-----
From: Ahsan, Noor=20
Sent: Monday, June 17, 2013 4:12 PM
To: openembedded-devel@lists.openembedded.org
Cc: Ahsan, Noor
Subject: [meta-gnome][PATCH V2] gvfs: Handle samba dependency based on GPLv=
3 license.

From: Noor <noor_ahsan@mentor.com>

* Samba is GPLv3. In GPLv3 free environment one was not able to
  build gvfs. Add PACKAGECONFIG for samba and enable is when GPLv3
  is not present in INCOMPATIBLE_LICENSE.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs.inc      |    4 +---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb |    7 ++++++-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs.inc b/meta-gnome/recipes-gn=
ome/gvfs/gvfs.inc
index 0e1c69c..ba52fe7 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs.inc
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs.inc
@@ -10,9 +10,7 @@ SRC_URI[archive.md5sum] =3D "402f94b187b197b403d25c85caeb=
9562"
 SRC_URI[archive.sha256sum] =3D "0895ac8f6d416e1b15433b6b6b68eb119c6e8b04fd=
b66db665d684355ef89345"
 SRC_URI +=3D "file://0001-gvfsfusedaemon.c-fix-glib-build.patch"
=20
-EXTRA_OECONF =3D "--with-samba-includes=3D${STAGING_INCDIR} \
-                --with-samba-libs=3D${STAGING_LIBDIR} \
-                --with-archive-includes=3D${STAGING_INCDIR} \
+EXTRA_OECONF =3D "--with-archive-includes=3D${STAGING_INCDIR} \
                 --with-archive-libs=3D${STAGING_LIBDIR} \  "
=20
diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb b/meta-gnome/recip=
es-gnome/gvfs/gvfs_1.8.2.bb
index 7f86151..5274280 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb
@@ -1,6 +1,6 @@
 require gvfs.inc
=20
-DEPENDS =3D "samba libsoup-2.4 gnome-keyring glib-2.0 fuse avahi fuse gcon=
f libgphoto2"
+DEPENDS =3D "libsoup-2.4 gnome-keyring glib-2.0 fuse avahi fuse gconf libg=
photo2"
 # optional: obexftp libcdio libimobiledevice=20
=20
 PR =3D "${INC_PR}.1"
@@ -21,3 +21,8 @@ FILES_gvfsd-trash =3D "${libexecdir}/gvfsd-trash ${datadi=
r}/gvfs/mounts/trash.moun
=20
 RDEPENDS_${PN} =3D "gvfs-gdu-volume-monitor"
 RRECOMMENDS_gvfsd-ftp +=3D "openssh-sftp openssh-ssh"
+
+PACKAGECONFIG ?=3D "${@base_contains('INCOMPATIBLE_LICENSE', 'GPLv3', '', =
'samba', d)}"
+
+PACKAGECONFIG[samba] =3D "--enable-samba --with-samba-includes=3D${STAGING=
_INCDIR} \
+                        --with-samba-libs=3D${STAGING_LIBDIR}, --disable-s=
amba, samba"
--
1.7.9.5


