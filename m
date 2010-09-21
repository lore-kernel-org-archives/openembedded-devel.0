Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oy1NW-0001h8-W9
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 13:51:19 +0200
Received: by iwn2 with SMTP id 2so5226538iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 04:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=s8BW4GHK23HyRN8ysMZRtMi3oL64vUgU/RPBFGquDgY=;
	b=JVVyADZaPZAy/MxphZIHHWr6wMDg9Z9jxQLhKlAem+aYjOlt9B1Ad5RlVxX3RG691T
	CeOZSlOmVAwzFJ0Jc/0zt+wMxQae186r2VlbXnZvWGXgmJZYBx4i6SbXWrSszg7/zBHm
	Z/mWQ/a8t2u0tDjE0gcjDvrFms9ESQSuivPi8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ggn0gPEX6teo7ycxV0nhvwVaBlpaNv+V8IskQPdIPCmtlWlB8s+kLnZy8xMoC1pTgy
	k20QFtxpMNgyE4v5pWauH5Q8m75beHCf6pTf/h92MwLzl0AKwdwGbJQ7HuskWSw3K8hA
	v00ng5vbMlBvvliA917EqH1Oomxfmbm5ujXyo=
MIME-Version: 1.0
Received: by 10.231.190.75 with SMTP id dh11mr11690176ibb.189.1285069872314;
	Tue, 21 Sep 2010 04:51:12 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 21 Sep 2010 04:51:12 -0700 (PDT)
In-Reply-To: <0B51A1E7C61D114DAE6FC10B0FD0ABA501A74218@deimsg40.de.net.world>
References: <1284933592-4558-1-git-send-email-pirobk@gmail.com>
	<4C9693E5.3040504@freyther.de>
	<AANLkTim+VwnZH-yiNOPkQ-ZvbGLmjXpEz8U-WJOoPzt7@mail.gmail.com>
	<0B51A1E7C61D114DAE6FC10B0FD0ABA501A74218@deimsg40.de.net.world>
Date: Tue, 21 Sep 2010 13:51:12 +0200
Message-ID: <AANLkTikvmhwy8w3=a5TcoRJBP2TLem_OQP4oB4_hnxDU@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] qt4-embedded: avoid circular dependencies for reciped providing qt4-embedded
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
X-List-Received-Date: Tue, 21 Sep 2010 11:51:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/21 Hauser, Wolfgang (external) <Wolfgang.Hauser.external@cassidian.c=
om>:
> Is it possible to apply this patch soon ? I need the gles version of qt4-=
embedded. At the time I workaround this problem by a modified qt4-embedded =
recipe.

Can't judge the details of your patch (and can't push from here anyway).
What I normally do in those cases is keep the patched recipe in an
overlay (and discard it when the patch is applied).

Frans
>
> -----Urspr=FCngliche Nachricht-----
> Von: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedd=
ed-devel-bounces@lists.openembedded.org] Im Auftrag von Bj=F6rn Krombholz
> Gesendet: Montag, 20. September 2010 20:16
> An: openembedded-devel@lists.openembedded.org
> Betreff: Re: [oe] [PATCH] qt4-embedded: avoid circular dependencies for r=
eciped providing qt4-embedded
>
> 2010/9/20 Holger Freyther <holger+oe@freyther.de>
>> On 09/20/2010 05:59 AM, Bj=F6rn Krombholz wrote:
>> > @@ -1,4 +1,4 @@
>> > -DEPENDS_prepend =3D "${@["qt4-embedded ", ""][(bb.data.getVar('PN', d=
, 1) =3D=3D 'qt4-embedded')]}"
>> > +DEPENDS_prepend =3D "${@["qt4-embedded ", ""][(bb.data.getVar('PN', d=
, 1)[:12] =3D=3D 'qt4-embedded')]}"
>> > =A0inherit qmake2
>>
>> use startsWith and avoid the extra array allocation?
>
> Array slicing just provides a new mapping onto the original array and
> doesn't copy any data.
>
> I chose this syntax to make it consistent with qt4x11.bbclass
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


