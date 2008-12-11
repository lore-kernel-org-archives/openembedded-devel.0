Received: from [216.145.245.198] (helo=mx02.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LAZus-00010K-89
	for openembedded-devel@openembedded.org; Thu, 11 Dec 2008 02:00:35 +0100
Received: from [209.242.7.188] (helo=[192.168.231.111])
	by mx02.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LAZqw-0005Jk-Ro
	for openembedded-devel@openembedded.org; Wed, 10 Dec 2008 18:56:31 -0600
Message-ID: <4940650B.1000802@dls.net>
Date: Wed, 10 Dec 2008 18:55:39 -0600
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.18) Gecko/20081105 Thunderbird/2.0.0.18 Mnenhy/0.7.5.666
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <20081210234910.GA16050@excalibur.local> <49405BD7.2010801@gmx.de>
	<200812110137.01104.mickey@vanille-media.de>
In-Reply-To: <200812110137.01104.mickey@vanille-media.de>
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
X-List-Received-Date: Thu, 11 Dec 2008 01:00:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Michael 'Mickey' Lauer wrote:
> We can compile it completely without dbus support in a seperate recipe, if 
> that's what you want -- but given the increasing ubiquity of dbus, that 
> doesn't make much sense.

Which raises a point -- there are still devices out there that don't
want the X11 libraries (due to flash space limitations) -- perhaps it is
_dbus_ that needs splitting into two separate recipes, one with X and
one without?

I think this would mean that everything would change to depend on
"virtual/dbus", right?  -- and that would be a fairly disruptive change,
hence my comments here to see if anyone has strong protests or better ideas.

Mike (mwester)


