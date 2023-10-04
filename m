Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF831E7C4E5
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 16:33:35 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web11.22764.1696436075103416973
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Oct 2023 09:14:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm2 header.b=tu1/Ynr5;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=bJ9gFEmy;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.25, mailfrom: pavel@zhukoff.net)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 4B32F5C02DB;
	Wed,  4 Oct 2023 12:14:34 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute4.internal (MEProxy); Wed, 04 Oct 2023 12:14:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1696436074; x=1696522474; bh=0R
	wFpv0QrvlWL632LuC+ZEMd+RX1jzXvWyiOeVeDnn0=; b=tu1/Ynr572Gawo6C2r
	7x7qe7lhkEwEhLF3CtUKvuiOnGJnZ1VckyGr67bD8j8mhUgFcsPI2WcXvO/Bk63D
	l7fDT+HHiMz/B+m+yPCDKdMspQkmyMZ4p/3Bz4Vr/JGtfmfs3uerBA36+RN2JQcO
	aKqWLnA7HKWUnmk3GkezJNwHw2f5v7OCEGYgdEo6I01b09TeZjciGdZN4IKCNANY
	eWLtnRgIV61qBBY88B8gaVscvg7xfvWGtmVkJFBMPTqUb0FtFi8EIR15TXphcdfd
	GOrwoZP3SGF0NjspiKTxUK0TRqIeHIC77IHfJpBnslaFmFd+y6+Z9VbOEWxzjdD4
	Qnig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1696436074; x=1696522474; bh=0RwFpv0QrvlWL
	632LuC+ZEMd+RX1jzXvWyiOeVeDnn0=; b=bJ9gFEmye4AyzourTquhl/jhXgyjs
	ozCmnqE/jG2IUMbcIac/s8r9luzYwwtyb4g71+t9+wpaLchGleuKFwfqOswXoVe0
	Lobww/tqqWHpHCLczTotER2GQRz+SnPdJqOaeuSWQeT0qFYTdGa6vO2JkzdYOAi1
	SHfmXRk+tWP3+xg/pg0AMJLh0UZw+ymZ9KuNNsW78qyExSDj1AzDHRjvRED3P2Cm
	82M+MPTpB7acOMiQt+rNGwp5dis6AdRZUesQiT3RtVtGxCHxHUobkG6v64ISADOR
	hNp2yArtxo/CJ+SBPfcZmC6gn7Qm439IMvwjIOGfu4LvwQvtNDgH+D/aw==
X-ME-Sender: <xms:ao8dZXfyij2FrCUJsXM_2Skv1EqdTx-C8aRd9qRdl3RFIa3RTHTZWg>
    <xme:ao8dZdNCqgnjwNWQYDNjXlokSa3ZL2PZaF63gvVaVyXOnCgUt3bHuekpGbbtsln5t
    nlpJZmM9qpsw0gmM4s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrgedvgdeljecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesrgdtreerreertdenucfhrhhomhepfdfrrghv
    vghlucgkhhhukhhovhdfuceophgrvhgvlhesiihhuhhkohhffhdrnhgvtheqnecuggftrf
    grthhtvghrnheptefhfeeiffejvdekieejueeivdetudelvdehueetudfhkedugeevvdel
    jeduieehnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghvvghlseiihhhu
    khhofhhfrdhnvght
X-ME-Proxy: <xmx:ao8dZQhebKHk5SvTz8-8uPXi0Bm4MGXmqYfczvDJl59MzvAe5YR4Pw>
    <xmx:ao8dZY-l4vvvn8TxD6dQwXcSqJFNej65gsc5FQQ9wcM0_ST1GDwDRg>
    <xmx:ao8dZTu8Vr63IIBML0SJC74rBvvReha8QPhKyO0Gw8EmM5tVI-MVcQ>
    <xmx:ao8dZQ7dtiNKrZwkb6kHE-uJkRholoP2zprvb4PNQN36QADn-IvB3w>
Feedback-ID: ib94946c9:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 069E9B60089; Wed,  4 Oct 2023 12:14:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-958-g1b1b911df8-fm-20230927.002-g1b1b911d
MIME-Version: 1.0
Message-Id: <219770fd-d741-4300-ace1-97cbc3af11a7@app.fastmail.com>
In-Reply-To: 
 <CAMKF1squqBoDcuEdRY_MS=uJfyc7bVtK15pLrh8VunKo4YvvDw@mail.gmail.com>
References: <20231004065728.4283-1-pavel@zhukoff.net>
 <CAMKF1squqBoDcuEdRY_MS=uJfyc7bVtK15pLrh8VunKo4YvvDw@mail.gmail.com>
Date: Wed, 04 Oct 2023 18:11:48 +0200
From: "Pavel Zhukov" <pavel@zhukoff.net>
To: "Khem Raj" <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH 1/3] dummy-sdk-package.inc: Filter packages which are marked for installation
Content-Type: multipart/alternative;
 boundary=f555627f95924b8a9774ca261d9dc89d
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Oct 2023 16:33:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105338

