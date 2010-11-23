Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PKhLF-0001xZ-6T
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 02:06:42 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PKhK3-000229-Gp from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 17:05:27 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 22 Nov 2010 17:05:16 -0800
Received: from [172.30.80.10] ([172.30.80.10]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 22 Nov 2010 18:05:16 -0700
Message-ID: <4CEB1349.6080602@mentor.com>
Date: Mon, 22 Nov 2010 18:05:13 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101027 Lightning/1.0b1 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimt7_P96yJMtLVd5S8ZOgH-=6VgTny=CezhOJ7P@mail.gmail.com>
	<AANLkTikQLnSYpAF4YivEWQODjHpOdHowndLOkyh3LJAp@mail.gmail.com>
In-Reply-To: <AANLkTikQLnSYpAF4YivEWQODjHpOdHowndLOkyh3LJAp@mail.gmail.com>
X-OriginalArrivalTime: 23 Nov 2010 01:05:16.0486 (UTC)
	FILETIME=[7D80D660:01CB8AAA]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: automake-1.11 vs. host $perl_threads
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
X-List-Received-Date: Tue, 23 Nov 2010 01:06:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/22/2010 05:04 PM, Andrea Adami wrote:
> I found something in run.do_configure of automake-1.11
>
> do_configure() {
>          if false
>          then
>                  export
> ac_cv_path_PERL="${ac_cv_path_PERL=/oe/build/tmp/sysroots/i686-linux/usr/bin/perl}"
>          fi
>          autotools_do_configure
>
> }
>
> It comes from
>
>
> do_configure_prepend () {
>          if ${@['true', 'false'][bb.data.inherits_class('native', d)]}
>          then
>                  export ac_cv_path_PERL="${ac_cv_path_PERL=${bindir}/perl}"
>          fi
> }
>
> test fails...

Intentionally, yes.  There is no dependency on perl-native for 
autoconf/automake and instead on the fake "throwing our hands up" 
perl-runtime-native.

-- 
Tom Rini
Mentor Graphics Corporation


