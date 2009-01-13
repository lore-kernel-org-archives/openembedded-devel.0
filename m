Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1LMsEM-0001g8-2d
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jan 2009 23:59:30 +0100
Received: from andromeda.vanille.de (e180184168.adsl.alicedsl.de
	[85.180.184.168])
	by drlauer-research.com (Postfix) with ESMTP id CBA7B584186
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jan 2009 00:13:27 +0100 (CET)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Jan 2009 23:52:56 +0100
User-Agent: KMail/1.9.10
References: <200901132011.00353.openembedded@haerwu.biz>
	<200901132023.37777.mickey@vanille-media.de>
	<gkirbu$mtt$2@ger.gmane.org>
In-Reply-To: <gkirbu$mtt$2@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200901132352.56407.mickey@vanille-media.de>
Subject: Re: HAL and Xserver
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
X-List-Received-Date: Tue, 13 Jan 2009 22:59:30 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Am Tuesday 13 January 2009 20:51:26 schrieb Koen Kooi:
> On 13-01-09 20:23, Michael 'Mickey' Lauer wrote:
> > Am Tuesday 13 January 2009 20:10:59 schrieb Marcin Juszkiewicz:
> >> Hi
> >>
> >> Current x11-image depends on 'angstrom-x11-base-depends' which adds HAL.
> >> For one customer I am building images with 1.3.0.0 xserver-kdrive so HAL
> >> is not required at all (not to mention that it does not find any devices
> >> when mdev is used instead of udev).
> >>
> >> I created patch which removes HAL from 'angstrom-x11-base-depends' and
> >> moves it into dependencies of xserver-(kdrive,xorg) newer then 1.3.0.0.
> >>
> >> What do you think about it?
> >
> > Sounds good. I'd even welcome if we could disable it for all versions.
>
> You can't, it's needed to get input devices nowadays, there's a 3 month
> long flamewar about it on the xorg mailinglists if you want some
> background on it.

Thanks. That's very unfortunate, but hey... source is out there, I can patch 
it out.

-- 
:M:


