Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P8H0u-0005cL-R2
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 20:34:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 4827F31491A1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 20:33:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id M8zsUJY-KdN5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 20:33:40 +0200 (CEST)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 083E9314915D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 20:33:40 +0200 (CEST)
Message-ID: <4CBDE483.3030002@opendreambox.org>
Date: Tue, 19 Oct 2010 20:33:39 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.12) Gecko/20100915 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1287506184-13086-1-git-send-email-obi@opendreambox.org>	<1287507624-29362-1-git-send-email-obi@opendreambox.org>
	<AANLkTikVU2M3gEC_Zd4PTPys_Er4x+uU0txYw5BftQVJ@mail.gmail.com>
In-Reply-To: <AANLkTikVU2M3gEC_Zd4PTPys_Er4x+uU0txYw5BftQVJ@mail.gmail.com>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] dvdauthor-0.6.18: initial recipe
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
X-List-Received-Date: Tue, 19 Oct 2010 18:34:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/19/2010 07:32 PM, Frans Meulenbroeks wrote:
> 2010/10/19 Andreas Oberritter <obi@opendreambox.org>:
>> * v2: updated DESCRIPTION, SECTION and PRIORITY
>>
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> ---
>>  recipes/dvdauthor/dvdauthor_0.6.18.bb |   13 +++++++++++++
>>  1 files changed, 13 insertions(+), 0 deletions(-)
>>  create mode 100644 recipes/dvdauthor/dvdauthor_0.6.18.bb
>>
>> diff --git a/recipes/dvdauthor/dvdauthor_0.6.18.bb b/recipes/dvdauthor/dvdauthor_0.6.18.bb
>> new file mode 100644
>> index 0000000..24f3a74
>> --- /dev/null
>> +++ b/recipes/dvdauthor/dvdauthor_0.6.18.bb
>> @@ -0,0 +1,13 @@
>> +DESCRIPTION = "A set of tools to help you generate DVD files to be played back on a standalone DVD player"
>> +SECTION = "console/multimedia"
>> +PRIORITY = "optional"
>> +LICENSE = "GPLv2"
> 
> Have you verified this is v2 and not v2 or later (aka v2+)?

Has there been an agreement on the correct notation of the commonly used
licenses? I don't quite get why making a difference between v2 and v2+
is important for OE, because v2+ can still be distributed as v2, if you
choose to. The only difference is that packages like the Linux kernel
can not be distributed as v3 or later, but what would be the benefit for
OE and its users in that case anyway?

Also, v2 could mean "the original unmodified license v2, which includes
the or-any-later-version-if-specified-in-the-program clause", while v2+
might suggest a modified v2 license.

Then, there was a recent commit, which changed GPL to GPLv2, while the
commit message suggested that GPLv2+ was the dominant license in that
package [1].

Having said that, there are some files in dvdauthor, which contain a
header stating that later versions of the GPL may be used, but not every
file contains such a header. Therefore, the safe choice is to use GPLv2,
which is what COPYING says, because I cannot assume that every file,
which does not include such a header, is safe to distribute under v3 or
later.

Btw.: Debian is very picky about licenses, but does not offer a separate
license file for GPL-v2-but-not-later programs in
/usr/share/common-licenses.

Regards,
Andreas

[1]
http://cgit.openembedded.net/cgit.cgi/openembedded/commit/?h=master&id=860f2947b54a29becb4686261026c205bf3b9358


