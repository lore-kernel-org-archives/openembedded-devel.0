Received: from [192.94.94.40] (helo=arroyo.ext.ti.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin@ti.com>) id 1M7W7a-00027l-Rm
	for openembedded-devel@openembedded.org; Fri, 22 May 2009 16:53:19 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id n4MEjU6i021219
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 May 2009 09:45:35 -0500
Received: from dlep20.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id n4MEjU3w026256
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 May 2009 09:45:30 -0500 (CDT)
Received: from dlee75.ent.ti.com (localhost [127.0.0.1])
	by dlep20.itg.ti.com (8.12.11/8.12.11) with ESMTP id n4MEjTxt004561
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 May 2009 09:45:29 -0500 (CDT)
Received: from dlee02.ent.ti.com ([157.170.170.17]) by dlee75.ent.ti.com
	([157.170.170.72]) with mapi; Fri, 22 May 2009 09:45:30 -0500
From: "Ambrose, Martin" <martin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@openembedded.org>
Date: Fri, 22 May 2009 09:45:29 -0500
Thread-Topic: Force clean of dependencies
Thread-Index: Acna6/NcxkQsLxIlSlufSRrDZwbObQ==
Message-ID: <A24693684029E5489D1D202277BE8944404C82BA@dlee02.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Force clean of dependencies
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
X-List-Received-Date: Fri, 22 May 2009 14:53:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello.

I have searched this list and googled but can't find a way to force a clean=
 of
a package's dependencies.=20

My example is that of mplayer which has ~17 dependent packages and I would =
like
to clean them all so I can rebuild with a different toolchain.

When executing
	bitbake mplayer -c clean
=20
It cleans the mplayer tmp/working directory but does not touch any of the
dependent's working directories. My solution so far has been to write scrip=
ts
which clean each one of the dependencies explicitly. Is there a cleaner and=
/or=20
a more standard method within OE?=20

Regards,
Martin



