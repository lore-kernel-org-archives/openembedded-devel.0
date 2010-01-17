Received: from smtpauth01.prod.mesa1.secureserver.net ([64.202.165.181])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1NWeES-0004YQ-Ju
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jan 2010 00:08:35 +0100
Received: (qmail 24462 invoked from network); 17 Jan 2010 23:06:17 -0000
Received: from unknown (209.242.7.187)
	by smtpauth01.prod.mesa1.secureserver.net (64.202.165.181) with ESMTP;
	17 Jan 2010 23:06:17 -0000
Message-ID: <4B5397E0.8010505@mwester.net>
Date: Sun, 17 Jan 2010 17:06:08 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1263760344-26105-1-git-send-email-eric@eukrea.com>	<hivtt3$v2r$1@ger.gmane.org>	<1263763723.5353.16.camel@mattotaupa.wohnung.familie-menzel.net>
	<ac9c93b11001171353p358c02a4k90cb3dd70240bc58@mail.gmail.com>
In-Reply-To: <ac9c93b11001171353p358c02a4k90cb3dd70240bc58@mail.gmail.com>
X-SA-Exim-Connect-IP: 64.202.165.181
X-SA-Exim-Mail-From: mike@mwester.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] barebox: Add recipe for this new bootloader
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
X-List-Received-Date: Sun, 17 Jan 2010 23:08:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Frans Meulenbroeks wrote:
> 2010/1/17 Paul Menzel <paulepanter@users.sourceforge.net>:
>> Am Sonntag, den 17.01.2010, 22:02 +0100 schrieb Koen Kooi:

>>> Please don't set variables to the current default value, but leave
>>> them
>>> out. We had tons of problems with vars getting copy/paste where the
>>> default changed and we had to manually fix those (e.g. efl.bbclass
>>> still
>>> pokes needlessly at PACKAGES).
>>>
>>> Setting PR is relatively minor, but lets stay consistent :)
>> Could someone please change this in the manual please [1].
>>
>> »It is good practice to always define PR in your recipes, even for the
>> "r0" release, so that when editing the recipe it is clear that the PR
>> number needs to be updated.«
>>
> Personally I'm in favour of the above good practice.
> I suggest to keep PR = "r0" in recipes
> 
> Frans

+1 on this.   The PR is such a common variable to set, and as Koen
observes setting it to zero is relatively minor.  I feel that its
presence in a recipe may help avoid the "forgot to bump PR" problems.

-Mike (mwester)


