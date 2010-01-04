Received: from qmta08.emeryville.ca.mail.comcast.net ([76.96.30.80])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ajit@openblox.com>) id 1NRsM9-0004c7-RL
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jan 2010 20:12:49 +0100
Received: from OMTA24.emeryville.ca.mail.comcast.net ([76.96.30.92])
	by QMTA08.emeryville.ca.mail.comcast.net with comcast
	id RWQm1d00F1zF43QA8X9gAl; Mon, 04 Jan 2010 19:09:40 +0000
Received: from denali ([67.171.164.209])
	by OMTA24.emeryville.ca.mail.comcast.net with comcast
	id RXAn1d00M4XPUJB8kXAuRv; Mon, 04 Jan 2010 19:10:59 +0000
From: "Ajit Limaye" <ajit@openblox.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Jan 2010 11:11:42 -0800
Organization: OpenBlox
Message-ID: <D299FA2FC6F14C2092BE69139EA3D129@denali>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook, Build 10.0.2627
Importance: Normal
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.5579
X-SA-Exim-Connect-IP: 76.96.30.80
X-SA-Exim-Mail-From: ajit@openblox.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: xmonobut-0.4.1.tar.gz missing checksum
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
X-List-Received-Date: Mon, 04 Jan 2010 19:12:49 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi:
 
I am building a xii-image, using the following conf file for bitbake:
 
DL_DIR = "${OEBASE}/sources"
BBFILES = "${OEBASE}/openembedded/recipes/*/*.bb"
MACHINE = "overo"
DISTRO = "angstrom-2008.1"
BBDEBUG = "yes"
DEBUG_BUILD = "1"
INHIBIT_PACKAGE_STRIP = "1"
BBINCLUDELOGS = "yes"
 
I get the following error:
 
NOTE: Missing checksum
ERROR: xmonobut-0.4.1:
http://familiar.handhelds.org/source/v0.8.4-rc2/sources/xmonobut-0.4.1.t
ar.gz has no checksum defined, cannot check archive integrity
ERROR: Error in executing:
/home/ajit/linux/oe/openembedded/recipes/xmonobut/xmonobut_0.4.1.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Error in executing:
/home/ajit/linux/oe/openembedded/recipes/xmonobut/xmonobut_0.4.1.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Build of
/home/ajit/linux/oe/openembedded/recipes/xmonobut/xmonobut_0.4.1.bb
do_fetch failed
ERROR: Task 2576
(/home/ajit/linux/oe/openembedded/recipes/xmonobut/xmonobut_0.4.1.bb,
do_fetch) failed
NOTE: Tasks Summary: Attempted 2548 tasks of which 2548 didn't need to
be rerun and 1 failed.
ERROR:
'/home/ajit/linux/oe/openembedded/recipes/xmonobut/xmonobut_0.4.1.bb'
failed
 
I checked the familiar.handhelds.org website and discovered that rc2 has
been superceded by a stable release (v0.8.4), so I modified the source
path defined in  openembedded/recipes/xmonobut/xmonobut_0.4.1.bb from:
familiar.handhelds.org/source/v0.8.4-rc2/sources/xmonobut-${PV}.tar.gz
to: /familiar.handhelds.org/source/v0.8.4/sources/xmonobut-${PV}.tar.gz
but I still get the same error. 
 
Any suggestions regarding what I am doing wrong or what else I can try
would be greatly appreciated. 
 
Thanks.
 

