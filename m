Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PnEjN-0007CF-0y for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 19:25:33 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PnEiH-0004M1-So for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 19:24:25 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Feb 2011 19:24:25 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Feb 2011 19:24:25 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 09 Feb 2011 19:24:12 +0100
Message-ID: <iium4d$gau$1@dough.gmane.org>
References: <1297199824-3712-1-git-send-email-morphis@gravedo.de>	<4D51B81D.8000800@mentor.com>
	<AANLkTikbfyoZfnJq9k1fSkMVMkReNw0G8APuXjc_rTyY@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <AANLkTikbfyoZfnJq9k1fSkMVMkReNw0G8APuXjc_rTyY@mail.gmail.com>
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
X-List-Received-Date: Wed, 09 Feb 2011 18:25:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09-02-11 19:16, Khem Raj wrote:
> On Tue, Feb 8, 2011 at 1:39 PM, Tom Rini <tom_rini@mentor.com> wrote:
>> On 02/08/2011 02:17 PM, Simon Busch wrote:
>>>
>>> Neon support in evas is currently broken for the palmpre machine. If we
>>> enable neon
>>> support evas causes alignment trap errors and lets the device freeze in
>>> the end. This
>>> should be reverted after the bug in evas code is found and fixed.
>>>
>>> Signed-off-by: Simon Busch<morphis@gravedo.de>
>>> ---
>>>  recipes/efl1/evas.inc |    5 ++++-
>>>  1 files changed, 4 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/recipes/efl1/evas.inc b/recipes/efl1/evas.inc
>>> index eb64d7a..ad30eba 100644
>>> --- a/recipes/efl1/evas.inc
>>> +++ b/recipes/efl1/evas.inc
>>> @@ -7,7 +7,7 @@ DEPENDS_virtclass-native = "freetype-native libxext-native
>>> libpng-native jpeg-na
>>>  inherit efl
>>>
>>>  BBCLASSEXTEND = "native"
>>> -INC_PR = "r0"
>>> +INC_PR = "r1"
>>>  FILESPATHPKG =. "${BPN}-${PV}:${BPN}:"
>>>
>>>  python populate_packages_prepend () {
>>> @@ -83,6 +83,9 @@ EVAS_CPU_TWEAKS = ""
>>>  # Disabled for now, see
>>> http://thread.gmane.org/gmane.comp.window-managers.enlightenment.devel/25194
>>>  #EVAS_CPU_TWEAKS_armv7a = "--enable-cpu-neon"
>>>
>>> +# Neon support for evas is broken on palmpre currently (causes the device
>>> to freeze)
>>> +EVAS_CPU_TWEAKS_palmpre = "--disable-cpu-neon"
>>> +
>>>  # common options
>>>  EVAS_OECONF = " \
>>>                  --x-includes=${STAGING_INCDIR}/X11 \
>>
>> Shouldn't this be changing the armv7a EVAS_CPU_TWEAKS that's above yours to
>> be uncommented and as a --disable?
> 
> that would disable neon for all armv7a machines probably not what is
> needed here.

Actually, that was how I did it :) The NEON code that was added doesn't
build with gcc 4.3.x and binutils 2.18.x, so I disabled it by not
enabling it. If it builds and works with gcc 4.3.x nowadays we should
enable it and find out why the palmpre breaks.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNUtvMMkyGM64RGpERApZsAKCqED8JCVCdRqPtGfZ8gAZ+uCk0swCcD96s
9LMHSgBQMcskY+N/zSOAvc4=
=lI+a
-----END PGP SIGNATURE-----



