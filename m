Received: from [216.145.245.198] (helo=mx02.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1KIoWi-0001y4-7u
	for openembedded-devel@openembedded.org; Tue, 15 Jul 2008 19:41:24 +0200
Received: from gw.mwester.net ([209.242.5.110] helo=[192.168.1.111])
	by mx02.dls.net with esmtpa (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1KIoW5-0002tw-VD
	for openembedded-devel@openembedded.org; Tue, 15 Jul 2008 12:40:46 -0500
Message-ID: <487CE113.4040502@dls.net>
Date: Tue, 15 Jul 2008 12:40:35 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.14) Gecko/20080421 Thunderbird/2.0.0.14 Mnenhy/0.7.5.666
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <d9a6586e0807150126w6ceb8a0aj5a5b6bab4cb42cfc@mail.gmail.com>	<g5i16r$tb9$1@ger.gmane.org>
	<d9a6586e0807151033h46763394y622641365568c8a9@mail.gmail.com>
In-Reply-To: <d9a6586e0807151033h46763394y622641365568c8a9@mail.gmail.com>
Subject: Re: help with bitbake recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 15 Jul 2008 17:41:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Shawn Rutledge wrote:
> On Tue, Jul 15, 2008 at 4:20 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>> Try altering FILES_${PN}, since that gets packages before ${PN}-doc
> 
> So does it subtract the files it found in FILES_${PN} from being
> available for the following packages?

Yes, so you need to alter the pattern matching so that it matches only
what you want in the base package.

>> bitbake -b chicken_3.3.0.bb -c install -f ; bitbake -b chicken_3.3.0.bb -c
>> package_write
> 
> Thanks.

mike (mwester)


