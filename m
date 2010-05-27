Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OHX8U-00035O-7p for openembedded-devel@lists.openembedded.org;
	Thu, 27 May 2010 09:04:11 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OHX4T-0003NQ-E9 for openembedded-devel@lists.openembedded.org;
	Thu, 27 May 2010 09:00:01 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 May 2010 09:00:01 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 May 2010 09:00:01 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 27 May 2010 08:59:48 +0200
Message-ID: <htl594$4mn$1@dough.gmane.org>
References: <AANLkTikuptIZDURk9aJb5xqB22op3_cnR1OU7iQ0JfY0@mail.gmail.com>	<hso7dv$2lh$1@dough.gmane.org>	<AANLkTinzfd9OTFGIFxcCCdaxgXZ3lJm1OorWVxg0njNG@mail.gmail.com>	<AANLkTimLcmTnl-zjJR9SVHRaX7GlKjhYT_IMiOy-eQtJ@mail.gmail.com>
	<20100526200901.GB10091@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100512 Shredder/3.0.6pre
In-Reply-To: <20100526200901.GB10091@gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add lksctp tools
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
X-List-Received-Date: Thu, 27 May 2010 07:04:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 26-05-10 22:09, Khem Raj wrote:
> On (23/05/10 15:50), João Henrique Freitas wrote:
>> Hi,
>>
>> Attached a unique patch.
> 
> same as cgreen. but it builds. I get these warnings. Are they ok ?

Unpackaged file are almost never OK, so please update PACKAGES and FILES
to package these:

> 
> NOTE: the following files were installed but not shipped in any package:
> NOTE:   /usr/lib/lksctp-tools/libwithsctp.so.1
> NOTE:   /usr/lib/lksctp-tools/libwithsctp.so
> NOTE:   /usr/lib/lksctp-tools/libwithsctp.so.1.0.7
> NOTE:   /usr/lib/lksctp-tools/libwithsctp.a
> NOTE:   /usr/lib/lksctp-tools/libwithsctp.la
> NOTE:   /usr/share/lksctp-tools/checksctp.c
> NOTE:   /usr/share/lksctp-tools/sctp_socket.c
> NOTE:   /usr/share/lksctp-tools/sctp_bind.c
> NOTE:   /usr/share/lksctp-tools/sctp_darn.c
> NOTE:   /usr/share/lksctp-tools/sctp_load_libs.c
> NOTE:   /usr/share/lksctp-tools/sctp_sockopt.c
> NOTE:   /usr/share/lksctp-tools/sctp_socket.h
> NOTE:   /usr/share/lksctp-tools/sctp_test.c
> NOTE:   /usr/share/lksctp-tools/sctp_darn.h
> NOTE:   /usr/bin/sctp_test
> NOTE:   /usr/bin/sctp_darn
> NOTE:   /usr/bin/checksctp
> NOTE:   /usr/bin/withsctp
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL/hhkMkyGM64RGpERAqd2AJ9oe2hjZg9OCf0jsJt6gllNSZMMrACgjhvC
wDJUhKoyPLc0g8PxH5Rfzks=
=Oojb
-----END PGP SIGNATURE-----



