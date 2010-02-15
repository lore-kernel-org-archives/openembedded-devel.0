Received: from mail-gx0-f215.google.com ([209.85.217.215])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Nh7zg-0002eP-T9
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 21:56:40 +0100
Received: by gxk7 with SMTP id 7so7825230gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2010 12:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=LMfLq6GWkgj3uEBlBz5uhLlEF43FxCkbxO+z8dvaIv8=;
	b=UkYM4ruIrHvTpQLJUgTY8KUiwt6yStEOEPQMgJTXnGPCJY00zYcVCnnLMwnHbQpOSN
	IjrySvbGCnulx6tsMQGn03onrXFP+fWMvwiufr+jiwKNpbVsi6So3EmghBZIu2H6w8le
	iJ//1u9XzaYtZ170CbcMKpTL3E6IMy53YYtH4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Y8dBaaebpkXpiOkNI6DCdyeX5n5Kouj9IV7Mcnq1Ang/LboKlXZC+LJP4JPB7gL8d0
	JER0nRp0l5fH12oKMkdikryx5jxfXwl4mYPICrCyhODyBQ+3zBJyeo4194T6LsFvBQ0J
	JAvVDeSnTvhq7OlxLMhEpe+pl4gw/EQT/YzqA=
MIME-Version: 1.0
Received: by 10.150.118.14 with SMTP id q14mr7117183ybc.105.1266267238224; 
	Mon, 15 Feb 2010 12:53:58 -0800 (PST)
In-Reply-To: <hlc4jp$cfc$1@ger.gmane.org>
References: <20100214135613.GF5364@jama> <4B79673B.50108@balister.org>
	<ac9c93b11002150859i4aa5ee7eid6a648d95fa25d6c@mail.gmail.com>
	<20100215171952.GA3233@jama> <hlc4jp$cfc$1@ger.gmane.org>
Date: Mon, 15 Feb 2010 21:53:58 +0100
Message-ID: <ac9c93b11002151253p77fabb2dve773f78098da85b0@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.215
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Using bitbake in minimal chroot environment
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
X-List-Received-Date: Mon, 15 Feb 2010 20:56:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/2/15 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 15-02-10 18:19, Martin Jansa wrote:
>> On Mon, Feb 15, 2010 at 05:59:39PM +0100, Frans Meulenbroeks wrote:
>>>>> I'm just thinking about using bitbake only in minimalistic chroot.
>>
>> Already rebuilding in new chroot :).
>>
>>>>>
>>>>> What are advantages/disadvantages?
>>>>>
>>>>> How I see it:
>>>>>
>>>>> Advantages:
>>>>> 1) more secure (I started to use separate user for bitbake, when I
>>>>> =A0 =A0started to play with bitbake master instead release - because =
that
>>>>> =A0 =A0warning it said), but chroot is even better.
>>>>> 2) less problems when autotools pick some header or lib from buildhos=
t
>>>>> =A0 =A0instead of staging
>>>>> 3) easier to check, that -native package is missing for some importan=
t
>>>>> =A0 =A0lib
>>>>>
>>>>> Disadvantages:
>>>>> 1) Few more MB for building environment (extra libc, gcc, binutils, g=
it,
>>>>> =A0 =A0svn, sh, etc. installed in chroot
>>>
>>> If they are on the same filesystem you could use hard links and save th=
ose MBs.
>>
>> Not so big problem for me, so I used mount --bind for dirs I want to
>> share (ie /usr/portage as I'm using gentoo) and it took only about
>> 100MB.. so not a big deal
>>
>>>>> 2) More administrative to keep chroot system updated
>>>>> 3) harder to check, that autotools won't pick something from buildhos=
t
>>>>> =A0 =A0in normal environment before pushing new version/recipe (ie I =
won't
>>>>> =A0 =A0have SDL libs installed in chroot, but everybody else will and=
 maybe
>>>>> =A0 =A0build will fail for them after I push some recipe.
>>>>
>>>> I see this as a good thing :)
>>
>> The last point? Well it's good for me (less issues) but if I push some
>> recipe failing for 99% other builders just because they have pretty
>> standard libs on their systems, then I should be blamed for pushing
>> crappy recipe :).
>>
>>> Seems a good plan to me, please keep us posted.
>>> (actually I've been considering building in a minimalistic VM)
>>
>> Well VM would be much slower..
>
> On a recent intel/amd cpu VMs I can't measure much difference between VM
> and non-vm builds.
> My main buildmachine at work is an ubuntu 8.04LTS vm running under
> windows XP. The only major speedup I can get building in a native
> install would be using 64bit, since the VM is 32 bit, but it does expose
> both CPU cores :)
>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFLeZW6MkyGM64RGpERAtFOAJ9hOQA/80gWA5pzQQW9vZ34Kcmy7ACgh6vV
> zSccfttlBkf/RDcRCiYQMqg=3D
> =3DID01
> -----END PGP SIGNATURE-----
>

Interesting results.
I had expected that ramfs would improve things. The only explanation I
have that it does not is that if you have sufficient RAM most of the
data will remain in the cache.
(although listening to the hard disk when building (dual core, 32 bit
OS, 4GB ram gives reason to suspect otherwise).

Frans.


