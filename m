Received: from [17.148.16.96] (helo=asmtpout021.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MGF1v-0003Ak-M8
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Jun 2009 18:27:32 +0200
MIME-version: 1.0
Received: from [87.201.169.122] by asmtp021.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLA0051HFW15EA0@asmtp021.mac.com> for
	openembedded-devel@lists.openembedded.org; Mon,
	15 Jun 2009 09:16:54 -0700 (PDT)
Message-id: <CEB7DE21-4D93-4533-AE15-B775392D0799@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Jun 2009 20:16:39 +0400
X-Mailer: Apple Mail (2.935.3)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: How to avoid multiple bb files being built with classpath recipe
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
X-List-Received-Date: Mon, 15 Jun 2009 16:27:32 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7BIT

Hi,
	I have copied the classpath recipe folder to my user.collection  
folder and set DEFAULT_PREFERENCE="1" for classpath_0.97.2.bb.

I get an error message saying that multiple bb files are due to be  
built which each provide classpath. How can I prevent this?

Please help! I'm stuck with this issue and cannot build the RXTX  
library due to errors with classpath recipe. It also pulls in a lot of  
xorg packages and recipes which I don't think is needed for RXTX to  
work.

Best regards,

Elvis


[elvis@zeus overo-oe]$ bitbake classpath
NOTE: Handling BitBake files: \ (6912/6912) [100 %]
NOTE: Parsing finished. 6640 cached, 0 parsed, 272 skipped, 2 masked.
NOTE: Cache is clean, not saving.
NOTE: multiple providers are available for classpath (classpath,  
classpath-minimal);
NOTE: consider defining PREFERRED_PROVIDER_classpath
NOTE: Resolving any missing task queue dependencies
NOTE: multiple providers are available for virtual/javac-native (ecj- 
bootstrap-native, openjdk-javac-native);
NOTE: consider defining PREFERRED_PROVIDER_virtual/javac-native
NOTE: multiple providers are available for virtual/java-native (cacao- 
native, jamvm-native);
NOTE: consider defining PREFERRED_PROVIDER_virtual/java-native
NOTE: multiple providers are available for virtual/java-initial (cacao- 
initial, jamvm-initial);
NOTE: consider defining PREFERRED_PROVIDER_virtual/java-initial
NOTE: Preparing runqueue
ERROR: Multiple .bb files are due to be built which each provide  
classpath (/tool/overo-oe/user.collection/recipes/classpath/ 
classpath_0.97.2.bb /tool/overo-oe/user.collection/recipes/classpath/ 
classpath-minimal_0.97.2.bb).
  This usually means one provides something the other doesn't and  
should.




