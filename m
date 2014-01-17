Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 405E76AA18
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2014 13:20:02 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1W49L4-0003s9-Pn for openembedded-devel@lists.openembedded.org;
	Fri, 17 Jan 2014 14:19:58 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2014 14:19:58 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2014 14:19:58 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 17 Jan 2014 14:22:43 +0100
Message-ID: <lbbal7$g5g$1@ger.gmane.org>
References: <1389945051-29080-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
In-Reply-To: <1389945051-29080-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe][master/dora][PATCH] Fix QA errors when building with multilib
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jan 2014 13:20:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Khem Raj schreef op 17-01-14 08:50:
> We do not take care of default libdir which accidently works out to be ok
> for non-multilib case since its /usr/lib
> 
> Fixes error like
> 
> ERROR: QA Issue: mozjs: Files/directories were installed but not shipped 
> /usr/lib /usr/lib/libmozjs-17.0.a /usr/lib/libmozjs-17.0.so 
> /usr/lib/pkgconfig /usr/lib/.debug /usr/lib/pkgconfig/mozjs-17.0.pc 
> /usr/lib/.debug/libmozjs-17.0.so
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Koen Kooi <koen@dominion.thruhere.net>


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFS2S6jMkyGM64RGpERAgODAKCgBd8o0yrypgI5AaBXtpQSKrzBcwCfZgKl
c1jVwZMI5nayNZvIbFgrDg8=
=3zCt
-----END PGP SIGNATURE-----


