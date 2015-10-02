Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id DAFC6770A7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Oct 2015 11:01:04 +0000 (UTC)
Received: (qmail 3478 invoked by uid 1003); 2 Oct 2015 11:01:02 -0000
Received: from unknown (HELO ?192.168.11.124?)
	(philip@opensdr.com@108.44.122.124)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	2 Oct 2015 11:01:02 -0000
To: openembedded-devel@lists.openembedded.org
References: <20150918115458.GA11095@jama>
	<1443713428-8635-1-git-send-email-Martin.Jansa@gmail.com>
	<1443713428-8635-8-git-send-email-Martin.Jansa@gmail.com>
	<CAMKF1sojEbscxJ8hGQJ5vAES_QKd8C8TUhBtw_4_hdU+_Y6Qpw@mail.gmail.com>
	<CA+chaQfZ+jHfWKABvdnHxkk13SgjwY=EE_mD8OPOeFa8eqFbXw@mail.gmail.com>
From: Philip Balister <philip@balister.org>
Message-ID: <560E63ED.50800@balister.org>
Date: Fri, 2 Oct 2015 07:01:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQfZ+jHfWKABvdnHxkk13SgjwY=EE_mD8OPOeFa8eqFbXw@mail.gmail.com>
Subject: Re: [PATCH][meta-oe 08/10] elmdentica, azy: blacklist because they are old and fail to build with gcc-5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Oct 2015 11:01:05 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 10/02/2015 04:20 AM, Martin Jansa wrote:
> Hi Khem,
> 
> thanks for reviews and suggestions.
> 
> I know how to fix most of these and I've fixed remaining components which
> are included in images I use.
> 
> The problem with these is that I want to get rid of unmaintained recipes, I
> was reporting these failures multiple times in "Bitbake world status"
> e-mails and nobody cares, I was warning about more PNBLACKLISTs for last
> couple weeks.
> 
> Being meta-oe maintainer doesn't make me responsible for fixing all recipes
> which live there, especially now when meta-oe is often used as dumping
> ground for unmaintained recipes which are pushed out of oe-core.
> 
> Yes I can spend more my free time fixing things like azy, but it wasn't
> updated in upstream in ages, nobody is probably using it (otherwise they
> would already notice it's borken, right?) and even when I fix building it
> with gcc-5 I wont spent extra time testing it in runtime, so it will
> possibly be broken and nobody will know, because again, this is old and
> nobody is probably using it (my last build which included elmdentica was
> SHR feed based on Dora release).
> 
> If someone wants to step-up and fix those issues, it's easy to do it
> together with PNBLACKLIST removal, until that time, it's better to
> explicitly definine that it's known to be broken, because people don't read
> my "Bitbake world status".

I do read the "Bitbake world status" and scan for recipes I care about.
I hope that others do the same. Blacklisting the ones that no one steps
up to fix is a good approach for moving on with stuff you need to work
and not getting stuck maintaining stuff no one cares about.

Thanks for doing this work.

Philip

> 
> Regards,
> 
> On Fri, Oct 2, 2015 at 4:26 AM, Khem Raj <raj.khem@gmail.com> wrote:
> 
>> On Thu, Oct 1, 2015 at 8:30 AM, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>>> * they weren't migrated from E_SVN to git and updated in ages, I'm not
>> interested
>>>   in maintaining them and nobody else volunteered to fix it
>>>
>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> ---
>>>  meta-efl/recipes-efl/e17/elmdentica_svn.bb | 2 ++
>>>  meta-efl/recipes-efl/efl/azy_svn.bb        | 5 +++++
>>>  2 files changed, 7 insertions(+)
>>>
>>> diff --git a/meta-efl/recipes-efl/e17/elmdentica_svn.bb
>> b/meta-efl/recipes-efl/e17/elmdentica_svn.bb
>>> index 20a4849..56a74c5 100644
>>> --- a/meta-efl/recipes-efl/e17/elmdentica_svn.bb
>>> +++ b/meta-efl/recipes-efl/e17/elmdentica_svn.bb
>>> @@ -19,3 +19,5 @@ SRCREV = "${EFL_SRCREV}"
>>>  RDEPENDS_${PN} = "${PN}-themes"
>>>
>>>  SRC_URI += "file://configure.patch"
>>> +
>>> +PNBLACKLIST[elmdentica] ?= "OLD and depends on broken azy"
>>> diff --git a/meta-efl/recipes-efl/efl/azy_svn.bb
>> b/meta-efl/recipes-efl/efl/azy_svn.bb
>>> index 0c3c9d7..dec2475 100644
>>> --- a/meta-efl/recipes-efl/efl/azy_svn.bb
>>> +++ b/meta-efl/recipes-efl/efl/azy_svn.bb
>>> @@ -30,3 +30,8 @@ inherit efl
>>>  SRC_URI =
>> "${E_SVN}/trunk/PROTO;module=${SRCNAME};protocol=http;scmdata=keep"
>>>  S = "${WORKDIR}/${SRCNAME}"
>>>
>>> +# azy/2_1.0.0+svnr82070-r2/azy/src/lib/extras/pugixml.cpp:33:
>>> +# sysroots/qemuarm/usr/include/c++/5.2.0/bits/basic_string.h:4780:5:
>> error: reference to 'basic_string' is ambiguous
>>
>> this is more serious problem. there seems to be two implementations of
>> string object. May be you should remove including string.h in
>> pugixml.cpp
>>
>>> +#     basic_string<_CharT, _Traits, _Alloc>
>>> +#     ^
>>> +PNBLACKLIST[azy] ?= "OLD and doesn't build with gcc-5"
>>> --
>>> 2.6.0
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>

