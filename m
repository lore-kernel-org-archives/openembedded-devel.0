Received: from bay0-omc4-s24.bay0.hotmail.com ([65.54.190.226])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <salehusman@hotmail.com>) id 1NULoA-0001pO-RC
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 16:03:59 +0100
Received: from BAY127-W19 ([65.54.190.199]) by bay0-omc4-s24.bay0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 11 Jan 2010 07:01:45 -0800
Message-ID: <BAY127-W1918F5429EEBD52D3DD5DED86D0@phx.gbl>
X-Originating-IP: [203.82.49.5]
From: saleh usman <salehusman@hotmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Date: Mon, 11 Jan 2010 20:01:45 +0500
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 11 Jan 2010 15:01:45.0262 (UTC)
	FILETIME=[FDCF4CE0:01CA92CE]
X-SA-Exim-Connect-IP: 65.54.190.226
X-SA-Exim-Mail-From: salehusman@hotmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Output of helloworld
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
X-List-Received-Date: Mon, 11 Jan 2010 15:04:01 -0000
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


/tmp directory is there i.e. in ${OEROOT}/build but It doesn't contain depl=
oy
directory in it.There are cache=2Cstaging=2Cstamps=2Cuser and work director=
ies in tmp
but it doesn't contain deploy directory.

Saleh

Gary Thomas <gary <at> mlbassoc.com> writes:

>=20
> On 01/11/2010 07:01 AM=2C saleh usman wrote:
> >
> > Hi
> > I've run bitbake helloworld but I am unable to find /tmp/deploy folder =
where
I can find output of
> helloworld.Where will be the output of this build? Terminal window is loo=
king
like as
> >
> > [saleh <at> localhost ~]$ bitbake helloworld
> > NOTE: Handling BitBake files: - (7634/7634) [100 %]
> > NOTE: Parsing finished. 7045 cached=2C 303 parsed=2C 286 skipped=2C 0 m=
asked.
> > NOTE: Resolving any missing task queue dependencies
> > NOTE: Preparing runqueue
> > NOTE: Executing runqueue
> > NOTE: Tasks Summary: Attempted 461 tasks of which 461 didn't need to be
rerun and 0 failed.
>=20
> It's most likely not "/tmp" - look in your local.conf for TMPDIR.
> Mine's set like this:
>    TMPDIR =3D "${OEROOT}/build/tmp"
> so my deploy directory is at
>    ${OEROOT}/build/tmp/deploy
>=20
 		 	   		 =20
_________________________________________________________________
Keep your friends updated=97even when you=92re not signed in.
http://www.microsoft.com/middleeast/windows/windowslive/see-it-in-action/so=
cial-network-basics.aspx?ocid=3DPID23461::T:WLMTAGL:ON:WL:en-xm:SI_SB_5:092=
010=

