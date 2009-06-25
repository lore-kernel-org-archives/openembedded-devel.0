Received: from [212.18.0.9] (helo=mail-out.m-online.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mok@mnet-online.de>) id 1MJhdi-0001hw-QF
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Jun 2009 07:36:51 +0200
Received: from mail01.m-online.net (mail.m-online.net [192.168.3.149])
	by mail-out.m-online.net (Postfix) with ESMTP id C098D1C1540E;
	Thu, 25 Jun 2009 07:25:34 +0200 (CEST)
Received: from localhost (dynscan2.mnet-online.de [192.168.1.215])
	by mail.m-online.net (Postfix) with ESMTP id 61D2E901A1;
	Thu, 25 Jun 2009 07:25:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.3.149])
	by localhost (dynscan2.mnet-online.de [192.168.1.215]) (amavisd-new,
	port 10024)
	with ESMTP id FWI5Tvh1ZWuX; Thu, 25 Jun 2009 07:25:33 +0200 (CEST)
Received: from mrdenker.localdomain (ppp-93-104-96-156.dynamic.mnet-online.de
	[93.104.96.156])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTP;
	Thu, 25 Jun 2009 07:25:33 +0200 (CEST)
From: "Klaus 'mrmoku' Kurzmann" <mok@mnet-online.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Jun 2009 07:25:32 +0200
User-Agent: KMail/1.11.3 (Linux/2.6.29.4-167.fc11.x86_64; KDE/4.2.3; x86_64; ;
	)
References: <Pine.LNX.4.64.0906242154090.8101@juice.ott.cti.com>
In-Reply-To: <Pine.LNX.4.64.0906242154090.8101@juice.ott.cti.com>
MIME-Version: 1.0
Message-Id: <200906250725.32962.mok@mnet-online.de>
Subject: Re: Building against a local git repo
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
X-List-Received-Date: Thu, 25 Jun 2009 05:36:54 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Am Donnerstag 25 Juni 2009 04:05:59 schrieb Michael Smith:
> Hi,
>
> I think in the past couple of months someone posted a trick for building
> out of an existing source directory, so changes can easily be gathered up
> and committed.
>
> Basically, for local projects I'd like to occasionally break out of a
> development cycle of (edit, commit, push, bitbake) * n and just do (edit,
> bitbake) * n with a final commit and push at the end.
>
> I remember the trick was being used for kernel development, and may have
> involved mangling S or WORKDIR, but that's about it; hoping someone might
> remember and save me some more hours scouring the archives :)
What I do is to have the following in local.conf:
SRC_URI_pn-libframeworkd-phonegui-efl2 = "file:///path/to/your/source/libframeworkd-phonegui-efl2"
SRCREV_pn-libframeworkd-phonegui-efl2 = "LOCAL"
S_pn-libframeworkd-phonegui-efl2 = "${WORKDIR}/${PN}"

Works like a charm :)

>
> Thanks,
> Mike
>

-- 

Klaus 'mrmoku' Kurzmann


