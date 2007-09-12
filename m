Received: from [62.169.194.61] (helo=memova2.tellas.gr)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <skoroneos@digital-opsis.com>) id 1IVLEy-0006aO-2K
	for openembedded-devel@openembedded.org; Wed, 12 Sep 2007 07:58:20 +0200
Received: from dias (62.169.211.226) by memova2.tellas.gr (7.3.118.8)
	id 4638635B02FD90F2 for openembedded-devel@openembedded.org;
	Wed, 12 Sep 2007 07:54:02 +0200
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: <openembedded-devel@openembedded.org>
Date: Wed, 12 Sep 2007 08:55:10 +0300
Message-ID: <HOECLKEKOHLAMMGDLLBHAENPMDAA.skoroneos@digital-opsis.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3138
In-Reply-To: <c384c5ea0709111614m20b079f8l4939336884b844b6@mail.gmail.com>
Importance: Normal
Subject: Re: USE flags - why they won't work for OE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Sep 2007 05:58:20 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

> Let's at least come up with a good way of using the namespace:
>
> -lite has been suggested, which I do not prefer (ambiguous, and I
> would prefer -light)
> -nodbus (if dbus dependency is dropped)
>
> I would prefer using:
>
> -without-x
> -without-gtk
> -without-dbus
> ...
>
> as the package suffix, as it re-uses the "configure" options
> namespace, well known to most developers.

Both comments are correct, but what happens in the case we have a package
with multiple -without-xyz ?


Stelios S. Koroneos

Digital OPSiS - Embedded Intelligence
http://www.digital-opsis.com






