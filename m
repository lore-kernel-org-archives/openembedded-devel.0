Received: from smtp24.4emm.com ([69.18.222.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1QUqEs-0000kP-VU
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Jun 2011 03:10:19 +0200
Received: from MBX20.4emm.local ([fe80::5895:fdc9:8838:234]) by
	HUB24.4emm.local ([::1]) with mapi; Thu, 9 Jun 2011 21:03:38 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH v2] initscripts: Modify 'populate-volatile.sh' to
	atomically update 'volatile.cache'
Thread-Index: AcwnCmMxV4mmo7pjQbSGMQv3s/NCzw==
Date: Fri, 10 Jun 2011 01:06:28 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF02E91F@MBX20.4emm.local>
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
X-List-Received-Date: Fri, 10 Jun 2011 01:10:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Thu, 09 Jun 2011 22:28:15 +0200, Paul Menzel wrote:
>=20
> One more question. Is `rm -rf volatile.cache` actually a noop since it
> does not exist due to the prior check?
>=20

It looks to me like it is there to clear the cache when the script is calle=
d in an 'update' operation - I think we should keep it.

Regards,
James



