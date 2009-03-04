Received: from [199.44.250.2] (helo=exchsrvr.syntech-fuelmaster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mbutsch@syntech-fuelmaster.com>) id 1Lez7p-000348-Ml
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 22:59:37 +0100
MIME-Version: 1.0
X-MimeOLE: Produced By Microsoft Exchange V6.5
Date: Wed, 4 Mar 2009 16:59:22 -0500
Message-ID: <EC5EE493B6046F45A2DDEC4A828DE52E039C63A6@EXCHSRVR.syntech.org>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: Error building gnome-vfs-2.22.0
thread-index: AcmdFHn5JT4hqg5pSlqd+NJ6rMdLxQ==
From: "Mark Butsch" <mbutsch@syntech-fuelmaster.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Error building gnome-vfs-2.22.0
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
X-List-Received-Date: Wed, 04 Mar 2009 21:59:37 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

When building gnome-vfs-2.22.0, it fails task do_configure with the
following error message:

------
checking for LIBGNOMEVFS... configure: error: Package requirements
(glib-2.0 >=3D
2.9.3 gmodule-no-export-2.0 >=3D 2.9.3 gthread-2.0 >=3D 2.9.3 =
gobject-2.0 >=3D
2.9.3 g
conf-2.0 >=3D 1.1.1 libxml-2.0 >=3D 2.6.0 gnome-mime-data-2.0 =
dbus-glib-1 >=3D
0.60) w
ere not met:

No package 'dbus-glib-1' found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables LIBGNOMEVFS_CFLAGS
and LIBGNOMEVFS_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.

FATAL: oe_runconf failed
------

Is this referring to 'dbus-glib-1' missing from my dev host or from the
OE built stuff?

Where should I look to resolve this?

Thanks,

Mark


