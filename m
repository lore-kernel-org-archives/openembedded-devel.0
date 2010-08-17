Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OlRPq-0000H3-Vr
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 21:01:58 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OlRPO-0006sq-2S from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 12:01:14 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 17 Aug 2010 12:01:13 -0700
Received: from [172.30.80.170] ([172.30.80.170]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 17 Aug 2010 13:01:12 -0600
Message-ID: <4C6ADC77.90903@mentor.com>
Date: Tue, 17 Aug 2010 12:01:11 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <lyr5hyhjpb.fsf@ensc-virt.intern.sigma-chemnitz.de>	<AANLkTinO51XMyYQ65HgdD1Vy8FxTixxCZfJ_+GUBhEK-@mail.gmail.com>	<4C6ACB57.6010900@mentor.com>
	<AANLkTimM1KXgWUXHFz+njHmUAMYo75eVYy2J9ATEC0Bw@mail.gmail.com>
In-Reply-To: <AANLkTimM1KXgWUXHFz+njHmUAMYo75eVYy2J9ATEC0Bw@mail.gmail.com>
X-OriginalArrivalTime: 17 Aug 2010 19:01:12.0755 (UTC)
	FILETIME=[8F8E4030:01CB3E3E]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Usage of NATIVE_INSTALL_WORKS
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
X-List-Received-Date: Tue, 17 Aug 2010 19:01:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Chris Larson wrote:
> On Tue, Aug 17, 2010 at 10:48 AM, Tom Rini <tom_rini@mentor.com> wrote:
> 
>> Chris Larson wrote:
>>
>>> On Mon, Aug 16, 2010 at 4:37 AM, Enrico Scholz <
>>> enrico.scholz@sigma-chemnitz.de> wrote:
>>>
>>>  Hi,
>>>> http://wiki.openembedded.org/index.php/Legacy_staging states that
>>>> NATIVE_INSTALL_WORKS must be set when there is a non trivial
>>>> do_install() function and BBCLASSEXTEND is used.
>>>>
>>>> But
>>>>
>>>> | git grep NATIVE_INSTALL_WORKS conf/ classes/ lib/
>>>>
>>>> shows only one place where this variable is evaluated:
>>>>
>>>> | classes/staging.bbclass:    elif bb.data.getVar('NATIVE_INSTALL_WORKS',
>>>> d, 1) == "1":
>>>> | classes/staging.bbclass-        legacy = False
>>>>
>>>> And there, it is used only in the is_legacy_staging() function, to
>>>> override legacy/non-legacy detection results.
>>>>
>>>>
>>>> Is there still any use for this variable in modern staging?  Or shall it
>>>> be purged from non-legacy recipes?
>>>>
>>>
>>> If you purge it from particular non-legacy recipes, the legacy detection
>>> code will misidentify those as legacy and fail to do the correct thing.
>>>
>> Can we update the wiki page to expand on when this is needed a little bit
>> more then?  My quick read of is_legacy_staging() says that if do_stage is
>> empty (and it should be if you convert from do_stage to do_install right)
>> NATIVE_INSTALL_WORKS shouldn't be needed.
> 
> 
> Removing the do_stage function from the recipe doesn't necessarily result in
> an empty do_stage.  If you look at native.bbclass, you'll see that do_stage
> is do_stage_native.  If your do_stage is do_stage_native and you haven't set
> AUTOTOOLS_NATIVE_STAGE_INSTALL, it'll fall back to legacy staging, at least
> if I'm reading is_legacy_staging correctly.

So, perhaps it's time to convert that real quick?  Or is there some 
reason I'm not seeing as to why we wouldn't want to:
- Change native.bbclass do_stage / do_stage_native to do_install / 
do_install
- Drop NATIVE_INSTALL_WORKS

-- 
Tom Rini
Mentor Graphics Corporation


