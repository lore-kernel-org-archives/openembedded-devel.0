Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1H95OY-0008AF-SZ
	for openembedded-devel@openembedded.org; Mon, 22 Jan 2007 21:03:58 +0100
Received: from [130.89.7.3] (vpn007003.vpn.utwente.nl [130.89.7.3])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l0MK3qLr032038 for <openembedded-devel@openembedded.org>;
	Mon, 22 Jan 2007 21:03:53 +0100
Message-ID: <45B518A5.8000500@dominion.kabel.utwente.nl>
Date: Mon, 22 Jan 2007 21:03:49 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <45B40165.6000506@whitby.id.au>	<45B4EDCD.1060609@dominion.kabel.utwente.nl>
	<45B50D16.8060001@whitby.id.au>
In-Reply-To: <45B50D16.8060001@whitby.id.au>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: RFC: Adding a new global MACHINE_ENDIAN variable
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
X-List-Received-Date: Mon, 22 Jan 2007 20:03:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Rod Whitby schreef:
> Koen Kooi wrote:
>> Rod Whitby schreef:
>>>> There exist machines (like the ixp4xx range of processors) which can be
>>>> run in either little-endian or big-endian mode, and both modes are
>>>> supported by OE.
>>>>
>>>> I propose a new "MACHINE_ENDIAN" (naming courtesy of RP) variable to do
>>>> this selection (i.e. for machines that support both, the build can be
>>>> selected in local.conf).
>> No, that's just needles confusion, just make a .inc file (like ixp4xx.inc) that has the
>> common bits and 2 machine files that set up the appropriate endiannes stuff. That way you
>> can use machine overrides to configure stuff instead of putting more anonymous python
>> functions in the metadata.
> 
> There currently is an ARCH_BYTE_SEX "magic" variable (which nslu2-linux
> added), which is used 77 times in OE as it stands today (mostly in
> SlugOS files).  First thing I will do is replace that with
> MACHINE_ENDIAN (as it's a better name).
> 
> As for MACHINE_ENDIAN as a magic variable, to do as you suggest requires
> that there be an easy way to have a "machine architecture" override
> (i.e. ixp4xx) as well as the usual "actual machine/board" override (i.e.
> nslu2le).  Currently there is only one such override in place, which
> means that in *every* place that there currently is an _ixp4xx override
> in the metadata, that needs to have 2 other duplicates of that line (one
> for _nslu2le and one for _nslu2be) added in each of those .bb files.
> 
> I'm happy to go down that path instead of the MACHINE_ENDIAN path (if
> that's the consensus of all the OE core team members - RP and koen
> currently have diametrically opposed opinions on this - what do others
> think?).  But I will need a way of inserting "ixp4xxle/be" and "ixp4xx"
> in the set of overrides for both nslu2le and nslu2be machines.  I expect
> this will need to be done in the ixp4xx.conf file by some hacky python
> which looks for ${MACHINE} in the override list and adds "ixp4xxle/be"
> and "ixp4xx" after it.
> 
> Koen, with that extra information and context, is your input to the
> consensus still the same?

I think adding two machines adheres to the principle of least surprise and makes is
possible to build for the 2 machines in parallel (/me hugs bitbake trunk + machine-via-env).
Also take a look at the amount of python in ixp4xx.conf to translate endianness into
various settings. With 2 machines, you can do without the python, which makes it for new
OE users look less arcane, and easier for python n00bs like me to modify.

regards,

Koen


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFtRilMkyGM64RGpERAu07AKC2oMsHFQ3rD9MXFMhb2Yd3k7pHmgCeO6nf
SBy9UW8sKfS04A6NMS+IMjU=
=jUws
-----END PGP SIGNATURE-----


