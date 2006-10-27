Received: from [141.2.4.18] (helo=mail.tm.informatik.uni-frankfurt.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mickey@tm.informatik.uni-frankfurt.de>)
	id 1GdXcF-0004jA-4r for openembedded-devel@lists.openembedded.org;
	Fri, 27 Oct 2006 21:43:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id 7C714CE8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2006 21:43:20 +0200 (CEST)
Received: from mail.tm.informatik.uni-frankfurt.de ([127.0.0.1])
	by localhost (mail [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 06685-04 for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2006 21:43:14 +0200 (CEST)
Received: from [141.2.14.64] (gandalf.tm.informatik.uni-frankfurt.de
	[141.2.14.64])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id A7853C96
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2006 21:43:14 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200610271801.52172.openembedded@hrw.one.pl>
References: <200610271801.52172.openembedded@hrw.one.pl>
Organization: VanilleMedia
Date: Fri, 27 Oct 2006 21:43:14 +0200
Message-Id: <1161978194.1649.335.camel@gandalf.tm.informatik.uni-frankfurt.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.7.2.1-3mdv2007.0 
X-Virus-Scanned: by amavisd-new at tm.informatik.uni-frankfurt.de
Subject: Re: RFC: More granular libraries packaging
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
X-List-Received-Date: Fri, 27 Oct 2006 19:43:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Freitag, den 27.10.2006, 18:01 +0200 schrieb Marcin Juszkiewicz:
> My proposition is - let split each library to separate package. This will 
> enlarge feeds (so ipkg will get hurt more ;( but in some situations can 
> give us smaller rootfs.

+1 from me, however would this be explicit or implicit, i.e. do we need
to opt-in for it to happen (e.g. by inheriting package_libs) or do we
need to opt-out for it _not_ to happen (e.g. by defining
PACKAGE_LIBS_AUTOMATIC = "0").

If we are going to make it opt-in, then for the sake of consistency I'd
favour something along the lines of autotools_stage_all, i.e.

do_package() {
    package_libs_all
}
-- 
Regards,

Michael 'Mickey' Lauer | FreeLancer | http://www.Vanille-Media.de




