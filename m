Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L9S2h-0008G4-Vn
	for openembedded-devel@openembedded.org; Sun, 07 Dec 2008 23:24:00 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1L9Ryt-0004cL-F4
	for openembedded-devel@openembedded.org; Sun, 07 Dec 2008 22:20:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 07 Dec 2008 22:20:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 07 Dec 2008 22:20:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 07 Dec 2008 23:16:37 +0100
Message-ID: <ghhi04$mmo$2@ger.gmane.org>
References: <1223383906-4111-1-git-send-email-eha@doredevelopment.dk>	<d2b9ea600810211323y1dd1fc11i585f26f044696de9@mail.gmail.com>	<20081202174141.GB16628@smtp.west.cox.net>	<1228250322.5456.70.camel@dax.rpnet.com>	<20081202212155.GG16628@smtp.west.cox.net>	<20081206214525.GJ16628@smtp.west.cox.net>	<20081207193340.GC15204@smtp.west.cox.net>	<ghha1f$ugd$1@ger.gmane.org>	<20081207201118.GD15204@smtp.west.cox.net>	<ghhe2j$b5p$1@ger.gmane.org>
	<19c1b8a90812071340o57e4542cv8452e324445c64e@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081130 Shredder/3.0b1pre
In-Reply-To: <19c1b8a90812071340o57e4542cv8452e324445c64e@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Canadian SDK support
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
X-List-Received-Date: Sun, 07 Dec 2008 22:24:00 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07-12-08 22:40, Khem Raj wrote:
> On Sun, Dec 7, 2008 at 1:09 PM, Koen Kooi<k.kooi@student.utwente.nl>  wrote:
>> On 07-12-08 21:11, Tom Rini wrote:
>>> On Sun, Dec 07, 2008 at 09:00:47PM +0100, Koen Kooi wrote:
>>>> On 07-12-08 20:33, Tom Rini wrote:
>>>>
>>>>> As an aside, gcc-cross-sdk on arm(v6 only?) is blowing up in fortran,
>>>>> but I've got a git bisect narrowing that down now (30 revs left).
>>>> gcc-cross-sdk picks the wrong patch (from files/gfortran.patch) instead
>>>> of the correct one from gcc-4.2.4/gfortran.patch. gcc-cross *does* pick
>>>> the right patch.
>>> For gcc-4.2.4.inc would it be OK to rename gfortran.patch to
>>> gfortran-4.2.4.patch and fix this problem?
>> If 4.2.4 is the only using it (which I doubt), that would be the way to go.
>> IIRC all gcc 4.2 variants (so also the dreaded csl 2007qX ones) need the one
>> with '64', the 4.3.x ones (including csl 2008qX) need the one with '65'.
>
> Why do we need these two. 65 one sounds worng to me from first look.

It is wrong in a way that it check for a 128bit cpu, but I can confirm 
that running compiled fortran programs works very well with it. Using 
the 'correct' version with '64' would cause a regression, which is not 
what we want.

regards,

Koen

regards,

Koen



