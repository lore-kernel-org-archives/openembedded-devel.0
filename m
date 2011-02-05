Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Plk5G-0007wC-0N
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Feb 2011 16:29:58 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Plk4H-00037A-QH from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Feb 2011 07:28:57 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sat, 5 Feb 2011 07:28:56 -0800
Received: from [172.30.80.88] ([172.30.80.88]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 5 Feb 2011 08:28:56 -0700
Message-ID: <4D4D6CB1.9050008@mentor.com>
Date: Sat, 05 Feb 2011 08:28:49 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=QkexH5odXt9-6a9SFe=hhyv=tsiBXOhHt-u9p@mail.gmail.com>
In-Reply-To: <AANLkTi=QkexH5odXt9-6a9SFe=hhyv=tsiBXOhHt-u9p@mail.gmail.com>
X-OriginalArrivalTime: 05 Feb 2011 15:28:56.0741 (UTC)
	FILETIME=[6759BD50:01CBC549]
Subject: Re: testing branch 2011-02-03
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
X-List-Received-Date: Sat, 05 Feb 2011 15:29:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/04/2011 06:08 AM, Cliff Brake wrote:
> master has been merged to testing-next and is ready for clean builds.
>
> I realize I've been tardy in getting the testing-next going, so I'm
> going to create a cron job now that does that weekly.
>
> Last week's testing results:
>
> http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=tested_2011-01-28
>
> For more information on OE testing, see:
>
> http://www.openembedded.org/index.php/Testing

Without be21179c5321bd0afb9221f020ac12ad75c86a3b all of mine (would 
have) failed so I wont be reporting results on the table this week but I 
am kicking things off on current top of tree.  I expect:
- angstrom-2008.1 + qt4* to fail (reported earlier this week)
- qt4* + arm + minimal-uclibc to fail (one of those __cxa_atexit things, 
will report better)
- qt4* + mips64 + minimal-uclibc to fail (don't have the log handy, will 
report).

-- 
Tom Rini
Mentor Graphics Corporation


