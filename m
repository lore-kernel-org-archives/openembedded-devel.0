Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1LAZc2-0000eB-Ih
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Dec 2008 01:41:06 +0100
Received: from andromeda.vanille.de (e180172163.adsl.alicedsl.de
	[85.180.172.163])
	by drlauer-research.com (Postfix) with ESMTP id 77A4258414A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2008 01:54:39 +0100 (CET)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Dec 2008 01:37:00 +0100
User-Agent: KMail/1.9.10
References: <20081210234910.GA16050@excalibur.local> <49405BD7.2010801@gmx.de>
In-Reply-To: <49405BD7.2010801@gmx.de>
MIME-Version: 1.0
Message-Id: <200812110137.01104.mickey@vanille-media.de>
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
X-List-Received-Date: Thu, 11 Dec 2008 00:41:06 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Am Thursday 11 December 2008 01:16:23 schrieb Thomas Kunze:
> > The following patch i nstalls the files correctly for me. Never used
> > FILES_${PN} before so I would like to get some review before.

Looks good to me.

>
> Maybe its better to create a package wpasupplicant-dbus. IMO we should
> try to split packages if we can and  the dbus
> functionallity is clearly separable from wpasupplicant core functions.

Is it? How so? AFAIK there is no facility to have wpa_supplicant dlopen 
libdbus and only provide the dbus interface on demand.

We can compile it completely without dbus support in a seperate recipe, if 
that's what you want -- but given the increasing ubiquity of dbus, that 
doesn't make much sense.

-- 
:M:


