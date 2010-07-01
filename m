Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OUSWJ-0004TH-1m
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 00:46:13 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OUSRg-00061q-Tw from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 15:41:24 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 1 Jul 2010 15:41:24 -0700
Received: from [172.30.80.201] ([172.30.80.201]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 1 Jul 2010 16:41:23 -0600
Message-ID: <4C2D198E.6010603@mentor.com>
Date: Thu, 01 Jul 2010 15:41:18 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1278021938.8213.7.camel@utx.utx.cz>
In-Reply-To: <1278021938.8213.7.camel@utx.utx.cz>
X-OriginalArrivalTime: 01 Jul 2010 22:41:23.0837 (UTC)
	FILETIME=[888F22D0:01CB196E]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: invalid removal of rpath from native binaries during installation or staging
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
X-List-Received-Date: Thu, 01 Jul 2010 22:46:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Stanislav Brabec wrote:
> Hallo.
> 
> Packages like perl-native and gettext-native compile correctly, but then
> stage broken binaries, that miss rpath from binaries. Such binaries work
> only if the library of the same name exists in the host system, which is
> not correct.
> 
> Example:
> ERROR: log data follows (/OE/build/tmp/work/x86_64-linux/libxml-parser-perl-native-2.36-r2/temp/log.do_configure.27765)
> | perl: error while loading shared libraries: libperl.so: cannot open shared object file: No such file or directory
> 
> Now try:
> ben:/OE/build> /OE/build/tmp/sysroots/x86_64-linux/usr/bin/perl
> /OE/build/tmp/sysroots/x86_64-linux/usr/bin/perl: error while loading shared libraries: libperl.so: cannot open shared object file: No such file or directory
> ben:/OE/build> /OE/build/tmp/work/x86_64-linux/perl-native-5.8.8-r19/perl-5.8.8/perl
> (this instance works)
> 
> Work around: simply copy binaries from work directly to sysroots and compilation continues correctly.

Can you use readelf -d on your perl?  The whole point of the relative 
path calculation that relocatable.bbclass does is to fix the hard cases 
like perl.   Thanks!

-- 
Tom Rini
Mentor Graphics Corporation


