Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 52D6A605B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2014 09:06:56 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1WZcqu-0006Fg-Hq for openembedded-devel@lists.openembedded.org;
	Mon, 14 Apr 2014 11:06:56 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2014 11:06:56 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2014 11:06:56 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 14 Apr 2014 11:06:40 +0200
Message-ID: <lig8f0$nkv$1@ger.gmane.org>
References: <cover.1397459226.git.Chong.Lu@windriver.com>	<2201d43b35ff3c7007ccbd3805b2d4ec0d0b9193.1397459226.git.Chong.Lu@windriver.com>	<lig3ir$ibp$1@ger.gmane.org>	<534B971C.2070401@windriver.com>	<lig6kb$t82$1@ger.gmane.org>
	<534BA2C6.3050308@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
In-Reply-To: <534BA2C6.3050308@windriver.com>
X-Enigmail-Version: 1.6
Subject: Re: [PATCH 2/2] mariadb: add perl to RDEPENDS
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
X-List-Received-Date: Mon, 14 Apr 2014 09:06:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Chong Lu schreef op 14-04-14 10:56:
> 
> On 04/14/2014 04:35 PM, Koen Kooi wrote: Chong Lu schreef op 14-04-14
> 10:06:
>>>> On 04/14/2014 03:43 PM, Koen Kooi wrote: Chong Lu schreef op
>>>> 14-04-14 09:16:
>>>>>>> Perl doesn't be installed in small image, but
>>>>>>> mariadb-server, mariadb-client and mariadb-leftovers need it
>>>>>>> in runtime, so we add perl to RDEPENDS.
>>>> It doesn't need any perl modules to work?
>>>> 
>>>>> mariadb-server, mariadb-client and mariadb-leftovers need 
>>>>> /usr/bin/perl rpm -qp -R mariadb-server-5.1.67-r0.core2_64.rpm
>>>>> warning: mariadb-server-5.1.67-r0.core2_64.rpm: Header V4
>>>>> DSA/SHA1 Signature, key ID f6cf289c: NOKEY /usr/bin/perl ...
> I get that it needs /usr/bin/perl, but you didn't answer my question:
> 
> It doesn't need any perl modules to work?
> 
> Does it actually work with only 'perl' installed and not any of the 
> 'perl-module-' packages?
> 
> 
>> I don't find more dependencies about perl module. I make a image and
>> start mariadb. It works well.

Can you describe the difference before and after this patch for the runtime
behaviour? I get the impression that you only silenced output from RPM and
didn't do any real testing or try to understand the problem
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTS6UgMkyGM64RGpERApbOAJ4teUaJa3Owih3cPogWpBuyrJ8V6QCfePw8
G+rAP5C6+rkmP8Nw+loS+CM=
=gMxa
-----END PGP SIGNATURE-----


