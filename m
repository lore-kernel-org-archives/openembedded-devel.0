Received: from [216.145.245.200] (helo=mx04.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LogwR-0004v6-S2
	for openembedded-devel@openembedded.org; Tue, 31 Mar 2009 18:36:00 +0200
Received: from [209.242.7.134] (helo=[192.168.231.111])
	by mx04.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LoguI-00021t-CE
	for openembedded-devel@openembedded.org; Tue, 31 Mar 2009 11:33:46 -0500
Message-ID: <49D245F0.4060107@dls.net>
Date: Tue, 31 Mar 2009 11:33:52 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.21) Gecko/20090302 Thunderbird/2.0.0.21 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
Subject: madwifi-ng & linux 2.6.29
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
X-List-Received-Date: Tue, 31 Mar 2009 16:36:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Now that the 2.6.29 kernel has support for some of the Atheros wifi
devices, we have a little bit of a problem.  The solution would seem to
me to be to virtualize atheros support in OE.  This would change a
number of recipes, including hostap-daemon, wpa-supplicant, and a bunch
of package and task recipes.

This assumes that hostap-daemon and wpa-supplicant won't need other
changes to support the new drivers...

So the first question to the group is who uses madwifi anymore?  SlugOS
includes drivers, but only for selected (and unusual) devices, so fixing
this is not a high priority for SlugOS, nor is maintaining compatibility
a big concern for SlugOS, I think.   Anyone else?

Mike (mwester)


