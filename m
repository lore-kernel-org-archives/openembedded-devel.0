Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P1iRY-0006k6-7I
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 18:26:47 +0200
Received: by iwn2 with SMTP id 2so4031917iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Oct 2010 09:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=LNpPp/KLDtHbWDS62zYacud/iEGnimUOCQ2QcU+T4/c=;
	b=c9mYV9p8T5Opnwe04xFYE7OdcDjTiQqokqezbVCTwGT3S1Qlx9n5scElsthHCHzbus
	LLU+6f83bTT9gxS0aIfkNGEZZcjO8bXQHfBSAveGw3NvwivljUV0QES/XLcdOLLNqtz8
	Vu3Kmn+ZIiSxbCJbGyvvGXNXpDtF50BJxO6DQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Xe3seAH1JRzOIwH5L7ApxT4GD7loNP/AOXwPY4ZH/iUBBg/S3OrQJzhinoporTDUsS
	WxTH7GzJZSQ+jPnRFIEi26+xxIFDVVpdFRtEWE6tkFRdjshXvtSJ3+d+FhH9UVrj+6C2
	ykBIP50QTnVbpzQw9o/9bN5INoTEsYbw9JdL8=
Received: by 10.231.14.71 with SMTP id f7mr5839098iba.118.1285950388528; Fri,
	01 Oct 2010 09:26:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Fri, 1 Oct 2010 09:26:08 -0700 (PDT)
In-Reply-To: <4CA606D5.4060608@dresearch.de>
References: <4CA44597.5070300@dresearch.de>
	<1285834219-17132-1-git-send-email-sledz@dresearch.de>
	<4CA606D5.4060608@dresearch.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Oct 2010 09:26:08 -0700
Message-ID: <AANLkTi=QQ_79Huh9Pu-yJyRrfRfojgnN5+YF5niOHrTp@mail.gmail.com>
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
X-List-Received-Date: Fri, 01 Oct 2010 16:26:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 1, 2010 at 9:05 AM, Steffen Sledz <sledz@dresearch.de> wrote:
> Am 30.09.2010 10:10, schrieb Steffen Sledz:
>> Signed-off-by: Steffen Sledz <sledz@dresearch.de>
>> ---
>> =C2=A0recipes/gnome/epiphany_2.30.2.bb | =C2=A0 =C2=A02 +-
>> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/gnome/epiphany_2.30.2.bb b/recipes/gnome/epiphany_2=
.30.2.bb
>> index 426d468..38798f7 100644
>> --- a/recipes/gnome/epiphany_2.30.2.bb
>> +++ b/recipes/gnome/epiphany_2.30.2.bb
>> @@ -9,7 +9,7 @@ SRC_URI[archive.md5sum] =3D "29b084acfa016540d91d3601ec3=
dff5c"
>> =C2=A0SRC_URI[archive.sha256sum] =3D "cd0124e71e72142593cfeb442d58d97e99=
ba94ace6e31d94717fe977c0bfb98a"
>>
>>
>> -EXTRA_OECONF =3D "--disable-nss --with-engine=3Dwebkit --with-distribut=
or-name=3D${DISTRO}"
>> +EXTRA_OECONF =3D "--disable-nss --with-engine=3Dwebkit --with-distribut=
or-name=3D${DISTRO} --without-ca-file"
>>
>> =C2=A0do_configure_prepend() {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0touch ${S}/gnome-doc-utils.make
>
> Ping!
>
> The next 'testing-next' branch is knocking at the door. ;-)

while the patch looks ok you need to bump the PR too as mentioned.
Paul could you send your build logs
somewhere to look at. We need to know if its something Stefan's build
system problem or yours.

>
> --
> Steffen Sledz
> DResearch Digital Media Systems GmbH
> Otto-Schmirgal-Str.3, D-10319 Berlin, Germany
> Tel: +49 (30) 515932237 mailto:sledz@DResearch.DE
> Fax: +49 (30) 515932299 http://www.DResearch.DE
> Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
> Amtsgericht Berlin Charlottenburg; HRB 54412;
> Ust.-IDNr. DE169013825; WEEE Reg.-Nr. DE 85995642
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


