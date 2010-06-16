Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1OOrn1-0001mw-Ek
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 14:32:20 +0200
Received: (qmail 4623 invoked by uid 1003); 16 Jun 2010 12:27:47 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 16 Jun 2010 12:27:47 -0000
Message-ID: <4C18C342.2010304@balister.org>
Date: Wed, 16 Jun 2010 08:27:46 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-3.fc13 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <hva2uj$jco$2@dough.gmane.org>
	<20100616095322.180eb9b5@xora-desktop.xora.org.uk>
In-Reply-To: <20100616095322.180eb9b5@xora-desktop.xora.org.uk>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: virtual/opkg-dev breaks task-sdk-native, please revert
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
X-List-Received-Date: Wed, 16 Jun 2010 12:32:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/16/2010 04:53 AM, Graeme Gregory wrote:
> On Wed, 16 Jun 2010 10:45:07 +0200
> Koen Kooi<k.kooi@student.utwente.nl>  wrote:
>
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Hi,
>>
>> I noticed that
>> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=eeffe0a6eee97604679cf9a3cf40ed4604ae6493
>> breaks lots of things:
>>
>> * a dependency loop in 'bitbake task-sdk-native'
>> * using virtual/ namespace in packages instead of recipes.
>>
>> I propose to revert this change and just remove the ?pkg-dev from the
>> sdk tasks.
>>
> virtual/ in package space is always wrong as it blows up on at least
> one of our supported package types.
>
> Acked-by: Graeme Gregory<dp@xora.org.uk>

Acked-by: Philip Balister <philip@balister.org>

>
> Graeme
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


