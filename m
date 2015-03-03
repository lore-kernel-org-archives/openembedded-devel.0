Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 2108965DA3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2015 09:19:56 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1YSizW-0006UR-A2 for openembedded-devel@lists.openembedded.org;
	Tue, 03 Mar 2015 10:19:50 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2015 10:19:50 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2015 10:19:50 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 03 Mar 2015 10:19:32 +0100
Message-ID: <md3ub4$594$1@ger.gmane.org>
References: <1425283365-19326-1-git-send-email-Martin.Jansa@gmail.com>	<54F439E6.3010906@dominion.thruhere.net>
	<20150302102611.GY2309@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
In-Reply-To: <20150302102611.GY2309@jama>
Subject: Re: [meta-oe][PATCH] vboxguestdrivers: import recipe from meta-luneos
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
X-List-Received-Date: Tue, 03 Mar 2015 09:20:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Martin Jansa schreef op 02-03-15 om 11:26:
> On Mon, Mar 02, 2015 at 11:22:30AM +0100, Koen Kooi wrote: Martin Jansa
> schreef op 02-03-15 om 09:02:
>>>> * useful to run our qemu* builds inside VirtualBox
>>>> 
>>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> --- 
>>>> .../vboxguestdrivers/Makefile.utils                | 43
>>>> ++++++++++++++ .../vboxguestdrivers/vboxguestdrivers_4.3.22.bb    |
>>>> 65 ++++++++++++++++++++++
> 
>>>> +PACKAGES += "kernel-module-vboxguest kernel-module-vboxsf 
>>>> kernel-module-vboxvideo" +RDEPENDS_${PN} +=
>>>> "kernel-module-vboxguest kernel-module-vboxsf
>>>> kernel-module-vboxvideo"
> 
> Please don't ever RDEPEND on kernel modules, even when the recipe will
> build them, it sets a bad precedent.
> 
>> I think it makes sense in this case.. nobody will ever include them in 
>> kernel image and vboxguestdrivers utils don't make much sense without 
>> the modules installed.

I agree completely with that, my objection is setting a bad precedent that
people will copy/paste into other recipes.
I see v2 has RRECOMMENDS, thank you for changing it.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFU9XykMkyGM64RGpERAtp/AJ9/M6P16FGCn/EvTXEWCygoon+NHACfWKPA
j0bXmjsmVkWxKsJ+e5Ulaog=
=H4No
-----END PGP SIGNATURE-----


