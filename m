Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 625BB74D9B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 22:47:41 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id a3-v6so582202pgt.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 15:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=wtxWnaA/HoVu4YNuRJEXrj1pc2SH5EOVG3+gcFTIeZY=;
	b=cvI/TlHN2ur3BsUjJtQNC+wzoOlf2RVvj/m4BhafC+jw2UcvP7WsE45ihLXeiyzqqS
	WZGD9Tu9pf9/S6J/fb8M8tsQn+GDlt2G8/LnMBM0APPohjbaWZr29N8kVpcgnEc+AQVR
	EQxsEnyVkmSDhVFMHhjTH5kcDxPxJHKKuix0ySMsE1FNdav3DXia7q8KyAWpj6TLqgYn
	utJS1Rd7yjtABSovPTLHPW0X1NiRPyW9OCjMEqfP292Mir0uh+GSzaW1Z9mEq3D0EX3s
	u8TRF9sx6c1GV/4Mx2c90vu9/1E2ROuL8QYEx6vaflZw35JZERs2ZF7nov+yWx+QhvZw
	dLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=wtxWnaA/HoVu4YNuRJEXrj1pc2SH5EOVG3+gcFTIeZY=;
	b=oP0WjOLD9yUDlytlSPS83MbPyk1d8mVQEbQs2gAgVVu58W9glHrk5GZHuyYPjGNqJL
	a+vd/Ddvvphe6tfn3pGSwaiMA9E6r5oQSOQLaOwcQcIMrAK9BZKWjs5WZCIrecCHvdeJ
	oN+hTwrW6IIAHQP66MBoREELWX4+FbC3SsUIGgK0ryZsdisgRg1nXwAJc7RCz3Ph8Mwk
	nzu/DB4WNKkQVGAxvtpIV+6dhZtTmxYHC4ZRxql64DrcS/9s0b/E3Apev8os6+ImwQgg
	CR3Od+CvnzBPd3boX7efjqidxJsaJReEjsfJLvatyg4VWs52osWx12UdQNIQSv49ojaY
	X5Cw==
X-Gm-Message-State: ALKqPwfW4+42HA8iqz9IqGCQUFg4iuITR7nisqk0K4/n+SKCvFQc/k3D
	oalBfsrBT5TQvnQllQCODHZWC1gQ6kxvVMsjrgo=
X-Google-Smtp-Source: AB8JxZpEDJGSLvGO93YGUPZHVXefPRw5/dBxA60wSWOtzNjbSoVwuXUG41pQy7PPI4alOKPIW42XY9wvwpeQx+pshIM=
X-Received: by 2002:a62:5b02:: with SMTP id
	p2-v6mr17616658pfb.96.1526856462976; 
	Sun, 20 May 2018 15:47:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:8b91:0:0:0:0 with HTTP; Sun, 20 May 2018 15:47:12
	-0700 (PDT)
In-Reply-To: <CALbNGRRMj8LqXaw+=DzkBMQoKgprxp5u8OdLrePgPxS9_x_dxg@mail.gmail.com>
References: <20180520223517.9869-1-raj.khem@gmail.com>
	<CALbNGRRMj8LqXaw+=DzkBMQoKgprxp5u8OdLrePgPxS9_x_dxg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 May 2018 15:47:12 -0700
Message-ID: <CAMKF1sqzSijiLbRpGirRtyJ6RkcQsfL=FntfpxDRwuOw7thErg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH 1/6] network-manager-applet: Package gir-1.0 files into devel package
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
X-List-Received-Date: Sun, 20 May 2018 22:47:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 20, 2018 at 3:46 PM, Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
> On Mon, May 21, 2018 at 12:35 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> Fixes QA errors e.g.
>>
>> ERROR: network-manager-applet-1.8.10-r0 do_package: QA Issue: network-ma=
nager-applet: Files/directories were installed but not shipped in any packa=
ge:
>>   /usr/share/gir-1.0
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../network-manager-applet/network-manager-applet_1.8.10.bb   | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/netw=
ork-manager-applet_1.8.10.bb b/meta-gnome/recipes-connectivity/network-mana=
ger-applet/network-manager-applet_1.8.10.bb
>> index dc2b964be5..ccfe38d010 100644
>> --- a/meta-gnome/recipes-connectivity/network-manager-applet/network-man=
ager-applet_1.8.10.bb
>> +++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-man=
ager-applet_1.8.10.bb
>> @@ -43,3 +43,7 @@ FILES_${PN} +=3D " \
>>      ${datadir}/libnm-gtk/wifi.ui \
>>      ${datadir}/libnma/wifi.ui \
>>  "
>> +
>> +FILES_${PN}-dev +=3D " \
>> +    ${datadir}/gir-1.0 \
>> +"
>> --
>> 2.17.0
>>
> On sumo I do not see this QA error and gir-files are packed properly
> to network-manager-applet-dev.
>
> Sure that this is a correct fix? What changed in oe-core?
>

This is seen with musl builds. In anycase gir files if any should go
into -dev pkgs.

> Andreas

