Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NAsn0-0004fB-Gm
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 23:14:18 +0100
Received: from [85.210.2.237] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NAslX-0007lR-On
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 22:12:45 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <6ec4247d0911181320o1aae5e21o2f6a8038daff6173@mail.gmail.com>
References: <4B03CBF0.5010000@SSpaeth.de> <4B03CDD9.1010202@SSpaeth.de>
	<6ec4247d0911181320o1aae5e21o2f6a8038daff6173@mail.gmail.com>
Date: Wed, 18 Nov 2009 22:12:28 +0000
Message-ID: <1258582348.25369.689.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.2.237
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: BAD_RECOMMENDATIONS is broken (opkg issue)
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
X-List-Received-Date: Wed, 18 Nov 2009 22:14:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2009-11-19 at 07:50 +1030, Graham Gower wrote:
> 2009/11/18 Sebastian Spaeth <Sebastian@sspaeth.de>:
> > additional: as this is an opkg issue, I am using opkg-native r240.
> >
> > Graham, is this supposed to work?
> >
> > Thanks,
> > Spaetz
> >
> 
> A quick look at the relevant code for this indicates to me that it may
> work under certain circumstances. Its non trivial to determine how
> this all interacts from code inspection alone. I'll play with it for a
> bit and let you know what I come up with.

It's meant to be handled by this chunk of code, and I'm fairly sure that
this used to work reliably.  Has that part of opkg changed recently?

                    /* user request overrides package recommendation */
                    if (satisfying_pkg != NULL
                        && (compound_depend->type == RECOMMEND ||
compound_depend->type == SUGGEST)
                        && (satisfying_pkg->state_want == SW_DEINSTALL
|| satisfying_pkg->state_want == SW_PURGE)) {
                         opkg_message (conf, OPKG_NOTICE, "%s: ignoring
recommendation for %s at user request\n",
                                       pkg->name, satisfying_pkg->name);
                         continue;
                    }

p.



