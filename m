Received: from [17.148.16.86] (helo=asmtpout011.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MGYzD-0006mo-GP
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Jun 2009 15:46:03 +0200
MIME-version: 1.0
Received: from [87.201.169.67] by asmtp011.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLC001RQ33CGE30@asmtp011.mac.com> for
	openembedded-devel@lists.openembedded.org; Tue,
	16 Jun 2009 06:35:40 -0700 (PDT)
Message-id: <A08B4996-5193-4730-9C12-D669170223C5@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
In-reply-to: <8C98050F-2C26-4376-9A32-BAC900B5E832@mac.com>
Date: Tue, 16 Jun 2009 17:35:24 +0400
References: <9050EA3F-01E5-479A-8AF2-C6553F347FE7@mac.com>
	<D34E12F3-25C1-4B11-BC85-7D45664905DE@mac.com>
	<A2AED021-1D87-4921-A330-FE9AF01C9FCD@mac.com>
	<303CFF24-F38E-46D2-A01D-16756614815F@mac.com>
	<d1b08f940906160324h11f182e2i82f92d2f65575724@mail.gmail.com>
	<8C98050F-2C26-4376-9A32-BAC900B5E832@mac.com>
X-Mailer: Apple Mail (2.935.3)
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
X-List-Received-Date: Tue, 16 Jun 2009 13:46:03 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi,
	Don't ask me how, but using the following provider options and  
creating a new recipe for jamvm_1.5.3.bb (just copy paste and rename  
the existing jamvm_1.5.2.bb file to jamvm_1.5.3.bb) worked! :-)

PREFERRED_PROVIDER_classpath = "classpath"
PREFERRED_VERSION_classpath = "0.98"

PREFERRED_PROVIDER_virtual/java-initial = "jamvm-initial"
PREFERRED_VERSION_jamvm-initial = "1.5.0"

PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
PREFERRED_VERSION_libecj-bootstrap = "3.4.1"

PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
PREFERRED_VERSION_jamvm-native = "1.5.3"


Best regards,

Elvis




