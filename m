Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NeYpV-0003Dt-OQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 19:59:32 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NeYn2-00053m-E8 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 10:56:56 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 8 Feb 2010 10:56:56 -0800
Received: from 172.30.80.244 ([172.30.80.244]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Mon,  8 Feb 2010 18:55:59 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	08 Feb 2010 11:55:58 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b11002050222t477c1397t156282bcfb1df756@mail.gmail.com>
References: <ac9c93b11001230431s6a9dc637y370ad9999d82c83@mail.gmail.com>
	<d1b08f941001230513j5c017493s19838533588f33bc@mail.gmail.com>
	<ac9c93b11001261347x7a5f5bc3h9651448f9e9b0b49@mail.gmail.com>
	<ac9c93b11002050222t477c1397t156282bcfb1df756@mail.gmail.com>
Organization: Mentor Graphics Corporation
Date: Mon, 08 Feb 2010 11:55:58 -0700
Message-Id: <1265655358.16517.5.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-OriginalArrivalTime: 08 Feb 2010 18:56:56.0138 (UTC)
	FILETIME=[7C1D1AA0:01CAA8F0]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: packaged staging fails in do_deploy for kernel
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
X-List-Received-Date: Mon, 08 Feb 2010 18:59:33 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2010-02-05 at 11:22 +0100, Frans Meulenbroeks wrote:

> Andrea, I saw your message on irc saying that last night you hit the same issue.
> 
> The odd thing is that I have not seen the issue any more.
> 
> I have a hunch that it is time-stamp-related. That is also why I post
> here so others can share their $ 0.02.
> 
> My idea is that the granularityof the time stamps might not be good enough.
> Packaged staging restores the time stamps and based upon that the
> system decides that nothing has to be done after it.
> However the stamp for packaged staging is generated shortly after do_deploy.
> I believe the granularity of timestamps is one second. Not sure what
> the build system does if both files have an identical time.
> 
> Any expert opinion?

So, the general case of this problem should be fixed now.  We add
${S}/${KERNEL_OUTPUT} (or so) to the manually cached list.  However, if
any recipe overrides kernel.bbclass' do_deploy, it will still choke.

-- 
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


