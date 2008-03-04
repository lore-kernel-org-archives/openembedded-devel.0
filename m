Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JWZf1-0003eZ-QL
	for openembedded-devel@openembedded.org; Tue, 04 Mar 2008 17:06:41 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m24G5JCm016283
	for <openembedded-devel@openembedded.org>; Tue, 4 Mar 2008 16:05:19 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15969-08 for <openembedded-devel@openembedded.org>;
	Tue,  4 Mar 2008 16:05:15 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m24G5Awv016272
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 4 Mar 2008 16:05:10 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200803041356.51830.thomas.cooksey@trolltech.com>
References: <200803041240.17891.thomas.cooksey@trolltech.com>
	<200803041356.51830.thomas.cooksey@trolltech.com>
Date: Tue, 04 Mar 2008 16:05:09 +0000
Message-Id: <1204646709.8117.3.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
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
X-List-Received-Date: Tue, 04 Mar 2008 16:06:41 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-03-04 at 13:56 +0100, Tom Cooksey wrote:
> Yup, we like pkgconfig too, saves us a lot of work. :-) Sadly, we have to support 
> qt being built on 3rd party toolchains we have no access to and therefore no
> way to modify. pkg-config caused a headache for support so we've dropped it
> by default when cross-compiling. Hopefully we'll re-enable it in the future as
> the pkg-config devs seem to be working on the problem, providing an env 
> variable you can use to set a sysroot prefix (PKG_CONFIG_SYSROOT).

Just for reference, it was OE users (well, Poky) who argued for that to
be introduced into pkgconfig to escape the mangling that we used to
do[1] ;-)

[1] We're literally in the process of removing that today.

Cheers,

Richard



