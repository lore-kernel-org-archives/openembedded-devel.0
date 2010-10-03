Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1P2Duc-0006VC-CC
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 Oct 2010 04:02:51 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1P2DuI-0001OV-Dy from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Oct 2010 19:02:30 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Sat, 2 Oct 2010 19:02:26 -0700
Received: from [172.30.80.12] ([172.30.80.12]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 2 Oct 2010 20:02:26 -0600
Message-ID: <4CA7E429.7060407@mentor.com>
Date: Sat, 02 Oct 2010 19:02:17 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CA719E0.7050409@freyther.de>
	<AANLkTi=e0PuBjz1o-FhmaE7Mh_+JOLOau7ZhC0G9WOBn@mail.gmail.com>
In-Reply-To: <AANLkTi=e0PuBjz1o-FhmaE7Mh_+JOLOau7ZhC0G9WOBn@mail.gmail.com>
X-OriginalArrivalTime: 03 Oct 2010 02:02:26.0219 (UTC)
	FILETIME=[06B74FB0:01CB629F]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RPATH in many modules
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
X-List-Received-Date: Sun, 03 Oct 2010 02:02:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> On Sat, Oct 2, 2010 at 4:39 AM, Holger Freyther <holger+oe@freyther.de> wrote:
>> Hi all,
>>
>> today I wanted to make the generated toolchain free of RPATH and I was a bit
>> surprised to see that even the target libraries contain the rpath and that it
>> is not caught by insane.bbclass.
>>
>> I have added a more strict check to insane.bbclass to uncover the issue and I
>> am fighting neon and its manual libtool usage right now... it might be just
>> easier to use chrpath to fix the resulting libraries.
>>
>> any opinion?
> 
> I think we should try to get the rpaths right without chrpath. so your
> insane patch
> seems ok. May be to avoid lot of packages failing this could be turned
> on as a warning
> and once we fix the packages failing this then we could turn it into error.

Initial link time $ORIGIN being correct is a lot more complex than being 
wrong and fixing it up.  I got it being correct for the non-autoconf 
case and then made autotools.bbclass also get it right initially and 
then patched gcc/gdb/binutils (which are the difficult ones that run 
configure again) but it's really much more work.  I'll try and RFC the 
patches on Monday, if I've still got the branch around.

-- 
Tom Rini
Mentor Graphics Corporation


