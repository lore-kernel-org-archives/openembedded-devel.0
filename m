Received: from dub0-omc1-s8.dub0.hotmail.com ([157.55.0.207])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <l.bolognini@hotmail.it>) id 1QBSJl-0003zx-LY
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 15:47:13 +0200
Received: from DUB107-W16 ([157.55.0.237]) by dub0-omc1-s8.dub0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Sun, 17 Apr 2011 06:43:51 -0700
Message-ID: <DUB107-w168531FE95ECFF71F7C03098AE0@phx.gbl>
X-Originating-IP: [95.74.75.173]
From: Luca Bolognini <l.bolognini@hotmail.it>
To: Openembedded Mailing List <openembedded-devel@lists.openembedded.org>
Date: Sun, 17 Apr 2011 15:43:52 +0200
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 17 Apr 2011 13:43:51.0968 (UTC)
	FILETIME=[7CBDFA00:01CBFD05]
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: an ipk package depending on its corresponding -dev
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
X-List-Received-Date: Sun, 17 Apr 2011 13:47:13 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


A strange thing happended to me last time I created libgles-omap3 ipk packa=
ges.I had justed patched /usr/bin/cputype (a file contained in one of the S=
RC_URIs) and libgles-omap3.inc to add some INSANE_SKIPs =2C then I gave the=
 commands:MACHINE=3Dbeagleboard bitbake -v -c clean libgles-omap3MACHINE=3D=
beagleboard bitbake -v libgles-omap3
At least=2C it happened that I had the dependency:libgles_omap3 -> libgles_=
omap3_dev
It's quite strange and it's the first time I see a package depending on its=
 corresponding -dev.Obviously this dependency is false=2C there can't be an=
y dependency between these two packages.The same action=2C with MACHINE=3Dc=
6a816x-evm (in a different development machine) doesn't lead to this behavi=
our.However I don't think that MACHINE=3Dbeagleboard is involved=2C probabl=
y I corrupted something in the 1st development machine=2C I don't know.Have=
 you any idea how to remove this ugly (and useless) dependency? How could i=
t originate?
Thank you=2C byeLuca

-------------------------Luca Bologninil.bolognini@hotmail.it


 		 	   		  =

