Received: from [195.70.105.99] (helo=mail.skidata.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <FALE@skidata.com>) id 1GariK-0006a9-Oa
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Oct 2006 12:34:56 +0200
X-SEF-Processed: 5_0_0_713__2006_10_20_12_27_48
From: Leopold Faschalek <fale@skidata.com>
To: openembedded-devel@lists.openembedded.org
Organization: SKIDATA AG
Date: Fri, 20 Oct 2006 13:26:19 +0200
Message-Id: <1161343579.28578.3.camel@ubuntu>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
Subject: cvs proxy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Oct 2006 10:34:57 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

after installing OE I tried with 'bitbake task-bootstrap' and got
following output after a second run:

NOTE: Using cache in '/stuff/tmp/cache'
NOTE: Handling BitBake files: | (3983/3983) [100 %]
NOTE: Parsing finished. 3866 cached, 0 parsed, 117 skipped, 0 masked.

NOTE: build 200610201320: started

OE Build Configuration:
BB_VERSION     = "1.6.1"
OE_REVISION    = "b4deec430ac4a640c372471057dbd7e0973f41e5"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux"
MACHINE        = "collie"
DISTRO         = "familiar"
DISTRO_VERSION = "unstable-20061020"
TARGET_FPU     = ""

NOTE: package ipkg-utils-native-1.6+cvs20050404: started
NOTE: package ipkg-utils-native-1.6+cvs20050404-r8: task do_fetch:
started
NOTE: fetch
http://www.oesources.org/source/current/ipkg-utils_anoncvs.handhelds.org__20050930.tar.gz
--13:20:50--
http://www.oesources.org/source/current/ipkg-utils_anoncvs.handhelds.org__20050930.tar.gz
           =>
`/home/fale/sources/ipkg-utils_anoncvs.handhelds.org__20050930.tar.gz'
Connecting to 172.16.10.104:8080... connected.
Proxy request sent, awaiting response... 504 Proxy Timeout ( The
connection timed out. For more information about this event, see ISA
Server Help.  )
13:21:11 ERROR 504: Proxy Timeout ( The connection timed out. For more
information about this event, see ISA Server Help.  ).

NOTE: Fetch
cvs://anoncvs:anoncvs@anoncvs.handhelds.org/cvs;module=ipkg-utils
cvs [checkout aborted]: connect to
anoncvs.handhelds.org(128.31.0.23):2401 failed: No route to host
NOTE: Task failed: Fetch failed: ipkg-utils
NOTE: package ipkg-utils-native-1.6+cvs20050404-r8: task do_fetch:
failed
ERROR: TaskFailed event exception, aborting
NOTE: package ipkg-utils-native-1.6+cvs20050404: failed
ERROR: Build of task-bootstrap failed

any suggestions?

many thanks

Leopold Faschalek
fale at skidata dot com




