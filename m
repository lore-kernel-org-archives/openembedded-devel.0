Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MLi38-0002A9-UF
	for openembedded-devel@openembedded.org; Tue, 30 Jun 2009 20:27:23 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MLhrh-0000F6-4P
	for openembedded-devel@openembedded.org; Tue, 30 Jun 2009 18:15:33 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 30 Jun 2009 18:15:33 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 30 Jun 2009 18:15:33 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 30 Jun 2009 20:15:18 +0200
Message-ID: <h2dknm$t4n$1@ger.gmane.org>
References: <4A41C00B.3030409@tait.co.nz>	<1245882237-30230-1-git-send-email-denis@denix.org>
	<20090629174435.GD5905@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090622 Shredder/3.0b3pre
In-Reply-To: <20090629174435.GD5905@denix.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH] /etc/profile: stricter root PATH - require absolute pathname for bins in cwd
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
X-List-Received-Date: Tue, 30 Jun 2009 18:27:23 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29-06-09 19:44, Denys Dmytriyenko wrote:
> On Wed, Jun 24, 2009 at 06:23:57PM -0400, Denys Dmytriyenko wrote:
>> Having current directory (either '.' or empty string) in PATH is considered
>> dangerous for root.
>>
>> Signed-off-by: Denys Dmytriyenko<denis@denix.org>
>> Acked-by: Phil Blundell<philb@gnu.org>
>> Acked-by: Koen Kooi<koen@openembedded.org>

Acked-by: Koen Kooi <koen@openembedded.org>


>> ---
>>   recipes/base-files/base-files/profile |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/base-files/base-files/profile b/recipes/base-files/base-files/profile
>> index 5797535..b5ce69d 100644
>> --- a/recipes/base-files/base-files/profile
>> +++ b/recipes/base-files/base-files/profile
>> @@ -12,7 +12,7 @@ if [ ! -e /etc/localtime ]; then
>>   fi
>>
>>   if [ "`id -u`" -eq 0 ]; then
>> -   PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin:
>> +   PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
>>   fi
>>   if [ "$PS1" ]; then
>>   # works for bash and ash (no other shells known to be in use here)
>> --
>> 1.6.0.6
>>
>
> ping?




