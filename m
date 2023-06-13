Return-Path: <muhammad.hamzai@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC58AC7EE29
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 05:16:14 +0000 (UTC)
Received: from sonic306-19.consmr.mail.ir2.yahoo.com (sonic306-19.consmr.mail.ir2.yahoo.com [77.238.176.205])
 by mx.groups.io with SMTP id smtpd.web11.6748.1686633372570645000
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 22:16:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=R2NvpOcN;
 spf=neutral (domain: yahoo.com, ip: 77.238.176.205, mailfrom: muhammad.hamzai@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1686633370; bh=qdt+wOWQgmvjbuyQXYnGl8NeT9tU1f/LNH6FuJGgASk=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=R2NvpOcNgyjHVqzumNxyzNvzbCb29fqjOuPq7eYYfZy4q3yyPtlNBUXZXSfDEZ+NBqZFiXdIm48ui+clgLg6SVeLDWMOb6b8qWwTuo6oVd+CbIVxLV7IeGuuSFf98IFVIjpyZ4zvckajB7pz0p4BxWUSYJbsUcKoXUD2Zuy9f/eptmWvYtAvDon/T5CIbh6g0xubkKafRsZIvoHLng2JCECaT66WqhTh3YStGXYMSRhDEXjtlx4a4N3BrUioMvfE5Ss2HFc6005G2RTP5BnsNzaOQWXOspAU8FpfaLf8Y7SMyJHP9LhBJRXO+XKkKq3YVbrhQ14lkSofFGCa3RK/yA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1686633370; bh=wYh2YxAeaQ4aNHwNDE3yEdNaQZ1RbmIdQt9bBnVLBXJ=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=TDRPnYLd4S5OkgpclkR22Yd9FGxjM524D+L0t+Jd5Bs1fGmauIYwcmABQYfA4dEgXwzg+vPUk767sA3x+xE2pQvsS3Fmr1y0t1JRDJ6VDrm9vXIutH6D2/7dJVXm3NIh4QjjbWU91hVA5N+CC6auICzNjo1iZBw68OCKcbD6n445ftfgIuCdoas/zphSlNemP+zkIzR5x6KQpkEXC/6LMHiRv9QTkBHhk8r97caAEHtBM3VfVztPP2bxr8BRBwU65l/QydGAVjDEOGjiD+MS30pq0tnSCpUsMnTst3KK79gnGsSsb+BpHF3D1vUahRDgMH6i3HsML3qh55NnsFY+yA==
X-YMail-OSG: w4Un1usVM1ldHvyWMFxqJZmeHJbl87LCknEgNEBy0oOfMHun75gwgnYdLzKPJQY
 9N9wwVir3FGU.3C761TEeLjENIBG4r6LIRVirvNDWgjHqtLdX3DvVEXsUqDfr8TYyVcz7wvBRZzm
 Sq6Q6DST9Ig5C7SAWRPM06Azep7ejzw3bRXaYkAzXdHikYZM13NmiJE3TzAK2An6ajOBt1M5LMeS
 yTmiT_UaYRDahqGuRB6fc47j9UyJ_qneGkCfEi6Wnwf4kVYnvY_dZvoPpxAalkWPHNXODn9QqbdY
 6va0FUhbQH4Bwk91c2bru0BcY4wf6cOtitbEBgPLIaG1GMlJEbmwglLTtUDR1TFZt5aSdgbx668U
 Pa2eMLF8HaiWzE0dSlCFLJFIzB6JMD.F7nHRqPAwe1PrN8FSiO234AemS8MTbUcs_iaFtm.1LnX1
 IIURgR3mjN8f2BrBMlvw1mHx3MGCEJ9xLnkZJttXWn7Gzl02d4hHlZnJ1Dh8jmZ_K0ZHJcRGnXeE
 Uc.Scb5neUQClLPHbXe.hI94uKPaoDvBLG0_g0l3SZJ.7RsrbPcs9sB3TmS8ZKsK4sMRhf7QR7ys
 WnLcmihSTF2p..XOIozCRCKVpdtYKDjBTxBM.4C7n_JNKftX7DfYq.tt0QmmHWDypZn_FHYwt_Hf
 iNz_TkzsaeFPLOjd07JleJ_XKL1GmyHwPCU7K6bVF0Y8na9GCg284ZicQBB0O6lGyHxfBJchdLLP
 OihGyG2yLJTPwk8eylJYRJ3muTEWCz.iYItvqHSn24YJPMG9JMVXzuw7WYiUpcheCZ1ZSQNobcTt
 B5NJTxCNUrkAoWniDM1vgS8v5Y8w4rA63EUKSGmYl9TXhCtY3pBfTUN.a2dRSF6PbdEaOHW7ulDZ
 Tu.woa5F1VtOKuWS4Cg.N8Qj0e2E_IoK0mRAzK15pIcCKC0zVht4jWa2ceikJZAHjaRf5Fs4lXL_
 O1MzWxPYNTVwacYk6tO9dOvFrjml6LCpHcGizqnPT4J4hF9t7x3WzrI0PjcJyk.4fY1Sg4OJ6jV_
 tdNQW2tVo7e.PdL3lrZeD4m.Py3s.G239MznwMtPZaTEjTW6BWCW7nb_MU0ENH3WuL0SIg8ekKys
 nzh6OsN3sqkeorKS3q._t4n6vxWpr6ELuwodlukPmlvJDwUKNZZsvKEbeqi47rI.3wOF6a5_LlG6
 bzTyhp37985CYR_JbLajnFI5WHqOmf1DQqQVasWzZ2gKLJGsaceyKnDwDWW89lAypTaTCnF0hhi5
 _fCZMGOeSEoPktdcNvnFRDn29x_wy6qlYyVoC7UZkUjIFDBtmkgUsZLVWDNtkYDhrYIOnTiwTlN7
 MSbkzwEBiURR_rtEbJ0AWm1ifxLE2nJH5ATMJqO9dx7.YFTMEZAkXq9DJ3kP5cjBWLUajPllkcP4
 o276vyxUWqEzASXxOhcR9dkrzu7tp011Cw0ERlM7EG5F6vTESiXE4SYZ3nnZtjsIhf5EEkEfUVBP
 4Pa8p3r6Ph.QiR1TjfqD.ZvVhrGjbJbomGEtfxV0timST0XrIOgRGvSn6_n9LcqwyA69YvtGfISL
 gSzTXYi8UXx7HBmrQMVr0.WCV7.9vgSZmdAxrQiHK9S2npdAYYupvtclWxApxSKDxRV9xBQFIQph
 0EtkFS9tjPLTYgFuC46Iw7Pqh6mi8a1ooRlTzttDUTV224PPbGeU.pBWTiW4rlN2G76doxuFopEL
 1W1SNKGfmOOVgIlUSPBcVFPD5hYrYvE.nrAWA5zIXw7Ne1tUz1O6u1H5rNCwMcZCNW1_qXfNU4uw
 7u4Ee6WBOwnAbYfbfRzzTdZpOXrzUHOSAuipytqZgb0ycLMcAo5UUKhDd8j4SImuAdEj9jC0KsCO
 Cdj2pj.PLosW50IzHJqzopaIYpOfsRda0ITsNFEnPvG0ZdH.vwNzK36UwW2uOJ2zf3wUSeMkkevK
 vGWVIZvTJDC42uImLIzVRbugAZKKYo12XHzzUZ_F7eYPzICMKbRrWnj4js.SYo7e_1piEOZAFEPV
 WV.ABgjhgzhge3CS3JeNU2qOf16xDOVzaZrx7WTm1t0pDea5BsRr2.hbxOgICK8jKsmIMzLVTXtq
 JjnwP5rdJZd2_KH793_X8bKKpv489AzH1DKt7fzpo5HSIdt7fTxFgpH8YRc8mgdp7y09_EpIySVR
 Jcv3MTVrawuaVVLhwSWgjFace1_5_fbls97ECuO0PfTY8JVk4N_Tk.elyqMRBwI96gzC5xA--
X-Sonic-MF: <muhammad.hamzai@yahoo.com>
X-Sonic-ID: 5837b0bf-c218-4e85-b3ac-9829f7a7a368
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.ir2.yahoo.com with HTTP; Tue, 13 Jun 2023 05:16:10 +0000
Date: Tue, 13 Jun 2023 05:16:06 +0000 (UTC)
From: "Muhammad.Hamza Ishfaq" <muhammad.hamzai@yahoo.com>
To: 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Message-ID: <1747474539.3138796.1686633366135@mail.yahoo.com>
Subject: [meta-oe][PATCH] exprtk_git: Fix SRCREV for exprtk_git
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_3138795_917642246.1686633366134"
References: <1747474539.3138796.1686633366135.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.21516 YMailNorrin
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 05:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103256

------=_Part_3138795_917642246.1686633366134
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

exprtk_git recipe uses a SRCREV that does not belongto any branch and resul=
ts in a fetcher failure when bitbaketries to fetch it.This commit updates t=
he SRCREV to fix this issue.
Signed-off-by: Muhammad Hamza <muhammad.hamzai@yahoo.com>---=C2=A0meta-oe/r=
ecipes-devtools/exprtk/exprtk_git.bb | 2 +-=C2=A01 file changed, 1 insertio=
n(+), 1 deletion(-)
diff --git a/meta-oe/recipes-devtools/exprtk/exprtk_git.bb b/meta-oe/recipe=
s-devtools/exprtk/exprtk_git.bbindex 52975c821..557c4f27a 100644--- a/meta-=
oe/recipes-devtools/exprtk/exprtk_git.bb+++ b/meta-oe/recipes-devtools/expr=
tk/exprtk_git.bb@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/ArashParto=
w/exprtk"=C2=A0SECTION =3D "libs"=C2=A0LICENSE =3D "MIT"=C2=A0LIC_FILES_CHK=
SUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b=
4f302"-SRCREV =3D "281c2ccc65b8f91c012ea3725ebcef406378a225"+SRCREV =3D "f4=
6bffcd6966d38a09023fb37ba9335214c9b959"=C2=A0=C2=A0SRC_URI =3D "git://githu=
b.com/ArashPartow/exprtk.git;branch=3Dmaster;protocol=3Dhttps"=C2=A0--=C2=
=A02.34.1


------=_Part_3138795_917642246.1686633366134
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"yahoo-style-wrap" style=3D"font-fami=
ly:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:13px;"><div dir=
=3D"ltr" data-setdir=3D"false"><div><div>exprtk_git recipe uses a SRCREV th=
at does not belong</div><div>to any branch and results in a fetcher failure=
 when bitbake</div><div>tries to fetch it.</div><div>This commit updates th=
e SRCREV to fix this issue.</div><div><br></div><div>Signed-off-by: Muhamma=
d Hamza &lt;muhammad.hamzai@yahoo.com&gt;</div><div>---</div><div>&nbsp;met=
a-oe/recipes-devtools/exprtk/exprtk_git.bb | 2 +-</div><div>&nbsp;1 file ch=
anged, 1 insertion(+), 1 deletion(-)</div><div><br></div><div>diff --git a/=
meta-oe/recipes-devtools/exprtk/exprtk_git.bb b/meta-oe/recipes-devtools/ex=
prtk/exprtk_git.bb</div><div>index 52975c821..557c4f27a 100644</div><div>--=
- a/meta-oe/recipes-devtools/exprtk/exprtk_git.bb</div><div>+++ b/meta-oe/r=
ecipes-devtools/exprtk/exprtk_git.bb</div><div>@@ -3,7 +3,7 @@ HOMEPAGE =3D=
 "https://github.com/ArashPartow/exprtk"</div><div>&nbsp;SECTION =3D "libs"=
</div><div>&nbsp;LICENSE =3D "MIT"</div><div>&nbsp;LIC_FILES_CHKSUM =3D "fi=
le://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b4f302"</div=
><div>-SRCREV =3D "281c2ccc65b8f91c012ea3725ebcef406378a225"</div><div>+SRC=
REV =3D "f46bffcd6966d38a09023fb37ba9335214c9b959"</div><div>&nbsp;</div><d=
iv>&nbsp;SRC_URI =3D "git://github.com/ArashPartow/exprtk.git;branch=3Dmast=
er;protocol=3Dhttps"</div><div>&nbsp;</div><div>--&nbsp;</div><div>2.34.1</=
div><div><br></div></div><br></div></div></body></html>
------=_Part_3138795_917642246.1686633366134--

