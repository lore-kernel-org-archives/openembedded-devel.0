Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <robert@erafx.com>) id 1POG9f-0007i7-Qi
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Dec 2010 21:53:29 +0100
Received: by vws6 with SMTP id 6so3540222vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Dec 2010 12:52:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.241.196 with SMTP id lf4mr442192qcb.55.1291323124151; Thu,
	02 Dec 2010 12:52:04 -0800 (PST)
Received: by 10.220.194.65 with HTTP; Thu, 2 Dec 2010 12:52:04 -0800 (PST)
X-Originating-IP: [24.165.208.114]
In-Reply-To: <4CF80383.6010401@lambsys.com>
References: <4CF68D24.80900@lambsys.com>
	<20101201180621.GB20482@excalibur.local>
	<4CF69653.5000504@lambsys.com>
	<20101201185406.GC20482@excalibur.local>
	<AANLkTins+XE2Zq2P=wBHUc9N9XvD0f+t7zdyVjNevggS@mail.gmail.com>
	<4CF80383.6010401@lambsys.com>
Date: Thu, 2 Dec 2010 15:52:04 -0500
Message-ID: <AANLkTimBA8-FcoVsePaoe8zi8FcdcZxRhupsviF8VWQC@mail.gmail.com>
From: Robert Foerster <robert@erafx.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: robert@erafx.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Documentation
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
X-List-Received-Date: Thu, 02 Dec 2010 20:53:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Dec 2, 2010 at 3:37 PM, David Lambert <dave@lambsys.com> wrote:

> Thanks for all the suggestions. While on the subject, does a dictionary of
> keywords with their meanings exist anywhere? Newbies like me may find it
> very useful when browsing recipes. Some terms are intuitively obvious, such
> as DEV_BASE, but others such as PR, INHERIT, PV, leave me with some
> ambiguity.
>
>
Some info can be found in the manual:
http://docs.openembedded.org/usermanual/usermanual.html#recipes_versioning
Discussed in the manual are many of the items which are initially confusing:
P, PN, PV, PR, PF, S, D, WORDIR, etc

Also useful is to read the bitbake manual, which defines the basic metadata
syntax handled by bitbake. http://bitbake.berlios.de/manual/

Hope that helps.
Bob



> Regards,
>
> Dave.
>
>
>
> On 12/01/2010 04:46 PM, Robert Foerster wrote:
>
>> On Wed, Dec 1, 2010 at 1:54 PM, Stefan Schmidt<stefan@datenfreihafen.org
>> >wrote:
>>
>>  Hello.
>>>
>>> On Wed, 2010-12-01 at 12:39, David Lambert wrote:
>>>
>>>> That is indeed the version of documentation that I was reading. To
>>>> be more specific, one of the subjects I was attempting to look up
>>>> was how to specialize a recipe using "amend.inc". I do not see any
>>>> documentation on this subject.
>>>>
>>> We lack a good technical writer in the community. IIRC there was a
>>> blogpost
>>> from
>>> Khem about it and maybe some more infos on the mailling list. Thats of
>>> course
>>> not the most straight forward location for the information.
>>>
>>> If you searched together the information it would be great if you could
>>> send a
>>> patch updating the manual with it. :)
>>>
>>> regards
>>> Stefan Schmidt
>>>
>>>
>>>  I'm not an expert on the subject, but I've managed to utilize amend.inc
>> based on some information I pieced together from the irc logs.  I hope to
>> soon write an article on how to use amend.inc, but haven't yet found the
>> time.
>>
>> (This is far from authoritative, but it's been working for me here)
>>
>> You need to add the following to build-dir/conf/local.conf (can also go in
>> overlay/conf/site.conf).
>> INHERIT += "amend"
>>
>> DEV_BASE = "${HOME}/dev/openembedded/dev"
>> COLLECTIONS = "${DEV_BASE}/overlay/recipes \
>>                 ${DEV_BASE}/openembedded/recipes"
>>
>> # By default, file:// SRC_URIs only look under the current .bb file.
>> # Prepend our overlays into the file:// search path, so we can override
>> # openembedded recipes' SRC_URI files. Also, ensure the openembedded
>> # files are always in the search path, so our overlay .bb's can
>> # reference upstream files.
>> FILESPATHBASE =. "${@ \
>>         ':'.join([os.path.join(recipedir, \
>>                                 os.path.basename(os.path.dirname( \
>>                                                         d.getVar('FILE',
>> 1)))) \
>>                 for recipedir in d.getVar('COLLECTIONS', 1).split()])}:"
>>
>>
>> You'll need to make DEV_BASE and COLLECTIONS match your setup.  This
>> assumes
>> that I have two trees with recipes:
>>  - openembedded
>>  - overlay
>>
>> This makes sure that for a given recipe, my local overlay will be in its
>> FILESPATH.
>>
>>
>> Now, for example, I've added a patch to psplash to adjust the colors.
>> In overlay/recipes/psplash/ I have two files:
>> amend.inc:
>> PR .= "-amend"
>> SRC_URI += "file://0001-tweaked-for-company-colors.patch"
>>
>> and my patch, named 0001-tweaked-for-company-colors.patch
>>
>> Now, the new patch will be applied when psplash is built.  Also, I like
>> updating PR with -amend, this way the package is now shown
>> as psplash-0.0+svnr422-r34-amend, so that I can easily tell that I've
>> amended the package.
>>
>> I'm sure there are others who can provide more/better information, but
>> that'll hopefully get you started.
>>
>> Regards,
>> Bob Foerster
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

