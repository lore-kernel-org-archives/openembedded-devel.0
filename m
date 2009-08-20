Received: from [64.18.0.20] (helo=exprod5og110.obsmtp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@gefanuc.com>) id 1Me6hx-0006Sn-NE
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 14:25:34 +0200
Received: from source ([4.79.213.129]) (using TLSv1) by
	exprod5ob110.postini.com ([64.18.4.12]) with SMTP
	ID DSNKSo08r6Jz7pkTlTFIP17IpD7+W8J32tgM@postini.com;
	Thu, 20 Aug 2009 05:08:17 PDT
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Alpmlip08.e2k.ad.ge.com with ESMTP; 20 Aug 2009 08:08:15 -0400
Received: from es-j7s4d2j.amer.consind.ge.com (HELO [3.138.54.92])
	([3.138.54.92])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 20 Aug 2009 08:08:15 -0400
Message-ID: <4A8D3CEE.6050601@gefanuc.com>
Date: Thu, 20 Aug 2009 13:09:18 +0100
From: Martyn Welch <martyn.welch@gefanuc.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090608)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1250738680-20274-1-git-send-email-clarson@mvista.com>	<1250738680-20274-5-git-send-email-clarson@mvista.com>	<1250738680-20274-6-git-send-email-clarson@mvista.com>	<200908200749.07494.holger+oe@freyther.de>	<6ec4247d0908200032s44cd3230s9b3e0d06777116c3@mail.gmail.com>
	<20090820074357.GC459@denix.org>
In-Reply-To: <20090820074357.GC459@denix.org>
Subject: Re: [PATCH] bitbake.conf: Kill CCACHE. Implicit, automatic	use of things which can fail is bad.
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
X-List-Received-Date: Thu, 20 Aug 2009 12:25:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Denys Dmytriyenko wrote:
> On Thu, Aug 20, 2009 at 05:02:31PM +0930, Graham Gower wrote:
>   
>> 2009/8/20 Holger Hans Peter Freyther <holger+oe@freyther.de>:
>>     
>>> On Thursday 20 August 2009 05:24:37 Chris Larson wrote:
>>>       
>>>> To re-enable, set CCACHE = "ccache ".
>>>>
>>>> Signed-off-by: Chris Larson <clarson@mvista.com>
>>>>         
>>> Could you elaborate on the need of that? Which platforms do you deal with that
>>> break due the usage of ccache?
>>>       
>> I run Slackware 12.2, whose build of ccache does not seem to be
>> accepted. I don't recall the exact mechanism of failure, but
>> shasum-native fails before getting to any other pacakges. Currently I
>> have to move the ccache binary out of my $PATH or OE tries to use it.
>>     
>
> Same exact problem has been reported many times with RedHat-based distros as 
> well - it just fails to build shasum-native (the very first package) w/o any 
> meaningful messages...
>   
I have also suffered random failures that disappear once ccache has been 
uninstalled on at least Ubuntu 8.10.

Martyn

-- 
Martyn Welch MEng MPhil MIET (Principal Software Engineer)   T:+44(0)1327322748
GE Fanuc Intelligent Platforms Ltd,        |Registered in England and Wales
Tove Valley Business Park, Towcester,      |(3828642) at 100 Barbirolli Square,
Northants, NN12 6PF, UK T:+44(0)1327359444 |Manchester,M2 3AB  VAT:GB 927559189


