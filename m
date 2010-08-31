Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OqMyk-0006eT-Cd
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 11:18:36 +0200
Received: by iwn2 with SMTP id 2so5560746iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Aug 2010 02:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=XSFoyd/L1hT0eve1HxLzXWujNs6kJGIGnaeRblYdKuc=;
	b=ofycSfP5atZ4nK+LDDhAErpPwBPqFxHLllFNvhMWoaz0trhT9N//Tqf5eTiAg6acZD
	Q6zLiIboRpJ1OiZVjfEnsGW/BXEQxf4c0hQWZxOCjWFxa5uhZnJVuUvjjHUrKFEj6mJX
	Phhg8/qhZNjhVPxoSncUOJxn1TPBG304kDCoY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=gNLRrYFQQ5kWk6tMvzUS4Yb8Q6VcQ9piGOb67j4xUBwFMQBfvMfIxo88uqEqTF0gAN
	+luiJFWNsfh4ye4iyNqhCwZMjUPko5NuXTFiei0kQt7318rGfaixgLwKHu/CeyRq3x0M
	xL7jqa40x2iNhC4FXR2cfwdiZlhgavLe8s9Po=
MIME-Version: 1.0
Received: by 10.231.169.10 with SMTP id w10mr6610325iby.106.1283246249569;
	Tue, 31 Aug 2010 02:17:29 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Tue, 31 Aug 2010 02:17:29 -0700 (PDT)
In-Reply-To: <i5iej2$qi2$1@dough.gmane.org>
References: <AANLkTikcbgZQ8EkyCh3a7mby5VbXZ4Hp8bXRORPpZKsY@mail.gmail.com>
	<i5iej2$qi2$1@dough.gmane.org>
Date: Tue, 31 Aug 2010 11:17:29 +0200
Message-ID: <AANLkTikFZx7DQzBzTFfjQTxCK+zV6k7Mf29WFivEV8vW@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: linux-omap-psp-2.6.32 breaks iscsi-target
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
X-List-Received-Date: Tue, 31 Aug 2010 09:18:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/31 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 30-08-10 19:47, Frans Meulenbroeks wrote:
>> The current beagleboard angstrom and minimal distro's (and maybe
>> others) use the linux-omap-psp_2.6.32.bb recipe to build the kernel.
>>
>> This one says:
>> # This is the v2.6.32_OMAPPSP_03.00.01.06 branch
>> SRCREV =3D "a6bad4464f985fdd3bed72e1b82dcbfc004d7869"
>>
>> # The main PR is now using MACHINE_KERNEL_PR, for omap3 see
>> conf/machine/include/omap3.inc
>> MACHINE_KERNEL_PR_append =3D "+gitr${SRCREV}"
>>
>> SRC_URI =3D "git://arago-project.org/git/people/sriram/ti-psp-omap.git;p=
rotocol=3Dgit;branch=3Dmaster
>> \
>>
>> Building it creates:
>> linux-omap-psp-2.6.32-r88+gitra6bad4464f985fdd3bed72e1b82dcbfc004d7869
>>
>> However this is not a sound 2.6.32 tree. It contains this patch
>> http://arago-project.org/git/people/?p=3Dsriram/ti-psp-omap.git;a=3Dcomm=
it;h=3Dc720c7e8383aff1cb219bddf474ed89d850336e3
>> which was not in the mainstream kernel in 2.6.32
>
> What a surprise, a vendor kernel has patches that aren't in mainline linu=
x.

Well the surprise is not that a vendor kernel has patches that are not
mainlined. Actually I expect vendor specific patches in such a kernel.
The surprise is that this kernel advertises itself as 2.6.32, yet has
2.6.33 patches integrated that are non-vendor related at all.

And surprise or no surprise, what happened is that I encountered a
problem in a recipe I maintain in conjunction with a platform that
used to support this.
(actually both the iscsi-target package and the tgt package appear on
the angstrom feed for armv7a)

I've analysed the problem, figured that there is no good way to
resolve this in the package and that the root cause is a kernel that
advertises itself as 2.6.32 but is not compliant with it.
Therefore I report the problem. I actually offered to work on a patch.

However, instead of appreciating the fact that someone reports an
incompatibility so that it is known, some people seem to prefer to
shoot the messenger. :-(
Great piece of teamwork!

>
>> (compare
>> http://arago-project.org/git/people/?p=3Dsriram/ti-psp-omap.git;a=3Dblob=
;f=3Dinclude/net/inet_sock.h;hb=3Dc720c7e8383aff1cb219bddf474ed89d850336e3
>> with
>> http://git.kernel.org/?p=3Dlinux/kernel/git/stable/linux-2.6.32.y.git;a=
=3Dblob;f=3Dinclude/net/inet_sock.h;h=3D47004f35cc7eaf6f2b3cac2779ea7b7ccd5=
d9c1f;hb=3DHEAD
>> ).
>>
>> The patch mentioned above was integrated in a 2.6.33 rc version.
>>
>> iscsi-utils uses the inet_sock struct, and contains code to access the
>> daddr field of this struct. For versions <=3D .32 daddr is used. for
>> higher versions inet_daddr is used.
>> However the omap-psp kernel from arago does contain this patch =A0but
>> reports as a .32 kernel causing a compiler errir when compiling
>> iscsi_target (as the name the recipe expects is not there).
>>
>> Not sure how to fix it. Changing the test in iscsi-target is not an
>> option as then it does not work for official .32 kernels.
>> Probably the best way to fix this is to use the above patch to revert
>> the change.
>>
>> anyone a better solution?
>
> I can tell you right now that patching the psp kernel will not be
> accepted, so patching the iscsi recipe is the way to go.

iscsi-target cannot fix this in a reasonable way. If I saw a decent
fix (which does not break things for other .32 kernels), I would have
done it.
A patch for the psp kernel would be very simple. We're only talking
about a patch (which could be in oe, not in arago) to give the struct
fields the name that they should have according to 2.6.32).
Functionally this is a zero-impact patch.

Then again, the flexibility, open-minded-ness and customer
friendliness of some of our developers is already known to me, so I
kind-a expected this reaction (which is also why I posted this before
spending time to develop a patch).

Anyway, I already lost interest in resolving this. I can make it work
locally for me, no problem with that, and I'll add DP of -1 for
beagleboard to the iscsi-target recipe with an explanatory note.

Have a nice day.
Frans


