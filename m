Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1E89F74DBB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 22:59:49 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id t27-v6so11483841oij.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 15:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=akQu1EnuBp6cuwVQPkyp+XgstvIwmsw0NYW49aJ2ADs=;
	b=rSyEJ7i1s0tdkF/EcBh8H/U31JxA0xoJsFfYgoyvnufID8GcFbvPXMSsXbHd/gTlD7
	beoLctIIO05dCv3bQpAgFPUnkFBQY+K8SS+StDQBZYlNdCDpXXuD/u5fidRSdbHXE1Fk
	PDUKBuRa01dwRCFGuffSOXibjLuJE/ccP5L+j5sIwG7KQ13N4p+RfPERXkID0Nh0aw5N
	JL80Qrlz7fe8BGxfIPUni3xGTGMYx0RQmJ3c/5QsEzEKpXNbML5Y+k1cVAhNhLg5oVbg
	muQ240x8gZfxfWEp/rvqlNPQbMgctzG8Yn4ag18WhlRGRBHbLldPZkQV+uGFgmOlC2Ni
	DZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=akQu1EnuBp6cuwVQPkyp+XgstvIwmsw0NYW49aJ2ADs=;
	b=m1viH/GXAdrcihXul3hcL/os9RUef9XS/gB9BnytOGCEUQmvQGYtl5/E9vbA5wwp9J
	bOxltncZE0ek/xAg/aK8l76Oim+NT9+24w+xgpfa74PbXdEZFLOZEr9S5+Ns+5XWVkC6
	0IuXmPJC5UIULCbkH2FfouEjFAl0N+2Jw0vaMSpGhMlR1IeT+GFh2iaecND2DQ5N4sQR
	ynLyo2DTd6rhOvetLJ5XeGJg2cOmyxMzLw1wpE1orw1DcLARgt/6fYpAqGqsnC4jOdpb
	m+jbtcI9pKn8a7rwLBQ+SlIioEn69U9hIpg4HI3N0F1F2Q8fZRDp/R2yQ8/A1wOaRxmc
	4k1g==
X-Gm-Message-State: ALKqPwcUIXgZtOae8zpmfDMAYekyLXLstew6HdGX+pYVbFqXtpiLJ3AK
	XSLVrhQ0P8jwC0KGFRtj1Atnge0BoLBKf9rUfZY=
X-Google-Smtp-Source: AB8JxZo+xAIAhJ7Fb5SwxZKoKlCOQrkTwec349ICi6whS5ZOf9471CfHF8FWHpL+RfedKX8rpmyFFojD7lHdIdeqP7g=
X-Received: by 2002:aca:2ec3:: with SMTP id
	u186-v6mr10859318oiu.104.1526857190548; 
	Sun, 20 May 2018 15:59:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.73.11 with HTTP; Sun, 20 May 2018 15:59:49 -0700 (PDT)
In-Reply-To: <CAMKF1sqzSijiLbRpGirRtyJ6RkcQsfL=FntfpxDRwuOw7thErg@mail.gmail.com>
References: <20180520223517.9869-1-raj.khem@gmail.com>
	<CALbNGRRMj8LqXaw+=DzkBMQoKgprxp5u8OdLrePgPxS9_x_dxg@mail.gmail.com>
	<CAMKF1sqzSijiLbRpGirRtyJ6RkcQsfL=FntfpxDRwuOw7thErg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 21 May 2018 00:59:49 +0200
Message-ID: <CALbNGRRF1tRnwBrsSueJyVVnxCC_ncxmP2vEWmeYVq9EQMAAAA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Sun, 20 May 2018 22:59:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 21, 2018 at 12:47 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sun, May 20, 2018 at 3:46 PM, Andreas M=C3=BCller <schnitzeltony@gmail=
.com> wrote:
>> On Mon, May 21, 2018 at 12:35 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> Fixes QA errors e.g.
>>>
>>> ERROR: network-manager-applet-1.8.10-r0 do_package: QA Issue: network-m=
anager-applet: Files/directories were installed but not shipped in any pack=
age:
>>>   /usr/share/gir-1.0
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>  .../network-manager-applet/network-manager-applet_1.8.10.bb   | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/net=
work-manager-applet_1.8.10.bb b/meta-gnome/recipes-connectivity/network-man=
ager-applet/network-manager-applet_1.8.10.bb
>>> index dc2b964be5..ccfe38d010 100644
>>> --- a/meta-gnome/recipes-connectivity/network-manager-applet/network-ma=
nager-applet_1.8.10.bb
>>> +++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-ma=
nager-applet_1.8.10.bb
>>> @@ -43,3 +43,7 @@ FILES_${PN} +=3D " \
>>>      ${datadir}/libnm-gtk/wifi.ui \
>>>      ${datadir}/libnma/wifi.ui \
>>>  "
>>> +
>>> +FILES_${PN}-dev +=3D " \
>>> +    ${datadir}/gir-1.0 \
>>> +"
>>> --
>>> 2.17.0
>>>
>> On sumo I do not see this QA error and gir-files are packed properly
>> to network-manager-applet-dev.
>>
>> Sure that this is a correct fix? What changed in oe-core?
>>
>
> This is seen with musl builds. In anycase gir files if any should go
> into -dev pkgs.
>
Ahh musl / gir...

So how about dropping a note near FILES_${PN}-dev - otherwise chances
are high it gets removed sooner or later. For non musl this is not
necessary and at least I will not remember during next release
panic...

Andreas

