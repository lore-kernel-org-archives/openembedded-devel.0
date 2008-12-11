Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1LAa5h-0001JK-T1
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Dec 2008 02:11:46 +0100
Received: from andromeda.vanille.de (e180172163.adsl.alicedsl.de
	[85.180.172.163])
	by drlauer-research.com (Postfix) with ESMTP id B985258414A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2008 02:25:19 +0100 (CET)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Dec 2008 02:07:39 +0100
User-Agent: KMail/1.9.10
References: <20081210234910.GA16050@excalibur.local>
	<200812110137.01104.mickey@vanille-media.de>
	<4940650B.1000802@dls.net>
In-Reply-To: <4940650B.1000802@dls.net>
MIME-Version: 1.0
Message-Id: <200812110207.39687.mickey@vanille-media.de>
Subject: Re: [RFC] Ship dbus config and dbus service activation files
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
X-List-Received-Date: Thu, 11 Dec 2008 01:11:47 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Am Thursday 11 December 2008 01:55:39 schrieb Mike (mwester):
> Michael 'Mickey' Lauer wrote:
> > We can compile it completely without dbus support in a seperate recipe,
> > if that's what you want -- but given the increasing ubiquity of dbus,
> > that doesn't make much sense.
>
> Which raises a point -- there are still devices out there that don't
> want the X11 libraries (due to flash space limitations) -- perhaps it is
> _dbus_ that needs splitting into two separate recipes, one with X and
> one without?

I'd rather write a patch that tries to dlopen libX11. dbus needs libX11 only 
for setting one property on the root window.

-- 
:M:


