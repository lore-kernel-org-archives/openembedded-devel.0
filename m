Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PVQzh-0007TX-TG for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 16:52:49 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PVQzb-0002cE-Nx for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 16:52:43 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 16:52:43 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 16:52:43 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 22 Dec 2010 16:52:33 +0100
Message-ID: <iet6s1$h1r$1@dough.gmane.org>
References: <1293016481-703-1-git-send-email-koen@openembedded.org>	<AANLkTinhDm2O+71-+ec_LX1DOQ9bO6gpiwNOE3fauswA@mail.gmail.com>	<iesrb1$mue$1@dough.gmane.org>	<AANLkTinurP-H+XiaeLgaUe6Uq6oN5xYd1H0QnqiyhEW_@mail.gmail.com>
	<4D121D05.4090806@mentor.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <4D121D05.4090806@mentor.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] sanity: release 2010.12 is out, so bump minimum bitbake to 1.10.0 per TSC decision
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
X-List-Received-Date: Wed, 22 Dec 2010 15:52:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 22-12-10 16:45, Tom Rini wrote:
> On 12/22/2010 05:48 AM, Frans Meulenbroeks wrote:
>> 2010/12/22 Koen Kooi<k.kooi@student.utwente.nl>:
>>> -----BEGIN PGP SIGNED MESSAGE-----
>>> Hash: SHA1
>>>
>>> On 22-12-10 12:55, Frans Meulenbroeks wrote:
>>>> 2010/12/22 Koen Kooi<koen.kooi@gmail.com>:
>>>>> Signed-off-by: Koen Kooi<koen@openembedded.org>
>>>>> ---
>>>>>   conf/sanity.conf |    2 +-
>>>>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>>>>
>>>>> diff --git a/conf/sanity.conf b/conf/sanity.conf
>>>>> index 0f53cb2..1c83c14 100644
>>>>> --- a/conf/sanity.conf
>>>>> +++ b/conf/sanity.conf
>>>>> @@ -3,7 +3,7 @@
>>>>>   # See sanity.bbclass
>>>>>   #
>>>>>   # Expert users can confirm their sanity with "touch
>>>>> conf/sanity.conf"
>>>>> -BB_MIN_VERSION = "1.8.18"
>>>>> +BB_MIN_VERSION = "1.10.0"
>>>>>
>>>>>   SANITY_ABIFILE = "${TMPDIR}/abi_version"
>>>>>   SANITY_PRFILE = "${TMPDIR}/distro_pr"
>>>>> -- 
>>>>> 1.7.0
>>>>>
>>>>
>>>> As 1.10.1 is already out for quite a while and (if I recall correctly)
>>>> 1.10.0 had some issues that are resolved in 1.10.1 wouldn't it be
>>>> better to set 1.10.1 as minimal version?
>>>> Otherwise no objections.
>>>
>>> The head of the 1.10 branch says it's 1.10.0, not 1.10.1 :(
>>
>> Indeed :-(
>> Guess this should be changed then
>>
>> There is http://developer.berlios.de/projects/bitbake/ which lists 1.10.1
>> and the git also has a tag for 1.10.1 and a donwload for it.
>>
>> Btw I assume we also need to update the wiki
> 
> I think what happened was Chris forgot to bump the version number when
> tagging / etc.  As he plans to do a 1.10.2 soon, maybe we can wait for
> that?  And maybe we can get that done this week?

I really want the 1.10 in sooner than later, since at OEDEM we agreed to
do it before the release, but the TSC disagreed for undisclosed reasons.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNEh7BMkyGM64RGpERAq2CAKCU9ozyZchRMe2PCzF6gA2mM3hEXQCfYubv
eOxFfH6IOkk2jGe6QbMaT8I=
=DVUe
-----END PGP SIGNATURE-----



