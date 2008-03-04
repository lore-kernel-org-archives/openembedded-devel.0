Received: from [62.70.27.150] (helo=hoat.troll.no)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tcooksey@trolltech.com>) id 1JWZzI-0000Ar-7E
	for openembedded-devel@openembedded.org; Tue, 04 Mar 2008 17:27:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by hoat.troll.no (Postfix) with ESMTP id 80104581A8
	for <openembedded-devel@openembedded.org>;
	Tue,  4 Mar 2008 17:25:31 +0100 (CET)
Received: from hoat.troll.no ([127.0.0.1])
	by localhost (hoat.troll.no [127.0.0.1]) (amavisd-maia,
	port 10024) with LMTP
	id 12125-07 for <openembedded-devel@openembedded.org>;
	Tue,  4 Mar 2008 17:25:30 +0100 (CET)
Received: from sx01.troll.no (sx01.troll.no [62.70.27.21])
	by hoat.troll.no (Postfix) with ESMTP id 384EF581A4
	for <openembedded-devel@openembedded.org>;
	Tue,  4 Mar 2008 17:25:30 +0100 (CET)
Received: from sx01.troll.no (localhost.localdomain [127.0.0.1])
	by sx01.troll.no (8.13.8/8.13.8) with ESMTP id m24GQCv9023049
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 4 Mar 2008 17:26:12 +0100
Received: from tomdev.troll.no (tomdev.troll.no [10.3.5.39])
	by sx01.troll.no (Scalix SMTP Relay 11.3.0.11339)
	via ESMTP; Tue, 04 Mar 2008 17:26:12 +0100 (CET)
Date: Tue, 4 Mar 2008 17:29:55 +0100
From: Tom Cooksey <thomas.cooksey@trolltech.com>
To: openembedded-devel@openembedded.org
Message-ID: <200803041729.55760.thomas.cooksey@trolltech.com>
In-Reply-To: <1204646709.8117.3.camel@dax.rpnet.com>
References: <200803041240.17891.thomas.cooksey@trolltech.com>
References: <200803041356.51830.thomas.cooksey@trolltech.com>
References: <1204646709.8117.3.camel@dax.rpnet.com>
x-scalix-Hops: 1
Organization: Trolltech
User-Agent: KMail/1.9.7
MIME-Version: 1.0
X-Virus-Scanned: Maia Mailguard 1.0.2a
X-SA-Exim-Connect-IP: 62.70.27.150
X-SA-Exim-Mail-From: tcooksey@trolltech.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Missing includes in STAGING_INCDIR
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
X-List-Received-Date: Tue, 04 Mar 2008 16:27:37 -0000
Content-Type: text/plain;
	charset="US-ASCII"
Content-Disposition: inline

On Tuesday 04 March 2008 17:05:09 Richard Purdie wrote:
> On Tue, 2008-03-04 at 13:56 +0100, Tom Cooksey wrote:
> > Yup, we like pkgconfig too, saves us a lot of work. :-) Sadly, we have to support 
> > qt being built on 3rd party toolchains we have no access to and therefore no
> > way to modify. pkg-config caused a headache for support so we've dropped it
> > by default when cross-compiling. Hopefully we'll re-enable it in the future as
> > the pkg-config devs seem to be working on the problem, providing an env 
> > variable you can use to set a sysroot prefix (PKG_CONFIG_SYSROOT).
> 
> Just for reference, it was OE users (well, Poky) who argued for that to
> be introduced into pkgconfig to escape the mangling that we used to
> do[1] ;-)
> 
> [1] We're literally in the process of removing that today.

Awesome! Well argued. :-) Does that mean PKG_CONFIG_SYSROOT is stable
enough now to be used in anger?


Cheers,

Tom


