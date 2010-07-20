Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1ObF5w-0006ns-2B
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 17:51:18 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1ObF5R-00020T-FI from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 08:50:29 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 20 Jul 2010 08:50:29 -0700
Received: from [172.30.80.25] ([172.30.80.25]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 20 Jul 2010 09:50:27 -0600
Message-ID: <4C45C5BD.6070108@mentor.com>
Date: Tue, 20 Jul 2010 08:50:21 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1279290319.10837.1747.camel@rex>
	<4C44BAB3.8010703@mentor.com>	<AANLkTild0OtzxFT1GmBoNoUj8spV7jcvp1s_Cd69Frdy@mail.gmail.com>	<AANLkTinZATYyQw2PEk52Hk71R_4nIzdacjzB2qKt2ZnQ@mail.gmail.com>	<AANLkTikAmC6Li8IdUfbfZ48Or-dEABfH4ua8JjIgA0JT@mail.gmail.com>	<AANLkTim1m8AQ4WsVRLu_1BU3VUfOrCgpLNIclgewXhJz@mail.gmail.com>
	<4C45BE9F.7000002@mentor.com>
In-Reply-To: <4C45BE9F.7000002@mentor.com>
X-OriginalArrivalTime: 20 Jul 2010 15:50:28.0152 (UTC)
	FILETIME=[46796B80:01CB2823]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: A new bitbake extension: .bbappend files
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
X-List-Received-Date: Tue, 20 Jul 2010 15:51:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Tom Rini wrote:
> Chris Larson wrote:
>> On Tue, Jul 20, 2010 at 12:28 AM, Frans Meulenbroeks <
>> fransmeulenbroeks@gmail.com> wrote:
>>
>>> 2010/7/19 Chris Larson <clarson@kergoth.com>
>>>
>>>> On Mon, Jul 19, 2010 at 2:22 PM, Chris Larson <clarson@kergoth.com>
>>> wrote:
>>>>>
>>>>> On Mon, Jul 19, 2010 at 1:50 PM, Tom Rini <tom_rini@mentor.com> wrote:
>>>>>
>>>>>> Richard Purdie wrote:
>>>>>>
>>>>>>> Whilst our layers mechanism, is great it does have a drawback which
>>> has
>>>>>>> bugged me for a while. If you have a recipe like pointercal which 
>>>>>>> has
>>>>>>> machine specific information in it and you have your new machine 
>>>>>>> code
>>>> in
>>>>>>> a layer, how do you add a pointercal file for your machine?
>>>>>>>
>>>>>>> Answer is you copy the whole pointercal recipe and files into your
>>>>>>> layer, then add the single file for your machine. To me this is 
>>>>>>> ugly,
>>>>>>> ugly, ugly. We hate code duplication and as soon as you create two
>>>>>>> copies of the same information, we've failed.
>>>>>>>
>>>>>>> So how could we do this better? Somehow we need to say that a given
>>>>>>> directory X has some information which should be merged with the
>>>>>>> original recipe. I've thought through several different ways of 
>>>>>>> doing
>>>>>>> this and the best solution I found was "bbappend".
>>>>>>>
>>>>>>> The idea is that if bitbake finds any X.bbappend files, when it 
>>>>>>> loads
>>>>>>> X.bb, it will also include these files after it parses the base .bb
>>>> file
>>>>>>> (but before finalise and the anonymous methods run). This means that
>>>>>>> the .bbappend file can poke around and do whatever it might want to
>>> the
>>>>>>> recipe to customise it.
>>>>>>>
>>>>>>> I went ahead and tried it out as its quite simple to code this in
>>>>>>> bitbake. I liked the result enough I've already merged this into
>>> Poky:
>>>>>>>
>>>>>>>
>>> http://git.pokylinux.org/cgit.cgi/poky/commit/?id=63e6ba85677b8aa9f4cf9942a1fccbb8a8c72660 
>>>
>>>>>>> I'm proposing to push it to bitbake master if there are no serious
>>>>>>> objections.
>>>>>>>
>>>>>>> As an example use case, for the pointercal case above in another
>>> later
>>>>>>> you could add a pointercal_0.0.bbappend file which contained
>>> something
>>>>>>> like:
>>>>>>>
>>>>>>> FILESPATH := "${FILESPATH}:${@os.path.dirname(bb.data.getVar('FILE',
>>> d,
>>>>>>> True))}"
>>>>>>>
>>>>>>> which would then cause the directory containing the bbappend file to
>>> be
>>>>>>> searched for pointercal files.
>>>>>>>
>>>>>>> There are of course many other uses this could be put to for 
>>>>>>> creating
>>>>>>> customised layers, its totally generic.
>>>>>>>
>>>>>>> For the specific case of paths, I have wondered if there would be a
>>> way
>>>>>>> to leverage help from bitbake in creating a sane set of search paths
>>>> but
>>>>>>> I'm still thinking about that. This extension is good enough in its
>>> own
>>>>>>> right in my opinion to be worthwhile.
>>>>>>>
>>>>>> I must be missing something.  How is this better than amend.inc where
>>>>>> today you would just do:
>>>>>> # Just to make sure PR does change, could actually be omitted for 
>>>>>> this
>>>>>> # example
>>>>>> $ echo 'PR .= ".1"' > mymachine/recipes/pointercal/amend.inc
>>>>>> $ cp /tmp/mycal mymachine/recipes/pointercal/whatever_it_is_called
>>>>>>
>>>>>> ?  Or did you just give too trivial of an example here, and as there
>>> are
>>>>>> indeed places where amend.inc falls down today, this does work?
>>>>>
>>>>> It's the opposite.  amend.inc is a bit more flexible than bbappend, 
>>>>> not
>>>>> vice versa, but bbappend has fewer performance implications, and is
>>>>> supported directly by bitbake itself (and ensures that anonymous 
>>>>> python
>>>>> functions will work fine in appended metadata).  Aside: I also suspect
>>>> that
>>>>> BBCLASSEXTEND alterations will work correctly from a bbappend, which
>>> does
>>>>> not work correctly today from an amend.inc.
>>>>>
>>>>> You'd have to be careful to lock down your appended versions when 
>>>>> using
>>>>> bbappend, since bitbake could easily pick a newer version without the
>>>> append
>>>>> out from under you, which is not an issue with amend.inc.
>>>>>
>>>> Although, I suppose you could set DEFAULT_PREFERENCE in the 
>>>> bbappend, so
>>>> whenever you include that collection, it gets preferred.
>>>>
>>>> Not if your distro decides to move to a new version. The distro choice
>>> gets
>>> priority to DEFAULT_PREFERENCE.
>>>
>>
>> Fair point, best to use a version lockdown tool if you leverage 
>> bbappend, at
>> this time, so there's a bit more work involved.
>>
>> Btw is there any doc on how to use amend.inc? Looks like a neat thing.
>>
>>
>> I don't think so, but there isn't much to document.  Just add INHERIT +=
>> "amend", and then you can place a "amend.inc" file anywhere in any 
>> recipe's
>> FILESPATH, and it will be parsed and added onto the metadata of that 
>> recipe.
>>  Avoid modifying BBCLASSEXTEND from it, that's known to have issues.
> 
> It's also needed, in some cases, to lock down your changes via OVERRIDES 
> that will only match what you want to work on.  For example, we're using 
> a snapshot with an older python, so amend.inc in our python directory 
> looks like:
> 
> SRC_URI_append_pn-python-native = 
> "file://python-2.6-r73342.patch;patch=1;pnum=0"
> PARALLEL_MAKE_pn-python-native = ""
> PR_append_pn-python-native .= ".1"
> 
> So that we only change python-native and not all of the other python 
> recipes.  This would indeed not be an issue with bbappend as we'd have 
> put all of that into python-native_2.6.1.bbappend (but it sounds like we 
> would have had to add something for FILESPATH manipulation?  If so, that 
> sounds really bad to me, Richard?).

OK, misrecollection on my part.  amend.inc needs you to do some form of 
mucking as well (if you want to add files or patches or ..) and in both 
cases you could stick it into local.conf.

-- 
Tom Rini
Mentor Graphics Corporation


