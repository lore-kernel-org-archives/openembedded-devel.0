Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GLm5Z-0002bp-Nl for openembedded-devel@lists.openembedded.org;
	Fri, 08 Sep 2006 21:32:34 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 9FF56401B45; Fri,  8 Sep 2006 12:08:02 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060908190802.9FF56401B45@tinman.treke.net>
Date: Fri,  8 Sep 2006 12:08:02 -0700 (PDT)
Subject: [Bug 1404] New: Compilation of libxml-parser-perl-native fails
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Sep 2006 19:32:34 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1404

           Summary: Compilation of libxml-parser-perl-native fails
           Product: Openembedded
           Version: OpenZaurus 3.5.4.x
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: bugs.openembedded.org@rolf.leggewie.biz
         QAContact: tinderbox-oe@gmx.net


| Expat.xs:2109: error: â undeclared (first use in this function)
| Expat.xs:2109: error: syntax error before â token
| Expat.xs:2110: error: â undeclared (first use in this function)
| Expat.xs:2115: error: â undeclared (first use in this function)
| Expat.xs:2117: error: â undeclared (first use in this function)
| Expat.c: In function â:
| Expat.c:2540: error: â undeclared (first use in this function)
| Expat.c:2540: error: syntax error before â
| Expat.xs:2127: error: â undeclared (first use in this function)
| Expat.xs:2127: error: syntax error before â token
| Expat.xs:2128: error: â undeclared (first use in this function)
| Expat.xs:2133: error: â undeclared (first use in this function)
| Expat.xs:2135: error: â undeclared (first use in this function)
| Expat.c: In function â:
| Expat.c:2568: error: â undeclared (first use in this function)
| Expat.c:2568: error: syntax error before â
| Expat.xs:2144: error: â undeclared (first use in this function)
| Expat.xs:2144: error: syntax error before â token
| Expat.xs:2149: error: â undeclared (first use in this function)
| Expat.xs:2149: error: syntax error before numeric constant
| Expat.xs:2153: error: â undeclared (first use in this function)
| Expat.xs:2154: error: â undeclared (first use in this function)
| Expat.xs:2154: error: syntax error before numeric constant
| Expat.xs:2158: error: â undeclared (first use in this function)
| Expat.xs:2158: error: syntax error before numeric constant
| Expat.c: In function â:
| Expat.c:2600: error: â undeclared (first use in this function)
| Expat.c:2600: error: syntax error before â
| Expat.xs:2167: error: â undeclared (first use in this function)
| Expat.xs:2167: error: syntax error before â token
| Expat.c: In function â:
| Expat.c:2621: error: â undeclared (first use in this function)
| Expat.c:2621: error: syntax error before â
| Expat.xs:2179: error: â undeclared (first use in this function)
| Expat.xs:2179: error: syntax error before â token
| Expat.c: In function â:
| Expat.c:2643: error: â undeclared (first use in this function)
| Expat.c:2643: error: syntax error before â
| Expat.xs:2194: error: â undeclared (first use in this function)
| Expat.xs:2194: error: syntax error before â token
| Expat.xs:2197: error: â undeclared (first use in this function)
| make[1]: *** [Expat.o] Error 1
| make[1]: Leaving directory
`/export/interim/openembedded/tmp/work/i686-linux/libxml-parser-perl-native-2.34-r0/XML-Parser-2.34/Expat'
| make: *** [subdirs] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:
/export/interim/openembedded/tmp/work/i686-linux/libxml-parser-perl-native-2.34-r0/temp/log.do_stage.18186
NOTE: package libxml-parser-perl-native-2.34-r0: task do_populate_staging:
failed
ERROR: TaskFailed event exception, aborting
NOTE: package libxml-parser-perl-native-2.34-r0: task do_clean: started
NOTE: removing
/export/interim/openembedded/tmp/work/i686-linux/libxml-parser-perl-native-2.34-r0
NOTE: removing
/export/interim/openembedded/tmp/stamps/i686-linux/libxml-parser-perl-native-2.34-r0.*
NOTE: package libxml-parser-perl-native-2.34-r0: task do_clean: completed
NOTE: package libxml-parser-perl-native-2.34: failed
ERROR: Build of granule failed


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


