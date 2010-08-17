Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OlPvf-0005b2-P0
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 19:26:43 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OlPvH-0000PB-8Q from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 10:26:03 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 17 Aug 2010 10:26:03 -0700
Received: from [172.30.80.144] ([172.30.80.144]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 17 Aug 2010 11:26:01 -0600
Message-ID: <4C6AC627.9050801@mentor.com>
Date: Tue, 17 Aug 2010 10:25:59 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1281998751-10781-1-git-send-email-jkridner@beagleboard.org>	<4C69CD3E.5090007@mentor.com>	<AANLkTikGKtyVsmKKD4A8nuXS5wSGNOvCMb1apeFHPYE0@mail.gmail.com>
	<AANLkTi=YwSNSqe8eSykO_ajEc6dsMBdXFdzBA+to-fEV@mail.gmail.com>
In-Reply-To: <AANLkTi=YwSNSqe8eSykO_ajEc6dsMBdXFdzBA+to-fEV@mail.gmail.com>
X-OriginalArrivalTime: 17 Aug 2010 17:26:01.0852 (UTC)
	FILETIME=[43979BC0:01CB3E31]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] flex: disabled packaged staging of native builds
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
X-List-Received-Date: Tue, 17 Aug 2010 17:26:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:
> 2010/8/17 Jason Kridner <jkridner@beagleboard.org>:
>> On Mon, Aug 16, 2010 at 7:43 PM, Tom Rini <tom_rini@mentor.com> wrote:
>>> Jason Kridner wrote:
>>>> ---
>>>>  recipes/flex/flex.inc |    4 +++-
>>>>  1 files changed, 3 insertions(+), 1 deletions(-)
>>>>
>>>> diff --git a/recipes/flex/flex.inc b/recipes/flex/flex.inc
>>>> index 49b26e8..5d3f076 100644
>>>> --- a/recipes/flex/flex.inc
>>>> +++ b/recipes/flex/flex.inc
>>>> @@ -4,7 +4,7 @@ LICENSE = "BSD"
>>>>  DEPENDS = "gettext"
>>>>  -INC_PR = "r5"
>>>> +INC_PR = "r6"
>>>>  S = "${WORKDIR}/flex-${PV}"
>>>>  @@ -16,3 +16,5 @@ inherit autotools gettext
>>>>  # static-only library; that might be an error
>>>>  FILES_${PN} += "${libdir}/libfl.a"
>>>> +
>>>> +PSTAGING_DISABLED_virtclass-native = "1"
>>> I assume you've ran into 2.3.35 not being relocation happy?  Have you been
>>> able to look at this at all?  2.3.31 works so it's something 'bad' done
>>> upstream.  Thanks!
>> I did, but I didn't look into the details.  bison-native wouldn't
>> rebuild when I used my flex-native pstage.  bitbake -c clean
>> flex-native fixed it, so...
> 
> After that would rebuilding from pstage cause the error again?
> I'm a little bit worried that we inhibit PSTAGING because e.g.
> something else is wrong (e.g. a change elsewhere that should have been
> resulted in a flex PR bump).

So, this change is fine itself.  The problem is that flex 2.3.35 has 
introduced a hardcoded path somewhere into the binary.  So blacklisting 
and bumping PR means that pstaging is sane again.

> Besides (but this is more a global remark): it would be nice if a
> recipe disables something that there is a short description why this
> is done. (at least in the commit message, but imho preferably in the
> recipe, so in half a year time, people still know why it is done and
> can much easier judge if it can be removed).

Yes, I agree with that, a comment why is good.

-- 
Tom Rini
Mentor Graphics Corporation


