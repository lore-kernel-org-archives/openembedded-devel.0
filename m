Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Png44-00075J-5Z
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 00:36:44 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Png30-0001kv-KI from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 15:35:38 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 10 Feb 2011 15:35:37 -0800
Received: from [172.30.80.144] ([172.30.80.144]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 10 Feb 2011 16:35:37 -0700
Message-ID: <4D547643.2020600@mentor.com>
Date: Thu, 10 Feb 2011 16:35:31 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D544976.6010800@drewtech.com> <4D545173.8080904@mentor.com>
	<4D54734B.7060705@drewtech.com>
In-Reply-To: <4D54734B.7060705@drewtech.com>
X-OriginalArrivalTime: 10 Feb 2011 23:35:37.0529 (UTC)
	FILETIME=[38712290:01CBC97B]
Subject: Re: openembedded with a prebuilt external toolchain
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
X-List-Received-Date: Thu, 10 Feb 2011 23:36:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/10/2011 04:22 PM, Joey Oravec wrote:
> On 2/10/2011 3:58 PM, Tom Rini wrote:
>> We talked about this a little on IRC and I provided the example of how
>> to use the CodeSourcery recipes that exist today. The marvell
>> toolchain however will need it's own special love.
>
> Yes! Much appreciated!
>
>> Now what you'll want to do is make an external-toolchain-marvell.bb
>> and set TOOLCHAIN_BRAND to "marvell" and tweak TOOLCHAIN_VENDOR such
>> that we go from what OE normally says TARGET_SYS is to what your tools
>> actually say it is. Then it's a matter of tweaking the contents of
>> external-toolchain-marvell.bb to copy the right things out of the
>> marvell install and into where OE wants them. In this regard, the -csl
>> recipe may be more instructive than the -generic recipe as the
>> -generic recipe (along with external-toolchain.bb) are targeted at
>> toolchains exported by OE and thus require little mangling to work.
>
> Both the -csl.bb and -generic.bb copy a bunch of stuff to STAGING_DIR in
> do_stage(). Of course in the long-run I need for the recipe to copy C
> libraries, but for now I should be able to leave the body blank. At
> least it'll use my compiler and run to completion. Right?

Well, as you saw, it fails in some cases.  This is because, yeah, we're 
telling the toolchain stuff lives ...here now, and it doesn't.

> That's what I did and it seems to be ok. The "bitbake nano" example
> failed, looks like it wasn't linking ncurses. Another attempt with
> "bitbake busybox" worked and I saw some packages in the output folder.
> Looks good so far!

busybox, being self contained is more likely to be OK.

-- 
Tom Rini
Mentor Graphics Corporation


