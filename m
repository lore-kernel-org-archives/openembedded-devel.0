Received: from mail-yw0-f175.google.com ([209.85.211.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NrBnD-0003SW-Nh
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 16:01:20 +0100
Received: by ywh5 with SMTP id 5so296578ywh.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 07:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=5ypUfYtkm/1uyaSLl/+s7RhlMEhR8dVcA/ah0lvvdZU=;
	b=hPTqsbzP/90Wh3g664jUqqMTV9SKgo7Ll4fKRY+zXb077wA8TTFG7i5erqy37p5kr8
	lXeFb9i6CXHsHgsd/ZizquqVi7lcSfT4QjGu3taj3uffnsVLj11h43iy7yi4dbCaOcd8
	RetFErNbwSX51cfk/nZieag7Sr3a5PrgtPnPE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=LW9JR86gDrDFPazwz87289dYBP3ruBe6FY0+h+JzFyfA1e0aiu3c7a2dTPGdYRCPm5
	r0ekO5SHRUfAL4gf8K8UDxBVlOZkaUva3JW2jVxPAPiF04hntzztiiVlAU8UE6CmnAG8
	dUAWJRP6Y7hUQYfPtGP8xT4sVEllyzHbb4/98=
MIME-Version: 1.0
Received: by 10.101.169.39 with SMTP id w39mr1753795ano.140.1268665097437; 
	Mon, 15 Mar 2010 07:58:17 -0700 (PDT)
In-Reply-To: <201003151538.10288.holger+oe@freyther.de>
References: <201003081300.19058.holger+oe@freyther.de>
	<201003150446.26284.holger+oe@freyther.de>
	<4B9E3BE8.1070800@mwester.net>
	<201003151538.10288.holger+oe@freyther.de>
Date: Mon, 15 Mar 2010 15:58:17 +0100
Message-ID: <ac9c93b11003150758m4c3a4c77gfa84a47ced1c86c3@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: samba-essential upgrade or remove?
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
X-List-Received-Date: Mon, 15 Mar 2010 15:01:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/3/15 Holger Hans Peter Freyther <holger+oe@freyther.de>:
> On Monday 15 March 2010 14:53:44 Mike Westerhof wrote:
>
> Dear Mike,
>
>> Sigh.
>>
>> I really don't think this recipe is worthy of this much controversy.
>> It's essential (hence the name) for certain very small NAS devices.
>>
>> I fail to see how its presence is impacting others -- if you don't like
>> it, don't use it. =A0Simple.
>
> See. This is not the point of liking or not liking a given recipe. I don'=
t
> like the fact that this recipe is not maintained for years and has the
> possibility of damaging the reputation of distros built with OE. I assume
> even users of SlugOS do not like if their device gets owned via known and
> circulating exploits?

I think the chances are small that anyone would put a slug on the open inte=
rnet.
>
> It would be nice if we could establish a shared responsibility for mainta=
ining
> software that listens on network ports and is handling multimedia content=
 (the
> two kind of things most likely to be suffering flaws). I don't think it i=
s that
> difficult. If there is a remote hole and exploits are floating around, up=
grade
> the recipe?

Note that this might go a lot further than you think.
It also means keeping things like php, python and perl up to date as
people could exploit bugs in php code or cgi scripts.

Frans


