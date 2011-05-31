Received: from edison.awellconnected.net ([83.167.180.132])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukas@htc-linux.org>) id 1QRMYo-00036w-Iq
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 May 2011 12:52:30 +0200
Received: from localhost.awellconnected.net ([127.0.0.1] helo=localhost)
	by edison.awellconnected.net with esmtpa (Exim 4.69)
	(envelope-from <lukas@htc-linux.org>) id 1QRMVh-0003xV-UC
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 May 2011 11:49:17 +0100
Received: from bibray.bib.uni-erlangen.de (bibray.bib.uni-erlangen.de
	[131.188.12.119]) by webmail.htc-linux.org (Horde Framework) with HTTP; 
	Tue, 31 May 2011 11:49:17 +0100
Message-ID: <20110531114917.33186l97l89fv3oc@webmail.htc-linux.org>
Date: Tue, 31 May 2011 11:49:17 +0100
From: Lukas-David Gorris <lukas@htc-linux.org>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) H3 (4.3.9)
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - edison.awellconnected.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - htc-linux.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: oebb.sh oe-core with non-angstrom distro
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
X-List-Received-Date: Tue, 31 May 2011 10:52:30 -0000
Content-Type: text/plain;
 charset=ISO-8859-1;
 DelSp="Yes";
 format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Is it possible to use the =20
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/setup-scripts/ =20
setup scripts for a non-angstrom distro?

I tried to do this as explained in the following:

git clone git://git.angstrom-distribution.org/setup-scripts
cd setup-scripts
git checkout -b oe-core remotes/origin/oe-core

Now I replace =A8angstrom...=A8 with =A8shr=A8 in DISTRO=3D in oebb.sh and =
run

./oebb.sh config htcleo #I added htcleo machine in the meta-smartphone laye=
r

./oebb.sh bitbake shr-image

This will end up with bitbake trying to use some angstrom scripts and =20
then fail. It would be very nice to make the distro configurable in =20
oebb.sh. I suppose extra configurations for the non-angstrom distro =20
will be needed but I am uncertain how to go about this. Maybe we can =20
add a new branch for SHR specific oebb.sh ?

Best regards

Lukas



