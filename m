Received: from [17.148.16.89] (helo=asmtpout014.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MGPrl-00015Y-Rf
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Jun 2009 06:01:46 +0200
MIME-version: 1.0
Received: from [87.201.169.122] by asmtp014.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLB00KRFC1GOK80@asmtp014.mac.com> for
	openembedded-devel@lists.openembedded.org; Mon,
	15 Jun 2009 20:51:24 -0700 (PDT)
Message-id: <D34E12F3-25C1-4B11-BC85-7D45664905DE@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
In-reply-to: <9050EA3F-01E5-479A-8AF2-C6553F347FE7@mac.com>
Date: Tue, 16 Jun 2009 07:51:06 +0400
References: <9050EA3F-01E5-479A-8AF2-C6553F347FE7@mac.com>
X-Mailer: Apple Mail (2.935.3)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: classpath_0.98 recipe failure
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
X-List-Received-Date: Tue, 16 Jun 2009 04:01:46 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7BIT

Hi,
	If I set the following providers, classpath compilation fails. Could  
someone please help me get classpath to successfully build on the overo?

PREFERRED_PROVIDER_classpath = "classpath"
PREFERRED_PROVIDER_virtual/javac-native = "openjdk-javac-native"
PREFERRED_PROVIDER_virtual/java-initial = "cacao-initial"
PREFERRED_PROVIDER_virtual/java-native = "cacao-native"

Additionally, using jamvm results in configuration failures, so I'm  
effectively stuck and cannot build classpath. :-(

Best regards,

Elvis

NOTE: Running task 1192 of 1725 (ID: 8, /tool/overo-oe/ 
org.openembedded.dev/recipes/classpath/classpath_0.98.bb, do_compile)
ERROR: function do_compile failed
ERROR: log data follows (/tool/overo-oe/tmp/work/armv7a-angstrom-linux- 
gnueabi/classpath-0.98-r0/temp/log.do_compile.8372)

  Making all in tools
| make[1]: Entering directory `/tool/overo-oe/tmp/work/armv7a-angstrom- 
linux-gnueabi/classpath-0.98-r0/classpath-0.98/tools'
| /tool/overo-oe/tmp/staging/i686-linux/usr/bin/mkdir -p classes asm
| /tool/overo-oe/tmp/staging/i686-linux/usr/bin/mkdir -p ../tools/ 
generated/gnu/classpath/tools/gjdoc/expr
| java -classpath  antlr.Tool -o ../tools/generated/gnu/classpath/ 
tools/gjdoc/expr/ \
| 	  ./gnu/classpath/tools/gjdoc/expr/java-expression.g
| Unknown option: -o
| Usage: cacao [-options] classname [arguments]
|                (to run a class file)
|    or  cacao [-options] -jar jarfile [arguments]
|                (to run a standalone jar file)





