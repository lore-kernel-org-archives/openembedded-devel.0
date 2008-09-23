Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ki6VT-0007Di-Ot
	for openembedded-devel@openembedded.org; Tue, 23 Sep 2008 13:56:39 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Ki6S3-0001GB-PO
	for openembedded-devel@openembedded.org; Tue, 23 Sep 2008 11:53:07 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 23 Sep 2008 11:53:07 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 23 Sep 2008 11:53:07 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 23 Sep 2008 13:52:58 +0200
Message-ID: <gbalaq$39s$1@ger.gmane.org>
References: <20080923110049.B007318806A@amethyst.openembedded.net>
	<48D8D5B3.8010708@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080912030722 Shredder/3.0b1pre
In-Reply-To: <48D8D5B3.8010708@gmx.de>
Sender: news <news@ger.gmane.org>
Subject: Re: [oe-commits] : zaurus-2.6.inc: a string always is true, so test for the contents of it
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
X-List-Received-Date: Tue, 23 Sep 2008 11:56:39 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thomas Kunze wrote:
> OE GIT Trial schrieb:
>> Module: OE.dev
>> Branch: org.openembedded.dev
>> Commit: 51e5f5be04d699828ab2f4a28e62ed6c789fb283
>> URL:
>> http://gitweb.openembedded.net//OE.dev.git/?a=commit;h=51e5f5be04d699828ab2f4a28e62ed6c789fb283
>>
>>
>> Author: <koen@openembedded.org>
>> Date: Tue Sep 23 10:41:38 2008 +0000
>>
>> zaurus-2.6.inc: a string always is true, so test for the contents of it
>>
>> ---
>>
>> conf/machine/include/zaurus-2.6.inc | 2 +-
>> 1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/conf/machine/include/zaurus-2.6.inc
>> b/conf/machine/include/zaurus-2.6.inc
>> index 5e8f34f..a688f2f 100644
>> --- a/conf/machine/include/zaurus-2.6.inc
>> +++ b/conf/machine/include/zaurus-2.6.inc
>> @@ -52,7 +52,7 @@ zaurus_make_installkit () {
>> mkdir ${IMAGE_NAME}-installkit/
>>
>> # Get the latest kernel using the zImage-<machine>.bin symlink
>> - if [ "${@base_contains('MACHINE_FEATURES', 'kexecboot', 'true',
>> 'false',d)}" ]; then
>> + if [ "${@base_contains('MACHINE_FEATURES', 'kexecboot', 'true',
>> 'false',d)}" = "true" ]; then

> Did you test the other solution? I meant to put the programcall 'true'
> or 'false' in there. But I think I didn't test the negative case.

I did not test that yet, since I want to get a 'normal' boot working 
first on this &*$@*$(@ c700.

regards,

Koen



