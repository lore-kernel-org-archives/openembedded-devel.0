Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 25C427CE73
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2019 04:42:06 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id x15so42086336pgg.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2019 21:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=0X0mr0FxqHtUKxY+BBKl93L7jephgw0R/lPpHgZ0Kh8=;
	b=ldNgB6QXW358zvll6+Ws3eW7vkY4d/9q4p1hCFTJkPP10jdiL4eo/wzZxIlVUs7bk2
	k9270Ljhje6OZM7EsBfEiOnrjuCXfUS3AC90fGZL0HWY9cyyFFhqtAFutHEFAsoCg7Ch
	q3f8xqiiHzlULAweOVWIBNCUVBymMZ0CnGEYC4HLgNkn/j8BbcRTi+Ann5DSoRh9v6HF
	nAWUn8+EtLjpsXgYfGhLDS025XCSYp6zNq4VIHqbQOOM9fU1S4LmNeh477DJF0ew1u7w
	p3kjwEybix5heSrClRv68/LFxK1g/uvSsQnY8DuXTISH8BTevZSLQzCLondU0vuKrRu3
	/x3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=0X0mr0FxqHtUKxY+BBKl93L7jephgw0R/lPpHgZ0Kh8=;
	b=SUO83/ZwVc5sRFZsCk7pCjYmgeu4l2JdG4VXVNqvRUSAap45YMkTVBpdkJoUbvv0+k
	DcoOlh2EjSoSAnmfDtuM2CFx7iuRZS7/C4ksKL684BMXEwNDSe3hRMt2BMMlMR4IRlrA
	Bz2NdqmBICRaAJha/mLqgz3yadf14I2pMdOKRMqu5SR3SFETvu5397gANTC749EYi7zO
	a/AZrVMP5KR8x7+M+Lqa2nundaP1Qz6AkdjrIBvX1VmvP0ErLn0VIKdoZtUSSzEeFZga
	7+h5AsoSN2XASP3Mym8i9+1J5O8SvCTDHmTxeQknsFzbkEv4VgrklbpJZsYpVtvCbc97
	XxHg==
X-Gm-Message-State: APjAAAX1jCewtRl5ehX17zm3PYdXxdEQuzRf06iHy2L8kjm5wxRZUJBM
	gVdwBWUBcwY9ez+HBb+fA1TBMUVAiuA=
X-Google-Smtp-Source: APXvYqyAl/+sAakZQ6v4yK6mLsMWLb5KSYaANcS/ZJO2GDq0e5teMaZelsE4MdPLkHXJjf96cTIdhQ==
X-Received: by 2002:a17:90a:3646:: with SMTP id
	s64mr5410171pjb.44.1565757727329; 
	Tue, 13 Aug 2019 21:42:07 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6::afc4? ([2601:646:8500:6bc6::afc4])
	by smtp.gmail.com with ESMTPSA id p90sm9121719pjp.7.2019.08.13.21.42.06
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Aug 2019 21:42:06 -0700 (PDT)
To: "Buzarra, Arturo" <Arturo.Buzarra@digi.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <1F1C12BB7E7BAA40ACCAD76309F0BEC301C8D8D3@dor-sms-xch01.digi.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <5cfc2cf4-7023-d0b9-54e5-683f4891e144@gmail.com>
Date: Tue, 13 Aug 2019 21:42:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1F1C12BB7E7BAA40ACCAD76309F0BEC301C8D8D3@dor-sms-xch01.digi.com>
Subject: Re: [meta-oe][PATCH v2] lvm2: Fix RDEPEND on lvm2 to lvm2-udevrules
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
X-List-Received-Date: Wed, 14 Aug 2019 04:42:07 -0000
X-Groupsio-MsgNum: 79091
Content-Type: multipart/mixed; boundary="------------18EAC04523FA0042C4860A4A"
Content-Language: en-US

--------------18EAC04523FA0042C4860A4A
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 8/13/19 12:31 AM, Buzarra, Arturo wrote:
> Any feedback about this patch?

thanks for reminder, this is same as [1], then thud in subject line
confused me and I assigned it to Armin for release maintainance but
now I see that we can apply this patch for master as well. which I have
queued

>=20
> Thanks,
>=20

--------------18EAC04523FA0042C4860A4A
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3Dsj8j
-----END PGP PUBLIC KEY BLOCK-----

--------------18EAC04523FA0042C4860A4A--
