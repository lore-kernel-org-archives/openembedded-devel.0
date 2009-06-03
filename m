Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MBuju-0004vL-Id
	for openembedded-devel@openembedded.org; Wed, 03 Jun 2009 19:59:02 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MBubC-0001Ab-B1
	for openembedded-devel@openembedded.org; Wed, 03 Jun 2009 17:50:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 03 Jun 2009 17:50:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 03 Jun 2009 17:50:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 03 Jun 2009 19:46:28 +0200
Message-ID: <h06ctk$8lc$2@ger.gmane.org>
References: <20090603151754.GI26065@smtp.west.cox.net>	<1244043442-3868-1-git-send-email-ihar.hrachyshka@gmail.com>	<1244043442-3868-2-git-send-email-ihar.hrachyshka@gmail.com>	<1244043442-3868-3-git-send-email-ihar.hrachyshka@gmail.com>	<20090603160007.GJ26065@smtp.west.cox.net>	<h069pd$tf0$1@ger.gmane.org>
	<20090603173600.GM26065@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090526 Shredder/3.0b3pre
In-Reply-To: <20090603173600.GM26065@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH 02/12] qt4-embedded: added directfb plugin
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
X-List-Received-Date: Wed, 03 Jun 2009 17:59:02 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03-06-09 19:36, Tom Rini wrote:
> On Wed, Jun 03, 2009 at 06:53:01PM +0200, Koen Kooi wrote:
>> On 03-06-09 18:00, Tom Rini wrote:
>>> On Wed, Jun 03, 2009 at 06:37:12PM +0300, Ihar Hrachyshka wrote:
>>>> Signed-off-by: Ihar Hrachyshka<ihar.hrachyshka@gmail.com>
>>>> ---
>>>>    recipes/qt4/qt4-embedded.inc |    4 ++--
>>>>    1 files changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/recipes/qt4/qt4-embedded.inc b/recipes/qt4/qt4-embedded.inc
>>>> index bae52ab..3d986b2 100644
>>>> --- a/recipes/qt4/qt4-embedded.inc
>>>> +++ b/recipes/qt4/qt4-embedded.inc
>>>> @@ -3,7 +3,7 @@ SECTION = "libs"
>>>>    LICENSE = "GPL QPL"
>>>>    PRIORITY = "optional"
>>>>    HOMEPAGE = "http://www.trolltech.com"
>>>> -DEPENDS += "tslib"
>>>> +DEPENDS += "directfb tslib"
>>>>    INC_PR = "r11"
>>>
>>> So, here's a problem.  We both don't allow use flags and we force
>>> directfb stuff to be done in foo-directfb (libxine / synaesthesia seems
>>> to be the exception to this rule) rather than the main foo package.
>>
>> Isn't this just creating a qt-gfxdriver-directfb.so and not impose
>> runtime deps on directfb in ${PN}?
>
> But how much stuff is now going to pick up "Oh, we have directfb" ?  Or
> are you sure everything is already passing --disable-directfb that might
> default to auto?

That would be bugs in other recipes, and fixing those is out of scope 
for this patchset.

regards,

Koen



