Received: from [84.21.108.25] (helo=ns.penguin.cz ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1LvroV-0004G4-UG
	for openembedded-devel@openembedded.org; Mon, 20 Apr 2009 13:37:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 79BED1416BA8
	for <openembedded-devel@openembedded.org>;
	Mon, 20 Apr 2009 13:35:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l18-dHJYxfZA for <openembedded-devel@openembedded.org>;
	Mon, 20 Apr 2009 13:35:04 +0200 (CEST)
Received: from [10.20.1.86] (unknown [82.119.242.94])
	by ns.penguin.cz (Postfix) with ESMTP id 53BFB1416BA2
	for <openembedded-devel@openembedded.org>;
	Mon, 20 Apr 2009 13:35:04 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
In-Reply-To: <gshgnr$t3e$1@ger.gmane.org>
References: <1236373070.7461.49.camel@utx.utx.cz>
	<359c5480903061431t30283e9dgda3d57aedfbb8999@mail.gmail.com>
	<1240220030.14678.5.camel@utx.utx.cz>  <gshgnr$t3e$1@ger.gmane.org>
Date: Mon, 20 Apr 2009 13:33:07 +0200
Message-Id: <1240227187.6832.9.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.0 
Subject: Re: [PATCH] new interface is already up but udev must call ifup anyway
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
X-List-Received-Date: Mon, 20 Apr 2009 11:37:28 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:

> > Proposed solution:
> > Either:
> > wpa_wupplicant should perform (or trigger somehow) wlan network hotplug
> > completely (i. e. call ifup after network association instead of udev
> > device addition)
> > or:
> > Revert previous behavior - "passive" wpa_supplicant.
> > or:
> > Apply mentioned patch. Ugly, it fixes only symptom, not the cause.
> 
> With my distro hat on: shouldn't something like connman take care of 
> wireless? Which would probably mean going back to a passive wpa_supplicant.

Yes, at least on distro build conf level (but probably also on runtime
or package selection level) there should a way to select networking
concept:

- ifup/ifdown with /etc/network/interfaces, udev hotplugging and
  wpa_supplicant handling lost association

- connman handling everything

- NetworkManager handling everything

OT: I have no experience with connman. Does it have the same "one
network active at a time" constraint like NetworkManager has? And does
connman automatically handle "association lost" case for wireless?

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



