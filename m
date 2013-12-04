Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 809B16D99E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2013 13:25:51 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1VoCSc-0003o3-QH for openembedded-devel@lists.openembedded.org;
	Wed, 04 Dec 2013 14:25:50 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Dec 2013 14:25:50 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Dec 2013 14:25:50 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 04 Dec 2013 14:25:40 +0100
Message-ID: <l7nag8$s69$1@ger.gmane.org>
References: <1386107047-27409-1-git-send-email-otavio@ossystems.com.br>	<1386107047-27409-2-git-send-email-otavio@ossystems.com.br>	<l7mogt$5cp$1@ger.gmane.org>
	<CAP9ODKpy+pLLboraV=nNeEB1i3oVdg=DarEmF9Mem+do4sGC9w@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
In-Reply-To: <CAP9ODKpy+pLLboraV=nNeEB1i3oVdg=DarEmF9Mem+do4sGC9w@mail.gmail.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe 2/5] proj: Use 'lib_package' class and add data files
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
X-List-Received-Date: Wed, 04 Dec 2013 13:25:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Otavio Salvador schreef op 04-12-13 14:16:
> Hello Koen,
> 
> On Wed, Dec 4, 2013 at 6:20 AM, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
>>> -inherit autotools pkgconfig +inherit autotools pkgconfig
>>> lib_package
>>> 
>>> +FILES_${PN} += "${datadir}/proj"
>> 
>> Will this cause renaming of the output packages?
> 
> It does:
> 
> tmp/deploy/ipk/cortexa9hf-vfp-neon/libproj-bin_4.8.0-r0.2_cortexa9hf-vfp-neon.ipk
>
> 
tmp/deploy/ipk/cortexa9hf-vfp-neon/libproj-dbg_4.8.0-r0.2_cortexa9hf-vfp-neon.ipk
> tmp/deploy/ipk/cortexa9hf-vfp-neon/libproj-dev_4.8.0-r0.2_cortexa9hf-vfp-neon.ipk
>
> 
tmp/deploy/ipk/cortexa9hf-vfp-neon/libproj-doc_4.8.0-r0.2_cortexa9hf-vfp-neon.ipk
> tmp/deploy/ipk/cortexa9hf-vfp-neon/libproj-staticdev_4.8.0-r0.2_cortexa9hf-vfp-neon.ipk
>
> 
tmp/deploy/ipk/cortexa9hf-vfp-neon/libproj0_4.8.0-r0.2_cortexa9hf-vfp-neon.ipk
> 
> Do you want me to add a transitional package?

No, just being curious. I couldn't remember how it was before the change.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSny1TMkyGM64RGpERAsZPAKC6GhnKc5CfxK+hh7cJuFEdSsOo2gCghpFP
rBECOkvYwO0pQqxD8Wlbw/c=
=0Fbr
-----END PGP SIGNATURE-----


