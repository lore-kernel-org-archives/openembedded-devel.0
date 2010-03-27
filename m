Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1NvT1g-0003jL-UL
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Mar 2010 11:13:57 +0100
Received: from [10.210.21.213] (tmo-101-117.customers.d1-online.com
	[80.187.101.117])
	by phalanx.drlauer-research.com (Postfix) with ESMTP id 4353B58438E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Mar 2010 11:12:10 +0100 (CET)
Message-Id: <89AC32E3-DE99-4D32-9832-858160FA85CD@vanille-media.de>
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <20100326215731.GE18337@excalibur.local>
X-Mailer: iPhone Mail (7D11)
Mime-Version: 1.0 (iPhone Mail 7D11)
Date: Sat, 27 Mar 2010 11:11:09 +0100
References: <n> <1266857650-5557-1-git-send-email-michael.lippautz@gmail.com>
	<20100326215731.GE18337@excalibur.local>
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] python-setuptools: Version bump to 0.6c11
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
X-List-Received-Date: Sat, 27 Mar 2010 10:13:57 -0000
Content-Type: text/plain;
	charset=us-ascii;
	format=flowed;
	delsp=yes
Content-Transfer-Encoding: 7bit

Acked-by: Michael 'Mickey' Lauer <mlauer@vanille-media.de>

Cheers,

:M:

Am 26.03.2010 um 22:57 schrieb Stefan Schmidt  
<stefan@datenfreihafen.org>:

> Hello.
>
> Mickey, do you have a moment to review and comment on this python  
> related patch?
>
> regards
> Stefan Schmidt
>
> On Mon, 2010-02-22 at 17:54, Michael Lippautz wrote:
>> * Adds python module 'pkg_resources'.
>>
>> Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
>> ---
>> .../python-setuptools/fix-log-usage-0.6c11.patch   |   18 ++++++++++ 
>> ++++++
>> recipes/python/python-setuptools_0.6c11.bb         |   22 ++++++++++ 
>> ++++++++++
>> 2 files changed, 40 insertions(+), 0 deletions(-)
>> create mode 100644 recipes/python/python-setuptools/fix-log- 
>> usage-0.6c11.patch
>> create mode 100644 recipes/python/python-setuptools_0.6c11.bb
>>
>> diff --git a/recipes/python/python-setuptools/fix-log- 
>> usage-0.6c11.patch b/recipes/python/python-setuptools/fix-log- 
>> usage-0.6c11.patch
>> new file mode 100644
>> index 0000000..b860700
>> --- /dev/null
>> +++ b/recipes/python/python-setuptools/fix-log-usage-0.6c11.patch
>> @@ -0,0 +1,18 @@
>> +--- a/setuptools/command/sdist.py    2010-02-22 14:57:56.000000000  
>> +0100
>> ++++ b/setuptools/command/sdist.py    2010-02-22 14:57:31.000000000  
>> +0100
>> +@@ -1,6 +1,5 @@
>> + from distutils.command.sdist import sdist as _sdist
>> + from distutils.util import convert_path
>> +-from distutils import log
>> + from glob import glob
>> + import os, re, sys, pkg_resources
>> +
>> +@@ -94,7 +93,7 @@
>> +         try: svnver = int(data.splitlines()[0])
>> +         except: pass
>> +         if svnver<8:
>> +-            log.warn("unrecognized .svn/entries format in %s",  
>> dirname)
>> ++            print("unrecognized .svn/entries format in %s",  
>> dirname)
>> +             return
>> +         for record in map(str.splitlines, data.split('\n\x0c\n') 
>> [1:]):
>> +             if not record or len(record)>=6 and record[5] 
>> =="delete":
>> diff --git a/recipes/python/python-setuptools_0.6c11.bb b/recipes/ 
>> python/python-setuptools_0.6c11.bb
>> new file mode 100644
>> index 0000000..bccafa4
>> --- /dev/null
>> +++ b/recipes/python/python-setuptools_0.6c11.bb
>> @@ -0,0 +1,22 @@
>> +DESCRIPTION = "Download, build, install, upgrade, and uninstall  
>> Python packages"
>> +HOMEPAGE = "http://cheeseshop.python.org/pypi/setuptools"
>> +SECTION = "devel/python"
>> +PRIORITY = "optional"
>> +LICENSE = "MIT"
>> +DEPENDS_${PN}-native = "python-native"
>> +RDEPENDS_${PN} = "python-distutils python-compression"
>> +PR = "ml3"
>> +
>> +SRC_URI = "\
>> +  http://cheeseshop.python.org/packages/source/s/setuptools/${SRCNAME}-${PV}.tar.gz;name=setuptools 
>>  \
>> +  file://fix-log-usage-0.6c11.patch;patch=1 \
>> +"
>> +SRC_URI[setuptools.md5sum] = "7df2a529a074f613b509fb44feefe74e"
>> +SRC_URI[setuptools.sha256sum] =  
>> "630fea9b726320b73ee3ca6ff61732cb32675b0389be658080fe46383b87a1d3"
>> +
>> +SRCNAME = "setuptools"
>> +S = "${WORKDIR}/${SRCNAME}-${PV}"
>> +
>> +inherit distutils
>> +
>> +BBCLASSEXTEND = "native"
>> -- 
>> 1.6.4.4
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded- 
>> devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


