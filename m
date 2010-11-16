Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PIR0i-0004cb-J7 for openembedded-devel@lists.openembedded.org;
	Tue, 16 Nov 2010 20:16:09 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PIQzg-0007Fg-G1 for openembedded-devel@lists.openembedded.org;
	Tue, 16 Nov 2010 20:15:04 +0100
Received: from 76.205.222.173 ([76.205.222.173])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 20:15:04 +0100
Received: from harvey.tim by 76.205.222.173 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 20:15:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Tim Harvey <harvey.tim@gmail.com>
Date: Tue, 16 Nov 2010 10:52:30 -0800
Message-ID: <ibujte$daf$1@dough.gmane.org>
References: <1289930468-7867-1-git-send-email-harvey.tim@gmail.com>
	<AANLkTinNfK87ceiCPVZXehvuMweZfp+jFQwio_Wu4QtN@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: 76.205.222.173
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101027 Lightning/1.0b1 Thunderbird/3.0.10
In-Reply-To: <AANLkTinNfK87ceiCPVZXehvuMweZfp+jFQwio_Wu4QtN@mail.gmail.com>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_NUMERIC_HELO,SPF_HELO_PASS,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] iftop: new recipe
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
X-List-Received-Date: Tue, 16 Nov 2010 19:16:09 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/16/2010 10:09 AM, Khem Raj wrote:
> On Tue, Nov 16, 2010 at 10:01 AM, Tim Harvey<harvey.tim@gmail.com>  wrote:
>> Signed-off-by: Tim Harvey<harvey.tim@gmail.com>
>> ---
>>   recipes/iftop/iftop_0.17.bb |   11 +++++++++++
>>   1 files changed, 11 insertions(+), 0 deletions(-)
>>   create mode 100644 recipes/iftop/iftop_0.17.bb
>>
>> diff --git a/recipes/iftop/iftop_0.17.bb b/recipes/iftop/iftop_0.17.bb
>> new file mode 100644
>> index 0000000..2cfa441
>> --- /dev/null
>> +++ b/recipes/iftop/iftop_0.17.bb
>> @@ -0,0 +1,11 @@
>> +DESCRIPTION = "Network usage monitor"
>> +HOMEPAGE = "http://www.ex-parrot.com/pdw/iftop/"
>> +SECTION = "console/network"
>> +LICENSE = "GPLv2"
>
> I read the license it should be GPLv2+ sorry

ok - I understand now.  If the license states 'at your option any later 
version' it is GPLv2+ (or later)

Has documentation regarding LICENSE been pushed into OE docs or wiki yet 
(I couldn't find a good explanation that included this GPLv2+ case)?  I 
know its been discussed quite a bit on maillist.

I'm resubmitting both recipes with proper LICENSE.

Thanks,

Tim

>
>> +DEPENDS = "libpcap ncurses"
>> +
>> +SRC_URI = "http://www.ex-parrot.com/pdw/iftop/download/iftop-${PV}.tar.gz"
>> +SRC_URI[md5sum] = "062bc8fb3856580319857326e0b8752d"
>> +SRC_URI[sha256sum] = "d032547c708307159ff5fd0df23ebd3cfa7799c31536fa0aea1820318a8e0eac"
>> +
>> +inherit autotools
>> --
>> 1.7.0.4
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




