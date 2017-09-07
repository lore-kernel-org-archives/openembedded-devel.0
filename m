Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1436F780AA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Sep 2017 14:51:52 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id s15so19182644uag.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Sep 2017 07:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=q+Qkvj1E2n3LC8xBLlE1KODxJ0m7YODZK8b6YwDW3ro=;
	b=Q1D763+2+1GhEguwzWi8aZE6/QgxLDKA1nhgS67ZMQrbCjTubGeW8VwSpWBsIyWDwD
	3RVFZjHMFlpmSi5r4DHixx3fpYk8Zbqh1jStpCN5fXGJW5B0Q07i13QrcaopLbx08O4o
	fr+9lXKUuSoRS2or0nYVfU1zs5L3eiXf1KfCFTHRalo0vWlA02iGy1488ltc5UojWWIG
	gU9EmqQrYbqXzBD8homS1YN8bRisMFj4fPizAxGJIcHt/Y2XXP2qMcv1lKd0RkxjLZkj
	Dg8wcvhpr7M61asdk51fimcFUHQz2iVKuOWoKGtoZMOiHQMxXzEiG65yEpvH/3rsb44T
	c0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=q+Qkvj1E2n3LC8xBLlE1KODxJ0m7YODZK8b6YwDW3ro=;
	b=uCRtzxmn9D9M+aZId3c5EdMv8ZCU9Q+nZMGGI5W3Svhwc8AirmHGS6E0QCWSxLOmxZ
	wARU/KrSLFA38DX7UueXgfG/RopxetF98GmFXjzbhkDq0rRVhWPGo0pGY2CA+IVSVVw1
	4mR/FdodcX+vENvC87ZCCFjQ/x/zcTA59HjRTUt1GVTnhGeHXqEy56E5JpxxBQq5kK7x
	BtlaFdiOgxrLXA5GTyAQSg0uYrM7h78abztEhhp2P9zoZkpY/2ELlSzWOv3/bYeqb8M7
	Ew21wpQwq7dRTA1Z7rn7e5niziFlZeyooe+FKgenk3FEuQDjweWxy7i7aXGnS2+fG9BV
	jMnw==
X-Gm-Message-State: AHPjjUj4AUjnKn9N/zPvRrpCmPu0WdwRm0Xo532jj+Buyzo3g16KPRv2
	AjAkH3ZYCizGqnDp8D2kHKf7w05nzA==
X-Google-Smtp-Source: ADKCNb5lrmR5UmYW7sSI7TgxlLNrPaa9o1wH4QTO3/Kremy1S7IL11iivAMkVZ1p+4sxHQBcMncdoGytxU7QT++XT6Q=
X-Received: by 10.176.67.35 with SMTP id k32mr1916391uak.203.1504795913695;
	Thu, 07 Sep 2017 07:51:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.51.10 with HTTP; Thu, 7 Sep 2017 07:51:53 -0700 (PDT)
In-Reply-To: <729ff654-8482-3c02-fe1e-fc88a1a90179@windriver.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
	<1504725809-12825-20-git-send-email-mark.hatle@windriver.com>
	<CALbNGRS8S=vdceyyRV2fuTyJnZFM0MsK=JWdVoWn_KAxu_SRsw@mail.gmail.com>
	<729ff654-8482-3c02-fe1e-fc88a1a90179@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 7 Sep 2017 16:51:53 +0200
Message-ID: <CALbNGRSOSdckoQix8bc+ciAaiiNsqN1Y+TyHNoQPGfRSD8RTKQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 19/31] glade3: Move PACKAGECONFIG setting to enable_gnome.conf
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
X-List-Received-Date: Thu, 07 Sep 2017 14:51:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 7, 2017 at 3:45 PM, Mark Hatle <mark.hatle@windriver.com> wrote=
:
> On 9/7/17 4:29 AM, Andreas M=C3=BCller wrote:
>> On Wed, Sep 6, 2017 at 9:23 PM, Mark Hatle <mark.hatle@windriver.com> wr=
ote:
>>> This resolves a failure of the yocto-compat-layer.py script.  Changing =
the
>>> PACKAGECONFIG setting by just including a layer can cause problems.
>>>
>>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>>> ---
>>>  meta-gnome/conf/enable_gnome.conf                   | 2 ++
>>>  meta-gnome/recipes-devtools/glade/glade3_%.bbappend | 1 -
>>>  2 files changed, 2 insertions(+), 1 deletion(-)
>>>  delete mode 100644 meta-gnome/recipes-devtools/glade/glade3_%.bbappend
>>>
>>> diff --git a/meta-gnome/conf/enable_gnome.conf b/meta-gnome/conf/enable=
_gnome.conf
>>> index 883a6f5..7e711ee 100644
>>> --- a/meta-gnome/conf/enable_gnome.conf
>>> +++ b/meta-gnome/conf/enable_gnome.conf
>>> @@ -1 +1,3 @@
>>>  AVAHI_GTK_pn-avahi-ui =3D "gtk gtk3"
>>> +
>>> +PACKAGECONFIG_pn-glade3 =3D "gnome"
>>> diff --git a/meta-gnome/recipes-devtools/glade/glade3_%.bbappend b/meta=
-gnome/recipes-devtools/glade/glade3_%.bbappend
>>> deleted file mode 100644
>>> index 3abacfb..0000000
>>> --- a/meta-gnome/recipes-devtools/glade/glade3_%.bbappend
>>> +++ /dev/null
>>> @@ -1 +0,0 @@
>>> -PACKAGECONFIG ??=3D "gnome"
>>> --
>>> 1.8.3.1
>>>
>> Yet another stupid question (yes I need gnome support for working with
>> glade3): How is enable_gnome.conf supposed to be activated?
>>
>> For the record: This is yet another patch kicking things off for the
>> sake of yocto-compat-layer script. Is meta-gnome supposed to be yocto
>> compatible? Was this decided by 'community'?
>
> See the cover letter:
>
> [18/31] enable_gnome.conf: Move the AVAHI_GTK setting
> - The yp-compat script does not allow a layer to modify the system wide
> configuration (including modifying other recipe behavior).  The AVHAI_GTK
> changes the behavior of that recipe, which is detected by the script.  So
> I choose to move this to a configuration file that will need to be requir=
ed
> by the user IF they want avahi to use GTK.  I'm not happy with this, but =
I
> don't see any other way to meet the requirements.
>
> [19/31] glade3: Move PACKAGECONFIG setting to enable_gnome.conf
> - Similar to the above, but with PACKAGECONFIG this time.
>
> I don't see an alternative here due to this requirement.  As I said befor=
e you
> guys maintain meta-openembedded, I don't.  If this doesn't work (and I ne=
ver
> expected it to) then reject the patch and don't merge it.
Your approach scares me - really: Somebody creates a magic script says
'this is it', calls it community driven and you send out patches which
break things and you don't care - or even worse you expect them to
break things. You guys are aware of what we are doing here: Major
target is building working images - right?

This is not the community I want to waste further time on

Andreas

