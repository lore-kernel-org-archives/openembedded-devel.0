Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1LaAtq-0007qf-Gm
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Feb 2009 16:33:18 +0100
Received: from andromeda.vanille.de (e180136146.adsl.alicedsl.de
	[85.180.136.146])
	by drlauer-research.com (Postfix) with ESMTP id 7D09B58413B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2009 16:54:33 +0100 (CET)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Feb 2009 16:30:53 +0100
User-Agent: KMail/1.9.10
References: <499D6562.2070702@gmail.com>
	<200902191517.16274.mickey@vanille-media.de>
	<200902191527.18534.openembedded@haerwu.biz>
In-Reply-To: <200902191527.18534.openembedded@haerwu.biz>
MIME-Version: 1.0
Message-Id: <200902191630.54598.mickey@vanille-media.de>
Subject: Re: KaeilOS distribution joins OpenEmbedded
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
X-List-Received-Date: Thu, 19 Feb 2009 15:33:18 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Am Thursday 19 February 2009 15:27:17 schrieb Marcin Juszkiewicz:
> On Thursday 19 of February 2009 15:17:16 Michael 'Mickey' Lauer wrote:
> > This is an exciting moment for OpenEmbedded, we are looking forward
> > to cooperating with you guys.
> >
> > Regarding boot time, I have since long wanted to bring upstart into
> > the platform, but I can't find time for it.
>
> Will be interesting to compare upstart with sysvinit for some of our
> devices.

Absolutely. To be honest, my primary motivation is not boot time, but rather 
on-demand service activation and deativation. It feels wrong to 
call /etc/init.d/foo start|stop|restart from a resource manager, so I'd 
welcome init system support for that.

Boot time improvement will come as a consequence of this, since in OE we still 
boot our embedded systems as if they were desktop systems. All services up by 
default is wrong.

-- 
:M:


