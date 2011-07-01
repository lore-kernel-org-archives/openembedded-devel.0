Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QchIx-0001rG-Se
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jul 2011 19:15:00 +0200
Received: by pzk36 with SMTP id 36so825332pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jul 2011 10:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=+2z/d0S2fovZBXwGGvu/XuiV8kS6pW8Ithc1X9vLqAc=;
	b=k91r9tu0AcynVYPzFlbAAixjiuf+ZUSZC055YyBiOzGtmSkKp1hu8BP/SA2mZXG4Lt
	Jkne7oZbtIhyJeaBEdJqMt+jzS+lxvNBYYKPqXYnq1P92QAYlgRwTkhhlrrvNszniXUf
	0GKL/WAnL83HArmDoWBDgCOBUb+QpBaqIR9do=
Received: by 10.142.74.13 with SMTP id w13mr1463404wfa.60.1309540274329;
	Fri, 01 Jul 2011 10:11:14 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id d15sm2195026wfl.18.2011.07.01.10.11.12
	(version=SSLv3 cipher=OTHER); Fri, 01 Jul 2011 10:11:13 -0700 (PDT)
Message-ID: <4E0DFFB0.7080806@gmail.com>
Date: Fri, 01 Jul 2011 10:11:12 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1309498698-13369-1-git-send-email-raj.khem@gmail.com>	<1309513723.2633.32.camel@phil-desktop>	<BDFA7941-3D06-4F4E-8E0A-00F6B4D7E920@gmail.com>
	<1309530191.2633.63.camel@phil-desktop>
In-Reply-To: <1309530191.2633.63.camel@phil-desktop>
Subject: Re: [meta-oe][PATCH] systemd_git.bb: Alias mkostemp() to mkstemp() for uclibc targets
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
X-List-Received-Date: Fri, 01 Jul 2011 17:15:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/01/2011 07:23 AM, Phil Blundell wrote:
> On Fri, 2011-07-01 at 06:48 -0700, Khem Raj wrote:
>>
>> On Jul 1, 2011, at 2:48 AM, Phil Blundell<philb@gnu.org>  wrote:
>>
>>> On Thu, 2011-06-30 at 22:38 -0700, Khem Raj wrote:
>>>> ++#ifdef __UCLIBC__
>>>> ++/* uclibc does not implement mkostemp GNU extention */
>>>> ++#define mkostemp(x,y) mkstemp(x)
>>>> ++#endif
>>>
>>> Is that safe?  It would be nice to have some commentary in the patch
>>> explaining why the flags are not required for systemd to operate
>>> correctly.  If it genuinely doesn't need to be using mkostemp() then
>>> perhaps this change should just be made upstream for all libcs.
>>>
>> right
>> I have to test it eglibc systems
>
> I'm not sure that's quite the point.  What I was trying to say before
> was that, if systemd is going to the trouble of using mkostemp() rather
> than mkstemp() in the first place, one would normally assume that it is
> expecting that extra argument to be respected.  So it seems like there
> are two possibilities:
>
> a) the standardised semantics of mkstemp() are actually sufficient for
> systemd's requirements and there was no need for it to be using
> mkostemp() at all.  In this case it should just be patched (ideally
> upstream) to use mkstemp() unconditionally.

yes I was using a mobile device did not type too much but this is the 
case I am inclined to test.

>
> b) the specific semantics of uClibc's mkstemp() implementation are
> sufficient for systemd's needs, although the semantics guaranteed by the
> standards are not.  In this case your patch might be appropriate but
> there should be a comment explaining why it is safe and what exactly the
> uClibc behaviour is that it depends on.  This would still not be an
> ideal state of affairs since uClibc might change in the future, but it's
> probably acceptable; a better solution might be either to add mkostemp()
> into uClibc explicitly, or to patch systemd to obtain the semantics that
> it needs by some other route.

no if the flags are needed then uclibc's mkstemp wont work. We have to 
provide an implementation of mkostemp or alter the code in systemd so
it uses something else. But this is second choice. Since uclibc does not 
like the extentions to be implemented.

>
> I'm not familiar enough with either systemd or uClibc to know which of
> the above is true here.  Can you clarify?
>
> p.
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



