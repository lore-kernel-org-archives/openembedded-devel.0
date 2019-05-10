Return-Path: <sean@geanix.com>
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
	by mail.openembedded.org (Postfix) with ESMTP id A208B7E0A7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 16:49:09 +0000 (UTC)
Received: from [192.168.100.12] (unknown [95.138.208.137])
	by first.geanix.com (Postfix) with ESMTPSA id C626DAD5;
	Fri, 10 May 2019 16:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1557506894; bh=RcbKWUn6goKHzYTvb3xSjB7CbIXYW45Pb058XqRHs2k=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=VoOqwYtqTPCcQlMiGW3ClFLvbWAy0e42WtSLLNPVGSZ0H8rrRgBdnVjEwLcdDg6wm
	FW38dpKlxgcVFW0/lGYOdsMpJZzngnBldlmhI7tPfZIMASjdmZ0D7xgEIpHcC/UX4M
	LJ7KmiOvD/1/NuFFEB4i/0T2oD6reinlA5KWSQsskqwxQSJQ41EMHs86dgxEufNS2O
	zyMkhR/fl3d+2ffVbz+DvYuNI6GMgFZVmweCBLVIGtWP86g3s8cCPDub/x5/W/nSiQ
	+hk2M3bNX/uS+GeitihJZkc204LrdWqG/HUehdyLHoJWKTP3+igXOWr9mbxvjLsBJz
	MELBa7CIytSUw==
Mime-Version: 1.0 (1.0)
From: =?utf-8?Q?Sean_Nyekj=C3=A6r?= <sean@geanix.com>
X-Mailer: iPhone Mail (16E227)
In-Reply-To: <CAP71WjyBr94m0gH4MBG7CEpQcS01UP9ia1Ay9S6zueJdeT-Jcg@mail.gmail.com>
Date: Fri, 10 May 2019 18:49:08 +0200
Message-Id: <8EC4636E-7D85-4364-8864-23BF2DC610DB@geanix.com>
References: <20190430060855.60494-1-sean@geanix.com>
	<CAP71WjyBr94m0gH4MBG7CEpQcS01UP9ia1Ay9S6zueJdeT-Jcg@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
X-Spam-Status: No, score=-3.1 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED
	autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on 9cf0eadf640b
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2] cannelloni: new package, CAN to ethernet proxy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 May 2019 16:49:09 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



> On 10 May 2019, at 15.08, Nicolas Dechesne <nicolas.dechesne@linaro.org> w=
rote:
>=20
> On Tue, Apr 30, 2019 at 8:09 AM Sean Nyekjaer via Openembedded-devel
> <openembedded-devel@lists.openembedded.org> wrote:
>>=20
>> Tool for sending SocketCAN messages
>> over Ethernet tunnel.
>>=20
>> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
>> ---
>> Changes in v2:
>> - Added PV
>>=20
>> .../cannelloni/cannelloni_git.bb                | 17 +++++++++++++++++
>> 1 file changed, 17 insertions(+)
>> create mode 100644 meta-oe/recipes-connectivity/cannelloni/cannelloni_git=
.bb
>>=20
>> diff --git a/meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb b/=
meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb
>> new file mode 100644
>> index 000000000..df75e6342
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb
>> @@ -0,0 +1,17 @@
>> +SUMMARY =3D "a SocketCAN over Ethernet tunnel"
>> +HOMEPAGE =3D "https://github.com/mguentner/cannelloni"
>> +LICENSE =3D "GPLv2"
>> +
>> +SRC_URI =3D "git://github.com/mguentner/cannelloni.git;protocol=3Dhttps"=

>> +SRCREV =3D "44080bb021d1a143e6906f2ec4610513c4e1cece"
>> +
>> +PV =3D "20160414+${SRCPV}"
>> +
>> +LIC_FILES_CHKSUM =3D "file://gpl-2.0.txt;md5=3Db234ee4d69f5fce4486a80fda=
f4a4263"
>> +
>> +inherit cmake
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +PACKAGECONFIG ??=3D "lksctp-tools"
>> +PACKAGECONFIG[lksctp-tools] =3D "-DSCTP_SUPPORT=3Dtrue, -DSCTP_SUPPORT=3D=
false, lksctp-tools"
>=20
> lksctp-tools recipe is in meta-networking, so we've added an implicit
> dependency on meta-networking by taking this patch. should we disable
> lksctp-tools support by default?
I completely missed that. :-D
It seems to be the correct solution, to disable it by default...
Will you send a patch?

/Sean
>=20
>> --
>> 2.21.0
>>=20
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

