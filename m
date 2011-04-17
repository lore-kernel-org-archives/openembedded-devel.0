Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QBYHU-0007tH-RB
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 22:09:17 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QBYFF-0006uB-Ud from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 13:06:57 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sun, 17 Apr 2011 13:03:51 -0700
Received: from [172.30.80.170] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Sun, 17 Apr 2011 13:06:56 -0700
Message-ID: <4DAB4856.7030603@mentor.com>
Date: Sun, 17 Apr 2011 13:06:46 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <20110414193436.GA26286@denix.org>
	<4DAA505E.4000305@mentor.com>	<ioe35g$lb4$1@dough.gmane.org>
	<4DAB2CEC.1030008@mentor.com>	<20110417182117.GB4068@denix.org>
	<iofd1t$oat$1@dough.gmane.org> <20110417190302.GD4068@denix.org>
In-Reply-To: <20110417190302.GD4068@denix.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 17 Apr 2011 20:03:51.0537 (UTC)
	FILETIME=[92581E10:01CBFD3A]
Subject: Re: [2011.03-maintenance] Pull request for TI matrix-gui, ipc and sgx/gles
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
X-List-Received-Date: Sun, 17 Apr 2011 20:09:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04/17/2011 12:03 PM, Denys Dmytriyenko wrote:
> On Sun, Apr 17, 2011 at 08:54:53PM +0200, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 17-04-11 20:21, Denys Dmytriyenko wrote:
>>> On Sun, Apr 17, 2011 at 11:09:48AM -0700, Tom Rini wrote:
>>>> On 04/17/2011 12:00 AM, Koen Kooi wrote:
>>>>> On 17-04-11 04:28, Tom Rini wrote:
>>>>>> On 04/14/2011 12:34 PM, Denys Dmytriyenko wrote:
>>>>>>> Tom,
>>>>>
>>>>>>> Please pull these 5 commits for TI related changes - matrix-gui rev bump,
>>>>>>> new ti-ipc version and sgx/gles fixes for ti816x.
>>>>>>> All are cherry picked from oe.dev
>>>>>
>>>>>
>>>>>>> Pull URL: git://arago-project.org/git/people/denix/openembedded.git
>>>>>>>   Branch: 2011.03-maintenance
>>>>>>>   Browse: http://arago-project.org/git/people/?p=denix/openembedded.git;a=shortlog;h=refs/heads/2011.03-maintenance
>>>>>
>>>>>>> Thanks,
>>>>>>>     Denys Dmytriyenko <denys@ti.com>
>>>>>
>>>>>> Applied, thanks.
>>>>>
>>>>> Tom, can you please unmerge it? The SGX commit is bogus, I have already
>>>>> asked Denys to revert it from .dev. I do not want crap like that in
>>>>> maintenance.
>>>>
>>>> All of the parts of the merge or just a specific one?
>>>
>>> Tom,
>>>
>>> Can we hold off with unmerging/reverting for now? I'm trying to understand the 
>>> damage level and see the best course of action... But the commit in question 
>>> is "ligles-omap3: Remove SGX Fixup for TI816x"
>>
>> Right, only the "ligles-omap3: Remove SGX Fixup for TI816x" needs to get
>> reverted.
>>
>>>
>>> Koen,
>>>
>>> I replied to your email. Please let me know if you still prefer the complete 
>>> revert or if it can be worked around, as it still works, while may not be 
>>> optimal, and doesn't break anything else. Thanks.
>>
>> As I said in my response to the patch:
>>
>> - ------
>> So, I'm back from travelling now and I'll have to NAK this patch:
>>
>> 1) it assumes netra will never have an sgx core update and makes it
>> diverge from the other platforms.
>>
>> 2) it adds a useless 2 second boot delay
>>
>> So the net result is a harder to maintain slower version of the scripts,
>> which is not acceptable.
>> - ------
>>
>> So I'd very much like to get this patch reverted both from .dev and
>> 2011.03-maintenance. Especially considering I'm the actual maintainer
>> for that recipe.
>>
>> For fun, try booting on omap3 and moving the SD to netra and see what
>> happens. This is what we do at the office and customers do as well.
> 
> Ok, I'll revert this specific patch from .dev
> 
> Tom,
> 
> Please go ahead and unmerge/revert it from the 2011.03-maintenance. Sorry for 
> the inconvenience.

Done.

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNq0hOAAoJEI4NMjfc3nJxyrgH/2f374sesrN0/9quWm6jE2M5
4VDq2xOFw5YtZzfiYq/KRMeCM1uHaAVVojHP88HMhzICmx37fPVWx5/AKQmwy+0S
I5859/ct4UcprpKtyqc2eUGiTJGWxcvR0L/FCST6hod0iMDC9Azz6/UFjJsXkpJB
I5IF098ej7nbCQxova9fGlfxU9Vi7xwyLWr8T0r5ygwUYaeXZLL898NpkzWWlGxZ
0utU5po0zQ0IDchRcm2QY4o9eQn8Y1Lh833CGkqTLmQGR5oLBpW/r1ZnqyE5ayTv
TL2fMR1yYVcjZ6lPSW+oESo6AAkUEtRSk+HkFTcU+vj+VU+hE/IJsRwJr9wOLS4=
=cDor
-----END PGP SIGNATURE-----


