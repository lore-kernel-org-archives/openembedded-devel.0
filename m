Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OsVSg-00052O-RV for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 08:45:53 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OsVS3-0007qp-Oc for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 08:45:11 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 08:45:11 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 08:45:11 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 06 Sep 2010 08:44:59 +0200
Message-ID: <i622lb$jp9$1@dough.gmane.org>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>	<1283027073-12308-12-git-send-email-raj.khem@gmail.com>	<i5das3$v2$3@dough.gmane.org>	<AANLkTikE=wDnQPu5txDEL4QdOjfrD3YK1DOphAqvZZ4h@mail.gmail.com>	<AANLkTin3L-dJY_KRx5BjdSPCfU1nr-iTYvkzuE5KNE3B@mail.gmail.com>	<i5nnsf$1sq$2@dough.gmane.org>
	<AANLkTintRQq9RKAYhr48K7oyJFhG9WzX2k4e5KZbXr9m@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <AANLkTintRQq9RKAYhr48K7oyJFhG9WzX2k4e5KZbXr9m@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 11/23] udev-compat141_141.bb: if machine is not one of spitz akita c70x poodle then it is not needed to RDEPEND'ed on udev-compat-wrapper
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
X-List-Received-Date: Mon, 06 Sep 2010 06:45:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Looks good to me, but I haven't tested it.

On 03-09-10 09:01, Khem Raj wrote:
> On Thu, Sep 2, 2010 at 1:39 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 01-09-10 23:40, Khem Raj wrote:
>>> On Sun, Aug 29, 2010 at 11:15 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> On Sun, Aug 29, 2010 at 2:56 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>>>>> -----BEGIN PGP SIGNED MESSAGE-----
>>>>> Hash: SHA1
>>>>>
>>>>> On 28-08-10 22:24, Khem Raj wrote:
>>>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>>>> ---
>>>>>>  recipes/udev/udev-compat141_141.bb |    6 +++++-
>>>>>>  1 files changed, 5 insertions(+), 1 deletions(-)
>>>>>>
>>>>>> diff --git a/recipes/udev/udev-compat141_141.bb b/recipes/udev/udev-compat141_141.bb
>>>>>> index 2411fc6..c39d4cb 100644
>>>>>> --- a/recipes/udev/udev-compat141_141.bb
>>>>>> +++ b/recipes/udev/udev-compat141_141.bb
>>>>>> @@ -15,7 +15,11 @@ PACKAGES = "${PN} ${PN}-dbg"
>>>>>>  PROVIDES = "udev-compat"
>>>>>>
>>>>>>  # Need udev with udev-compat-wrapper support and nothing else.
>>>>>> -RDEPENDS_${PN} = "udev-compat-wrapper"
>>>>>> +RDEPENDS_${PN}_spitz = "udev-compat-wrapper"
>>>>>> +RDEPENDS_${PN}_akita = "udev-compat-wrapper"
>>>>>> +RDEPENDS_${PN}_c7x0 = "udev-compat-wrapper"
>>>>>> +RDEPENDS_${PN}_poodle = "udev-compat-wrapper"
>>>>>> +
>>>>>>  # Remove hotplug RPROVIDES
>>>>>>  RPROVIDES_${PN} = "udev-compat"
>>>>>
>>>>> NAK, this is a generic wrapper to use recent udev on older kernels, not
>>>>> specific to zaurus.
>>>>
>>>> OK then why is this wrapper only rprovided for specific machines and
>>>> not rprovided always for every machine ?
>>>> It seems its does not do what you are saying IIUC.
>>>
>>> ping ?
>>
>> The zaurus people screwed up when adding this, it is still intended as a
>> generic stopgap measure for device stuck on <2.6.27 kernels.
> 
> alright got it. what do you think of attached patch ?
> 
> Thanks
> 
> -Khem
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMhI3qMkyGM64RGpERAghfAJ9/Rj0V9//ayw0lVjNYe1ZPiar0qACgoecF
ELHTDHU7/kF8YQchnDHm51E=
=v6Ah
-----END PGP SIGNATURE-----



