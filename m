Received: from [85.115.52.190] (helo=cluster-a.mailcontrol.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Matteo.Fortini@mta.it>) id 1MGE9i-0004To-OG
	for openembedded-devel@openembedded.org; Mon, 15 Jun 2009 17:31:30 +0200
Received: from mailserver.mta.int (mail.mta.it [89.96.171.250])
	by rly12a.srv.mailcontrol.com (MailControl) with ESMTP id
	n5FFLDdE020869 for <openembedded-devel@openembedded.org>;
	Mon, 15 Jun 2009 16:21:14 +0100
Received: from mta-digicas.MTA.INT ([172.26.10.13]) by mailserver.mta.int with
	Microsoft SMTPSVC(6.0.3790.3959); Mon, 15 Jun 2009 17:21:12 +0200
Received: from [172.26.6.74] (172.26.6.74) by mta-digicas.mta.int
	(172.26.10.8) with Microsoft SMTP Server (TLS) id 8.1.336.0;
	Mon, 15 Jun 2009 17:21:12 +0200
Message-ID: <4A3666E5.4040304@mta.it>
Date: Mon, 15 Jun 2009 17:21:09 +0200
From: Matteo Fortini <matteo.fortini@mta.it>
User-Agent: Thunderbird 2.0.0.21 (Windows/20090302)
MIME-Version: 1.0
To: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
References: <4A365C10.8020307@mta.it>
	<c384c5ea0906150803v223fc517se185b7fbe8a4859e@mail.gmail.com>
In-Reply-To: <c384c5ea0906150803v223fc517se185b7fbe8a4859e@mail.gmail.com>
X-OriginalArrivalTime: 15 Jun 2009 15:21:12.0448 (UTC)
	FILETIME=[EAC24000:01C9EDCC]
X-Scanned-By: MailControl A-09-00-10 (www.mailcontrol.com) on 10.65.0.122
Subject: Re: nof/libgcc_s.so installed instead of libgcc_s.so on powerpc
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
X-List-Received-Date: Mon, 15 Jun 2009 15:31:30 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

I'm building on i686 a cross compiler for the mpc5121.

The machine description I'm using is:

TARGET_ARCH = "powerpc"
TARGET_FPU = "hard"

PREFERRED_PROVIDER_virtual/kernel = "linux-${MACHINE}"
PREFERRED_PROVIDER_virtual/kernel = "linux"

MACHINE_FEATURES = "kernel26 usbhost alsa touchscreen"

#don't try to access tty1
USE_VT = "0"

SERIAL_CONSOLE = "115200 ttyPSC0"

EXTRA_IMAGECMD_jffs2 = "--pad --big-endian --eraseblock=0x020000 -v -x lzo"

#tune for the MPC5121e cpu
require conf/machine/include/tune-ppce300c3.inc


Leon Woestenberg ha scritto:
> Hello Matteo,
>
> On Mon, Jun 15, 2009 at 4:34 PM, Matteo Fortini<matteo.fortini@mta.it> wrote:
>   
>> I'm building the Angstrom console-image on a powerpc (mpc5121) with
>> stable/2009.
>>
>>     
> Just to be sure: You are building OpenEmbedded *on* a MPC5121 platform?
>
> For what machine are you building?
>
> Regards,
>
> Leon.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>   

-


