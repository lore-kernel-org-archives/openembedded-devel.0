Received: from smtp2.nedap.com ([213.160.213.92] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1S9XLA-0001fq-5V
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Mar 2012 08:49:16 +0100
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.83.0; Mon, 19 Mar 2012
	08:40:21 +0100
X-TM-IMSS-Message-ID: <2cd8a07800140f27@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 2cd8a07800140f27 ;
	Mon, 19 Mar 2012 08:40:27 +0100
Message-ID: <4F66E2E5.4030108@nedap.com>
Date: Mon, 19 Mar 2012 08:40:21 +0100
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.27) Gecko/20120216 Lightning/1.0b2 Thunderbird/3.1.19
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <4F62FFB7.5070401@nedap.com>
	<20120316133328.GA13219@mi.fu-berlin.de>
In-Reply-To: <20120316133328.GA13219@mi.fu-berlin.de>
Subject: Re: remove dbg and dev packages
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
X-List-Received-Date: Mon, 19 Mar 2012 07:49:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

That was my first guess too.
If I remove them from the build/deploy/glibc/ipk/* directories and then 
do 'bitbake package-index' that would do the trick?
But I would have to remove them after every package I build...

On 03/16/2012 02:33 PM, Henning Heinold wrote:
> On Fri, Mar 16, 2012 at 09:54:15AM +0100, Jaap de Jong wrote:
>> Hi!
>>
>> is there an option (in local.conf?) to not build (or not add to the
>> repository of) the dbg and dev packages?
>>
>> Thanks!
>> Jaap
>
> Why dont write a shell skript which deletes all dbg and dev packages and calles the opkg index command afterwards?
>
> Bye Henning
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


