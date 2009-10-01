Received: from [141.89.48.7] (helo=mail.cs.uni-potsdam.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <akzare@cs.uni-potsdam.de>) id 1MtK37-0003hD-6y
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Oct 2009 13:42:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.cs.uni-potsdam.de (Postfix) with ESMTP id C8192123F5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2009 13:42:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at cs.uni-potsdam.de
Received: from mail.cs.uni-potsdam.de ([127.0.0.1])
	by localhost (mail.cs.uni-potsdam.de [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id pfsPvg0asEVx
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2009 13:42:12 +0200 (CEST)
Received: from [141.89.52.43] (orest.ift.cs.uni-potsdam.de [141.89.52.43])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.cs.uni-potsdam.de (Postfix) with ESMTPSA id 39AF6123F0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2009 13:42:12 +0200 (CEST)
From: Ali Akbar Zarezadeh <akzare@cs.uni-potsdam.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 01 Oct 2009 13:41:29 +0200
Message-Id: <1254397289.21355.57.camel@orest.ift.cs.uni-potsdam.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 141.89.48.7
X-SA-Exim-Mail-From: akzare@cs.uni-potsdam.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Failed to build opencv_1.0.0.bb recipe
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
X-List-Received-Date: Thu, 01 Oct 2009 11:42:20 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

I am trying to build opencv_1.0.0.bb recipe with this command:

bitbake -b /opt/local/oe/openembedded/recipes/opencv/opencv_1.0.0.bb 

I've just faced with this error: "oe_runconf: command not found"

Maybe this log would be helpful to get the point what happened:

-------------------------------------------------------------------------------------------------

NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 5 of 17 (ID:
5, /opt/local/oe/openembedded/recipes/opencv/opencv_1.0.0.bb,
do_configure)
__builtin__:6: DeprecationWarning: raising a string exception is
deprecated
NOTE: No Python in STAGING_INCDIR. Forgot to build python-native ?:None
while evaluating:
${@python_dir(d)}
/opt/local/oe/bitbake/lib/bb/data_smart.py:92: DeprecationWarning:
raising a string exception is deprecated
  raise
NOTE: No Python in STAGING_INCDIR. Forgot to build python-native ?:None
while evaluating:
--disable-debug  --without-gtk --without-python --disable-apps
az_python_cspec=${STAGING_INCDIR}/${PYTHON_DIR}
NOTE: No Python in STAGING_INCDIR. Forgot to build python-native ?:None
while evaluating:
	if [ -x ${S}/configure ] ; then
		cfgcmd="${S}/configure \
		    --build=${BUILD_SYS} \
		    --host=${HOST_SYS} \
		    --target=${TARGET_SYS} \
		    --prefix=${prefix} \
		    --exec_prefix=${exec_prefix} \
		    --bindir=${bindir} \
		    --sbindir=${sbindir} \
		    --libexecdir=${libexecdir} \
		    --datadir=${datadir} \
		    --sysconfdir=${sysconfdir} \
		    --sharedstatedir=${sharedstatedir} \
		    --localstatedir=${localstatedir} \
		    --libdir=${libdir} \
		    --includedir=${includedir} \
		    --oldincludedir=${oldincludedir} \
		    --infodir=${infodir} \
		    --mandir=${mandir} \
			${EXTRA_OECONF} \
		    $@"
		oenote "Running $cfgcmd..."
		$cfgcmd || oefatal "oe_runconf failed"
	else
		oefatal "no configure script found"
	fi

ERROR: function do_configure failed
ERROR: log data follows
(/opt/local/oe/tmp/work/ppc405-angstrom-linux/opencv-1.0.0-r2/temp/log.do_configure.24130)
| /opt/local/oe/tmp/work/ppc405-angstrom-linux/opencv-1.0.0-r2/temp/run.do_configure.24130: line 745: oe_runconf: command not found
NOTE: Task
failed: /opt/local/oe/tmp/work/ppc405-angstrom-linux/opencv-1.0.0-r2/temp/log.do_configure.24130
ERROR: TaskFailed event exception, aborting
ERROR: Build
of /opt/local/oe/openembedded/recipes/opencv/opencv_1.0.0.bb
do_configure failed
ERROR: Task 5
(/opt/local/oe/openembedded/recipes/opencv/opencv_1.0.0.bb,
do_configure) failed
NOTE: Tasks Summary: Attempted 5 tasks of which 5 didn't need to be
rerun and 1 failed.
ERROR: '/opt/local/oe/openembedded/recipes/opencv/opencv_1.0.0.bb'
failed

-------------------------------------------------------------------------------------------------

I would be grateful if somebody would help me to figure out the problem.

CIAO
Ali




