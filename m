Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PgLXW-0003kv-Nd
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 19:16:51 +0100
Received: by gwaa12 with SMTP id a12so678580gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jan 2011 10:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=cWdhEWziKSK3ZKvYjpKim29lfPT5t3hx7LwfXJ/vwJQ=;
	b=RQBFgZp8OvQlY3ABLHitgl8xuBuegC1kcJ3n8DB7t0hcd7P0GEQHyTRDQhXZyGNMDn
	Td+B0WyrOi+amN6nAgzer5oocPDEDoJ5JDZ/MU8n1BhTy5SvVS+8S2Fxoc6VL5sMbHOC
	OZG01Soi0nGGBQ91XK5CJvOjqZmOpyqKRtqg4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Cx8aUV0zvulCyxYrzP2pQFBnp9RP1hdbqSWRvfWLH0ieuS+RzDp530GO1lohN9dF9Q
	8J3pBCrCPDRIca/ETIhNt2hLVgp1yLELQxjn9yaGxp1MAYf8Eu+j5PN9mLNVG2WrUJ+x
	ghOWIK/RQfOKvOnn8iuK3Ow+5LnjaHf48kHZQ=
Received: by 10.90.1.2 with SMTP id 2mr1179395aga.58.1295633766752; Fri, 21
	Jan 2011 10:16:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.55.10 with HTTP; Fri, 21 Jan 2011 10:15:42 -0800 (PST)
In-Reply-To: <20110121102440.GB7400@lit.local.igalia.com>
References: <20110120103126.GB26640@lit.local.igalia.com>
	<AANLkTinrGpmXqWx8a4AULZduXpQC57VDA40=Z69wu9Dw@mail.gmail.com>
	<20110121102440.GB7400@lit.local.igalia.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Jan 2011 10:15:42 -0800
Message-ID: <AANLkTim7WH5h+ebREpL=8xX2JEHt7n9TGZo9HfZBrhnd@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: native-sdk-image do_rootfs() fails
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
X-List-Received-Date: Fri, 21 Jan 2011 18:16:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2011/1/21 V=C3=ADctor M. J=C3=A1quez L. <vjaquez@igalia.com>:
>
> I'm trying to build an image for the pandaboard but I faced this same iss=
ue:
>
> http://comments.gmane.org/gmane.comp.handhelds.openembedded/4065
>
> (the linux-omap4 kernel compilation broke because of "Error: selected
> processor does not support ARM mode `smc #0'")
>
> So I moved back the binutils version to 2.20.1
>
 No you should not do that. Its a coding problem and you should fix the ker=
nel
Read my response in below post
http://comments.gmane.org/gmane.comp.handhelds.openembedded/40650
and port those 2 patches to your kernel

Thanks
-Khem


