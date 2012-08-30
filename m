Received: from aek116.rev.netart.pl ([77.55.114.116])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mateusz.nowaczyk@wisene.pl>) id 1T791Y-0005e4-CU
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Aug 2012 19:59:24 +0200
Received: from [192.168.0.4] (unknown [79.191.173.144])
	by wisene.nazwa.pl (Postfix) with ESMTP id 96F77294886A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Aug 2012 19:47:10 +0200 (CEST)
Message-ID: <503FA71E.8000003@wisene.pl>
Date: Thu, 30 Aug 2012 19:47:10 +0200
From: Mateusz Nowaczyk <mateusz.nowaczyk@wisene.pl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <503E506E.2010002@wisene.pl> <k1n6oh$8ve$1@ger.gmane.org>
	<503F773F.6020409@wisene.pl> <1354802.G46xZeSRAF@helios>
	<503F7C92.9000701@wisene.pl>
In-Reply-To: <503F7C92.9000701@wisene.pl>
Subject: Re: Newbie question: Angstrom on at91sam9g20
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
X-List-Received-Date: Thu, 30 Aug 2012 17:59:24 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Now I get the following error:


ERROR: Function failed: Fetcher failure for URL: 'file://defconfig'. 
Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: 
/home/mn/angstrom/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/at91sam9g20ek-angstrom-linux-gnueabi/linux-3.0.1-r0/temp/log.do_fetch.30370
Log data follows:
| DEBUG: Trying PREMIRRORS
| DEBUG: For url ['file', '', 'defconfig', '', '', {}] comparing ['cvs', 
'.*', '/.*', '', '', {}] to ['http', 
'sources.angstrom-distribution.org', '/', '', '', {}]
| DEBUG: For url ['file', '', 'defconfig', '', '', {}] comparing ['svn', 
'.*', '/.*', '', '', {}] to ['http', 
'sources.angstrom-distribution.org', '/', '', '', {}]
| DEBUG: For url ['file', '', 'defconfig', '', '', {}] comparing ['git', 
'.*', '/.*', '', '', {}] to ['http', 
'sources.angstrom-distribution.org', '/', '', '', {}]
| DEBUG: For url ['file', '', 'defconfig', '', '', {}] comparing ['hg', 
'.*', '/.*', '', '', {}] to ['http', 
'sources.angstrom-distribution.org', '/', '', '', {}]
| DEBUG: For url ['file', '', 'defconfig', '', '', {}] comparing ['bzr', 
'.*', '/.*', '', '', {}] to ['http', 
'sources.angstrom-distribution.org', '/', '', '', {}]
| DEBUG: For url ['file', '', 'defconfig', '', '', {}] comparing ['osc', 
'.*', '/.*', '', '', {}] to ['http', 
'sources.angstrom-distribution.org', '/', '', '', {}]
| DEBUG: For url ['file', '', 'defconfig', '', '', {}] comparing ['p4', 
'.*', '/.*', '', '', {}] to ['http', 
'sources.angstrom-distribution.org', '/', '', '', {}]
| DEBUG: For url ['file', '', 'defconfig', '', '', {}] comparing ['svk', 
'.*', '/.*', '', '', {}] to ['http', 
'sources.angstrom-distribution.org', '/', '', '', {}]
| DEBUG: Trying Upstream
| ERROR: Function failed: Fetcher failure for URL: 'file://defconfig'. 
Unable to fetch URL from any source.
NOTE: package linux-3.0.1-r0: task do_fetch: Failed
ERROR: Task 607 
(/home/mn/angstrom/setup-scripts/sources/meta-handheld/recipes-kernel/linux/linux_3.0.1.bb, 
do_fetch) failed with exit code '1'

Any ideas? And why does it try to build the 3.0.1 kernel instead of 2.6.30?


