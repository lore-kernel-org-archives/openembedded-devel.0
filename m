Received: from [62.169.194.61] (helo=memova2.tellas.gr)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <skoroneos@digital-opsis.com>) id 1HmzEO-0003wL-7m
	for openembedded-devel@openembedded.org; Sat, 12 May 2007 23:34:24 +0200
Received: from dias (62.169.211.226) by memova2.tellas.gr (7.3.118.8)
	id 4638635B002C15A4 for openembedded-devel@openembedded.org;
	Sat, 12 May 2007 23:32:33 +0200
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: <openembedded-devel@openembedded.org>
Date: Sun, 13 May 2007 00:33:31 +0300
Message-ID: <HOECLKEKOHLAMMGDLLBHOECLLAAA.skoroneos@digital-opsis.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3028
In-Reply-To: <4644B4D1.5010803@klever.net>
Importance: Normal
Subject: Re: do_rootfs fails
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
X-List-Received-Date: Sat, 12 May 2007 21:34:24 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Had the same problem as i am still using 1.6 .
The mentioned patch solved it

Stelios S. Koroneos

Digital OPSiS - Embedded Intelligence
http://www.digital-opsis.com


> -----Original Message-----
> From: openembedded-devel-bounces@openembedded.org 
> [mailto:openembedded-devel-bounces@openembedded.org]On Behalf Of 
> Michael Krelin
> Sent: Friday, May 11, 2007 9:24 PM
> To: openembedded-devel@openembedded.org
> Subject: Re: [oe] do_rootfs fails
> 
> 
> > All: Are we still going to wait 1.5 months with requiring 
> 1.8.x? I've seen enough proof
> > that 1.6.x is broken with current .dev, with no effort to fix 
> it. "Giving people time to
> > prepare the upgrade" has now turned into "Stabbing user in the eye" :(
> 
> There's also an option of asking Tom to bitbake -DDD and send it to
> zecke, because I couldn't find time to try BB 1.6 for him again. And let
> him apply the patch that fixes this problem:
> 
> Index: lib/bb/parse/parse_py/BBHandler.py
> ===================================================================
> --- lib/bb/parse/parse_py/BBHandler.py  (revision 817)
> +++ lib/bb/parse/parse_py/BBHandler.py  (working copy)
> @@ -66,7 +66,9 @@
>          if not file in __inherit_cache.split():
>              debug(2, "BB %s:%d: inheriting %s" % (fn, lineno, file))
>              __inherit_cache += " %s" % file
> +            data.setVar('__inherit_cache', __inherit_cache, d)
>              include(fn, file, d)
> +            __inherit_cache = data.getVar('__inherit_cache', d) or ""
>      data.setVar('__inherit_cache', __inherit_cache, d)
> 
> Love,
> H
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 



