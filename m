Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TbTMF-0007QZ-VK
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 10:46:08 +0100
Received: from localhost ([127.0.0.1]:37655 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TbT8b-0001sD-Fo
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 09:32:01 +0000
Received: from [195.171.99.130] (port=19833 helo=[192.168.0.47])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TbT8b-0001s2-BY
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 09:32:01 +0000
Message-ID: <50ADF189.5010201@communistcode.co.uk>
Date: Thu, 22 Nov 2012 09:34:01 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1353518890.git.paul.eggleton@linux.intel.com>
	<1eef087d214b6c6ff27b60dff5511acfc2a3925e.1353518890.git.paul.eggleton@linux.intel.com>
	<20121121173754.GN12637@jama.jama.net> <2060735.4IBGo344JD@helios>
In-Reply-To: <2060735.4IBGo344JD@helios>
Subject: Re: [meta-networking][PATCH 2/2] ntp: make servers configurable and default to none configured
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
X-List-Received-Date: Thu, 22 Nov 2012 09:46:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 21/11/12 17:51, Paul Eggleton wrote:
> On Wednesday 21 November 2012 18:37:54 Martin Jansa wrote:
>> On Wed, Nov 21, 2012 at 05:29:30PM +0000, Paul Eggleton wrote:
>>> People can't blindly use pool.ntp.org, especially if they are building
>>> for a product or something that could be used in a product, so at least
>>> try to get people to do the right thing and not use pool.ntp.org by
>>> default.
>>>
>>> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>>> ---
>>>
>>>   meta-networking/recipes-support/ntp/ntp.inc |   12 +++++++++++-
>>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta-networking/recipes-support/ntp/ntp.inc
>>> b/meta-networking/recipes-support/ntp/ntp.inc index d20bc2e..b54608a
>>> 100644
>>> --- a/meta-networking/recipes-support/ntp/ntp.inc
>>> +++ b/meta-networking/recipes-support/ntp/ntp.inc
>>> @@ -33,12 +33,22 @@ PACKAGECONFIG[openssl] =
>>> "--with-openssl-libdir=${STAGING_LIBDIR} \>
>>>                             --without-openssl --without-crypto, \
>>>                             openssl"
>>>
>>> +# This should be set in the distro configuration
>>> +NTP_SERVERS ??= ""
>>> +
>>> +python __anonymous() {
>>> +    if not d.getVar("NTP_SERVERS", True):
>>> +        raise bb.parse.SkipPackage("Please set NTP_SERVERS in order to
>>> build ntp - see http://www.openembedded.org/wiki/NTP for details") +}
>> Cannot we move this logic to target?
>>
>> I mean ntpdate can be usefull for end-user even without this cron job.
>>
>> We can add something like
>> /etc/default/ntp
>> NTP_SERVERS=""
>>
>> And change cron job as well as that systemd .service file we talked
>> about before to show
>> "Please set correct NPT_SERVERS in /etc/default/ntp"
>> instead of failing (in systemd .service file case) or not being able to
>> build ntpdate package unless you have distro with own ntp pool.
>>
>> On other hand distro with own ntp pool can provide own value in
>> /etc/default/ntp with .bbappend, so their users won't ever see this on
>> target.
> Sure, this is an alternative approach. It will work for everything except
> ntp.conf, although for that we can just clear out that value in the file and
> get the distro to set their own custom version if they're going to use ntpd.
>
> Cheers,
> Paul
>

This would be beneficial for me too as we intend to ship ntpd but it 
will be mainly for use with internal servers so I will not want or need 
a default server set.

Cheers,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



