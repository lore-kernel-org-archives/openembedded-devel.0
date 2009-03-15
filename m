Received: from [195.54.101.73] (helo=proxy3.bredband.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1LixaK-0007Ve-N6
	for openembedded-devel@openembedded.org; Sun, 15 Mar 2009 22:09:31 +0100
Received: from ironport.bredband.com (195.54.101.120) by proxy3.bredband.net
	(7.3.139)
	id 49B5DCC60034F6CD for openembedded-devel@openembedded.org;
	Sun, 15 Mar 2009 22:08:53 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AgQUAIcLvUlT4zhBPGdsb2JhbAAIlS8BAQEBNboRg38G
X-IronPort-AV: E=Sophos;i="4.38,368,1233529200"; d="scan'208";a="496415679"
Received: from c-4138e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.101]) ([83.227.56.65])
	by ironport1.bredband.com with ESMTP; 15 Mar 2009 22:08:53 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@openembedded.org
Organization: Atmel Nordic AB
Date: Sun, 15 Mar 2009 18:16:41 +0100
Message-Id: <1237137401.5838.225.camel@grond>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.1.1 
X-SA-Exim-Connect-IP: 195.54.101.73
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,DATE_IN_PAST_03_06,
	RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: perl-native fails.
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
X-List-Received-Date: Sun, 15 Mar 2009 21:09:31 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Trying to build SAM9263EK using Angstrom.
perl-native seems to fail with the following error message:

ODBM_File.xs:124: error: too few arguments to function 'dbmclose'


Anyone seen this before?



make[1]: Entering directory
`/home/ulf/projects/OE_atmel/build/tmp/work/x86_64-linux/perl-native-5.8.8-r13/perl-5.8.8/ext/ODBM_File'
cp ODBM_File.pm ../../lib/ODBM_File.pm
../../miniperl "-I../../lib" "-I../../lib" ../../lib/ExtUtils/xsubpp
-noprototypes -typemap ../../lib/ExtUtils/typemap -typemap typemap
ODBM_File.xs > ODBM_File.xsc && mv ODBM_File.xsc ODBM_File.c

gcc  -c   -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS
-fno-strict-aliasing -pipe -Wdeclaration-after-statement
-I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2
-DVERSION=\"1.06\" -DXS_VERSION=\"1.06\" -fpic "-I../.."   ODBM_File.c
ODBM_File.xs: In function 'XS_ODBM_File_DESTROY':
ODBM_File.xs:124: error: too few arguments to function 'dbmclose'

make[1]: *** [ODBM_File.o] Error 1

make[1]: Leaving directory
`/home/ulf/projects/OE_atmel/build/tmp/work/x86_64-linux/perl-native-5.8.8-r13/perl-5.8.8/ext/ODBM_File'

make: *** [lib/auto/ODBM_File/ODBM_File.so] Error 2

FATAL: oe_runmake failed

Best Regards
Ulf Samuelsson



