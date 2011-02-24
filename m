Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PsWMq-0002TT-2a for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 09:16:08 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PsWLZ-0007t6-Om for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 09:14:49 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Feb 2011 09:14:49 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Feb 2011 09:14:49 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 24 Feb 2011 09:14:37 +0100
Message-ID: <ik541d$nb4$1@dough.gmane.org>
References: <1297199824-3712-1-git-send-email-morphis@gravedo.de>	<4D51B81D.8000800@mentor.com>	<AANLkTikbfyoZfnJq9k1fSkMVMkReNw0G8APuXjc_rTyY@mail.gmail.com>	<iium4d$gau$1@dough.gmane.org>
	<20110209193129.GA15397@nirvana>	<4D52EEE5.9030309@mentor.com>	<AANLkTin0nJfcj1wFiYcbXLyLa9tk_Dy8yn8Lp3=PGNHC@mail.gmail.com>	<4D53272F.1020400@mentor.com>
	<1298454891.3892.3.camel@mattotaupa>
	<20110224053346.GA15439@nirvana>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <20110224053346.GA15439@nirvana>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] evas: disable cpu neon support for palmpre machine
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
X-List-Received-Date: Thu, 24 Feb 2011 08:16:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 24-02-11 06:33, Simon Busch wrote:
> On 02/23/11 at 10:54am, Paul Menzel wrote:
>> Am Mittwoch, den 09.02.2011, 16:45 -0700 schrieb Tom Rini:
>>> On 02/09/2011 01:44 PM, Khem Raj wrote:
>>>> On Wed, Feb 9, 2011 at 11:45 AM, Tom Rini<tom_rini@mentor.com>  wrote:
>>>>> On 02/09/2011 12:31 PM, Simon Busch wrote:
>>>>>>
>>>>>> On 02/09/11 at 07:24pm, Koen Kooi wrote:
>>>>>>>
>>>>>>> -----BEGIN PGP SIGNED MESSAGE-----
>>>>>>> Hash: SHA1
>>>>>>
>>>>>>> On 09-02-11 19:16, Khem Raj wrote:
>>>>>>>>
>>>>>>>> On Tue, Feb 8, 2011 at 1:39 PM, Tom Rini<tom_rini@mentor.com>    wrote:
>>>>>>>>>
>>>>>>>>> On 02/08/2011 02:17 PM, Simon Busch wrote:
>>>>>>>>>>
>>>>>>>>>> Neon support in evas is currently broken for the palmpre machine. If
>>>>>>>>>> we
>>>>>>>>>> enable neon
>>>>>>>>>> support evas causes alignment trap errors and lets the device freeze
>>>>>>>>>> in
>>>>>>>>>> the end. This
>>>>>>>>>> should be reverted after the bug in evas code is found and fixed.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Simon Busch<morphis@gravedo.de>
>>>>>>>>>> ---
>>>>>>>>>>   recipes/efl1/evas.inc |    5 ++++-
>>>>>>>>>>   1 files changed, 4 insertions(+), 1 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/recipes/efl1/evas.inc b/recipes/efl1/evas.inc
>>>>>>>>>> index eb64d7a..ad30eba 100644
>>>>>>>>>> --- a/recipes/efl1/evas.inc
>>>>>>>>>> +++ b/recipes/efl1/evas.inc
>>>>>>>>>> @@ -7,7 +7,7 @@ DEPENDS_virtclass-native = "freetype-native
>>>>>>>>>> libxext-native
>>>>>>>>>> libpng-native jpeg-na
>>>>>>>>>>   inherit efl
>>>>>>>>>>
>>>>>>>>>>   BBCLASSEXTEND = "native"
>>>>>>>>>> -INC_PR = "r0"
>>>>>>>>>> +INC_PR = "r1"
>>>>>>>>>>   FILESPATHPKG =. "${BPN}-${PV}:${BPN}:"
>>>>>>>>>>
>>>>>>>>>>   python populate_packages_prepend () {
>>>>>>>>>> @@ -83,6 +83,9 @@ EVAS_CPU_TWEAKS = ""
>>>>>>>>>>   # Disabled for now, see
>>>>>>>>>>
>>>>>>>>>> http://thread.gmane.org/gmane.comp.window-managers.enlightenment.devel/25194
>>>>>>>>>>   #EVAS_CPU_TWEAKS_armv7a = "--enable-cpu-neon"
>>>>>>>>>>
>>>>>>>>>> +# Neon support for evas is broken on palmpre currently (causes the device
>>>>>>>>>> to freeze)
>>>>>>>>>> +EVAS_CPU_TWEAKS_palmpre = "--disable-cpu-neon"
>>>>>>>>>> +
>>>>>>>>>>   # common options
>>>>>>>>>>   EVAS_OECONF = " \
>>>>>>>>>>                   --x-includes=${STAGING_INCDIR}/X11 \
>>>>>>>>>
>>>>>>>>> Shouldn't this be changing the armv7a EVAS_CPU_TWEAKS that's above
>>>>>>>>> yours to
>>>>>>>>> be uncommented and as a --disable?
>>>>>>>>
>>>>>>>> that would disable neon for all armv7a machines probably not what is
>>>>>>>> needed here.
>>>>>>
>>>>>>> Actually, that was how I did it :) The NEON code that was added doesn't
>>>>>>> build with gcc 4.3.x and binutils 2.18.x, so I disabled it by not
>>>>>>> enabling it. If it builds and works with gcc 4.3.x nowadays we should
>>>>>>> enable it and find out why the palmpre breaks.
>>>>>>
>>>>>> Evas builds fine these days with neon support enabled but it enables it by
>>>>>> default. I really need to find the cause of the breakage on the palmpre
>>>>>> but don't have too much time to debug it so this is a interim solution only
>>>>>> until the bug is found and fixed.
>>>>
>>>> that would be nice because once we add machine override it can become
>>>> a common escape for other machines
>>>> and changing this to be a machine specific recipe is not desired
>>>> unless absolutely needed
>>>>
>>>>>
>>>>> My only concern is that are we sure other armv7a targets aren't also having
>>>>> fatal problems?
>>>>
>>>> we don't fix what we don't know is broken
>>>
>>> Right.  But it sounds like it shouldn't be too hard to see if it is 
>>> broken elsewhere :)
> 
>> This patch [1] is superseded by Koen’s commit d6729be1 [2].
> 
> I already saw Koen's commit but nevertheless someone should try to find out 
> why Neon makes such troubles on our arm targets. 

In my case, the ASM is written with gcc 4.5 and binutils 2.20 in mind,
so the constraints are a bit different, resulting in misrendered buttons.
I can't say what your problem with the palm is, probably a buggy kernel.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNZhNtMkyGM64RGpERAg/uAJ9pxS8OmICemCcYlbzVMgv8leE3TACgq94Z
E4r6Df8nBJOdxstJbOyb+eA=
=6KUG
-----END PGP SIGNATURE-----



