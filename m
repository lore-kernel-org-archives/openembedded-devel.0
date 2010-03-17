Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nrwnr-0007ca-Eg for openembedded-devel@lists.openembedded.org;
	Wed, 17 Mar 2010 18:13:19 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nrwku-0005jJ-N0 for openembedded-devel@lists.openembedded.org;
	Wed, 17 Mar 2010 18:10:04 +0100
Received: from 41.224.131.30 ([41.224.131.30])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Mar 2010 18:10:04 +0100
Received: from skander.lab by 41.224.131.30 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Mar 2010 18:10:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Skan <skander.lab@gmail.com>
Date: Wed, 17 Mar 2010 14:13:32 +0000 (UTC)
Message-ID: <loom.20100317T150947-575@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 41.224.131.30 (Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.1.8) Gecko/20100214 Ubuntu/9.10 (karmic) Firefox/3.5.8)
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,RCVD_NUMERIC_HELO,
	SPF_HELO_PASS,SPF_PASS,WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: openembedded to cross compile QT4 to FriendlyArm mini2440
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
X-List-Received-Date: Wed, 17 Mar 2010 17:13:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hello, 
I m using ubuntu9.10 with vmware to cross 
compile a Qt4 application to Qtopia
for the FriendlyArm mini2440.
I 've done this following a tutorial
-----------------------------------------
------------------------------------------
a) dowload bitbake from: 
http://download.berlios.de/bitbake/bitbake-1.8.8.tar.gz
b) mkdir /home/paul/project 
(I make a directory named "project" under my home
folder)
c) cd /home/paul/project (Go to the new folder)
b) mkdir build (Creating a new folder under project)
d) mkdir build/conf (This folder will containts the configure file)
e) touch soure-me.txt 
(Creating a new text file under project,it will used for
initializing the enviroment)
content of soure-me.txt:

export OETREE="${PWD}"
BBPATH=${OETREE}/:${OETREE}/build/:${OETREE}/openembedded/
PKGDIR=${OETREE}/build/
echo Setting up dev env for Ångström

if [ -z ${ORG_PATH} ] ; then
ORG_PATH=${PATH}
export ORG_PATH
fi

if [ -z ${ORG_LD_LIBRARY_PATH} ] ; then
ORG_LD_LIBRARY_PATH=${LD_LIBRARY_PATH}
export ORG_LD_LIBRARY_PATH
fi

PATH=${OETREE}/bitbake/bin:${ORG_PATH}

cd $PKGDIR

LD_LIBRARY_PATH=
export PATH LD_LIBRARY_PATH BBPATH
export LANG=C
export BB_ENV_EXTRAWHITE="MACHINE DISTRO OETREE ANGSTROM_MODE 
ANGSTROMLIBC LIBC"
echo "Altered environment for OE Development"
f) tar -xzvf bitbake-1.8.8.tar.gz -C /home/paul/project 
(untar bitbake into
project folder)
2. Getting openembedded
a) cd /home/paul/project (Go to project folder)
b) git clone git://git.openembedded.org/openembedded 
(dowload openembedded)
c) cp openembedded/conf/local.conf.sample build/conf/local.conf 
(Setting
local.conf file)

3.Building qt4-embedded recipe
Because the small project needs the lib of qt4,
 so the first thing to do is
building qt4-embedded recipe,
of cause , if you already finished this task ,
you can skin this step.
Building it by command follow:
a) cd /home/paul/project (Go to the project folder)
b) source source-me.txt (initializing envira)
c) bitbake qt4-embedded (This will takes a long time)
-------------------------------------------------------
but t have this error :

skan@skan-desktop:~/project$ bitbake qt4-embedded
/usr/lib/pymodules/python2.6/bb/COW.py:29: 
DeprecationWarning: the sets module
is deprecated
  import types, sets
/usr/lib/pymodules/python2.6/bb/COW.py:29:
 DeprecationWarning: the sets module
is deprecated
  import types, sets
Traceback (most recent call last):
  File "/usr/bin/bitbake", line 143, in <module>
    main()
  File "/usr/bin/bitbake", line 123, in main
    cooker.parseConfiguration()
  File "/usr/lib/pymodules/python2.6/bb/cooker.py", line 68, in parseConfiguration
    self.parseConfigurationFile( os.path.join( "conf", "bitbake.conf" ) )
  File "/usr/lib/pymodules/python2.6/bb/cooker.py", line 404, in
parseConfigurationFile
    bb.event.fire(bb.event.ConfigParsed(self.configuration.data))
  File "/usr/lib/pymodules/python2.6/bb/event.py", line 67, in fire
    if tmpHandler(event) == Handled:
  File "tmpHandler(e)", line 4, in tmpHandler
  File "<bb>", line 18, in check_sanity
NameError: global name 'os' is not defined




What can I do?



