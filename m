Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MHiLl-0006xi-4y
	for openembedded-devel@openembedded.org; Fri, 19 Jun 2009 19:58:05 +0200
Received: (qmail 16914 invoked from network); 19 Jun 2009 17:47:24 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 19 Jun 2009 10:47:24 -0700
Date: Fri, 19 Jun 2009 10:47:23 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090619174723.GR15477@smtp.west.cox.net>
References: <C960916A-B754-4AD4-9751-67D7025AC8C1@mac.com>
	<h19s8q$jd7$1@ger.gmane.org>
	<4593EC5C-D89E-4947-AA92-3AD423A196B5@mac.com>
	<h1dr55$nue$1@ger.gmane.org>
	<be7a9f3d0906180952v1bbb0611kd7079d5d947f83b8@mail.gmail.com>
	<h1dusl$4lp$1@ger.gmane.org> <4A3A8348.8080502@balister.org>
	<h1e0ot$bjn$1@ger.gmane.org>
	<20090618230514.GP15477@smtp.west.cox.net>
	<h1fgtp$b83$2@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <h1fgtp$b83$2@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Patch for libfann-2.0.0 recipe
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
X-List-Received-Date: Fri, 19 Jun 2009 17:58:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 19, 2009 at 10:06:18AM +0200, Koen Kooi wrote:
> On 19-06-09 01:05, Tom Rini wrote:
>> On Thu, Jun 18, 2009 at 08:24:29PM +0200, Koen Kooi wrote:
>>> On 18-06-09 20:11, Philip Balister wrote:
>>>> Koen Kooi wrote:
>>>>> On 18-06-09 18:52, Otavio Salvador wrote:
>>>>>> Hello Koen,
>>>>>>
>>>>>> On Thu, Jun 18, 2009 at 1:48 PM, Koen Kooi<k.kooi@student.utwente.nl>
>>>>>> wrote:
>>>>>>>> PR = "r01"
>>>>>>>
>>>>>>> Don't set PR to that.
>>>>>>
>>>>>> I believe that most people prefer to always have PR field included;
>>>>>> obviously it ought to be PR = "r1" or PR = "r0" but it is harder to
>>>>>> forget to update it when it shows in the recipe.
>>>>>
>>>>> That's nonsense. Not setting PR = "r0" in recipes makes maintenance a
>>>>> lot easier, e.g. forcing rebuild or all xorg libs. If every recipe was
>>>>> already using INC_PR, I might agree with you, but since that isn't the
>>>>> case adding PR = "r0" is creating more work.
>>>>
>>>> Can you explain this a little clearer? I know a number of people on the
>>>> list feel like Otavio and it would be really helpful for people to
>>>> understand what the downside is to starting with PR = "r0" instead of
>>>> leaving it out.
>>>
>>> Suppose you want to bump PR on every xorg lib recipe, do you want to
>>> edit 70 recipes or do you only want to edit 1 .inc file and 3 recipes?
>>> If you're in the 'edit 70 recipes' crowd, add PR = "r0" to all recipes
>>> in OE. If not, leave it out, bitbake defaults to it anyway.
>>> Also, does anyone remember how much pain we had when adding ${PN}-dbg
>>> into the default PACKAGES only to discover that lots of recipes were
>>> needlessly copying defaults?
>>
>> But there's no .inc file here.  How about saying:
>> - Adding an .inc file MUST switch all the recipes now using it to INC_PR
>> - If you're modifying recipes that really should be INC_PR, make them
>>    INC_PR while you're in there (the 70 xorg lib recipes not using INC_PR
>>    today for example).
>> - New recipes that also create a .inc must set INC_PR = "r0" / PR =
>>    "${INC_PR}.0"
>> - New recipes that are just a single .bb must set PR = "r0"
>>
>> The arguement against "leave it out, bitbake defaults to it anyway." is
>> that "once you make a change it's easier to forget to bump PR/INC_PR if
>> it's not staring you in the face".
>
> Shall we start putting every var in a recipe then? Setting vars to their  
> default is just bloat and wastes parse time.

If there's other variables that need to be changed, frequently, from
their default value after the first commit, yes, we should put those in
as well.

I would have assumed that since changing a package without changing the
PR can wreck havoc on public feeds you would be in favor of helping to
keep those problems at bay.

-- 
Tom Rini


