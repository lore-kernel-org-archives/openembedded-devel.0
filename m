Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MhPIu-0008Br-GW for openembedded-devel@lists.openembedded.org;
	Sat, 29 Aug 2009 16:53:22 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1MhP1D-0002g6-Ej
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Aug 2009 16:35:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Aug 2009 16:35:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Aug 2009 16:35:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 29 Aug 2009 16:34:21 +0200
Message-ID: <h7be9d$lrj$1@ger.gmane.org>
References: <200907011817.02564.marcin@juszkiewicz.com.pl>	<1246474461-16671-9-git-send-email-marcin@juszkiewicz.com.pl>
	<fce2a370908280737n25668cdi7cacd82a8a141499@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <fce2a370908280737n25668cdi7cacd82a8a141499@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 014/125] qemu-native.inc : force qemu native to use our C/LDFLAGS so that you don't need the required dev packages installed on host. Use our OE versions
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
X-List-Received-Date: Sat, 29 Aug 2009 14:53:24 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28-08-09 16:37, Ihar Hrachyshka wrote:
> Any chance our stable maintainers will check the patch? :-\

ISTR that I gave a global ack on the patchset

regards,

Koen


> On Wed, Jul 1, 2009 at 9:54 PM, Marcin
> Juszkiewicz<marcin@juszkiewicz.com.pl>  wrote:
>> From: Graeme Gregory<dp@xora.org.uk>
>>
>>
>> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
>> ---
>>   recipes/qemu/qemu-native.inc |    3 +++
>>   1 files changed, 3 insertions(+), 0 deletions(-)
>>
>> diff --git a/recipes/qemu/qemu-native.inc b/recipes/qemu/qemu-native.inc
>> index e4064a2..9edad66 100644
>> --- a/recipes/qemu/qemu-native.inc
>> +++ b/recipes/qemu/qemu-native.inc
>> @@ -1,3 +1,6 @@
>>   inherit native
>>
>>   DEPENDS = "libsdl-native zlib-native"
>> +
>> +export OS_CFLAGS="${CFLAGS} ${LDFLAGS}"
>> +
>> --
>> 1.6.3.1
>>
>>
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




