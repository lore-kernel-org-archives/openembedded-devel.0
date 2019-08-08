Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5B8627F2AB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Aug 2019 15:13:30 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id p184so44273917pfp.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Aug 2019 08:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=yX4F72k3KLFFePZxKqbRW6AWmXaOq67XUKneACRES3s=;
	b=OL82vqf7JycGLGPZrODeMWtkANU/UC6zblyeemoWkH8/UcVZsvuMLYXYXd3eEpOoXg
	GomO4rMxdnolzELdNRu5APb5X0DhUcL24tUc46s1b0DNdYwcYS60hRJZ2C6qezl9MUfz
	wImFGWnNfXVePXexfrjtca6xgAlCeLCfDSseLDP/ORGVq9HR9vTVMR8fE0nNwmg82QBR
	uC3u2+ncQAV9PEiGxZakhUo7vGPpiOqiLUvX4Fvoekxirt/0u5S7kfapgbxI76eOTEIe
	F+sNPzQopkbNNycBNchR+S9oGWtReq4opNcEQML4p/qRhH549zwz3vd7Zd98kyW1gPIf
	kO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=yX4F72k3KLFFePZxKqbRW6AWmXaOq67XUKneACRES3s=;
	b=oV3r10NCqkr3diskzGmvTEbbEB5UxULZmpaxHgX0Q7JhZSmB6/Dw55gkhqFxa72TRh
	LBMX9fgbhF0+7aiE2wplu55afuaGdygrwQZL5JNmgnS27RPKP1a0y/kfBfVZ+nwxCjGY
	PTlSjhUsU8NnpDNl9znClE66sgPFEOA0jsLdxmXjkPZ8r8SBZdNtCtJEsaV8EGfe714Z
	vMhzGCxjIBsxIKvAWaQe6FecCYv3oXbfIx3nD7wh4aJmUQmUBm6tLm5PPWPHVmIcbVcu
	odmbzRtAXmyuK6KEk18GMTqUzeLW22LonnHDG2VXtCzoLiOo3TqFfX9MdH+qnUZLoIAg
	1aGQ==
X-Gm-Message-State: APjAAAVu4reimOp9rLspEAT0kyaJGeyGN91jo1NXvt8tlz+Zo9zGisKF
	v525xPun3wnfL3OuzoqSt+FUJsnzilg=
X-Google-Smtp-Source: APXvYqyXdaFSI21AxXEsITpyodafeJwe7QSMuCKxXGnXgcyCI/Za2wydetYdvCClWY7ypJuylRUs/g==
X-Received: by 2002:a17:90a:26ea:: with SMTP id
	m97mr4591903pje.59.1565277210722; 
	Thu, 08 Aug 2019 08:13:30 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6::bbfb? ([2601:646:8500:6bc6::bbfb])
	by smtp.gmail.com with ESMTPSA id
	135sm109351714pfb.137.2019.08.08.08.13.29
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Aug 2019 08:13:30 -0700 (PDT)
To: Kang Kai <Kai.Kang@windriver.com>,
	=?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
References: <20190807051707.8709-1-kai.kang@windriver.com>
	<CALbNGRQ-e5SvSJVeet6MsZJ9Ux0K06jrxxH_T=YztAgCqGOUug@mail.gmail.com>
	<80d262d5-643d-0ccb-bd6d-1a1207d06833@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <176921d1-3656-c5a2-b526-f8b5c1bf346a@gmail.com>
Date: Thu, 8 Aug 2019 08:13:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <80d262d5-643d-0ccb-bd6d-1a1207d06833@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce][Patch 0/2] Add recipe of xfce4-datetime-setter
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
X-List-Received-Date: Thu, 08 Aug 2019 15:13:30 -0000
X-Groupsio-MsgNum: 78993
Content-Type: multipart/mixed; boundary="------------956DA2BEEB8A566B9F20222A"
Content-Language: en-US

--------------956DA2BEEB8A566B9F20222A
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 8/8/19 2:00 AM, Kang Kai wrote:
> On 2019/8/7 =E4=B8=8B=E5=8D=8810:02, Andreas M=C3=BCller wrote:
>> On Wed, Aug 7, 2019 at 7:18 AM <kai.kang@windriver.com> wrote:
>>> From: Kai Kang <kai.kang@windriver.com>
>>>
>>> Hi Andreas,
>>>
>>> I add recipe of xfce4-datetime-setter which is from your repo from
>>> github. But I found it requires dbus service org.freedesktop.timedate=
1
>>> which is from systemd. So make xfce4-settings requires it only when
>>> init manger
>>> is sytemd. Any comment on that please?
>>>
>>> Regards,
>>> Kai
>> Hi Kai,
>>
>> * had short glance on your patches: they look good to me. In the
>> 'old-days' when datetime-setter was part of xfce-settings, there was a=

>> packageconfig for it. That was enabled if systemd was in distro
>> features - so your suggestion should behave same.
>=20
> It reminds me that it is better to check distro systemd for
> xfce4-datetime-setter. v2 will be sent.
>=20
>=20
>> * thanks for taking care for meta-xfce for very long time now
>=20
> My pleasure.
>=20
>=20
>> * would anybody complain making you maintainer of meta-xfce?
>=20
> It will be my honor if I have chance to take more responsibility and
> contribute more to oe community.

Thanks for stepping up. It would be good if you can start looking at all
the meta-xfce patches, review them and send acks on mailing list, I
would look out for those, and eventually prepare a pull request for all
meta-xfce patches to be merged.

>=20
> Thanks,
> Kai
>=20
>>
>> Regards
>>
>>
>> Andreas
>>
>=20

--------------956DA2BEEB8A566B9F20222A
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3Dsj8j
-----END PGP PUBLIC KEY BLOCK-----

--------------956DA2BEEB8A566B9F20222A--
