Received: from [17.148.16.93] (helo=asmtpout018.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MGRIS-000306-4p
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Jun 2009 07:33:24 +0200
MIME-version: 1.0
Received: from [87.201.169.122] by asmtp018.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLB004FZG9FZY90@asmtp018.mac.com> for
	openembedded-devel@lists.openembedded.org; Mon,
	15 Jun 2009 22:22:32 -0700 (PDT)
Message-id: <A2AED021-1D87-4921-A330-FE9AF01C9FCD@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: Elvis Dowson <elvis.dowson@mac.com>
In-reply-to: <D34E12F3-25C1-4B11-BC85-7D45664905DE@mac.com>
Date: Tue, 16 Jun 2009 09:22:17 +0400
References: <9050EA3F-01E5-479A-8AF2-C6553F347FE7@mac.com>
	<D34E12F3-25C1-4B11-BC85-7D45664905DE@mac.com>
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
X-List-Received-Date: Tue, 16 Jun 2009 05:33:24 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7BIT

Hi,
	Here is another combination that results in configure failures.

PREFERRED_PROVIDER_classpath = "classpath"
PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
PREFERRED_PROVIDER_virtual/java-initial = "jamvm-initial"
PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"

What could the reason be? Natively I have sun-jdk-1.6.0 installed, so  
there is a javac in the path. Don't know if that is some how related  
to this error. Please help!

  configure: WARNING: I have to compile Test.class from scratch
| checking for ecj... no
| checking for ecj-3.3... no
| checking for ecj-3.2... no
| checking for javac... javac - 
Xlint:unchecked,cast,divzero,empty,finally,overrides
| checking if javac - 
Xlint:unchecked,cast,divzero,empty,finally,overrides is a version of  
gcj... Exception in thread "main" java.lang.NoClassDefFoundError: org/ 
eclipse/jdt/internal/compiler/batch/Main
|    <<No stacktrace available>>
| Caused by: java.lang.ClassNotFoundException:  
org.eclipse.jdt.internal.compiler.batch.Main not found in  
java.lang.ClassLoader$1{urls=[], parent=null}
|    at java.net.URLClassLoader.findClass(URLClassLoader.java:529)
|    at java.lang.ClassLoader.loadClass(ClassLoader.java:341)
|    at java.lang.ClassLoader$1.loadClass(ClassLoader.java:1112)
|    at java.lang.ClassLoader.loadClass(ClassLoader.java:293)
|
| checking if javac - 
Xlint:unchecked,cast,divzero,empty,finally,overrides works...  
configure: error: The Java compiler javac - 
Xlint:unchecked,cast,divzero,empty,finally,overrides failed (see  
config.log, check the CLASSPATH?)
| FATAL: oe_runconf failed
NOTE: Task failed: /tool/overo-oe/tmp/work/armv7a-angstrom-linux- 
gnueabi/classpath-0.98-r0/temp/log.do_configure.29294
ERROR: TaskFailed event exception, aborting
ERROR: Build of /tool/overo-oe/user.collection/recipes/classpath/ 
classpath_0.98.bb do_configure failed
ERROR: Task 6 (/tool/overo-oe/user.collection/recipes/classpath/ 
classpath_0.98.bb, do_configure) failed
NOTE: Tasks Summary: Attempted 1690 tasks of which 1646 didn't need to  
be rerun and 1 failed.
ERROR: '/tool/overo-oe/user.collection/recipes/classpath/ 
classpath_0.98.bb' failed



Best regards,

Elvis



