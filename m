Received: from [216.145.245.200] (helo=mx04.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LAkmA-0003Wk-QP
	for openembedded-devel@openembedded.org; Thu, 11 Dec 2008 13:36:19 +0100
Received: from [209.242.7.188] (helo=[192.168.231.111])
	by mx04.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LAkiD-00065t-QZ
	for openembedded-devel@openembedded.org; Thu, 11 Dec 2008 06:32:13 -0600
Message-ID: <49410819.6040302@dls.net>
Date: Thu, 11 Dec 2008 06:31:21 -0600
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.18) Gecko/20081105 Thunderbird/2.0.0.18 Mnenhy/0.7.5.666
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <20081210234910.GA16050@excalibur.local>	<49405BD7.2010801@gmx.de>	<200812110137.01104.mickey@vanille-media.de>	<4940650B.1000802@dls.net>
	<ghqgho$r9j$1@ger.gmane.org>
In-Reply-To: <ghqgho$r9j$1@ger.gmane.org>
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
X-List-Received-Date: Thu, 11 Dec 2008 12:36:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi rudely writes:
> On 11-12-08 01:55, Mike (mwester) wrote:
>
> http://www.angstrom-distribution.org/repo/?pkgname=dbus-1
> http://www.angstrom-distribution.org/repo/?pkgname=libdbus-1-3
> 
> Now where do you see it the _packages_ depending on libx11-6? Is dbus
> going to be the new python where everybody starts screaming about
> requiring X at runtime, when it's only a buildtime dep to build an
> *optional* subpackage like python-tk? Please stop with the FUD.

dbus-1 recommends dbus-x11, dbus-x11 depends libx11-6 (and other X libs).

So there you go, opkg install <anything-depending-on-dbus> blows up your
flash space by pulling in numerous X libs.  No FUD - very real concern.
 (But if it's not a concern for Angstrom, then fine -- please ignore
this issue; if I fix it, I'll make sure that it won't change for Angstrom.)

Regards
Mike (mwester)


