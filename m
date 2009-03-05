Received: from [199.44.250.2] (helo=exchsrvr.syntech-fuelmaster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mbutsch@syntech-fuelmaster.com>) id 1LfELL-0007gD-8e
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Mar 2009 15:14:35 +0100
MIME-Version: 1.0
X-MimeOLE: Produced By Microsoft Exchange V6.5
Date: Thu, 5 Mar 2009 09:14:16 -0500
Message-ID: <EC5EE493B6046F45A2DDEC4A828DE52E039C63CF@EXCHSRVR.syntech.org>
In-Reply-To: <1236246311.607.4.camel@hammer.suse.cz>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Error building gnome-vfs-2.22.0
thread-index: AcmdeUfWmQFRlgfERsufdznaSH5y9AAIp4MA
References: <EC5EE493B6046F45A2DDEC4A828DE52E039C63A6@EXCHSRVR.syntech.org>
	<1236246311.607.4.camel@hammer.suse.cz>
From: "Mark Butsch" <mbutsch@syntech-fuelmaster.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: Error building gnome-vfs-2.22.0
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
X-List-Received-Date: Thu, 05 Mar 2009 14:14:35 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Mark Butsch wrote in Wed 03/04 2009 at 16:59 -0500:
> Hello,
>=20
> When building gnome-vfs-2.22.0, it fails task do_configure with the
> following error message:

> No package 'dbus-glib-1' found

Try this. I can imagine, that this dependency was undiscovered for a
long time, as it is pretty common.

--- a/packages/gnome/gnome-vfs_2.22.0.bb
+++ b/packages/gnome/gnome-vfs_2.22.0.bb
@@ -1,5 +1,5 @@
 LICENSE =3D "GPL"
-DEPENDS =3D "libxml2 gconf dbus bzip2 gnome-mime-data zlib"
+DEPENDS =3D "libxml2 gconf dbus dbus-glib bzip2 gnome-mime-data zlib"
 RRECOMMENDS_${PN} =3D "gnome-vfs-plugin-file shared-mime-info"
 # Some legacy packages will require gnome-mime-data to be installed,
but use of
 # it is deprecated.

--=20
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus


That seems to have fixed it. I did notice that your original "DEPENDS"
line was different than what was
In the file I had.

		DEPENDS =3D "libxml2 gconf gnutls avahi dbus bzip2
gnome-mime-data zlib"

Also, does this patch need to be made to the "real" OpenEmbedded files
and how should that happen? (I am new
to this)

Mark

=20
=20
************************************************************************
************
This footnote confirms that this email message has been scanned by
PineApp Mail-SeCure for the presence of malicious code, vandals &
computer viruses.
************************************************************************
************





