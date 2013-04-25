Received: from rrcs-98-100-91-244.central.biz.rr.com ([98.100.91.244]
	helo=pluto.melinkcorp.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bevenson@melinkcorp.com>) id 1UVSoP-00070V-3W
	for Openembedded-devel@lists.openembedded.org;
	Thu, 25 Apr 2013 22:30:40 +0200
Received: from pluto.melinkcorp.local ([10.0.2.4]) by pluto.melinkcorp.local
	([10.0.2.4]) with mapi; Thu, 25 Apr 2013 16:11:46 -0400
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "Openembedded-devel@lists.openembedded.org"
	<Openembedded-devel@lists.openembedded.org>
Date: Thu, 25 Apr 2013 16:11:44 -0400
Thread-Topic: SRC_URI for Subversion server not supporting svn:// protocol
Thread-Index: Ac5B8RuAjPcZevbxTiSjNWEMNW3dyw==
Message-ID: <91586D499ADFD74FBCFB8425266A5DE40139FD94D8FD@pluto.melinkcorp.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 01D3078800431A01D308D5
acceptlanguage: en-US
MIME-Version: 1.0
Subject: SRC_URI for Subversion server not supporting svn:// protocol
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
X-List-Received-Date: Thu, 25 Apr 2013 20:30:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have a Subversion server that is setup for https:// access only (Apache s=
erver which redirects all http to https, no svnserve active).  There is an =
application on the repository that I would like to create a recipe for.  Ho=
wever, I'm running into issues with the SRC_URI for this application.

If I create a SRC_URI of the form:
SRC_URI =3D "svn://path/to/svn/repository/;module=3Dprojectname;rev=3DHEAD;=
proto=3Dhttps"

Then the fetch fails due to the svn checkout command being formed as:
svn co svn://path/to/svn/repository/ projectname

which my Subversion server rejects because it's not implementing the svn pr=
otocol (I know there are other checkout options in the command, but they're=
 not important to this topic).  If I then change the SRC_URI as follows:
SRC_URI =3D "https://path/to/svn/repository/;module=3Dprojectname;rev=3DHEA=
D;proto=3Dsvn"

Then during the fetch it attempts to use wget instead of a svn checkout.  T=
his also has issues since the base wget checkout is setup to checkout a sin=
gle file and not recursively checkout a directory.  Plus, I'd like to do a =
Subversion checkout for my workflow.

Is there a way to tell Bitbake to do a svn checkout but use an https:// URL=
?  If not, does anyone else have any other suggestions?

Thanks,
Bryan


