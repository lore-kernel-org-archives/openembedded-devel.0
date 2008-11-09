Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KzEAO-0001lZ-9n
	for openembedded-devel@openembedded.org; Sun, 09 Nov 2008 18:33:40 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KzE8g-000516-9v
	for openembedded-devel@openembedded.org; Sun, 09 Nov 2008 17:31:54 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 09 Nov 2008 17:31:54 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 09 Nov 2008 17:31:54 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 09 Nov 2008 18:31:46 +0100
Message-ID: <gf76q2$le2$1@ger.gmane.org>
References: <1226237296-11012-1-git-send-email-dbaryshkov@gmail.com>	<1226237296-11012-2-git-send-email-dbaryshkov@gmail.com>
	<1226249673.4235.671.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081025 Shredder/3.0b1pre
In-Reply-To: <1226249673.4235.671.camel@lenovo.internal.reciva.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] checksums.ini: correct wrong checksums
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
X-List-Received-Date: Sun, 09 Nov 2008 17:33:41 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09-11-2008 17:54, Phil Blundell wrote:
> On Sun, 2008-11-09 at 16:28 +0300, Dmitry Baryshkov wrote:
>>   [http://gpephone.linuxtogo.org/download/gpephone/libchenabler-0.1/libchenabler-0.1.tar.gz]
>> -md5=f29e1e63fcc55e3ae4e81f5ee9dd7bdd
>> -sha256=448a3ab76109664bb6bd8bcc2c62d957c7d44b52e39c37d91b3b73b5cfe35a3f
>> +md5=866fd13611a8de946428db1df9be8468
>> +sha256=74def55ba6a61e966e0873a4081fd3dd65089b94b837810d3bc056221d7e41c7
>
> How did these wrong checksums get in there?  It seems to defeat the
> point of checksums.ini if the data isn't trustworthy.

The gpephone people are in a habit of replacing the tarballs to get 
bugfixes to people instead of doing a new release. So the problem here 
is that _upstream_ is making a mess of things.
This also highlights why OE is now strictly enforcing checksums.



