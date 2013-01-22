Received: from [23.30.85.2] (helo=mail.breakawaysystems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dave@lambsys.com>) id 1Txgan-0004UY-Sk
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 17:21:06 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.breakawaysystems.com (Postfix) with ESMTP id C946F5861BC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2013 10:05:28 -0600 (CST)
Received: from mail.breakawaysystems.com ([127.0.0.1])
	by localhost (mail-breakaway.protnet [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id Tdjhi+sJbChO
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2013 10:05:22 -0600 (CST)
Received: from [192.168.1.100] (unknown [23.30.85.1])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: dlambert@breakawaysystems.com)
	by mail.breakawaysystems.com (Postfix) with ESMTPSA id B1EA0584865
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2013 10:05:22 -0600 (CST)
Message-ID: <50FEB8C2.4040907@lambsys.com>
Date: Tue, 22 Jan 2013 10:05:22 -0600
From: David Lambert <dave@lambsys.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <50FDF53C.90001@lambsys.com> <kdlhp2$cil$1@ger.gmane.org>
	<50FE8314.9080201@mlbassoc.com>
In-Reply-To: <50FE8314.9080201@mlbassoc.com>
Subject: Re: Angstrom Beaglebone broken again?
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
X-List-Received-Date: Tue, 22 Jan 2013 16:21:13 -0000
X-Groupsio-MsgNum: 42815
Content-Type: multipart/mixed; boundary="------------000105060809060403020208"

--------------000105060809060403020208
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/22/2013 06:16 AM, Gary Thomas wrote:
> On 2013-01-22 01:14, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Op 22-01-13 03:11, David Lambert schreef:
>>> Over the past few weeks I have noticed that builds based on the
>>> Angstrom/Beaglebone distribution have been unreliable. Notably
>>> systemd/udev issues. Now I noticed a new issue (log below). I 
>>> understand
>>> that a dynamically update system will have bugs from time to time, but
>>> this appears to be getting worse. Am I the only one who is noticing 
>>> this?
>>> If so, maybe I am doing something wrong. If not, is there any hope 
>>> of the
>>> issue stabilizing somewhat?
>>>
>>> Regards,
>>>
>>> Dave.
>>>
>>>
<-snipped error message->
>> That's a recipe managed by oe-core, so you;d have to complain to the
>> maintainers of that layer.
>
> Was this a build from scratch, or an update (build attempt in an already
> built tree)?  I've seen similar issues with some of the native recipes
> recently, but it normally is recoverable.  Try this:
>   % bitbake db-native -c cleansstate
>   % bitbake db-native
> If that works, you should be able to carry on.  If not, report back.
>
Thanks, that seemed to work. I was not familiar with the "cleansstate" 
target. Where is it (and others) documented?


--------------000105060809060403020208
Content-Type: text/x-vcard; charset=utf-8;
 name="dave.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="dave.vcf"

begin:vcard
fn:David Lambert
n:Lambert;David
org:Breakaway Systems LLC
adr:;;24703 Lakebriar Drive;Katy;TX;77494;USA
email;internet:dave@lambsys.com
title:President
tel;work:281 395-3439
tel;fax:281 395-0796
tel;cell:281 787-3648
url:breakawaysystems.com
version:2.1
end:vcard


--------------000105060809060403020208--
