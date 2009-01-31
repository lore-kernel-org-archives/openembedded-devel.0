Received: from [216.145.245.200] (helo=mx04.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LTADv-0003Q2-5d
	for openembedded-devel@openembedded.org; Sat, 31 Jan 2009 08:25:03 +0100
Received: from [209.242.7.188] (helo=[192.168.231.111])
	by mx04.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LTA6M-0001sB-12
	for openembedded-devel@openembedded.org; Sat, 31 Jan 2009 01:17:14 -0600
Message-ID: <4983FAF8.2010503@dls.net>
Date: Sat, 31 Jan 2009 01:17:12 -0600
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.19) Gecko/20081209 Thunderbird/2.0.0.19 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
Subject: samba-3.2.5 missing
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
X-List-Received-Date: Sat, 31 Jan 2009 07:25:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Looks like the recipe for samba-3.2.5 is missing.

It got renamed very recently to samba-3.2.7 -- which is a bit of a sore
point to begin with, as some people may have set a PREFERRED_VERSION
which would now break.

But it's much much worse -- the new samba-3.2.7 doesn't just update
3.2.5, it enables krb and ads support.  Marvelous, I'm sure -- but what
if I don't have space for all those libraries and all?

Not to mention that krb won't build, so now samba won't build either.

I'm going to re-create samba-3.2.5 as best as I can (it's way late,
maybe I'll screw it up and nobody's builds will work, who knows?), and
set the default preference for 3.2.7 to -1.  That really should have the
krb stuff backed out, and a "samba-krb_3.2.7" recipe created, IMO.

regards,
Mike (mwester)


