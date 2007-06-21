Received: from [64.233.166.176] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1I1HJ4-0004e5-IW
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jun 2007 09:42:21 +0200
Received: by py-out-1112.google.com with SMTP id f47so882658pye
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2007 00:38:30 -0700 (PDT)
Received: by 10.35.14.18 with SMTP id r18mr2463611pyi.1182411510113;
	Thu, 21 Jun 2007 00:38:30 -0700 (PDT)
Received: from cube ( [82.193.98.14])
	by mx.google.com with ESMTP id m1sm1444056nzf.2007.06.21.00.38.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jun 2007 00:38:29 -0700 (PDT)
Date: Thu, 21 Jun 2007 10:38:30 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <10510686462.20070621103830@gmail.com>
To: Sergey Lapin <slapinid@gmail.com>
In-Reply-To: <4679A49F.3090201@gmail.com>
References: <48239d390706200314y300766en9956ec5e56789ce5@mail.gmail.com>
	<17610553906.20070620183452@gmail.com> <4679A49F.3090201@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] locales
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jun 2007 07:42:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Sergey,

Thursday, June 21, 2007, 1:05:19 AM, you wrote:

> Paul Sokolovsky wrote:
>> 
>>         That's true in the sense that there's no special infra to deal
>> with l19n issues efficiently. Otherwise, basic support on package
>> management level is there and works well (on that very package management
>> level).
>> 
>>         Going for elaboration of this support is opening Pandora's box.
>> There going to be just too many issues, and they will swamp whoever go
>> for them. At that's at the time, when we have more pressing issues on
>> all levels (OE - many packages not up-to-date/broken; Angstrom - lots
>> of clean up to do, and finally to make release; Specific devices -
>> lotsa kernel and related stuff to support/improve).
> I have a feeling that that will go on forever - there are always
> broken packages, not to mention improvements, especially on kernel side.
> There's no stopping point, and that's not bad.
>>
>>         So, I feel like currently it's bad time to go for l19n
>> problems.
> It seems that good time will never come, since there are always
> other things to be done.

        Nice bit of philosophy in midst of technical/organization
discussion. But even philosophical theory of changes has notions of
"less appropriate" and "more appropriate" for a given event in a given
point of time. Anyway, that was all my IMHO, and YMMV.

>>         Yes, as of now, Angstrom is shipped with the default locale
>> only. Users who need other locale, can easily install it using package
>> manager (and yes, this easiness can be improved even more).

> Any interesting details here, please?

        My idea is that there should be a tool, frontend to package
manager, allowing to find and install useful things easily for end
user (but not necessarily in optimal way). To not create more entities
than needed, in my dream I see the very package manager reuse for
that, under following scheme:

1. Multiple section support added to ipk's.
2. Package manager provides ability to to filter list by section
(likely already done).
3. A separate section is created, with catchy name like
"Oh-so-cool-goodies".
4. Within that section, there live virtual packages (empty with just
Depends on real packages), within also boring names like "Click here
to install translations for language X" or "Click here to install
bunch'o'games".
5. There's a shortcut on desktop, which starts package manager with
the mentioned section filter applied.

>> 
>>> Infrastructure problem:
>>> * We need a way to set up automatic locale package installation during
>>> image build according to some subset of languages/locales.
>> 
>>         On OE level, it's possible. On Angstrom level, we'd need to
>> decide which will be that "subset". And one decision was already made
>> - as locales (as in glibc locale package) are big in size, and there's
>> no definitive subset of size=N, N>1 which will allow to cover needs of
>> greater audience than subset of size=N-1, let there be one default
>> locale, and let users use standard means of customizing the install -
>> a package manager.
> It is not possible for some devices, and too hard on others
> (due to lack of device support, for example, and need to provide
> powerful showcase).

        Locales, devices, and phase of the moon have no correlation,
sorry. It should be possible to install any locale on any device
regardless of the moon phase.

>>         Ok, let me just dump my thoughts on how I'd do that:
>> 
>> 1. Use ROOTFS_POSTPROCESS_COMMAND to do this stuff, don't patch the
>> rest of bitbake/OE.
>> 2. ROOTFS_POSTPROCESS_COMMAND is run after rootfs is fully created, in
>> particular, when all packages are recursively installed. The list of
>> them is in /usr/lib/ipkg/status.
>> 3. Read the list, and for each package PKG in it, try to install
>> package PKG-locale-LL. Skip non-existent packages.
>> 4. Voila

> And here you provide solution to build image, not solving
> issues for user

        You were already provided idea of the corresponding
solution for runtime use on IRC. Just to have it all in one place,
here what it was:

1. You write an app which scans currently installed list of packages.
2. For each package PKG, it tries to install PKG-locale-LL, skipping
any errors.
3. Users run this update-locales tool after installing new packages.

> (he installs application and expects
> for package manager to install his locales for him
> automatically.
> So, a bit of patching of ipkg is needed.
> Any cons?

        Pretty mad expectations. Lart that user, just in case. But
even that is possible, and of course without (adhoc) ipkg patching. In
the worst case, we can add that update-locales script as post-install
for each package which has locales. But that's again contamination of
metadata. Instead, ipkg should allow global post-install hook, and
update-locales should be there.


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



