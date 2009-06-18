Received: from [17.148.16.96] (helo=asmtpout021.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MHA4y-0002Ln-VA
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 07:22:30 +0200
MIME-version: 1.0
Received: from [87.201.169.51] by asmtp021.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLF00H2852UUY70@asmtp021.mac.com> for
	openembedded-devel@lists.openembedded.org; Wed,
	17 Jun 2009 22:11:26 -0700 (PDT)
Message-id: <64C3C67F-454D-401D-A284-9D4B39C4A905@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: Robert Schuster <theBohemian@gmx.net>
In-reply-to: <E701E0BB-B8EC-482B-8808-47449E0FD322@mac.com>
Date: Thu, 18 Jun 2009 09:11:06 +0400
References: <9050EA3F-01E5-479A-8AF2-C6553F347FE7@mac.com>
	<4A396EBD.2010207@gmx.net>
	<E701E0BB-B8EC-482B-8808-47449E0FD322@mac.com>
X-Mailer: Apple Mail (2.935.3)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Thu, 18 Jun 2009 05:22:33 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7BIT

Hi Robert,
			Here is what is working so far: ecj-initial, classpath-initial-0.93

Here is what is not working: classpath-native-0.98, classpath-0.98.

classpath-native-0.98 has a compilation failure. I've copied the error  
messages for this below:

NOTE: Running task 257 of 267 (ID: 8, /tool/overo-oe/user.collection/ 
recipes/classpath/classpath-native_0.98.bb, do_compile)
ERROR: function do_compile failed
ERROR: log data follows (/tool/overo-oe/tmp/work/i686-linux/classpath- 
native-0.98-r0/temp/log.do_compile.14214)

  Making all in tools
| make[1]: Entering directory `/tool/overo-oe/tmp/work/i686-linux/ 
classpath-native-0.98-r0/classpath-0.98/tools'
| /tool/overo-oe/tmp/staging/i686-linux/usr/bin/mkdir -p classes asm
| /tool/overo-oe/tmp/staging/i686-linux/usr/bin/mkdir -p ../tools/ 
generated/gnu/classpath/tools/gjdoc/expr
| /tool/overo-oe/tmp/staging/i686-linux/usr/bin/java-initial - 
classpath  antlr.Tool -o ../tools/generated/gnu/classpath/tools/gjdoc/ 
expr/ \
| 	  ./gnu/classpath/tools/gjdoc/expr/java-expression.g
| Unrecognised command line option: -o
| Usage: jamvm-initial [-options] class [arg1 arg2 ...]
|                  (to run a class file)
|    or  jamvm-initial [-options] -jar jarfile [arg1 arg2 ...]
|                  (to run a standalone jar file)

  make[1]: *** [tools.zip] Error 1
| make[1]: Leaving directory `/tool/overo-oe/tmp/work/i686-linux/ 
classpath-native-0.98-r0/classpath-0.98/tools'
| make: *** [all-recursive] Error 1
| FATAL: oe_runmake failed



classpath--0.98 has a configuration failure.

Elvis



