Received: from dub0-omc1-s3.dub0.hotmail.com ([157.55.0.202])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <l.bolognini@hotmail.it>) id 1QKREf-0007DF-LQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 10:27:06 +0200
Received: from DUB107-W41 ([157.55.0.237]) by dub0-omc1-s3.dub0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 12 May 2011 01:22:59 -0700
Message-ID: <DUB107-w41DACD15A70DBAF0FFD5F998890@phx.gbl>
X-Originating-IP: [78.6.111.196]
From: Luca Bolognini <l.bolognini@hotmail.it>
To: Openembedded Mailing List <openembedded-devel@lists.openembedded.org>,
	Arago Mailing List <arago-devel@gforge.ti.com>
Date: Thu, 12 May 2011 10:22:59 +0200
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 12 May 2011 08:22:59.0393 (UTC)
	FILETIME=[CDA3EB10:01CC107D]
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: cybaslt@hotmail.com
Subject: apache2-native and modphp trouble
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
X-List-Received-Date: Thu, 12 May 2011 08:27:06 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hallo=2Cwhy=2C in recipe apache2-native_2.2.14.bb=2C passing from PR=3Dr1 t=
o PR=3Dr2=2C do_stage has been deleted and replaced with do_install task?
This causes modphp configuration to fail:| Sorry=2C I cannot run apxs.  Pos=
sible reasons follow:|| 1. Perl is not installed| 2. apxs was not found. Tr=
y to pass the path using --with-apxs2=3D/path/to/apxs| 3. Apache was not bu=
ilt using --enable-so (the apxs usage page is displayed)|| The output of /h=
ome/bolognini/diskp2/diskp2.11/oe/arago-tmp/sysroots/i686-linux/usr/bin/apx=
s follows:| cannot open /home/bolognini/diskp2/diskp2.11/oe/arago-tmp/sysro=
ots/i686-linux/usr/build/config_vars.mk: No such file or directory at /home=
/bolognini/diskp2/diskp2.11/oe/arago-tmp/sysroots/i686-linux/usr/bin/apxs l=
ine 218.| configure: error: AbortingNOTE: Task failed: /home/bolognini/disk=
p2/diskp2.11/oe/arago-tmp/work/armv7a-none-linux-gnueabi/modphp-5.1.6-r3/te=
mp/log.do_configure.14249ERROR: TaskFailed event exception=2C abortingERROR=
: Build of /home/bolognini/diskp2/diskp2.11/oe/arago-oe-dev/recipes/modphp/=
modphp_5.1.6.bb do_configure failedERROR: Task 12 (/home/bolognini/diskp2/d=
iskp2.11/oe/arago-oe-dev/recipes/modphp/modphp_5.1.6.bb=2C do_configure) fa=
iledNOTE: Tasks Summary: Attempted 405 tasks of which 405 didn't need to be=
 rerun and 1 failed.ERROR: '/home/bolognini/diskp2/diskp2.11/oe/arago-oe-de=
v/recipes/modphp/modphp_5.1.6.bb' failed
as already pointed out by David Abdurachmanov ( http://comments.gmane.org/g=
mane.linux.distributions.angstrom.devel/4586 )
By the way=2C if I replace r2 recipe with r1=2C rebuild apache2 package and=
 then succesfully build modphp=2C apache2 segfaults as libphp5.so is loaded=
 with LoadModule directive inside httpd.conf.This was accurately described =
by Raffaele Recalcati ( https://gforge.ti.com/pipermail/arago-devel/2010-Se=
ptember/000312.html )=20
Have people committing r2 recipe of apache2-native ever tried to build modp=
hp?Does anyone succeed in getting apache2-2.2.14 and modphp-5.1.6 work toge=
ther in boards such as beagleboard or something else (it doesn't matter the=
 board)?I think this is an old issue but it seems to me that no solution ha=
s been found yet.
Thank you=2CLuca
-------------------------Luca Bologninil.bolognini@hotmail.it


 		 	   		  =

