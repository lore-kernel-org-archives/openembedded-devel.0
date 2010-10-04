Received: from smtp3.nedap.com ([87.249.123.12] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1P2gC9-0007g3-Kz
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 10:14:53 +0200
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Mon, 4 Oct 2010 10:14:40 +0200
X-TM-IMSS-Message-ID: <06284f1800001198@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 06284f1800001198 for
	<jaap.dejong@nedap.com>; Mon, 4 Oct 2010 10:14:36 +0100
Message-ID: <4CA98CEF.3090604@nedap.com>
Date: Mon, 04 Oct 2010 10:14:39 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.12) Gecko/20100915 Lightning/1.0b1 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CA97897.4020001@nedap.com> <4CA97EBC.4040406@eukrea.com>
In-Reply-To: <4CA97EBC.4040406@eukrea.com>
X-OriginalArrivalTime: 04 Oct 2010 08:14:40.0143 (UTC)
	FILETIME=[312F69F0:01CB639C]
X-SA-Exim-Connect-IP: 87.249.123.12
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: trouble compiling udev
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
X-List-Received-Date: Mon, 04 Oct 2010 08:14:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Thanks!
That seems to work!!
Something to be added to udev recipe...

On 10/04/2010 09:14 AM, Eric Bénard wrote:
> Hi,
>
> Le 04/10/2010 08:47, Jaap de Jong a écrit :
>> a fresh rebuild failed in compiling udev.
>> Any clues?
>
> if you are using gcc 4.5 => add CFLAGS_append = " -Os"
>  to udev recipe.
>
> Eric
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


