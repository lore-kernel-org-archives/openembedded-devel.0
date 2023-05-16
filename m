Return-Path: <ken.s@variscite.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 861DDC77B7A
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 16:17:23 +0000 (UTC)
Subject: Re: bug: meta-networking: networkmanager: Langdale: duplicate NetworkManager services at runtime
To: openembedded-devel@lists.openembedded.org
From: "Ken Sloat" <ken.s@variscite.com>
X-Originating-Location: Tampa, Florida, US (47.201.82.85)
X-Originating-Platform: Windows Firefox 112
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 16 May 2023 09:17:22 -0700
References: <CANx9H-B4h67Tk+B_2AgshgrE8zMGot7aHdq2RgAikQMn4_hjWQ@mail.gmail.com>
In-Reply-To: <CANx9H-B4h67Tk+B_2AgshgrE8zMGot7aHdq2RgAikQMn4_hjWQ@mail.gmail.com>
Message-ID: <22447.1684253842372864920@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Aig93TIbeq5MLCUSLcUo"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 16:17:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102633

--Aig93TIbeq5MLCUSLcUo
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Tim,

Thanks for your reply. INIT_MANAGER did not work for me in Langdale either,=
 but I tried Mickledore and see that it does work. I dug into this a bit mo=
re and figured out the issue, which was already fixed here:
https://git.yoctoproject.org/poky/commit/meta-poky/conf/distro/poky.conf?h=
=3Dmickledore&id=3D316d66b4c43a2338609ca6c1c51afb0970a41c8e

Essentially this is a problem with the way INIT_MANAGER is assigned in the =
poky distro config. Those other variables I sent may enable systemd but do =
not disable sysvinit because INIT_MANAGER is still setting "sysvinit." User=
s who are using their own custom distro might not see this issue.

Thanks for both your responses, it ultimately led me to find the actual roo=
t problem.

Sincerely,
Ken Sloat

--Aig93TIbeq5MLCUSLcUo
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Tim,<br /><br />Thanks for your reply. INIT_MANAGER did not work for me =
in Langdale either, but I tried Mickledore and see that it does work. I dug=
 into this a bit more and figured out the issue, which was already fixed he=
re:<br /><a href=3D"https://git.yoctoproject.org/poky/commit/meta-poky/conf=
/distro/poky.conf?h=3Dmickledore&amp;id=3D316d66b4c43a2338609ca6c1c51afb097=
0a41c8e" target=3D"_blank" rel=3D"noopener">https://git.yoctoproject.org/po=
ky/commit/meta-poky/conf/distro/poky.conf?h=3Dmickledore&amp;id=3D316d66b4c=
43a2338609ca6c1c51afb0970a41c8e</a><br /><br />Essentially this is a proble=
m with the way INIT_MANAGER is assigned in the poky distro config. Those ot=
her variables I sent may enable systemd but do not disable sysvinit because=
 INIT_MANAGER is still setting "sysvinit." Users who are using their own cu=
stom distro might not see this issue.<br /><br />Thanks for both your respo=
nses, it ultimately led me to find the actual root problem.<br /><br />Sinc=
erely,<br />Ken Sloat

--Aig93TIbeq5MLCUSLcUo--