--f555627f95924b8a9774ca261d9dc89d
Content-Type: text/plain

Whoops. Sorry. wrong alias.
I'm resending to proper ML. 

On Wed, Oct 4, 2023, at 17:51, Khem Raj wrote:
> Wrong mailing list core layer patches go to oe-core mailing list not oe-devel 
> 
> On Wed, Oct 4, 2023 at 8:07 AM Pavel Zhukov <pavel@zhukoff.net> wrote:
>> From: Pavel Zhukov <pavel@zhukoff.net>
>> 
>> if packages is provided by dummysdk and in the same time marked for
>> installation with IMAGE_INSTALL it causes conflict in apt because virtual providers are
>> not taken into account if package is asked to be installed explicitly.
>> Filter such packages from provides/conflicts to workaround this problem.
>> This workaround brakes RPM usecase because of file conlicts with
>> DUMMYPROVIDES, use DUMMYPROVIDES_PACKAGES_MULTILIB instead (which
>> doesn't include file based conflicts).
>> While this is needed for the case of package_deb only adding it for all
>> package managers to not complicate the code.
>> 
>> Fixes: [Yocto #13338] [Yocto #14066]
>> 
>> Fixes:
>> The following information may help to resolve the situation:
>> 
>> The following packages have unmet dependencies:
>>  target-sdk-provides-dummy : Conflicts: bash
>> E: Unable to correct problems, you have held broken packages.
>> 
>> Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
>> ---
>>  meta/recipes-core/meta/dummy-sdk-package.inc | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>> 
>> diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/recipes-core/meta/dummy-sdk-package.inc
>> index bd26e39ad3..6ccafbf8bc 100644
>> --- a/meta/recipes-core/meta/dummy-sdk-package.inc
>> +++ b/meta/recipes-core/meta/dummy-sdk-package.inc
>> @@ -19,13 +19,14 @@ PR[vardeps] += "DUMMYPROVIDES"
>>  PR[vardeps] += "DUMMYPROVIDES_PACKAGES"
>> 
>>  DUMMYPROVIDES_PACKAGES ??= ""
>> -DUMMYPROVIDES_PACKAGES_MULTILIB = "${@' '.join([multilib_pkg_extend(d, pkg) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES').split()])}"
>> +DUMMYPROVIDES_PACKAGES_FILTERED = "${@' '.join([pkg for pkg in d.getVar('DUMMYPROVIDES_PACKAGES').split() if d.getVar('IMAGE_INSTALL') is not None and pkg not in d.getVar('IMAGE_INSTALL').split()])}"
>> +DUMMYPROVIDES_PACKAGES_MULTILIB = "${@' '.join([multilib_pkg_extend(d, pkg) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES_FILTERED').split()])}"
>>  DUMMYPROVIDES += "${DUMMYPROVIDES_PACKAGES_MULTILIB}"
>> 
>>  python populate_packages:prepend() {
>>      p = d.getVar("PN")
>>      d.appendVar("RPROVIDES:%s" % p, "${DUMMYPROVIDES}")
>> -    d.appendVar("RCONFLICTS:%s" % p, "${DUMMYPROVIDES}")
>> +    d.appendVar("RCONFLICTS:%s" % p, "${DUMMYPROVIDES_PACKAGES_MULTILIB}")
>>      d.appendVar("RREPLACES:%s" % p, "${DUMMYPROVIDES_PACKAGES_MULTILIB}")
>>  }
>> 
>> -- 
>> 2.41.0
>> 
>> 
>> 

--f555627f95924b8a9774ca261d9dc89d
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.MsoNor=
mal,p.MsoNoSpacing{margin:0}</style></head><body><div>Whoops. Sorry. wrong =
alias.<br></div><div>I'm resending to proper ML.&nbsp;<br></div><div><br></=
div><div>On Wed, Oct 4, 2023, at 17:51, Khem Raj wrote:<br></div><blockquot=
e type=3D"cite" id=3D"qt" style=3D""><div dir=3D"auto">Wrong mailing list c=
ore layer patches go to oe-core mailing list not oe-devel&nbsp;<br></div><d=
iv><div><br></div><div class=3D"qt-gmail_quote"><div dir=3D"ltr" class=3D"q=
t-gmail_attr">On Wed, Oct 4, 2023 at 8:07 AM Pavel Zhukov &lt;<a href=3D"ma=
ilto:pavel@zhukoff.net">pavel@zhukoff.net</a>&gt; wrote:<br></div><blockquo=
te class=3D"qt-gmail_quote" style=3D"margin-top:0px;margin-right:0px;margin=
-bottom:0px;margin-left:0.8ex;border-left-width:1px;border-left-style:solid=
;border-left-color:rgb(204, 204, 204);padding-left:1ex;"><div>From: Pavel Z=
hukov &lt;<a href=3D"mailto:pavel@zhukoff.net" target=3D"_blank">pavel@zhuk=
off.net</a>&gt;<br></div><div> <br></div><div> if packages is provided by d=
ummysdk and in the same time marked for<br></div><div> installation with IM=
AGE_INSTALL it causes conflict in apt because virtual providers are<br></di=
v><div> not taken into account if package is asked to be installed explicit=
ly.<br></div><div> Filter such packages from provides/conflicts to workarou=
nd this problem.<br></div><div> This workaround brakes RPM usecase because =
of file conlicts with<br></div><div> DUMMYPROVIDES, use DUMMYPROVIDES_PACKA=
GES_MULTILIB instead (which<br></div><div> doesn't include file based confl=
icts).<br></div><div> While this is needed for the case of package_deb only=
 adding it for all<br></div><div> package managers to not complicate the co=
de.<br></div><div> <br></div><div> Fixes: [Yocto #13338] [Yocto #14066]<br>=
</div><div> <br></div><div> Fixes:<br></div><div> The following information=
 may help to resolve the situation:<br></div><div> <br></div><div> The foll=
owing packages have unmet dependencies:<br></div><div> &nbsp;target-sdk-pro=
vides-dummy : Conflicts: bash<br></div><div> E: Unable to correct problems,=
 you have held broken packages.<br></div><div> <br></div><div> Signed-off-b=
y: Pavel Zhukov &lt;<a href=3D"mailto:pavel@zhukoff.net" target=3D"_blank">=
pavel@zhukoff.net</a>&gt;<br></div><div> ---<br></div><div> &nbsp;meta/reci=
pes-core/meta/dummy-sdk-package.inc | 5 +++--<br></div><div> &nbsp;1 file c=
hanged, 3 insertions(+), 2 deletions(-)<br></div><div> <br></div><div> diff=
 --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/recipes-core/m=
eta/dummy-sdk-package.inc<br></div><div> index bd26e39ad3..6ccafbf8bc 10064=
4<br></div><div> --- a/meta/recipes-core/meta/dummy-sdk-package.inc<br></di=
v><div> +++ b/meta/recipes-core/meta/dummy-sdk-package.inc<br></div><div> @=
@ -19,13 +19,14 @@ PR[vardeps] +=3D "DUMMYPROVIDES"<br></div><div> &nbsp;PR=
[vardeps] +=3D "DUMMYPROVIDES_PACKAGES"<br></div><div> <br></div><div> &nbs=
p;DUMMYPROVIDES_PACKAGES ??=3D ""<br></div><div> -DUMMYPROVIDES_PACKAGES_MU=
LTILIB =3D "${@' '.join([multilib_pkg_extend(d, pkg) for pkg in d.getVar('D=
UMMYPROVIDES_PACKAGES').split()])}"<br></div><div> +DUMMYPROVIDES_PACKAGES_=
FILTERED =3D "${@' '.join([pkg for pkg in d.getVar('DUMMYPROVIDES_PACKAGES'=
).split() if d.getVar('IMAGE_INSTALL') is not None and pkg not in d.getVar(=
'IMAGE_INSTALL').split()])}"<br></div><div> +DUMMYPROVIDES_PACKAGES_MULTILI=
B =3D "${@' '.join([multilib_pkg_extend(d, pkg) for pkg in d.getVar('DUMMYP=
ROVIDES_PACKAGES_FILTERED').split()])}"<br></div><div> &nbsp;DUMMYPROVIDES =
+=3D "${DUMMYPROVIDES_PACKAGES_MULTILIB}"<br></div><div> <br></div><div> &n=
bsp;python populate_packages:prepend() {<br></div><div> &nbsp; &nbsp; &nbsp=
;p =3D d.getVar("PN")<br></div><div> &nbsp; &nbsp; &nbsp;d.appendVar("RPROV=
IDES:%s" % p, "${DUMMYPROVIDES}")<br></div><div> -&nbsp; &nbsp; d.appendVar=
("RCONFLICTS:%s" % p, "${DUMMYPROVIDES}")<br></div><div> +&nbsp; &nbsp; d.a=
ppendVar("RCONFLICTS:%s" % p, "${DUMMYPROVIDES_PACKAGES_MULTILIB}")<br></di=
v><div> &nbsp; &nbsp; &nbsp;d.appendVar("RREPLACES:%s" % p, "${DUMMYPROVIDE=
S_PACKAGES_MULTILIB}")<br></div><div> &nbsp;}<br></div><div> <br></div><div=
> -- <br></div><div> 2.41.0<br></div><div> <br></div><div> <br></div><div> =
<br></div></blockquote></div></div></blockquote><div><br></div></body></htm=
l>

--f555627f95924b8a9774ca261d9dc89d--

