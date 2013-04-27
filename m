Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1UW2kA-0002wW-6n
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Apr 2013 12:52:39 +0200
Received: (qmail 28761 invoked by uid 1003); 27 Apr 2013 10:34:51 -0000
Received: from unknown (HELO ?192.168.1.106?)
	(philip@opensdr.com@71.171.26.125)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	27 Apr 2013 10:34:51 -0000
Message-ID: <517BA9C6.6090707@balister.org>
Date: Sat, 27 Apr 2013 06:34:46 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1367008757-18667-1-git-send-email-nicolas.dechesne@linaro.org>
	<klesac$abk$1@ger.gmane.org> <68356141.McDxtR3Bre@helios>
In-Reply-To: <68356141.McDxtR3Bre@helios>
X-Enigmail-Version: 1.5.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] smartmontools: import from OE classic
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
X-List-Received-Date: Sat, 27 Apr 2013 10:52:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 04/27/2013 04:24 AM, Paul Eggleton wrote:
> On Friday 26 April 2013 23:41:38 Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Op 26-04-13 22:39, Nicolas Dechesne schreef:
>>> Import smartmontools recipe from OE classic, and updated to upstream
>>> v5.40.
>>>
>>> Also added cosmetic changes in the recipe: INC_PR support and homepage.
>>>
>>> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org> ---
>>> meta-oe/recipes-support/smartmontools/smartmontools.inc     | 10
>>> ++++++++++ meta-oe/recipes-support/smartmontools/smartmontools_5.40.bb |
>>> 5 +++++ 2 files changed, 15 insertions(+) create mode 100644
>>> meta-oe/recipes-support/smartmontools/smartmontools.inc create mode
>>> 100644 meta-oe/recipes-support/smartmontools/smartmontools_5.40.bb
>>>
>>> diff --git a/meta-oe/recipes-support/smartmontools/smartmontools.inc
>>> b/meta-oe/recipes-support/smartmontools/smartmontools.inc new file mode
>>> 100644 index 0000000..6f23055 --- /dev/null +++
>>> b/meta-oe/recipes-support/smartmontools/smartmontools.inc @@ -0,0 +1,10
>>> @@ +SECTION = "console/utils" +DESCRIPTION = "Control and monitor storage
>>> systems using S.M.A.R.T." +HOMEPAGE =
>>> "http://smartmontools.sourceforge.net/" +LICENSE = "GPLv2"
>>> +LIC_FILES_CHKSUM =
>>> "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f" +INC_PR = "r1"
>>
>> Drop that
> 
> It would help for the sake of the uninitiated if you specified what to drop, 
> since your mail client has wrapped the quoted text incorrectly.
> 
>>> + +SRC_URI =
>>> "${SOURCEFORGE_MIRROR}/smartmontools/smartmontools-${PV}.tar.gz" +
>>> +inherit autotools diff --git
>>> a/meta-oe/recipes-support/smartmontools/smartmontools_5.40.bb
>>> b/meta-oe/recipes-support/smartmontools/smartmontools_5.40.bb new file
>>> mode 100644 index 0000000..93dc4db --- /dev/null +++
>>> b/meta-oe/recipes-support/smartmontools/smartmontools_5.40.bb @@ -0,0
>>> +1,5 @@ +require smartmontools.inc +PR = "${INC_PR}.1"
>>
>> And drop that.
>>
>> And do you really need a .inc?
> 
> Are we removing inc files if they were present in OE Classic? First I've heard 
> if we are...

If we are trying to reduce the number of versions of recipes we carry,
dropping .inc files would seem to be a good idea. I don't have strong
feelings, but it seems like something we should consider.

Philip


