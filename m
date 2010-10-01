Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P1ooM-0006Jn-Pe
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Oct 2010 01:14:43 +0200
Received: by iwn2 with SMTP id 2so4437057iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Oct 2010 16:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=+o1dy/9mMZOyO/qB8y1Fu4JOjNxCxlK3L5yX/kNY1Co=;
	b=FlUV1gbuMhlTzgO20kV60Xu2Cb7yz5mAyjq9sn4KDpaGkjVYoufjifw5tIk2Gc95k/
	ZxIen5A+AypLAPfO2MGA0CZGWz/8Be1JnyUqBdSxAXhNQOLKQ4vrl7B8JaxlKMOnjQvq
	XOMiaCPygWUaHtKA6vAESBqC/UxepmQVu/gyg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=ZU+jmmsbuLLZNwh1p9zh3nOC7R0CgwSn602PTmHvvm43WUZ0pT7rGTHFFPnjVrht2u
	RsAIKERkXKUBwv44qHPEQLpMmbDW1lY42EOWl2YHXV6hr0OyH5Qz/cKviHL5w53bx1tO
	i24tz5C9sVYahefSFTi0JESXCzJbm+x21QS3k=
Received: by 10.231.161.16 with SMTP id p16mr6449156ibx.61.1285974868478; Fri,
	01 Oct 2010 16:14:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Fri, 1 Oct 2010 16:14:08 -0700 (PDT)
In-Reply-To: <AANLkTikBehtaUHtM6GOME-nEM+LxhhotmphomS9Tbo-F@mail.gmail.com>
References: <4CA44597.5070300@dresearch.de>
	<1285834219-17132-1-git-send-email-sledz@dresearch.de>
	<4CA606D5.4060608@dresearch.de>
	<AANLkTi=QQ_79Huh9Pu-yJyRrfRfojgnN5+YF5niOHrTp@mail.gmail.com>
	<1285971107.4148.8.camel@mattotaupa>
	<AANLkTikBehtaUHtM6GOME-nEM+LxhhotmphomS9Tbo-F@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Oct 2010 16:14:08 -0700
Message-ID: <AANLkTin1useJ5YD3vZ8o22rCzHZvbFai22BEOb5dEHc5@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] epiphany-2.30.2: unbreak build by disabling CA files
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
X-List-Received-Date: Fri, 01 Oct 2010 23:14:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 1, 2010 at 4:13 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Oct 1, 2010 at 3:11 PM, Paul Menzel
> <paulepanter@users.sourceforge.net> wrote:
>> Am Freitag, den 01.10.2010, 09:26 -0700 schrieb Khem Raj:
>>> On Fri, Oct 1, 2010 at 9:05 AM, Steffen Sledz <sledz@dresearch.de> wrot=
e:
>>> > Am 30.09.2010 10:10, schrieb Steffen Sledz:
>>> >> Signed-off-by: Steffen Sledz <sledz@dresearch.de>
>>> >> ---
>>> >> =C2=A0recipes/gnome/epiphany_2.30.2.bb | =C2=A0 =C2=A02 +-
>>> >> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>>> >>
>>> >> diff --git a/recipes/gnome/epiphany_2.30.2.bb b/recipes/gnome/epipha=
ny_2.30.2.bb
>>> >> index 426d468..38798f7 100644
>>> >> --- a/recipes/gnome/epiphany_2.30.2.bb
>>> >> +++ b/recipes/gnome/epiphany_2.30.2.bb
>>> >> @@ -9,7 +9,7 @@ SRC_URI[archive.md5sum] =3D "29b084acfa016540d91d360=
1ec3dff5c"
>>> >> =C2=A0SRC_URI[archive.sha256sum] =3D "cd0124e71e72142593cfeb442d58d9=
7e99ba94ace6e31d94717fe977c0bfb98a"
>>> >>
>>> >>
>>> >> -EXTRA_OECONF =3D "--disable-nss --with-engine=3Dwebkit --with-distr=
ibutor-name=3D${DISTRO}"
>>> >> +EXTRA_OECONF =3D "--disable-nss --with-engine=3Dwebkit --with-distr=
ibutor-name=3D${DISTRO} --without-ca-file"
>>> >>
>>> >> =C2=A0do_configure_prepend() {
>>> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0touch ${S}/gnome-doc-utils.make
>>> >
>>> > Ping!
>>> >
>>> > The next 'testing-next' branch is knocking at the door. ;-)
>>>
>>> while the patch looks ok you need to bump the PR too as mentioned.
>>> Paul could you send your build logs
>>> somewhere to look at. We need to know if its something Stefan's build
>>> system problem or yours.
>>
>> Sorry, for not finding this earlier. I have `ca-certificates` installed
>> on my build system.
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0checking location of system Certificate Autho=
rity list... /etc/ssl/certs/ca-certificates.crt
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0[=E2=80=A6]
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0CA Certificates file =C2=A0 =C2=A0 =C2=A0 : /=
etc/ssl/certs/ca-certificates.crt
>>
>
> yes thats what I expected
>
>> The question is, if `ca-certificates` should be added to `DEPENDS` and
>> if that would be picked up.
>
> Stefan
>
> Try adding ca-certificates to DEPENDS and probably as RSUGGESTS for runti=
me too

RRECOMMENDS is better probably

>
>>
>> If not, Steffen=E2=80=99s patch is
>>
>> Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
>>
>>
>> Thanks,
>>
>> Paul
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>>
>


