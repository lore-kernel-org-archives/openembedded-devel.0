Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PuO4k-0004sk-W8
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 12:49:11 +0100
Received: by bwz10 with SMTP id 10so4467973bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Mar 2011 03:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=yzbQi16RHtRqhrSu8OSdG0r8S9huIrvq0xsbVPN0nzg=;
	b=mUN5gbNCLbXwg7ndO6BJj68lthIasU1J5029JZ4IkRxR2NNGVvEmSYA2mF8d8jgKMx
	Pd4vsj8wqqd/csVGtaVpIOfXgi+5mgpTFW0TPCCGZzPZ7m/+1WEdMjynacqYZ81RtZOL
	P+nKESjGQdslNmBJfX7LfAuKYyJEyclDEHAfs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=IsmIvkSB6EFlKG/FhX1UH/OfWMt0Bhp/lrweItj3cx5k5uVjaauWQdphRkHaH9UeXM
	AwryZirLQaHNR+3OWk8C1cGDJd6N99u34oUKyJZsXdyCVRkKBEx3Ch6oh3tfEgEYXoGx
	5iGv4Qid2+5y6WE0nekRVI003txjOUUDuC8Js=
MIME-Version: 1.0
Received: by 10.204.33.72 with SMTP id g8mr3436410bkd.16.1298980065169; Tue,
	01 Mar 2011 03:47:45 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Tue, 1 Mar 2011 03:47:45 -0800 (PST)
In-Reply-To: <1298979308.23547.67.camel@phil-desktop>
References: <AANLkTiknqQ6xLj8LFv4=17ymwSbVhD3C9kVe2qkviXhX@mail.gmail.com>
	<1298664057.3818.0.camel@lenovo.internal.reciva.com>
	<AANLkTin2WuKF=f_aOzi=28FmVTaxFVJa0uNb9TjfL2SB@mail.gmail.com>
	<1298666406.3818.4.camel@lenovo.internal.reciva.com>
	<AANLkTinUjtis22ZnLaP7uc0fa9nzxvhWod2uv43ZcJH=@mail.gmail.com>
	<1298669695.3818.5.camel@lenovo.internal.reciva.com>
	<AANLkTi=afktV1HC4Jdq_ammNdA+h4iMAWdJT809s+LMv@mail.gmail.com>
	<1298905700.23547.6.camel@phil-desktop>
	<AANLkTimyU4bSm9tM2LO5bMoqiFQqZXxt5Js7fg0B_HhJ@mail.gmail.com>
	<1298913422.23547.20.camel@phil-desktop>
	<AANLkTimomznky1rBn5QTqzS16O6Lk3VxHUx1pG+ULe3v@mail.gmail.com>
	<1298979308.23547.67.camel@phil-desktop>
Date: Tue, 1 Mar 2011 11:47:45 +0000
X-Google-Sender-Auth: EbFjB47GGRl3QhWrJiw33zg5vn4
Message-ID: <AANLkTimk6cXCRROwcD5cOkfarJuMkvg=A0cM_Um6oOSZ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Phil Blundell <philb@gnu.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Missing GLIBC_<version> tags on binaries
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
X-List-Received-Date: Tue, 01 Mar 2011 11:49:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 1, 2011 at 11:35, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2011-02-28 at 19:33 +0000, Otavio Salvador wrote:
>> On Mon, Feb 28, 2011 at 17:17, Phil Blundell <philb@gnu.org> wrote:
> I just tried linking xfreerdp by hand with gold and the resulting binary
> seemed to come out fine. =A0So I think this is indeed a bug in GNU ld.

Personally I think we need to trace it down (we as project) since it
can lead to broken and difficult to trace behaviour. It took 3 days
until I managed to identify the symbol failure.

I am far from an expert on linking and GNU ld. For debugging it I'd
need guidance.

> It does seem to be sensitive to the order in which things are mentioned
> in the command line: if you put -lpthread first then GNU ld gets it
> right. =A0But if -lpthread is at the end then it seems to fail to pick up
> the versioning information for symbols which are also mentioned (even as
> SHT_UNDEF) in other objects. =A0Clearly that can't be the whole story
> though because if it was that simple then it would be failing with
> everything. =A0I guess you need to either debug this further or switch to
> using gold for your own builds.

For now, I did:

+do_configure_prepend() {
+       # workaround gcc linking bug
+       find ${S} -name 'Makefile.am' | xargs -n 1 sed
's,-pthread,-lpthread -D_REENTRANT,g' -i
+}

This fixes the issue for me, but it is clearly a workaround.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


