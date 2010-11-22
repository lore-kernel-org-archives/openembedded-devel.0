Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PKb2g-0003Ou-9p
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 19:23:06 +0100
Received: by iwn7 with SMTP id 7so83432iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 10:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=givCSZxLIg456CdojZs9m2l3QTnLmDn9HehcXxZiARk=;
	b=LvF56bNNVwl1a0JsKtHsu6HI54Q9wlpOmdhHC8/QlejWGmZVab6dd4BuHb9+RJi4vo
	Va817BXTlVcuZ1J7stMBKILzWyl/GtnL8np9qj/76GJ/ieVfzhKu1pcnlxkCxF8nsTuS
	o5drrWT9HV447YPuj3WP+MI9r+vSvIq8Kuosw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=pLRQP7BO6LlWvjyg1C55HL2A8ii5Zn3V6LSfSR5+QYAYFIlZ0paGIOlLUs6Ehu4MkI
	belWoeq0zXm/ar0tNuKSVmTpDIHzOlXqPK1HZdtiL3eLEIseMmLhYCeb3S2c1lqjCx23
	ci31MHtefD8fiblVV1owtqfif+jhbCSUhDBVQ=
MIME-Version: 1.0
Received: by 10.231.39.137 with SMTP id g9mr7083792ibe.101.1290450114429; Mon,
	22 Nov 2010 10:21:54 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Mon, 22 Nov 2010 10:21:54 -0800 (PST)
In-Reply-To: <4CEAA907.4080808@eukrea.com>
References: <4CE64779.3020802@sensortherm.de>
	<AANLkTinAj4fG48Ppz_jwT1nmp+tzntZ9YJPaqat4HbES@mail.gmail.com>
	<4CE7D1F2.7010305@sensortherm.de>
	<AANLkTi=VB3EJo1DU2pGWgCSqFrZX81t1Es4xTHP3eCWU@mail.gmail.com>
	<4CEA2BFF.5090707@sensortherm.de>
	<AANLkTimabe75SmdGTA5EemH83-4Yd7KjNwdx8D3dCNR6@mail.gmail.com>
	<4CEA88D0.7070100@sensortherm.de>
	<AANLkTinRPF12o0qhpPq=qohG9E6tXRYTd58uB0itKEQ1@mail.gmail.com>
	<4CEAA907.4080808@eukrea.com>
Date: Mon, 22 Nov 2010 19:21:54 +0100
Message-ID: <AANLkTik7cBF59uNh=RCPNkN09jGEC8QFYTXB43DPFxEm@mail.gmail.com>
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
Subject: Re: buildserver
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
X-List-Received-Date: Mon, 22 Nov 2010 18:23:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/22 Eric B=E9nard <eric@eukrea.com>:
> On 22/11/2010 18:25, Frans Meulenbroeks wrote:
>>
>> Note that some of the errors Klaus reported are due to the outage of
>> www.handhelds.org.
>>
> as a workaround, here adding this to the local.conf works :
>
> INHERIT +=3D "own-mirrors"
> SOURCE_MIRROR_URL =3D "http://sources.openembedded.org/"
>
> Can peoples having problem with update-rc.d try this and report here if t=
hat
> solves their problem ?

After discussing things with Philip (the maintainer of update-rc.d) I
already pushed the change to have the update-rc.d file local (with his
ack).
We can try with other recipes.

One other question: can I have two mirrors? I already have our local
mirror in my list.

Frans.


