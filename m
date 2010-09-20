Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Oxl2C-0006jE-S7
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Sep 2010 20:24:27 +0200
Received: by ywa8 with SMTP id 8so1552235ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Sep 2010 11:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=X/jJmuXjW4RgfXMeQaBYr5mwdnYHvLg/9nYw25fYCX0=;
	b=joOADLxPLPIZP0652L1Es58J17wMtdHIV/FoesIQS8VVvROsuz43EKLXeCAfMWYh4j
	ZkUz9TbpGUfFjySzsQBCK7xSygGYodTnwhD24oxqcVyj26U4edOrYePdxdiM898QBPXE
	4d2lKJrTHqOrKnS4VsWXBPcwxizgDmRphnW8A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=OZgf6NMZEiUY/apt51FtGtynaKXUa5lidX6k8wVnk3iswzauvaGaemRDhM8YQ8zRK7
	TEuhO2haZ8IWj/W0W0l0ZO0jwh5Gr22zMWi+SkcaEJBubDf5XQ7+glgCehl1KeUgKSgK
	qqZYgzaz2GHBy46pcplPYzHjKQfZPlhcjqJ10=
Received: by 10.90.114.18 with SMTP id m18mr5860947agc.13.1285007049155; Mon,
	20 Sep 2010 11:24:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.200.194 with HTTP; Mon, 20 Sep 2010 11:23:49 -0700 (PDT)
In-Reply-To: <AANLkTi=jXnzu2VyQSDvZHraw1sE-dZ3wZjnsS_-fJbRT@mail.gmail.com>
References: <4C970C21.7020305@gmail.com>
	<AANLkTi=jXnzu2VyQSDvZHraw1sE-dZ3wZjnsS_-fJbRT@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Sep 2010 11:23:49 -0700
Message-ID: <AANLkTimUAfH6XWewVUgw-wvNgCkpAsjxx4cYeixc5p-J@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] tapioca, farsight: move to obsolete. These recipes are old and unbuildable.
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
X-List-Received-Date: Mon, 20 Sep 2010 18:24:28 -0000
X-List-Received-Date: Mon, 20 Sep 2010 18:24:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2010 at 12:38 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/9/20 Graham Gower <graham.gower@gmail.com>:
>> =C2=A0* gst-plugins-farsight uses all 6gb of my memory in do_configure.
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0Its 4 years old and has been obsoleted upstre=
am.
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0http://farsight.freedesktop.org/releases/obso=
lete/gst-plugins-farsight/OBSOLETE
>> =C2=A0* farsight has moved on to version 2, of which there is an in tree=
 recipe.
>> =C2=A0* tapioca depends on the obsolete versions and development stalled=
 years ago.
>>
>> Signed-off-by: Graham Gower <graham.gower@gmail.com>
>
> Confirmed that it is obsolete.
> development of farsight moved to farsight2 in 2008.
>
> Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>

ah that answers why my build was bailing out.

Acked-by: Khem Raj <raj.khem@gmail.com>


