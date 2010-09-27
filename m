Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P0IzQ-0002qD-NY
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 21:03:53 +0200
Received: by gxk10 with SMTP id 10so1719848gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Sep 2010 12:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=R2iXDheUt4+vgO4Lgt5HvRFYODsC4xgglZv2RhxJUAY=;
	b=IJrZPuB4W2qCiDeJBHYrSlHdtdIutuU85bbAMZR6PbdKWpBv2+793QzkSHiAc62e1S
	E+mpQv7p1aWQVEMd/EkD9vLPZhrMKx8AFMXrpCQ9ELr5ADNbUMvq9Irnh1xyGv8Ur9qb
	0JE/1A0UwKRJZUTNkBxY+OXvbWoR0ejhlmg1I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=WVRWHsj7q+sY4h6Fm0Fd30FqCVx9DOcR5WaJhDMT6TZPDMMXDcQmks68LWfIxB1DR6
	8bLk6sPotQxF941z82eSH0poi5oRk9LOmldOHlfw0ctnFPaCaOL12apqH4iE6WWLiwAC
	dL5DOuwWidKUCjJLTtFmQfbcNdKEceq1F01L4=
MIME-Version: 1.0
Received: by 10.151.98.9 with SMTP id a9mr9743339ybm.109.1285614221696; Mon,
	27 Sep 2010 12:03:41 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 27 Sep 2010 12:03:41 -0700 (PDT)
In-Reply-To: <AANLkTimTFM4nExCU7L2Pn+KPA1hRf1N=ThTe+5AqmLcy@mail.gmail.com>
References: <1285611664-30291-1-git-send-email-denis@denix.org>
	<AANLkTimTFM4nExCU7L2Pn+KPA1hRf1N=ThTe+5AqmLcy@mail.gmail.com>
Date: Mon, 27 Sep 2010 21:03:41 +0200
Message-ID: <AANLkTik6txvA=1-JfvzL+izKs=G-R=FMdSz5MO5YRE_h@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base.bbclass: not use bb.fetch.urldata in do_unpack() for traversing SRC_URIs
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
X-List-Received-Date: Mon, 27 Sep 2010 19:03:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/27 Khem Raj <raj.khem@gmail.com>:
> On Mon, Sep 27, 2010 at 11:21 AM, Denys Dmytriyenko <denis@denix.org> wro=
te:
>> bb.fetch.urldata contains cached SRC_URIs, but in case SRC_URI is altere=
d by
>> amend.inc or machine override, the original SRC_URI is not removed from =
the
>> cache, leading to calling do_unpack() multiple times on original and mod=
ified
>> versions of the file. Don't rely on bb.fetch.urldata and traverse SRC_UR=
Is
>> directly.
>>
>> Some background and details:
>> http://thread.gmane.org/gmane.comp.handhelds.openembedded/36703
>>
>> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
>
> looks good
>
> Acked-by: Khem Raj <raj.khem@gmail.com>

Tested, this also resolves my SRC_URI problem.
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

& thanks for fixing this!

Frans
>
>> ---
>> =A0classes/base.bbclass | =A0 =A08 ++++++--
>> =A01 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/classes/base.bbclass b/classes/base.bbclass
>> index b19eb32..964fe1c 100644
>> --- a/classes/base.bbclass
>> +++ b/classes/base.bbclass
>> @@ -202,10 +202,14 @@ do_unpack[dirs] =3D "${WORKDIR}"
>> =A0python base_do_unpack() {
>> =A0 =A0 from glob import glob
>>
>> - =A0 =A0srcurldata =3D bb.fetch.init(d.getVar("SRC_URI", True).split(),=
 d, True)
>> + =A0 =A0src_uri =3D d.getVar("SRC_URI", True)
>> + =A0 =A0if not src_uri:
>> + =A0 =A0 =A0 =A0return
>> + =A0 =A0srcurldata =3D bb.fetch.init(src_uri.split(), d, True)
>> =A0 =A0 filespath =3D d.getVar("FILESPATH", True).split(":")
>>
>> - =A0 =A0for url, urldata in srcurldata.iteritems():
>> + =A0 =A0for url in src_uri.split():
>> + =A0 =A0 =A0 =A0urldata =3D srcurldata[url]
>> =A0 =A0 =A0 =A0 if urldata.type =3D=3D "file" and "*" in urldata.path:
>> =A0 =A0 =A0 =A0 =A0 =A0 # The fetch code doesn't know how to handle glob=
s, so
>> =A0 =A0 =A0 =A0 =A0 =A0 # we need to handle the local bits ourselves
>> --
>> 1.6.3.3
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


