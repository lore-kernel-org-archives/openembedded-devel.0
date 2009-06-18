Received: from [17.148.16.89] (helo=asmtpout014.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MHNez-0002r5-LE
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 21:52:43 +0200
MIME-version: 1.0
Received: from [87.201.169.51] by asmtp014.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLG008WX9DTPI70@asmtp014.mac.com> for
	openembedded-devel@lists.openembedded.org; Thu,
	18 Jun 2009 12:41:57 -0700 (PDT)
Message-id: <7EAA7086-6741-4062-AEC0-BD56726E0A44@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
Date: Thu, 18 Jun 2009 23:41:42 +0400
X-Mailer: Apple Mail (2.935.3)
Subject: cocoa recipes getting built even through I specify jamvm as the default providers
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
X-List-Received-Date: Thu, 18 Jun 2009 19:52:55 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi,
	I have set my providers not to build cacoa, and use jamvm, but when I  
build the classpath recipe, the system tries to build cocoa. This  
shouldn't be happening right?

Here are my settings. I've let the commented parts in, as you can see  
i've set it to use jamvm, but cocoa gets built also.

#PREFERRED_VERSION_classpath-initial = "0.93"
#PREFERRED_VERSION_classpath-native = "0.97.2"

PREFERRED_PROVIDER_classpath = "classpath"
#PREFERRED_VERSION_classpath = "0.98"
#PREFERRED_PROVIDER_classpath = "classpath-minimal"
#PREFERRED_VERSION_classpath-minimal = "0.97.2"

#PREFERRED_PROVIDER_virtual/java-initial = "cacao-initial"
#PREFERRED_VERSION_cacao-initial = "0.98"
PREFERRED_PROVIDER_virtual/java-initial = "jamvm-initial"
PREFERRED_VERSION_jamvm-initial = "1.4.5"

PREFERRED_PROVIDER_virtual/javac-native = "openjdk-javac-native"
#PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
#PREFERRED_VERSION_libecj-bootstrap = "3.3"

#PREFERRED_PROVIDER_virtual/java-native = "ecj-initial"
#PREFERRED_PROVIDER_virtual/java-native = "cacao-native"
#PREFERRED_VERSION_cacao-native = "0.99.4"
PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
#PREFERRED_VERSION_jamvm-native = "1.5.3"

#PREFERRED_VERSION_jamvm = "1.5.2"

PREFERRED_PROVIDER_swt3.4-gtk = "swt3.4-gtk"


Best regards,

Elvis




