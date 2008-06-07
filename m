Received: from [201.35.65.91] (helo=freedom.ind.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1K4zd8-0004H4-15
	for openembedded-devel@openembedded.org; Sat, 07 Jun 2008 16:42:54 +0200
Received: from freedom.ind.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id F3B831DF072;
	Sat,  7 Jun 2008 11:37:54 -0300 (BRT)
Received: from internet.ossystems.com.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id A4E191B96A6;
	Sat,  7 Jun 2008 11:37:54 -0300 (BRT)
Received: from internet.ossystems.com.br ([201.40.162.47]
	helo=internet.ossystems.com.br)
	by mail.freedom.ind.br; 7 Jun 2008 11:37:54 -0300
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 0BA2AC2EA;
	Sat,  7 Jun 2008 08:38:21 -0300 (BRT)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 47E4F610055; Sat,  7 Jun 2008 11:40:09 -0300 (BRT)
To: openembedded-devel@lists.openembedded.org
References: <f96d234e0805301122s1b48445ardf7d268fcebdec50@mail.gmail.com>
	<200806021019.50397.openembedded@haerwu.biz>
	<f96d234e0806020753l21423d51kef19c7bc00f02244@mail.gmail.com>
	<loom.20080605T225939-65@post.gmane.org>
	<loom.20080606T002255-512@post.gmane.org>
	<f96d234e0806060651g12575666k2699643198a78262@mail.gmail.com>
	<f96d234e0806070423k5361f4a7g2b48cee0f8f0a659@mail.gmail.com>
	<g2dtoj$2u4$1@ger.gmane.org>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Sat, 07 Jun 2008 11:40:09 -0300
In-Reply-To: <g2dtoj$2u4$1@ger.gmane.org> (Koen Kooi's message of "Sat\,
	07 Jun 2008 14\:08\:50 +0200")
Message-ID: <87skvp8g1i.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org,
	openembedded-users@lists.openembedded.org
Subject: Re: adding German local files to an image
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sat, 07 Jun 2008 14:42:55 -0000
Content-Type: text/plain; charset=us-ascii

Koen Kooi <k.kooi@student.utwente.nl> writes:

> Cliff Brake wrote:
>> On Fri, Jun 6, 2008 at 9:51 AM, Cliff Brake<cliff.brake@gmail.com>  wrote:
>>> Another observation, I can install glibc-locale-de on a device using
>>> opkg, but not at rootfs time:
>>>
>>> Works on device:
>>>
>>> root@:~# opkg install glibc-locale-de
>>> Installing glibc-locale-de (2.6.1-r4) to root...
>>> Downloading http://hq.bec-systems.com/feeds/armv5te/glibc-locale-de_2.6.1-r4_armv5te.ipk
>>> 100% |========================================================================|
>>> Configuring glibc-locale-de
>>> root@:~# opkg files glibc-locale-de
>>> Package glibc-locale-de (2.6.1-r4) is installed on root and has the
>>> following files:
>>> /usr/share/locale/de/LC_MESSAGES/libc.mo
>>>
>>> But not at rootfs build time if I add glibc-locale-de to IMAGE_INSTALL
>>>
>>> NOTE: Resolving any missing task queue dependencies
>>> ERROR: '['/build//_build/oe/oe/custom/packages/images/rootfs-vac-table-image.bb']'
>>> RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity
>>> 'glibc-locale-de' but it wasn't found in any PACKAGE or RPROVIDES
>>> variables
>>> NOTE: Runtime target 'glibc-locale-de' is unbuildable, removing...
>>> Missing or unbuildable dependency chain was: ['glibc-locale-de']
>>> ERROR: Required build target 'rootfs-vac-table-image' has no buildable
>>> providers.
>>> Missing or unbuildable dependency chain was:
>>> ['rootfs-vac-table-image', 'glibc-locale-de']
>>> cbrake@happy:/build//_build/oe$
>>
>> The reason for the above behavior is locale packages are created
>> dynamically, so bitbake has no knowledge of them.  Adding the
>> following to bitbake.conf as as suggested on IRC last night would fix
>> that:
>>
>> PACKAGES_DYNAMIC = "${PN}-locale-*"
>>
>> Any objections to adding this?
>
> Yes, since it's wrong for most packages. Only packages with locales
> will generated locales, and even for those we also have a global
> USE_NLS switch to disable that.
>
> So: Nack

A better alternative would be a way to plug it into the locale package
generation code on package class however I failed to do that in my try.

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


