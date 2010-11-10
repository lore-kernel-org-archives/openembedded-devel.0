Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PGDZy-0008Tj-Nt
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Nov 2010 17:31:23 +0100
Received: by gxk26 with SMTP id 26so107867gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Nov 2010 08:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=RzkTzLAeaFjU7F49DQabY5KqtDG0XV7wVDm1WR1Clug=;
	b=Nx3SEA3GmLC0jAq5aUGJY3hXmdrACqcabHirct2Y5x4ZTCLyBwfRQT/HXxEKVJ4K1f
	yb6sF86L//5kktjuSxmI5JQUBIkgC1v2Sl3Urtp2IXaa2vCcv7oKQRnzirZGElK35Ae2
	oHeRGPvunaRpZXtqZXvvrBwq1Gp+oOEILbltI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=S8HUbwRiYh0BGSro56Z8NJ5OsPhUnujJeUaRGoXHw4V0yBhbpvVXKkWKaLK+fSizZz
	5fTMqvzeghQbFYoxJdW8Bzs0DcY7Wo/hr/Qfog69Guga5aNWnXTNNcTK2Ae9goeweJSh
	grFN3kS0EJ70Aw4mMfOeq2q6CsedoWAFOx6xc=
Received: by 10.91.11.6 with SMTP id o6mr8962251agi.91.1289406620228; Wed, 10
	Nov 2010 08:30:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Wed, 10 Nov 2010 08:30:00 -0800 (PST)
In-Reply-To: <20101110155011.GA29405@excalibur.local>
References: <20101110155011.GA29405@excalibur.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Nov 2010 08:30:00 -0800
Message-ID: <AANLkTimJ42rjLHm0P=idDYS7FjB_3Z6z-YekN=8VRueK@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: First release three weeks ahead. Tasks you can help with.
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
X-List-Received-Date: Wed, 10 Nov 2010 16:31:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 10, 2010 at 7:50 AM, Stefan Schmidt
<stefan@datenfreihafen.org> wrote:
> Hello.
>
> December the 1th is our first release due. It will be the first in a, hop=
efully
> long, row.
>
> As it is the first release it will not be perfect, but we should try to m=
ake it
> a stable base anyway. Some steps that I think should help are listed belo=
w:
>
> - Stop pushing maybe problematic changes in the last 2 weeks. That gives =
you one
> =C2=A0week from now to get this in and fixed. So what is problematic? Cha=
nges to
> =C2=A0bbclass files, the toolchain, core system services and changes that=
 may
> =C2=A0introduce runtime breakage should be avoided. There might be more.
> =C2=A0If in doubt sent the patch to the ml and ask others what they think=
.
>
> - If you care about a specific machine, set of recipes or images start te=
sting
> =C2=A0them now in our testing-next branch. The plan was to base the relea=
se tag on
> =C2=A0the testing-next branch. Or at least have it as fallback if master =
is broken.
>
> =C2=A0The testing matrix in the wiki will be used in the release tag in t=
he same way
> =C2=A0it is used right now with the tested tag. Make sure the stuff you c=
are is
> =C2=A0listed there as working to show other they could use it in this rel=
ease.
>
> - Try to take some hours in the last two weeks to get into bug fixing mod=
e for
> =C2=A0some moments and help OE forward to the release. check the ML for p=
roblem
> =C2=A0reports and patches. Test, apply and mark them in patchwork as appl=
ied.
>
> I think that are the minimal steps we need to get a release out of the do=
or.
> More will come when learning from the first releases.
>
> Anyone willing to take the release mainatainer hat for this release? My t=
ime is
> rather occupied with other things the next weeks. :/
> It would be only for this release. Afterwards we can discuss if this shou=
ld be a
> fixed position or newly assigned for any release. Such a person should ke=
ep the
> people motivated to fix some bugs, monitor the commit log for potential p=
roblems
> and discuss them and finally make the release tag in the meta data.
>
> Any takers?

I would be able to help here with the release

>
> regards
> Stefan Schmidt
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


