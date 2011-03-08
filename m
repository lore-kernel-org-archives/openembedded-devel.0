Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Px1ZO-0007g7-Ql
	for Openembedded-devel@lists.openembedded.org;
	Tue, 08 Mar 2011 19:23:42 +0100
Received: by fxm8 with SMTP id 8so5416496fxm.6
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 08 Mar 2011 10:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=CH89nRsBgOSACFMG0rc7D+Jo2J0gtXIRVwwVpHyCjO4=;
	b=rxAMptMuE1PK6/MyBkuckq3Ei6DnUc6UH5a9VbhgPqvx9XgdTnZRk08FG6acqKkmEw
	6o2ZBKexayOgy0R3bidqPWK4jRNw++yzMTTMa1Yoh0pLKkh40+KtwubBMeURysOvE18r
	e1pyHnyWX65DWIQRoD1HD72TiE/Ugj42CX1ZY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=xxFWMkFYu/vMcXywLDoT+JXEWxVoVYjrQQDuUIOQqTKcKTFhg9V/24PUR4IgKU4wNK
	vb5MKPdzcUjTFSZNkBoIB7OEAPKeVYNIJdr/W7WLMJ56AlP52ggD1Zn6VpzamkIFk6WZ
	5W5bIG8OYXchC6SsE5CTLRjxBrWklyxRNxCRA=
Received: by 10.223.75.1 with SMTP id w1mr6685881faj.17.1299608524108; Tue, 08
	Mar 2011 10:22:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Tue, 8 Mar 2011 10:21:34 -0800 (PST)
In-Reply-To: <4D75DBE0.5090601@dresearch.de>
References: <4D64BD5E.6040805@dresearch.de> <4D6DF124.2080607@dresearch.de>
	<AANLkTi=sJanB_o6LGmg=3-96=iDD8VMrM-DLp4EC+zBr@mail.gmail.com>
	<4D6E0CF4.4040005@dresearch.de>
	<AANLkTi=UYfsdZQvvQzLMBkZ21wFpPQK-p7pdbSy1F-_H@mail.gmail.com>
	<4D75DBE0.5090601@dresearch.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Mar 2011 10:21:34 -0800
Message-ID: <AANLkTi=MWAtHv6fxExUwExiMra6EFv+oACNm2Hn+jDbS@mail.gmail.com>
To: Steffen Sledz <sledz@dresearch.de>, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: net-snmp-svn-r7.0 do_compile failed
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
X-List-Received-Date: Tue, 08 Mar 2011 18:23:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 7, 2011 at 11:33 PM, Steffen Sledz <sledz@dresearch.de> wrote:
> Am 02.03.2011 21:45, schrieb Khem Raj:
>>>> and for others you can backport the
>>>> fix and you can backport it as it is ideally that patch should
>>>> have changed configure.ac and regenerated configure but they patched
>>>> configure instead. but its ok to patch configure here since
>>>> we do not regenerate configure for net-snmp recipe.
>>>
>>> As mentioned before i failed trying this. The patch does not apply with=
out modifications. :(
>>>
>>
>> hmmm I cant promise but if I have time I can look into it
>
> Hi Khem, any chance that you can work on it in the next days?

I thought you check git regularly I already fixed it with
3fac2c7d24b4c4c3cbdff2a6b303a4db47e089f4
>
> Steffen
>
> --
> DResearch Fahrzeugelektronik GmbH
> Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
> Tel: +49 30 515932-237 mailto:sledz@DResearch.de
> Fax: +49 30 515932-299
> Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
> Amtsgericht Berlin Charlottenburg; HRB 130120 B;
> Ust.-IDNr. DE273952058
>
>


