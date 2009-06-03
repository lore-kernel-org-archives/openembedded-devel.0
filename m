Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MBux5-0005LA-H6
	for openembedded-devel@openembedded.org; Wed, 03 Jun 2009 20:12:39 +0200
Received: (qmail 31137 invoked from network); 3 Jun 2009 18:03:40 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 3 Jun 2009 11:03:40 -0700
Date: Wed, 3 Jun 2009 11:03:36 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090603180336.GN26065@smtp.west.cox.net>
References: <20090603151754.GI26065@smtp.west.cox.net>
	<1244043442-3868-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-2-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-3-git-send-email-ihar.hrachyshka@gmail.com>
	<20090603160007.GJ26065@smtp.west.cox.net>
	<h069pd$tf0$1@ger.gmane.org>
	<20090603173600.GM26065@smtp.west.cox.net>
	<h06ctk$8lc$2@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <h06ctk$8lc$2@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
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
X-List-Received-Date: Wed, 03 Jun 2009 18:12:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 03, 2009 at 07:46:28PM +0200, Koen Kooi wrote:
> On 03-06-09 19:36, Tom Rini wrote:
>> On Wed, Jun 03, 2009 at 06:53:01PM +0200, Koen Kooi wrote:
>>> On 03-06-09 18:00, Tom Rini wrote:
>>>> On Wed, Jun 03, 2009 at 06:37:12PM +0300, Ihar Hrachyshka wrote:
>>>>> Signed-off-by: Ihar Hrachyshka<ihar.hrachyshka@gmail.com>
>>>>> ---
>>>>>    recipes/qt4/qt4-embedded.inc |    4 ++--
>>>>>    1 files changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/recipes/qt4/qt4-embedded.inc b/recipes/qt4/qt4-embedded.inc
>>>>> index bae52ab..3d986b2 100644
>>>>> --- a/recipes/qt4/qt4-embedded.inc
>>>>> +++ b/recipes/qt4/qt4-embedded.inc
>>>>> @@ -3,7 +3,7 @@ SECTION = "libs"
>>>>>    LICENSE = "GPL QPL"
>>>>>    PRIORITY = "optional"
>>>>>    HOMEPAGE = "http://www.trolltech.com"
>>>>> -DEPENDS += "tslib"
>>>>> +DEPENDS += "directfb tslib"
>>>>>    INC_PR = "r11"
>>>>
>>>> So, here's a problem.  We both don't allow use flags and we force
>>>> directfb stuff to be done in foo-directfb (libxine / synaesthesia seems
>>>> to be the exception to this rule) rather than the main foo package.
>>>
>>> Isn't this just creating a qt-gfxdriver-directfb.so and not impose
>>> runtime deps on directfb in ${PN}?
>>
>> But how much stuff is now going to pick up "Oh, we have directfb" ?  Or
>> are you sure everything is already passing --disable-directfb that might
>> default to auto?
>
> That would be bugs in other recipes, and fixing those is out of scope  
> for this patchset.

If it works for you, works for me, un-objecting here.

-- 
Tom Rini


