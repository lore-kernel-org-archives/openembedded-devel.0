Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1OzVGb-0002wt-0O
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Sep 2010 15:58:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 9B7AB8AE2BF
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Sep 2010 09:58:09 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 31218-02 for <openembedded-devel@lists.openembedded.org>; 
	Sat, 25 Sep 2010 09:58:09 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 56B38894253
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Sep 2010 09:58:09 -0400 (EDT)
Date: Sat, 25 Sep 2010 09:58:09 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1285404085.5151.3.camel@mattotaupa>
Message-ID: <Pine.LNX.4.64.1009250957240.5082@juice.ott.cti.com>
References: <AANLkTimSLnwKB0XchkPk56QpGDa0ELDoo7X_6OqD5w02@mail.gmail.com>
	<1285357189-26457-1-git-send-email-msmith@cbnco.com>
	<1285357189-26457-2-git-send-email-msmith@cbnco.com>
	<1285404085.5151.3.camel@mattotaupa>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/4] base.bbclass: add make-native to default dependencies
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
X-List-Received-Date: Sat, 25 Sep 2010 13:58:22 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="346837782-1390629860-1285423089=:5082"

--346837782-1390629860-1285423089=:5082
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 25 Sep 2010, Paul Menzel wrote:

> Am Freitag, den 24.09.2010, 15:39 -0400 schrieb Michael Smith:
> > This should work around package incompatibilities with whatever version
> > of make is installed on the build system.
> >=20
> > -=09=09=09deps +=3D " virtual/${TARGET_PREFIX}gcc virtual/libc "
> > +=09=09=09deps +=3D (" virtual/${TARGET_PREFIX}gcc virtual/libc "
> > +=09=09=09=09"make-native")
>=20
> Are the parentheses =C2=BB()=C2=AB needed? Is it to prevent using =C2=BB\=
=C2=AB for the line
> break?

Yes, that's correct.

Mike

--346837782-1390629860-1285423089=:5082--
