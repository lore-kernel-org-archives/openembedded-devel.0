Received: from ramkesd003-e.ra.rockwell.com ([205.175.240.251]
	helo=ramilwsmtp01.ra.rockwell.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mkes@ra.rockwell.com>) id 1Qu0nV-0005gK-Kf
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 13:30:05 +0200
Received: from cze.ra.rockwell.com ([10.70.136.58])
	by ramilwsmtp01.ra.rockwell.com (Lotus Domino Release 8.5.2FP2)
	with ESMTP id 2011081806252484-1128260 ;
	Thu, 18 Aug 2011 06:25:24 -0500 
Received: (qmail 68525 invoked from network); 18 Aug 2011 11:25:24 -0000
Received: from unknown (HELO [10.70.138.68]) ([10.70.138.68])
	(envelope-sender <mkes@ra.rockwell.com>)
	by euczprgmult004.cze.ra.rockwell.com (qmail-ldap-1.03) with SMTP
	for <openembedded-devel@lists.openembedded.org>;
	18 Aug 2011 11:25:24 -0000
Message-ID: <4E4CF6A7.6020901@ra.rockwell.com>
Date: Thu, 18 Aug 2011 13:25:27 +0200
From: Miroslav Kes <mkes@ra.rockwell.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110802 Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-MIMETrack: Itemize by SMTP Server on
	RAMilwSMTP01/Milwaukee/RA/Rockwell(Release
	8.5.2FP2|March 22, 2011) at 08/18/2011 06:25:25 AM,
	Serialize by Router on RAMilwSMTP01/Milwaukee/RA/Rockwell(Release
	8.5.2FP2|March 22, 2011) at 08/18/2011 06:25:28 AM,
	Serialize complete at 08/18/2011 06:25:28 AM
Subject: inetlib_1.1.1.bb (classpathx) doesn't install inetlib.jar to the sysroot
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
X-List-Received-Date: Thu, 18 Aug 2011 11:30:05 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=ISO-8859-1

I have experienced this error when building the gnumail:

$ cat log.do_configure
...
checking if
/home/mkes/sources/linux/platform/oebase/builds/beagleboard_gnu/build/tmp/sysroots/i686-linux/usr/bin/javac
works... yes
checking for fastjar... fastjar
checking for
/home/mkes/sources/linux/platform/oebase/builds/beagleboard_gnu/build/tmp/sysroots/java/activation.jar...
yes
checking for
/home/mkes/sources/linux/platform/oebase/builds/beagleboard_gnu/build/tmp/sysroots/java/inetlib.jar...
configure: error: can't find inetlib.jar in specified path

Really, the inetlib_1.1.1.bb doesn't install the jar to the
${TMPDIR/sysroots/java. The logs show that the oe_jarinstall() is never
called with the -s option.

I have created a local overlay and added a call to the the java_stage i.e.

do_install_append() {
  java_install
  java_stage
}

This fixed the problem.

Regards

Mira Kes


