Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NZsdM-0003kU-5H
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jan 2010 22:07:39 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NZsb3-0005Zg-QM from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jan 2010 13:05:13 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 26 Jan 2010 13:05:13 -0800
Received: from 172.30.80.228 ([172.30.80.228]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue, 26 Jan 2010 21:04:56 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	26 Jan 2010 14:04:56 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1263980224.3384.9.camel@mattotaupa.wohnung.familie-menzel.net>
References: <4B564B3D.7020108@atmel.com>
	<1263980224.3384.9.camel@mattotaupa.wohnung.familie-menzel.net>
Organization: Mentor Graphics Corporation
Date: Tue, 26 Jan 2010 14:04:56 -0700
Message-Id: <1264539896.4283.13.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-OriginalArrivalTime: 26 Jan 2010 21:05:13.0395 (UTC)
	FILETIME=[40AA9030:01CA9ECB]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH v2] Enable bmp and JPEG files for fbv
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
X-List-Received-Date: Tue, 26 Jan 2010 21:07:39 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2010-01-20 at 10:37 +0100, Paul Menzel wrote:
> Am Mittwoch, den 20.01.2010, 01:15 +0100 schrieb Ulf Samuelsson:
> > Enable bmp and JPEG files for fbv
> > 
> > Previously only supported PNG.
> > Ungif still not supported.
> 
> Not supported or just not enabled?
> 
> One last question. Does anyone know why this support was not enabled in
> the first place? Not needed back then, not working, size constrains?
> 
>         $ git log --follow recipes/fbv/fbv_1.0b.bb 
>         commit 0bdb7654c8a9b9850db27e5f6b4a746fb1083ed1
>         Author: Tom Rini <trini@embeddedalley.com>
>         Date:   Thu Apr 23 15:07:52 2009 -0400
>         
>             fbv: Add a framebuffer-based png viewer.
>             bmp/gif is supported but disabled.

<Insert USE_FLAGS rant here>

Didn't need bmp/jpeg support in the use case I added fbv for (testing
the fb driver easily) and didn't have jpeg/bmp support being pulled in
otherwise.

-- 
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


