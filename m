Received: from smtp20.4emm.com ([69.18.222.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1QU7U7-0007MA-0W
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 03:23:03 +0200
Received: from MBX20.4emm.local ([fe80::5895:fdc9:8838:234]) by
	HUB20.4emm.local ([fe80::b039:47b9:6dd0:b630%32]) with mapi;
	Tue, 7 Jun 2011 21:16:31 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH v2] initscripts: Modify 'populate-volatile.sh' to
	atomically update 'volatile.cache'
Thread-Index: Acwleg/U2ECjrLnxRFuLE94oXEH2Mw==
Date: Wed, 8 Jun 2011 01:19:21 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF02E876@MBX20.4emm.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Subject: Re: [PATCH v2] initscripts: Modify 'populate-volatile.sh' to atomically update 'volatile.cache'
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
X-List-Received-Date: Wed, 08 Jun 2011 01:23:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> Date: Tue, 07 Jun 2011 12:13:14 +0200
> From: Paul Menzel <paulepanter@users.sourceforge.net>
> Subject: Re: [oe] [PATCH v2] initscripts: Modify
> 	'populate-volatile.sh' to atomically update 'volatile.cache'
> To: openembedded-devel@lists.openembedded.org
> Message-ID: <1307441594.4064.19.camel@mattotaupa>
> Content-Type: text/plain; charset=3D"utf-8"
>=20
> Dear James,
>=20
> thank you for the updated patch.
>=20
> Am Dienstag, den 07.06.2011, 17:35 +0800 schrieb James Limbouris:
> > When power is lost before a new volatile.cache has been flushed to disk=
,
> > it can be corrupted, leaving the volatiles uncreated and causing softwa=
re
> failure.
>=20
> So the device is still booting up although the power is lost? I am still
> confused how this patch can fix this. I am sorry for my ignorance.

Hi Paul,

The problem is that the volatile.cache script becomes corrupt.
On my system it became empty after power loss. When the system
reboots, it runs the empty script instead of recreating the volatiles, and
so some of the /var/xxx directories become broken symlinks. System software
then refuses to start up. If we make sure that it is never corrupted, the
problem should go away.

Regards,
James



