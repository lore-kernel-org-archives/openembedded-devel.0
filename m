Received: from [17.148.16.94] (helo=asmtpout019.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MHDVS-0005hB-B1
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 11:02:02 +0200
MIME-version: 1.0
Received: from [87.201.169.51] by asmtp019.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLF00J6IF9MO080@asmtp019.mac.com> for
	openembedded-devel@lists.openembedded.org; Thu,
	18 Jun 2009 01:51:29 -0700 (PDT)
Message-id: <05A2CED6-0B36-4DF7-8B57-CFD20002E88E@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: Robert Schuster <theBohemian@gmx.net>, Phil Blundell <pb@reciva.com>
In-reply-to: <64C3C67F-454D-401D-A284-9D4B39C4A905@mac.com>
Date: Thu, 18 Jun 2009 12:51:11 +0400
References: <9050EA3F-01E5-479A-8AF2-C6553F347FE7@mac.com>
	<4A396EBD.2010207@gmx.net>
	<E701E0BB-B8EC-482B-8808-47449E0FD322@mac.com>
	<64C3C67F-454D-401D-A284-9D4B39C4A905@mac.com>
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
X-List-Received-Date: Thu, 18 Jun 2009 09:02:03 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7BIT

Hi Robert & Phil,
			       I've tried once again, with the latest oe repository sync,  
and classpath-0.98.bb recipe fails at this point.

checking if ecj -warn:-deprecation,serial,unusedImport is a version of  
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
| checking if ecj -warn:-deprecation,serial,unusedImport works...  
configure: error: The Java compiler ecj -warn:- 
deprecation,serial,unusedImport failed (see config.log, check the  
CLASSPATH?)
| FATAL: oe_runconf failed

Are you able to compile classpath-0.98 on your machines? If so, can  
you give me your PREFERRED_PROVIDER/VERSION settings?

There are my current settings.

PREFERRED_PROVIDER_classpath = "classpath"
PREFERRED_VERSION_classpath = "0.98"
PREFERRED_VERSION_classpath-initial = "0.93"
PREFERRED_VERSION_classpath-native = "0.97.2"

PREFERRED_PROVIDER_virtual/java-initial = "jamvm-initial"
PREFERRED_VERSION_jamvm-initial = "1.5.0"

PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
PREFERRED_VERSION_libecj-bootstrap = "3.4.1"

PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
PREFERRED_VERSION_jamvm-native = "1.5.3"

PREFERRED_VERSION_jamvm = "1.5.2"

Best regards,

Elvis


