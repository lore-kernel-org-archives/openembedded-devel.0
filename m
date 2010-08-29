Received: from webmail.no-log.org ([80.67.172.39])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1OpjTX-00025k-S9
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 17:07:17 +0200
Received: by webmail.no-log.org (Postfix, from userid 33)
	id 0F68A4BC72; Sun, 29 Aug 2010 17:06:45 +0200 (CEST)
X-Squirrel-UserHash: c3wyGAAN
X-Squirrel-FromHash: AQBQCAxQWHk=
Message-ID: <1d195d9a6173c3a10d8cc56511da8e54.squirrel@webmail.no-log.org>
In-Reply-To: <AANLkTi=+TA+fDPpcsE+erXjv6npnSV9thU=JYWpTPUeD@mail.gmail.com>
References: <dd79678279f18baf8ab00a450671a8dc.squirrel@webmail.no-log.org>
	<AANLkTi=+TA+fDPpcsE+erXjv6npnSV9thU=JYWpTPUeD@mail.gmail.com>
Date: Sun, 29 Aug 2010 17:06:45 +0200 (CEST)
From: "Denis 'GNUtoo' Carikli" <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.15
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
X-SA-Exim-Connect-IP: 80.67.172.39
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gtk-immodule
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
X-List-Received-Date: Sun, 29 Aug 2010 15:07:18 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

> On Fri, Aug 27, 2010 at 3:33 PM, Denis 'GNUtoo' Carikli
> <GNUtoo@no-log.org> wrote:
>> hi,
>> I'd like to add something like GTK_IM_MODULE=3Dxim in /etc/profile.d f=
or
>> the
>> htcdream, or maybe, any machine that has an hardware keyboard
>>
>> how should that be added?
>>
>> gtk-immodule-xim is part of the gtk+ recipes.
>>
>> should I add a do_immodule() that check if there is keyboard
>> MACHINE_FEATURES, and if there is do an echo of GTK_IM_MODULE=3Dxim to=
 a
>> file which will be shiped to /etc/profile.d/immodule-gtk.sh ?
>> And add that to the gtk-immodule package?
>
> yes deducing it from MACHINE_FEATURES is a good approach imo.
How should I implement the code that does that:
I need to do that(bash version of the python function I used):
FILES_gtk-immodule-xim +=3D "${sysconfdir}/profile.d/immodule-gtk.sh"
PACKAGE_ARCH_gtk-immodule-xim =3D "${MACHINE_ARCH}"

but there is an issue:
gtk-immodule-xim is part of PACKAGES_DYNAMIC,and it uses do_split_package=
s
if I add some python code after do_split_packages it seem to have no effe=
ct

Also, I wonder how multimachine builds would work:
the package is machine arch, but does gtk+ need to be rebuild for each
machine? that would be a huge issue for angstrom.

Denis.




