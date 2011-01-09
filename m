Received: from mx194.callplus.net.nz ([202.180.66.194]
	helo=mxi2.callplus.net.nz) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <roystonvasey@slingshot.co.nz>) id 1Pc1LW-00041v-G3
	for Openembedded-devel@lists.openembedded.org;
	Sun, 09 Jan 2011 20:54:34 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApgFACahKU3LYgoS/2dsb2JhbACWL48CsW0BiRINhT8EkDQ
Received: from smtp.connexionz.co.nz (HELO mikepad) ([203.98.10.18])
	by ismtp02.callplus.net.nz with ESMTP; 10 Jan 2011 08:53:56 +1300
From: "R U Local" <roystonvasey@slingshot.co.nz>
To: <Openembedded-devel@lists.openembedded.org>
References: 
In-Reply-To: 
Date: Mon, 10 Jan 2011 08:53:55 +1300
Message-ID: <00ce01cbb036$f31d3010$d9579030$@slingshot.co.nz>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: Acut4em3h8hh8lSiRTWhh8HpwuugOgCVESuA
Subject: Re: Mono recipe fails at do_install
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
X-List-Received-Date: Sun, 09 Jan 2011 19:54:34 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-nz

Dear List,=20
I=92m working on the Overo branch and just done a git pull to rebuild my
platform.=20
My previous head was 58feb7f form 2010-11-10.=20
I'm getting an error in the Mono package build for task do_install.=20
The mono-native and mono-mcs-intermediate parts build fine.=20
There have been no changes to the mono source or the recipe during this
time.=20

Has there been any changes to the way OE =A0is structured between these
commits that I should take a look at?=20

Any help or suggestions would be appreciated.=20

Cheers Mike.=20


Sorry forgot the error log.

NOTE: package mono-2.6.3-r0.0: task do_install: Started
ERROR: TaskFailed event exception, aborting
ERROR: Build of /opt/vm-share/user.collection/recipes/mono/mono_2.6.3.bb
do_install failed
ERROR: Task 3 (/opt/vm-share/user.collection/recipes/mono/mono_2.6.3.bb,
do_install) failed with 256
ERROR: '/opt/vm-share/user.collection/recipes/mono/mono_2.6.3.bb' failed
ERROR: Function do_install failed
NOTE: Task failed: ('function do_install failed',
'/home/ctm100/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/mono-2.6.3-=
r0.
0/temp/log.do_install.1883')
ERROR: Logfile of failure stored in:
/home/ctm100/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/mono-2.6.3-r=
0.0
/temp/log.do_install.1883
Log data follows:
|
/home/ctm100/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/mono-2.6.3-r=
0.0
/image
| /home/ctm100
| NOTE: make
DESTDIR=3D/home/ctm100/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/mo=
no-2.
6.3-r0.0/image install
| make: *** No rule to make target `install'.  Stop.
| FATAL: oe_runmake failed
| ERROR: Function do_install failed
NOTE: package mono-2.6.3-r0.0: task do_install: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of /opt/vm-share/user.collection/recipes/mono/mono_2.6.3.bb
do_install failed
ERROR: Task 3 (/opt/vm-share/user.collection/recipes/mono/mono_2.6.3.bb,
do_install) failed with 256
ERROR: '/opt/vm-share/user.collection/recipes/mono/mono_2.6.3.bb' failed
ERROR: '/opt/vm-share/user.collection/recipes/mono/mono_2.6.3.bb' failed



