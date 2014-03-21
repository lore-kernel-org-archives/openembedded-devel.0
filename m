Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 426CA6F9E2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2014 11:14:56 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1WQxPS-0002qs-RH for openembedded-devel@lists.openembedded.org;
	Fri, 21 Mar 2014 12:14:46 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2014 12:14:46 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2014 12:14:46 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 21 Mar 2014 12:15:18 +0100
Message-ID: <lgh6ub$tbs$1@ger.gmane.org>
References: <1395386596-56931-1-git-send-email-george.nita@enea.com>	<532C016C.2060309@dominion.thruhere.net>
	<532C088F.8090102@enea.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
In-Reply-To: <532C088F.8090102@enea.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-filesystems] [PATCH] Add fusermount to fuse by default
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
X-List-Received-Date: Fri, 21 Mar 2014 11:15:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

George Nita schreef op 21-03-14 10:38:
> On 03/21/2014 11:07 AM, Koen Kooi wrote: George Nita schreef op 21-03-14
> 08:23:
>>>> Without fusermount the '/etc/init.d/fuse status' command exits
>>>> with error. Added fusermount to PACKAGES list and ensured it gets
>>>> installed.
> 
> How are you ensuring it gets installed? You only added a new packages,
> you haven't updated any R* variable to take the new package into
> account.
> 
>> By installing fusermount into ${base_bindir}

So what you're saying is that /bin/fusermount ends up in 'fuse-utils' and
you're just adding 'fusermount' to PACKAGES because it looks cool? I get
that you want to have /bin/fusermount installed on your system, but I don't
get what your patch is doing.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTLB9GMkyGM64RGpERAn6/AJ4oqRW3F4Y+bXvOuAg9sUQEZGIGJgCcCeSj
BDhkv5mcw4UZjB56C5zJmso=
=a1Ip
-----END PGP SIGNATURE-----


