Received: from exprod5og108.obsmtp.com ([64.18.0.186])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1Nq0jh-0006fI-Bf
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Mar 2010 10:00:53 +0100
Received: from source ([12.43.191.1]) (using TLSv1) by
	exprod5ob108.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS5oCDtyx0SOLTDdoH1dxyZ9Op7GKCQS7@postini.com;
	Fri, 12 Mar 2010 00:57:52 PST
Received: from unknown (HELO cinmlip01.e2k.ad.ge.com) ([3.159.213.48])
	by Alpmlip09.e2k.ad.ge.com with ESMTP; 12 Mar 2010 03:57:45 -0500
Received: from es-j7s4d2j.amer.consind.ge.com (HELO [3.138.54.92])
	([3.138.54.92])
	by cinmlip01.e2k.ad.ge.com with ESMTP; 12 Mar 2010 03:57:44 -0500
Message-ID: <4B9A02C9.3030205@ge.com>
Date: Fri, 12 Mar 2010 09:00:57 +0000
From: Martyn Welch <martyn.welch@ge.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: Richard Purdie <rpurdie@rpsys.net>
References: <20100310103133.14548.62608.stgit@ES-J7S4D2J.amer.consind.ge.com>
	<1268341295.1625.7.camel@rex>
In-Reply-To: <1268341295.1625.7.camel@rex>
X-SA-Exim-Connect-IP: 64.18.0.186
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Allow spectrum fw to build behind a proxy
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
X-List-Received-Date: Fri, 12 Mar 2010 09:00:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> On Wed, 2010-03-10 at 10:31 +0000, Martyn Welch wrote:
>   
>> Spectrum-fw runs a script which uses curl, wget or ftp to pull an archive
>> rather than the archive being a part of the SRC_URI. Whilst it would
>> probably be preferable to pull this as part of the SRC_URI (incidentally,
>> if it was, the script wouldn't need to be modified), the "&" in the archive
>> name has foiled my attempts at doing that.
>>
>> This patch modifies the script to at least use the "FETCHCMD_wget" variable
>> which can be provided to help when accessing through a proxy.
>>     
>
> How about the recipe in Poky for this
> (meta/packages/orinoco/spectrum-fw.bb)? I think all these problems were
> addressed there.
>   
I tried exactly that first, wget keeps trying to download:

"ftp://symstore.longisland.com/Symstore/services_download/wirless_prod/MC"

not:

"ftp://symstore.longisland.com/Symstore/services_download/wirless_prod/MC&DriverOnlyInstallers.zip"

Has Bitbake been patched up in poky to handle "&" differently?

Martyn

-- 
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189



