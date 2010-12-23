Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PVfln-00055K-Rz
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Dec 2010 08:39:28 +0100
Received: by iwn8 with SMTP id 8so6150150iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 23:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=bFbokIcBNBhEr5zVdK9u5As0UoEP8xq9SSuZ1lT7Ozk=;
	b=A86KPIDDQMgqsupjb43Sp9ur0Y0cNLstBgOohaFY5Cqa/6dtaZvBw5oWviepaBGa6K
	0k5JZwwwwtmqCHF3PL+vPYvGWEtB05oGuvVTvzRid+L15B0mdUxe8wljZ69bQbppbCSg
	CJpGdqfgU/ftjhDgV9znqO7ZGgP2alUCPQ8kU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=J/AvULGPjwXqAYhu9bkQhzdjZ6kNc+4YuZ7lIF6O/lx63bcvBoU+mvMZIIEP1BVrGW
	aysXW67N9BOFcEHTxrM1Trs5EU+lSUzyTGqw/DNq5FSLod+MraJHD/5WK+obxhmlUDBi
	InjAAktEk/aI7pL7tAb+abcs6IdDbi09DHwNY=
MIME-Version: 1.0
Received: by 10.231.38.10 with SMTP id z10mr7824288ibd.107.1293089956437; Wed,
	22 Dec 2010 23:39:16 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Wed, 22 Dec 2010 23:39:16 -0800 (PST)
In-Reply-To: <20101222233302.GB12820@denix.org>
References: <1293016481-703-1-git-send-email-koen@openembedded.org>
	<ietk2q$jdr$1@dough.gmane.org> <4D1259F7.9030905@mentor.com>
	<4D126BCC.1020508@mentor.com>
	<AANLkTik_GNNX5vMMsjZO7PTdf6od8ah-uHBfbe31sKnA@mail.gmail.com>
	<20101222233302.GB12820@denix.org>
Date: Thu, 23 Dec 2010 08:39:16 +0100
Message-ID: <AANLkTinOCBnbJVzUxmYs=KSxwOCp7LNiPA_SQXkMRRc=@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] sanity: release 2010.12 is out, so bump minimum bitbake to 1.10.0 per TSC decision
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
X-List-Received-Date: Thu, 23 Dec 2010 07:39:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/12/23 Denys Dmytriyenko <denis@denix.org>:
> On Wed, Dec 22, 2010 at 02:42:31PM -0800, Khem Raj wrote:
>> On Wed, Dec 22, 2010 at 1:21 PM, Tom Rini <tom_rini@mentor.com> wrote:
>> > On 12/22/2010 01:05 PM, Tom Rini wrote:
>> >>
>> >> On 12/22/2010 12:38 PM, Koen Kooi wrote:
>> >>>
>> >>> -----BEGIN PGP SIGNED MESSAGE-----
>> >>> Hash: SHA1
>> >>>
>> >>> On 22-12-10 12:14, Koen Kooi wrote:
>> >>>>
>> >>>> Signed-off-by: Koen Kooi<koen@openembedded.org>
>> >>>> ---
>> >>>> conf/sanity.conf | 2 +-
>> >>>> 1 files changed, 1 insertions(+), 1 deletions(-)
>> >>>>
>> >>>> diff --git a/conf/sanity.conf b/conf/sanity.conf
>> >>>> index 0f53cb2..1c83c14 100644
>> >>>> --- a/conf/sanity.conf
>> >>>> +++ b/conf/sanity.conf
>> >>>> @@ -3,7 +3,7 @@
>> >>>> # See sanity.bbclass
>> >>>> #
>> >>>> # Expert users can confirm their sanity with "touch conf/sanity.con=
f"
>> >>>> -BB_MIN_VERSION =3D "1.8.18"
>> >>>> +BB_MIN_VERSION =3D "1.10.0"
>> >>>>
>> >>>> SANITY_ABIFILE =3D "${TMPDIR}/abi_version"
>> >>>> SANITY_PRFILE =3D "${TMPDIR}/distro_pr"
>> >>>
>> >>> If people are agreeing, can I get some Acked-by lines please?
>> >>
>> >> I agree with the concept but I want a patch that says 1.10.2 once Chr=
is
>> >> releases that hopefully later today.
>> >
>> > To be clear, this is because 1.10.0 has some bugs that aren't all that=
 hard
>> > to hit and 1.10.1 reports itself as 1.10.0. =A0I strongly suspect we h=
ave
>> > users that stay on the trailing edge, would get 1.10.0 release and hit
>> > issues.
>>
>> For 1.10.2
>>
>> Acked-by: Khem Raj <raj.khem@gmail.com>
>
> Let's wait for 1.10.2, but:
>
> Acked-by: Denys Dmytriyenko <denis@denix.org>

For 1.10.2
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


