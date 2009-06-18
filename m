Received: from [17.148.16.87] (helo=asmtpout012.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MHJnI-0007Ay-Tf
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 17:44:53 +0200
MIME-version: 1.0
Received: from [87.201.169.51] by asmtp012.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLF000R7XWQDQ10@asmtp012.mac.com> for
	openembedded-devel@lists.openembedded.org; Thu,
	18 Jun 2009 08:34:18 -0700 (PDT)
Message-id: <23B067EF-8C0C-4FE0-BA0E-842B494B7889@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
Date: Thu, 18 Jun 2009 19:33:51 +0400
X-Mailer: Apple Mail (2.935.3)
Subject: How to remove check for ecj
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
X-List-Received-Date: Thu, 18 Jun 2009 15:44:53 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi,
	How can I remove a check for ecj compiler feature. This is related to  
the errors that I am getting with trying to configure a version of  
classpath.

I have narrowed the problem down to the build system failing at the  
following point. By this time, I have run all combinations of ecj- 
bootstrap-native 3.3, 3.4, 3.4.1, and classpath-0.98, 0.97.2, 0.96.1  
and I get the same failure at this point.

| make use of stdint.h in include/config-int.h (assuming C99  
compatible system)
| checking for ecj... ecj -warn:-deprecation,serial,unusedImport
| checking if ecj -warn:-deprecation,serial,unusedImport works...  
configure: error: The Java compiler ecj -warn:- 
deprecation,serial,unusedImport failed (see config.log, check the  
CLASSPATH?)
| FATAL: oe_runconf failed
NOTE: Task failed: /tool/overo-oe/tmp/work/armv7a-angstrom-linux- 
gnueabi/classpath-minimal-0.97.2-r3/temp/log.do_configure.8978
ERROR: TaskFailed event exception, aborting


Can any one suggestion how I can disable this check? I have a  
deadline, and if I can't get past this error, I'll have to completely  
abandon attempting to use java support for the project.

Best regards,

Elvis


