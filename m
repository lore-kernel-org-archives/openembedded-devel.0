Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RGAzT-0007UH-1o
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 16:50:03 +0200
Received: by pzk33 with SMTP id 33so1755794pzk.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 07:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=KgfmKrI2U2HXfW8bF3qqQ4Cik82IDF2JxcWduyiG29c=;
	b=Ec+H40xvgpzj82dbtEGEmFW4VWvdWWrTO/n0LyNRPOBoDZDosvZwotKUIy7Wd5KzxN
	HXI5O4KyLrTbzEOe5YPCOb4U60J6RcgGJo3ANuDrlEKY4bkqZbE2akrSlp8JMAXkXaay
	w+daVtYrOlIa+J0CtMOZa9JLlW5VgJOMsDR2U=
Received: by 10.68.29.101 with SMTP id j5mr5310065pbh.61.1318949051645;
	Tue, 18 Oct 2011 07:44:11 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net.
	[99.57.141.118])
	by mx.google.com with ESMTPS id ml4sm8078290pbc.0.2011.10.18.07.44.10
	(version=SSLv3 cipher=OTHER); Tue, 18 Oct 2011 07:44:10 -0700 (PDT)
Message-ID: <4E9D90B6.3070604@gmail.com>
Date: Tue, 18 Oct 2011 07:44:06 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E9C93AB.7090705@telia.com> <4E9CA882.7080107@gmail.com>
	<4E9D16AD.7040403@telia.com>
In-Reply-To: <4E9D16AD.7040403@telia.com>
Subject: Re: Performance measurement: Building openembedded-core with and without overclocking on C-i7 2600K
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
X-List-Received-Date: Tue, 18 Oct 2011 14:50:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/2011 11:03 PM, Ulf Samuelsson wrote:
> My comparision between 2 similar machines indicate that
> 32 bit 11.04 with Psyco-Dist is 20% faster than 64 bit with 11.04
>

thats why I wanted to know if they were exactly same machine. Better to 
reinstall may be. I dont rule out that 32bit cant be faster but we need 
to measure it

> The machine running 64 bit 11.04 was tested with 32 bit 11.04
> using an external disk (connected through e-SATA) and results
> were very close to the numbers for the other 32 bit machine
>


> I didn't save those numbers but I think that is good enough
> to draw the conclusion that adding JIT for 64 bit (PyPy?) will reduce build
> time significantly.

Thats what I am interested in. If pypy would make it faster than
we could recommend it.



