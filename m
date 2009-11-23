Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NCbEW-0004U3-DH for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 16:53:47 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NCbD5-0000wC-M7
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 16:52:15 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 16:52:15 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 16:52:15 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 23 Nov 2009 16:52:03 +0100
Message-ID: <heeb33$9kc$1@ger.gmane.org>
References: <20091115163618.GA3317@jama>
	<hdr31n$8b0$1@ger.gmane.org>	<1258364356.5799.94.camel@dax.rpnet.com>	<20091122190547.GC3349@jama>
	<hedfru$gol$1@ger.gmane.org>	<1258978516.10321.79.camel@dax.rpnet.com>	<hee2r8$bav$1@ger.gmane.org>	<1258986598.10321.99.camel@dax.rpnet.com>	<hee82a$td1$1@ger.gmane.org>
	<20091123151256.GH3349@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <20091123151256.GH3349@jama>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SRCPV migration - How SRCPV works!
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
X-List-Received-Date: Mon, 23 Nov 2009 15:53:47 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-11-09 16:12, Martin Jansa wrote:
> On Mon, Nov 23, 2009 at 04:00:26PM +0100, Koen Kooi wrote:
>> On 23-11-09 15:29, Richard Purdie wrote:
>>> On Mon, 2009-11-23 at 14:31 +0100, Koen Kooi wrote:
>>>> On 23-11-09 13:15, Richard Purdie wrote:
>>>>
>>>>> As I understand it you'll lock locking down the local build revisions
>>>>> with Angstrom anyway?
>>>>
>>>> Dunno about that, ideally the SRCPV merge should have no impact at all
>>>> on existing distros, but it looks like everyone will be forced to lock
>>>> revisions/counts down.
>>>
>>> How is locking the counts down using LOCALCOUNT any different to the
>>> current situation?
>>
>> In the current situation you lock down SRCREV and change PV,PR
>> accordingly. In the new world you lock down SRCREV, increase
>> localcount (per recipe or globally) and change PV,PR accordingly.
>
> Why do you need to change PV,PR if you bump LOCALCOUNT?

Because the version might have gone from 1.4 to 1.6?

regards,

Koen

>
>> I just went from a 2 step error prone situation to a 3 step error
>> prone situation. And I need to track an *extra* variable as well
>> now.
>
> I see only 1 step in one place (SRCREV+LOCALCOUNT in sane-srcrevs or
> recipe). And as long as its in the same file, it can be a bit less
> error-prone then change of SRCREV in sane-srcrevs and PV/PR bump in
> recipe.
>
>> regards,
>
> regards,
>




