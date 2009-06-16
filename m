Received: from [17.148.16.94] (helo=asmtpout019.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MGWt9-0001pM-D2
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Jun 2009 13:31:39 +0200
MIME-version: 1.0
Received: from [87.201.169.67] by asmtp019.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLB00E1KWUMZX80@asmtp019.mac.com> for
	openembedded-devel@lists.openembedded.org; Tue,
	16 Jun 2009 04:20:50 -0700 (PDT)
Message-id: <8C98050F-2C26-4376-9A32-BAC900B5E832@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: openembedded-devel@lists.openembedded.org
In-reply-to: <d1b08f940906160324h11f182e2i82f92d2f65575724@mail.gmail.com>
Date: Tue, 16 Jun 2009 15:20:35 +0400
References: <9050EA3F-01E5-479A-8AF2-C6553F347FE7@mac.com>
	<D34E12F3-25C1-4B11-BC85-7D45664905DE@mac.com>
	<A2AED021-1D87-4921-A330-FE9AF01C9FCD@mac.com>
	<303CFF24-F38E-46D2-A01D-16756614815F@mac.com>
	<d1b08f940906160324h11f182e2i82f92d2f65575724@mail.gmail.com>
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
X-List-Received-Date: Tue, 16 Jun 2009 11:31:39 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi Andrea,
			Tired that, it fails miserably!! :-(

For example, going by the instructions on that wiki, I set the  
following preferred providers and still cannot build classpath!

#PREFERRED_PROVIDER_classpath = "classpath"
#PREFERRED_VERSION_classpath = "0.98"
PREFERRED_PROVIDER_classpath = "classpath-minimal"
PREFERRED_VERSION_classpath-minimal = "0.97.2"
PREFERRED_VERSION_classpath-initial = "0.93"

#PREFERRED_PROVIDER_virtual/javac-native = "openjdk-javac-native"
PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
PREFERRED_VERSION_libecj-bootstrap = "3.4"

#PREFERRED_PROVIDER_virtual/java-initial = "cacao-initial"
#PREFERRED_VERSION_cacao-initial = "0.98"
PREFERRED_PROVIDER_virtual/java-initial = "jamvm-initial"
PREFERRED_VERSION_jamvm-initial = "1.4.5"

#PREFERRED_PROVIDER_virtual/java-native = "cacao-native"
#PREFERRED_VERSION_cacao-native = "0.99.3"
PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
PREFERRED_VERSION_jamvm-native = "1.5.1"


As you can see, from the commented code, I've tried both jamvm and  
cacao and both of them dont work. :-(

I've been stuck with this problem for 2 days now. My goal is to get  
RXTX working for the overo, but I'm stuck with these basic libraries  
not building, so I'm stuck at the moment.

Elvis

On Jun 16, 2009, at 2:24 PM, Andrea Adami wrote:

> Elvis,
>
> the status-of-the art is described in two pages here:
>
> http://wiki.openembedded.net/index.php/Category:Java
>
> Regards
>
> Andrea
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



