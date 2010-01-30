Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1NbEsv-0000b0-CN
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jan 2010 16:05:20 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id D80B9110009A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2010 16:02:54 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 4EF661100093
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2010 16:02:54 +0100 (CET)
Received: from rhein.familie-heinold.de (f052238199.adsl.alicedsl.de
	[78.52.238.199]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2010 16:02:54 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 6DE193C0C3; Sat, 30 Jan 2010 16:02:53 +0100 (CET)
Date: Sat, 30 Jan 2010 16:02:53 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100130150252.GA3740@rhein.zuhause.netz>
References: <6C2434209962DC46B88345CA85C334A28596C7F9D3@Courier.syntech.org>
	<1264196828.26541.14.camel@mattotaupa.wohnung.familie-menzel.net>
	<6C2434209962DC46B88345CA85C334A28596C7FB21@Courier.syntech.org>
	<20100128110438.GA18170@rhein.zuhause.netz>
	<6C2434209962DC46B88345CA85C334A28596C7FBC4@Courier.syntech.org>
MIME-Version: 1.0
In-Reply-To: <6C2434209962DC46B88345CA85C334A28596C7FBC4@Courier.syntech.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Difficulties building java
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
X-List-Received-Date: Sat, 30 Jan 2010 15:05:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 29, 2010 at 03:58:39PM -0500, Mark Butsch wrote:
> I am using the following:
> 
> PREFERRED_PROVIDER_virtual/java-initial = "cacao-initial"
> PREFFERED_VERSION_cacao-initial = "0.98"
> 
> PREFERRED_PROVIDER_virtual/java-native = "cacao-native"
> PREFFERED_VERSION_cacao-native = "0.99.3"
> 
> PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
> PREFFERED_VERSION_libecj-bootstrap = "3.4"
> 
> PREFERRED_PROVIDER_classpath = "classpath"
> PREFFERED_VERSION_classpath-initial = "0.93"
> PREFFERED_VERSION_classpath-native = "0.97.2"
> 
> PREFERRED_PROVIDER_swt3.4-gtk = "swt3.4-gtk"
> 
> PREFFERED_VERSION_cacao= "0.99.4"
> PREFFERED_VERSION_classpath= "0.98"
> 
> Are these a good combination? I am building on an x86-64 machine for i686 target with Angstrom as my distro.
> 
> Suggestions on what to try/investigate?
> 
> Thanks in advance,
> 
> Mark

Hi Mark,

sorry but cacao dont work this well these days, please use jamvm for java-native and java-inital.

Bye Henning


