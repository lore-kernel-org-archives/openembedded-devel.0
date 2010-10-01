Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P1onY-0006ER-Gq
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Oct 2010 01:13:53 +0200
Received: by iwn2 with SMTP id 2so4436342iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Oct 2010 16:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=wx+bNgQAwqOXzaNq5ZEPoM+xUumRINBNE/ueH9KqJ0M=;
	b=anKSixKSVpqZpHgpBCPwolTdh1bsVa2Rz7/8PLRElAcF/IBKHoJedAODi/7zHmXUgD
	UcaoiUGNmXGYEh3fR+yZN0+PRIFURhxso1S5tPums6G2KqGK+g2e7QRdNHGmHrZ/vSbM
	ttPlXda5qHOOwCQSsbWjGs9ujIORoUV8bru6M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=rXWyGjZyZnG+jYLQda+oKMf7K3AU3kaqXeP6XHFEEydUQA/xSJBIT9hQnyw3WSds+o
	6B8d7JoF8ybKHH988pLOCBOBFnQZLOSvkSX8zpZmMLLohTl9sS68aPHPQiuX/zbfrIY6
	9bSplU845eSdnhmx0A8LpTo+0cVKl7B2BqPqk=
Received: by 10.231.12.139 with SMTP id x11mr6218296ibx.67.1285974818547; Fri,
	01 Oct 2010 16:13:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Fri, 1 Oct 2010 16:13:16 -0700 (PDT)
In-Reply-To: <1285971107.4148.8.camel@mattotaupa>
References: <4CA44597.5070300@dresearch.de>
	<1285834219-17132-1-git-send-email-sledz@dresearch.de>
	<4CA606D5.4060608@dresearch.de>
	<AANLkTi=QQ_79Huh9Pu-yJyRrfRfojgnN5+YF5niOHrTp@mail.gmail.com>
	<1285971107.4148.8.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Oct 2010 16:13:16 -0700
Message-ID: <AANLkTikBehtaUHtM6GOME-nEM+LxhhotmphomS9Tbo-F@mail.gmail.com>
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
X-List-Received-Date: Fri, 01 Oct 2010 23:13:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 1, 2010 at 3:11 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Am Freitag, den 01.10.2010, 09:26 -0700 schrieb Khem Raj:
>> On Fri, Oct 1, 2010 at 9:05 AM, Steffen Sledz <sledz@dresearch.de> wrote=
:
>> > Am 30.09.2010 10:10, schrieb Steffen Sledz:
>> >> Signed-off-by: Steffen Sledz <sledz@dresearch.de>
>> >> ---
>> >> =C2=A0recipes/gnome/epiphany_2.30.2.bb | =C2=A0 =C2=A02 +-
>> >> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>> >>
>> >> diff --git a/recipes/gnome/epiphany_2.30.2.bb b/recipes/gnome/epiphan=
y_2.30.2.bb
>> >> index 426d468..38798f7 100644
>> >> --- a/recipes/gnome/epiphany_2.30.2.bb
>> >> +++ b/recipes/gnome/epiphany_2.30.2.bb
>> >> @@ -9,7 +9,7 @@ SRC_URI[archive.md5sum] =3D "29b084acfa016540d91d3601=
ec3dff5c"
>> >> =C2=A0SRC_URI[archive.sha256sum] =3D "cd0124e71e72142593cfeb442d58d97=
e99ba94ace6e31d94717fe977c0bfb98a"
>> >>
>> >>
>> >> -EXTRA_OECONF =3D "--disable-nss --with-engine=3Dwebkit --with-distri=
butor-name=3D${DISTRO}"
>> >> +EXTRA_OECONF =3D "--disable-nss --with-engine=3Dwebkit --with-distri=
butor-name=3D${DISTRO} --without-ca-file"
>> >>
>> >> =C2=A0do_configure_prepend() {
>> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0touch ${S}/gnome-doc-utils.make
>> >
>> > Ping!
>> >
>> > The next 'testing-next' branch is knocking at the door. ;-)
>>
>> while the patch looks ok you need to bump the PR too as mentioned.
>> Paul could you send your build logs
>> somewhere to look at. We need to know if its something Stefan's build
>> system problem or yours.
>
> Sorry, for not finding this earlier. I have `ca-certificates` installed
> on my build system.
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0checking location of system Certificate Author=
ity list... /etc/ssl/certs/ca-certificates.crt
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[=E2=80=A6]
> =C2=A0 =C2=A0 =C2=A0 =C2=A0CA Certificates file =C2=A0 =C2=A0 =C2=A0 : /e=
tc/ssl/certs/ca-certificates.crt
>

yes thats what I expected

> The question is, if `ca-certificates` should be added to `DEPENDS` and
> if that would be picked up.

Stefan

Try adding ca-certificates to DEPENDS and probably as RSUGGESTS for runtime=
 too

>
> If not, Steffen=E2=80=99s patch is
>
> Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
>
>
> Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


