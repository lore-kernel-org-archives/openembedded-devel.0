Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1Tswxv-0003Di-Uw
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jan 2013 15:49:25 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 66BE6F8122A; Wed,  9 Jan 2013 07:34:05 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 3A542F811FD;
	Wed,  9 Jan 2013 07:34:04 -0700 (MST)
Message-ID: <50ED7FDD.7060003@mlbassoc.com>
Date: Wed, 09 Jan 2013 07:34:05 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1355519149-23005-1-git-send-email-gary@mlbassoc.com>
	<20121216180022.GC3448@jama>
	<20130109142121.GN3722@jama.palm1.palmone.com>
In-Reply-To: <20130109142121.GN3722@jama.palm1.palmone.com>
Subject: Re: [meta-oe][PATCH] rng-tools: Fixes for latest OE layouts
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
X-List-Received-Date: Wed, 09 Jan 2013 14:49:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-01-09 07:21, Martin Jansa wrote:
> On Sun, Dec 16, 2012 at 07:00:22PM +0100, Martin Jansa wrote:
>> On Fri, Dec 14, 2012 at 02:05:48PM -0700, Gary Thomas wrote:
>>> The current recipe has a few installation errors:
>>>    * The manipulation of configurable paths drops a '/'
>>>    * The init script defaults are placed in the wrong file
>>>    * Finer control over init script start/stop
>>>    * The default device is non-standard
>>>
>>> This patch fixes these little nits and makes the package usable again.
>>>
>>> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
>>> ---
>>>   meta-oe/recipes-support/rng-tools/files/default  |    3 ++-
>>>   meta-oe/recipes-support/rng-tools/rng-tools_2.bb |    5 +++--
>>>   2 files changed, 5 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/meta-oe/recipes-support/rng-tools/files/default b/meta-oe/recipes-support/rng-tools/files/default
>>> index ab7cd93..7aede9b 100644
>>> --- a/meta-oe/recipes-support/rng-tools/files/default
>>> +++ b/meta-oe/recipes-support/rng-tools/files/default
>>> @@ -1,2 +1,3 @@
>>>   # Specify rng device
>>> -RNG_DEVICE=/dev/hwrng
>>> +#RNG_DEVICE=/dev/hwrng
>>> +RNG_DEVICE=/dev/urandom
>>> diff --git a/meta-oe/recipes-support/rng-tools/rng-tools_2.bb b/meta-oe/recipes-support/rng-tools/rng-tools_2.bb
>>> index ef753cf..b94854a 100644
>>> --- a/meta-oe/recipes-support/rng-tools/rng-tools_2.bb
>>> +++ b/meta-oe/recipes-support/rng-tools/rng-tools_2.bb
>>> @@ -15,12 +15,13 @@ inherit autotools update-rc.d
>>>   do_install_append() {
>>>           install -d "${D}${sysconfdir}/init.d"
>>>           install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rng-tools
>>> -        sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir},' \
>>> +        sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir}/,' \
>>>               ${D}${sysconfdir}/init.d/rng-tools
>>>
>>>           install -d "${D}${sysconfdir}/default"
>>> -        install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/default
>>> +        install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/rng-tools
>>>   }
>>>
>>>   INITSCRIPT_NAME = "rng-tools"
>>>   INITSCRIPT_PARAMS = "defaults"
>>> +INITSCRIPT_PARAMS = "start 30 S . stop 30 0 6 1 ."
>>
>> Why do you add 2nd INITSCRIPT_PARAMS ?
>
> ping :)

Sorry, must have missed your query (holidays).

That second line should really replace the first for finer grain
control over the start/stop choice.  I can fix this and resend the patch.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


