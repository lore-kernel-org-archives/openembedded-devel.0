Received: from smtpfb1-g21.free.fr ([212.27.42.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <david.oe@pilsoft.com>) id 1O5blF-000404-8d
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Apr 2010 11:34:54 +0200
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id A1E5A77C94C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Apr 2010 11:26:00 +0200 (CEST)
Received: from smtp3-g21.free.fr (localhost [127.0.0.1])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 87A7C818139
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Apr 2010 11:25:56 +0200 (CEST)
Received: from mail.pilsoft.com (mna75-2-82-67-197-228.fbx.proxad.net
	[82.67.197.228])
	by smtp3-g21.free.fr (Postfix) with ESMTP id A3A2C818078
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Apr 2010 11:25:54 +0200 (CEST)
Received: from [192.168.33.16] ([192.168.33.1]) BY mail.pilsoft.com
	([192.168.33.30])
	WITH ESMTP (4D WebSTAR V Mail (5.4.1)); Sat, 24 Apr 2010 11:25:52 +0200
From: David Hemmo <david.oe@pilsoft.com>
Date: Sat, 24 Apr 2010 11:25:53 +0200
Message-Id: <D09DC8C0-929F-4983-AB79-490641D85D3C@pilsoft.com>
To: openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (Apple Message framework v1078)
X-Mailer: Apple Mail (2.1078)
X-SA-Exim-Connect-IP: 212.27.42.9
X-SA-Exim-Mail-From: david.oe@pilsoft.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,UNPARSEABLE_RELAY
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: problem with modifications to base.bbclass
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
X-List-Received-Date: Sat, 24 Apr 2010 09:34:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hello,

I am trying to build an image and I run in a python error that seems to =
be caused by the latest modifications to base.bbclase

ERROR: Error in executing: =
/home/owner/dvt/oe/oe_shogo2test/recipes/stage-manager/stagemanager-native=
_0.0.1.bb
ERROR: Exception:<type 'exceptions.TypeError'> Message:oe_unpack_file() =
got an unexpected keyword argument 'env'
ERROR: Printing the environment of the function
ERROR: 	0030:			destdir =3D os.path.join(workdir, =
*subdirs)
ERROR: 	0031:			bb.mkdirhier(destdir)
ERROR: 	0032:		else:
ERROR: 	0033:			destdir =3D workdir
ERROR: 	0034:		oe_unpack_file(local, destdir, env=3Denv, =
**urldata.parm)
ERROR: 	0035:
ERROR: Error in executing: =
/home/owner/dvt/oe/oe_shogo2test/recipes/stage-manager/stagemanager-native=
_0.0.1.bb
ERROR: Exception:<type 'exceptions.TypeError'> Message:oe_unpack_file() =
got an unexpected keyword argument 'env'
ERROR: Printing the environment of the function
ERROR: Build of =
/home/owner/dvt/oe/oe_shogo2test/recipes/stage-manager/stagemanager-native=
_0.0.1.bb do_unpack failed

it seems the parameters sent to oe_unpack_file are not what the function =
faits for

def oe_unpack_file(file, data, url =3D None):

I am too new to this project to propose a patch, but I hope someone will =
be able to help

Thanks

David Hemmo=


