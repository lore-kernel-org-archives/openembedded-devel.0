Received: from [93.186.196.80] (helo=mis07.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mailings@hardware-datenbank.de>) id 1Mwc4R-00014x-GZ
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Oct 2009 15:33:18 +0200
Received: by mis07.de (Postfix, from userid 65534)
	id 7A99D144E01C; Sat, 10 Oct 2009 15:32:25 +0200 (CEST)
Received: from [192.168.2.121] (p5DC8F19A.dip.t-dialin.net [93.200.241.154])
	by mis07.de (Postfix) with ESMTPA id DEB2111C61F7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Oct 2009 15:32:22 +0200 (CEST)
Message-ID: <4AD08CE6.3000909@hardware-datenbank.de>
Date: Sat, 10 Oct 2009 15:32:22 +0200
From: Rath <mailings@hardware-datenbank.de>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <A22F8CDABC6B406EA2FC80E3109602BD@pcvirus>	<200910082311.16084.david.lanzendoerfer@o2s.ch>	<4ACF4AF7.9070406@hardware-datenbank.de>
	<200910100246.06278.david.lanzendoerfer@o2s.ch>
In-Reply-To: <200910100246.06278.david.lanzendoerfer@o2s.ch>
X-SA-Exim-Connect-IP: 93.186.196.80
X-SA-Exim-Mail-From: mailings@hardware-datenbank.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: build of libxrender failed
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
X-List-Received-Date: Sat, 10 Oct 2009 13:33:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi

>> In the openembedded/conf/distro/angstrom-2008.1.conf I've set 
>>     
> "PREFERRED_VERSION_linux-libc-headers" to "2.6.29"
> Don't do this in the conf. For this purpose there is an include folder!
> Enter the versions in conf/distro/include/angstrom-2008-preferred-versions.inc
>   
Okay, but doesn't my entry in the preferred-versions.inc get overwritten 
by the angstrom-2008.1.conf ? The include for the 
preferred-versions.conf is in the angstrom.conf at top and after the 
include PREDERRE_VERSION_linux... is set with the default value of the conf.
> And your problem seems to be a glibc problem.
> Which version gets installed if you make glibc-native?
>   
Glibc or glib? When I type "bitbake glibc-native" or "bitbake 
glib-native" I get the error: ERROR: Nothing PROVIDES 'xxxx'

In my preferred-versions.conf stands:
PREFERRED_VERSION_glib-2.0     = "2.20.0"
PREFERRED_VERSION_glib-2.0-native = "2.18.0"

Regards, Joern




