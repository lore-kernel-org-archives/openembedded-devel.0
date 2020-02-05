Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 34D6560B42
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Feb 2020 18:06:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 015I6Fc3023926
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 5 Feb 2020 10:06:25 -0800
Received: from [128.224.56.226] (128.224.56.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Wed, 5 Feb 2020 10:06:04 -0800
To: Martin Jansa <martin.jansa@gmail.com>
References: <20200130153405.26756-1-Trevor.Gamblin@windriver.com>
	<CA+chaQdLL1BnAD7Yg3=MJxjxUEOGcZoUvBodTgYCkjTAHTspXQ@mail.gmail.com>
	<CANx9H-CSjpmXB13nkBB8PSgM8a4q=T+xHpQ4FGdij5ykEM+f+A@mail.gmail.com>
	<20200205145939.tadzklcfscc442eg@jama>
	<9c5c3983-5b16-eae0-db77-d273ba65a699@windriver.com>
	<20200205170127.xhu2tmhdfrhcbewm@jama>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <87db6dda-e364-adfe-0836-be36cec79a16@windriver.com>
Date: Wed, 5 Feb 2020 13:06:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200205170127.xhu2tmhdfrhcbewm@jama>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][zeus][PATCH v2 1/2] python-twisted: add required RDEPENDS for twistd
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Feb 2020 18:06:51 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 2/5/20 12:01 PM, Martin Jansa wrote:
> On Wed, Feb 05, 2020 at 10:16:01AM -0500, Trevor Gamblin wrote:
>> On 2/5/20 9:59 AM, Martin Jansa wrote:
>>> On Mon, Feb 03, 2020 at 08:45:26PM -0800, Tim Orling wrote:
>>>> On Mon, Feb 3, 2020 at 8:30 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>>>>
>>>>> Please send this fix to normal meta-python in meta-oe/zeus:
>>>>>
>>>>> http://git.openembedded.org/meta-openembedded/tree/meta-python/recipes-devtools/python/python-twisted.inc?h=zeus
>>>>>
>>>>> BTW: Why are you using meta-python2 with zeus branch? It imho doesn't have
>>>>> anything which would be missing in oe-core+meta-oe zeus branch and fixes
>>>>> like this should be resolved also for people using zeus branch without
>>>>> overlaying them by meta-python2.
>>>>>
>>>>>
>>>> Because, as I believe I have said before, I need a prior release to test
>>>> the infrastructure on. zeus allows me to work on more than just master
>>>> until we have the next stable release branching.
>>> The question was for Trevor, I understood that you wanted zeus branch to
>>> test the infrastructure, but I still don't understand why any "project"
>>> should use meta-python2/zeus for the python2 bits which are still in
>>> oe-core/zeus + meta-python/zeus.
>> I'm not sure if I'm misunderstanding, or if I have been the cause for
>> confusion in my summary. When the reporter filed
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13741, it was clear he was
>> using the python 2.x version of Twisted, on the zeus branch of
>> meta-openembedded (based on the version of Twisted that he reported). The
>> patch was written and tested using meta-oe/meta-python zeus and submitted
>> for that layer. I suppose it could be applied to meta-python2 as well.
> Thanks for reply, not it's more clear that my brain somehow failed to
> parse "[oe] [meta-python][zeus][PATCH v2 1/2]", all I was seeing was
> "meta-python" and "2", since my first reply I was seeing this as
> meta-python2 and assumed that you're submitting it only there, not to
> meta-python in meta-oe/zeus which is completely reasonable.
>
> Sorry for noise I just need more sleep or coffee or both actually.
>
> Now when I see that you're working on meta-python in meta-oe, why not
> cherry-pick the commits from master as they are?
>
> Similar change in master:
> http://git.openembedded.org/meta-openembedded/commit/meta-python/recipes-devtools/python/python-twisted.inc?id=7077abdf29a56896ef4dbad94b28201689b70ee3
> http://git.openembedded.org/meta-openembedded/commit/meta-python/recipes-devtools/python/python-twisted.inc?id=53e62e4e57c701dd546a2e27d8b72b7a4698551a
> it has a bit fewer modules in RDEPENDS. Is it because of 19.10.0 version in
> master while zeus has only 19.7.0 or are they actually missing in master
> as well?

When testing for both zeus and master, there was a discrepancy between 
the number of RDEPENDS that needed to be added for /usr/bin/twistd to 
get to its usage/help without issues - master's Twisted 19.10.0 only 
needed unixadmin, debugger, and pyhamcrest, but the zeus build (with 
Twisted version 19.7.0) was still complaining until I added misc, 
pkg-resources, pkgutil, plistlib, pyserial, and setuptools as well, 
hence the separate patch.

It's all making me realize that I haven't been getting some other 
patches for Twisted's RDEPENDS backported, though...

