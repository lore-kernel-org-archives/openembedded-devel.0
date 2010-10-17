Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P7QvI-0002IV-AD
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Oct 2010 12:57:05 +0200
Received: by iwn2 with SMTP id 2so2853526iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Oct 2010 03:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=AwNKfaHYN0GiEghYVJ6VAW4jkRbBErIUEkNsWsZpT9Y=;
	b=SzA6ODbe2t4ikMgsg0GDNBdJMODqmmIktobjD9VGKYM+/ZUDERi/rFeJUKK6UINc44
	p+wVMtxLRpWxaFuXfQ0zXUDo89HKZPH0Q8dCFTVT+5Q4amgpP4tncK5EQQXk6Ct2Yzj1
	IpNfPPAd05NqkUrz9Ve6h4RTSQWK4ncfamQ+k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=QQ2oGsUjaM8OUDh1AGrDrzQXS8/MWbLkKPnPB/QXl5UixIB5Eoi4TdJwn0f6FNH4/r
	d8wP+dSlkpqX7Md52ElKBt8EyipCJqRlzcbcIp+y9o5AY2XM7jaQpalH5iszpttk0f/r
	zIFOjoaDnsq6SXoJDTXnQG2+sdKlnIXmo9Jno=
MIME-Version: 1.0
Received: by 10.231.35.196 with SMTP id q4mr2169659ibd.170.1287312992297; Sun,
	17 Oct 2010 03:56:32 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sun, 17 Oct 2010 03:56:32 -0700 (PDT)
In-Reply-To: <AANLkTimu=q2VNcR=2fwNiRB0bojQQ70h1BVAEKa0pQUA@mail.gmail.com>
References: <1287218988-3946-1-git-send-email-ynezz@true.cz>
	<AANLkTi=_3DKvm3bbHuvdvQYOS9M3WDKaBjg2aON=kYWS@mail.gmail.com>
	<AANLkTimu=q2VNcR=2fwNiRB0bojQQ70h1BVAEKa0pQUA@mail.gmail.com>
Date: Sun, 17 Oct 2010 12:56:32 +0200
Message-ID: <AANLkTimiK0YnGdHjvpsKEcHvs+9zzi-UO_yHng5tgFzB@mail.gmail.com>
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
Subject: Re: [PATCH] oestats-client.bbclass: send USERDISTRO value
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
X-List-Received-Date: Sun, 17 Oct 2010 10:57:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/17 Chris Larson <clarson@kergoth.com>:
> On Sat, Oct 16, 2010 at 1:58 AM, Frans Meulenbroeks <
> fransmeulenbroeks@gmail.com> wrote:
>
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 'distro': bb.data.getVar=
('DISTRO', d, True),
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 'distro': bb.data.getVar=
('USERDISTRO', d, True),
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0})
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if re.match("^\d+$", data): id=3Ddata
>> > =A0 =A0 =A0 =A0except:
>> > --
>> > 1.7.0.4
>> >
>> Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>
>
> Is USERDISTRO always guaranteed to be set, or should it fall back to DIST=
RO?
> =A0(haven't checked, I feel lazy, sue me :)
> --

Yes, checked that, before I acked because I also had that concern.
It is done in bitbake.conf
see also the grep from Petr

Frans


