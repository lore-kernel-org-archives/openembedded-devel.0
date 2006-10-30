Received: from [64.233.162.199] (helo=nz-out-0102.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <papercrane@gmail.com>) id 1GeM1g-0002Dc-S3
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Oct 2006 02:33:21 +0100
Received: by nz-out-0102.google.com with SMTP id q3so1116348nzb
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Oct 2006 17:32:47 -0800 (PST)
Received: by 10.35.112.3 with SMTP id p3mr3702088pym;
	Sun, 29 Oct 2006 17:32:46 -0800 (PST)
Received: by 10.35.118.16 with HTTP; Sun, 29 Oct 2006 17:32:46 -0800 (PST)
Message-ID: <432beae0610291732m7a58da9dk67002822666ea07f@mail.gmail.com>
Date: Sun, 29 Oct 2006 18:32:46 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200610291528.40663.openembedded@hrw.one.pl>
MIME-Version: 1.0
References: <200610291528.40663.openembedded@hrw.one.pl>
Subject: Re: RFC: handling of machine/distro features stuff
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
X-List-Received-Date: Mon, 30 Oct 2006 01:33:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/29/06, Marcin Juszkiewicz <openembedded@hrw.one.pl> wrote:
>
> Currently OpenEmbedded use overrides based on DISTRO, MACHINE, TARGET_ARCH
> and few others. I want to suggest start of using also
> {MACHINE,DISTRO}_FEATURES because we have some stuff in metadata which
> make sense only on some targets only - for example madwifi is limited to
> PCI devices only.
>
> Why do this at all? Let me take wpa-supplicant 0.5.x as example.
>
> I'm building own distribution for my PDA devices and want to use latest
> possible software. But wpa-supplicant 0.5.1 depends on madwifi which
> cannot be build because my target device does not have PCI bus support. If
> I remove madwifi stuff from wpa-supplicant recipe then I will get working
> version. But this cannot be pushed back into repo because NSLU2 related
> distros want version with madwifi support.
>
> Solution can be adding checking for pci support in
> {MACHINE,DISTRO}_FEATURES and only then enable madwifi support:
>
> DEPENDS = "gnutls \
> ${@base_contains("DISTRO_FEATURES", "pci", "madwifi", "",d)}"
>
> Same stuff can go into madwifi recipe so it will get skipped if target
> device lack PCI support.
>

It *sounds* like what you want here is basically a USE-flag type of
system. Introducing it as FEATURES flags makes sense to me given that
OE is made for building embedded distros and not for local building,
as portage.

-- 
Justin Patrin