>
> Similarly what about the RDEPENDS of conch fixed in master with:
> http://git.openembedded.org/meta-openembedded/commit/meta-python/recipes-devtools/python/python-twisted.inc?id=c3a3470b1ba3768e04e0a938870ad487bd848120
> isn't this needed in zeus as well?
>
> I don't use python-twisted anywhere, I was just curious why this isn't
> straight backport from master.
>
>> I suppose it could be applied to meta-python2 as well.
> Yes, it looks like these changes are missing in meta-python2/master as
> well:
> https://git.openembedded.org/meta-python2/tree/recipes-devtools/python/python-twisted_19.10.0.bb#n66
>
> Cheers,
>
>>> I see that there are some differences in the recipes in zeus, e.g.:
>>>
>>> martin@jama:/OE/meta-python2$ diff recipes-devtools/python/python-configparser_3.8.1.bb ../meta-openembedded/meta-python/recipes-devtools/python/python-configparser_3.8.1.bb
>>> 1c1
>>> < inherit setuptools python-backports-init
>>> ---
>>>> inherit setuptools
>>> martin@jama:/OE/meta-python2$ diff recipes-devtools/python/python-dbus_1.2.12.bb ../meta-openembedded/meta-python/recipes-devtools/python/python-dbus_1.2.12.bb
>>> 18,19c18,19
>>> < # documentation needs python-sphinx, which is not in oe-core or meta-python2 for now
>>> < # change to use PACKAGECONFIG when python-sphinx is added to oe-core or meta-python2
>>> ---
>>>> # documentation needs python-sphinx, which is not in oe-core or meta-python for now
>>>> # change to use PACKAGECONFIG when python-sphinx is added to oe-core or meta-python
>>> But README nor your reply explained to me, what's the benefit of using meta-python2/zeus
>>> instead of the existing python2 recipes which are in oe-core and meta-oe zeus. That's why
>>> I've never tried to use it with zeus, nor submitted the python-numpy and python-nose
>>> recipes which got removed from oe-core/zeus, but weren't re-introduced in meta-python2
>>> python-nose was removed in:
>>> http://git.openembedded.org/openembedded-core/commit/?h=zeus&id=9f07b2836405d86e869780f8f1ae00843eadc409
>>> python-numpy in:
>>> http://git.openembedded.org/openembedded-core/commit/?h=zeus&id=4e9659f24e2f699effadcbe378b6a746d77ccdbd
>>> from oe-core/zeus.
>>>
>>>> It has nothing to do with what is missing from meta-oe, it is a viable
>>>> alternative that also helps prove out my workflow as I have EXTREMELY
>>>> LIMITED TIME to support this.
>>> Understood, thanks for doing this work, I'm happy to use and contribute to
>>> master branch, it's just that I still don't understand the purpose of zeus
>>> branch (other than testing the infrastructure by you) and I hope you agree
>>> that bug fixes for python2 issues like the one in this thread belong
>>> to meta-oe/meta-python zeus in first place (because that's the layer which
>>> what most people are probably still using with zeus).
>>>
>>> Cheers,
>>>
>>>> On Fri, Jan 31, 2020 at 10:29 AM Trevor Gamblin <
>>>>> Trevor.Gamblin@windriver.com> wrote:
>>>>>
>>>>>> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>>>>>>
>>>>>> python-twisted is currently missing some packages for its /usr/bin/twistd
>>>>>> executable to function. Add these to the RDEPENDS list, and also clean up
>>>>>> formatting since the list is getting long.
>>>>>>
>>>>>> Note that a similar patch has already been submitted for master branch,
>>>>>> but the python2 version of twisted needs more explicit RDEPENDS than the
>>>>>> python3 version submitted to master in order for /usr/bin/twistd to work
>>>>>> properly.
>>>>>>
>>>>>> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>>>>>> ---
>>>>>>    .../recipes-devtools/python/python-twisted.inc | 18 +++++++++++++++++-
>>>>>>    1 file changed, 17 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/meta-python/recipes-devtools/python/python-twisted.inc
>>>>>> b/meta-python/recipes-devtools/python/python-twisted.inc
>>>>>> index d70104dc2..024a9fa7c 100644
>>>>>> --- a/meta-python/recipes-devtools/python/python-twisted.inc
>>>>>> +++ b/meta-python/recipes-devtools/python/python-twisted.inc
>>>>>> @@ -56,7 +56,23 @@ RDEPENDS_${PN} = "\
>>>>>>        ${PN}-zsh \
>>>>>>    "
>>>>>>
>>>>>> -RDEPENDS_${PN}-core = "${PYTHON_PN}-core ${PYTHON_PN}-zopeinterface
>>>>>> ${PYTHON_PN}-incremental ${PYTHON_PN}-constantly ${PYTHON_PN}-hyperlink
>>>>>> ${PYTHON_PN}-automat"
>>>>>> +RDEPENDS_${PN}-core = "${PYTHON_PN}-automat \
>>>>>> +                       ${PYTHON_PN}-constantly \
>>>>>> +                       ${PYTHON_PN}-core \
>>>>>> +                      ${PYTHON_PN}-debugger \
>>>>>> +                       ${PYTHON_PN}-hyperlink \
>>>>>> +                       ${PYTHON_PN}-incremental \
>>>>>> +                       ${PYTHON_PN}-misc \
>>>>>> +                       ${PYTHON_PN}-pkg-resources \
>>>>>> +                       ${PYTHON_PN}-pkgutil \
>>>>>> +                       ${PYTHON_PN}-plistlib \
>>>>>> +                       ${PYTHON_PN}-pyhamcrest \
>>>>>> +                       ${PYTHON_PN}-pyserial \
>>>>>> +                       ${PYTHON_PN}-setuptools \
>>>>>> +                       ${PYTHON_PN}-unixadmin \
>>>>>> +                       ${PYTHON_PN}-zopeinterface \
>>>>>> +"
>>>>>> +
>>>>>>    RDEPENDS_${PN}-test = "${PN}"
>>>>>>    RDEPENDS_${PN}-conch = "${PN}-core ${PN}-protocols"
>>>>>>    RDEPENDS_${PN}-mail = "${PN}-core ${PN}-protocols"
>>>>>> --
>>>>>> 2.24.0
>>>>>>
>>>>>> --
>>>>>> _______________________________________________
>>>>>> Openembedded-devel mailing list
>>>>>> Openembedded-devel@lists.openembedded.org
>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>>>
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-devel mailing list
>>>>> Openembedded-devel@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>>

