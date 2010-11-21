Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PKAWz-0002xa-Lm
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Nov 2010 15:04:38 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PKAVq-0003ON-Pu from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Nov 2010 06:03:26 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sun, 21 Nov 2010 06:03:26 -0800
Received: from [172.30.80.10] ([172.30.80.10]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 21 Nov 2010 07:03:25 -0700
Message-ID: <4CE926A8.3000402@mentor.com>
Date: Sun, 21 Nov 2010 07:03:20 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101027 Lightning/1.0b1 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1PKA9U-00040x-SY@melo.openembedded.org>
In-Reply-To: <E1PKA9U-00040x-SY@melo.openembedded.org>
X-OriginalArrivalTime: 21 Nov 2010 14:03:25.0872 (UTC)
	FILETIME=[DDB84300:01CB8984]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Frans Meulenbroeks : flex: added perl to dependencies
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
X-List-Received-Date: Sun, 21 Nov 2010 14:04:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/2010 06:40 AM, git version control wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: c3b5b68541320ed0104d8654a0793251ed0187b9
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=c3b5b68541320ed0104d8654a0793251ed0187b9
>
> Author: Frans Meulenbroeks<fransmeulenbroeks@gmail.com>
> Date:   Sun Nov 21 10:15:08 2010 +0100
>
> flex: added perl to dependencies
>
> Without it (rebuilding from packaged staging) I got:
>
> | /home/frans/oe/tmp_minimal/work/i686-linux/flex-native-2.5.35-r5.1/temp/run.do_configure.12240:
> /home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/bin/automake:
> /home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/bin/perl: bad interpreter: No such file or directory

This starts to open up the very large can of worms of stuff that uses 
host perl (autotools, etc) and then what happens once perl-native has 
been built and installed.  I've mentioned this before in
http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg08445.html

-- 
Tom Rini
Mentor Graphics Corporation


