Received: from smtp2.nedap.com ([213.160.213.92] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1QbUyM-0004dT-Kn
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jun 2011 11:52:46 +0200
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Tue, 28 Jun 2011 11:49:05 +0200
X-TM-IMSS-Message-ID: <069ab8e300003fae@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 069ab8e300003fae ;
	Tue, 28 Jun 2011 11:49:05 +0200
Message-ID: <4E09A393.2050000@nedap.com>
Date: Tue, 28 Jun 2011 11:49:07 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <4E09926B.2000406@nedap.com>
	<BANLkTikvCycdv2g58Z_m3_14yj=nA9-+xg@mail.gmail.com>
In-Reply-To: <BANLkTikvCycdv2g58Z_m3_14yj=nA9-+xg@mail.gmail.com>
X-OriginalArrivalTime: 28 Jun 2011 09:49:05.0688 (UTC)
	FILETIME=[9E683980:01CC3578]
Subject: Re: how to change system files
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
X-List-Received-Date: Tue, 28 Jun 2011 09:52:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 06/28/2011 11:23 AM, Anders Darander wrote:
> On Tue, Jun 28, 2011 at 10:35, Jaap de Jong<jaap.dejong@nedap.com>  wrote:
>> What is the best way to change files like /etc/network/interfaces?
>> I have about 5 files or so that already are supplied by (default) packages;
>> they are not in 1 package.
>> I would like to have them in one package that I own so that I can easily
>> update them, but this is not necessary.
>> Is overlays the way to go?
> I'm handling this by using .bbappend's in a local layer.
> This won't give you one package, rather the ability to replace/add files (e.g.
> /etc/network/interfaces) in the standard packages.
>
Yeah, but what if I decide at a certain point in time to change the 
/etc/network/interfaces file?
Normally I would increment PR in the bb file and then build it.
And finally at the target I would do opkg upgrade.

Jaap


