Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id F2B90609A7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 09:41:38 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id bs8so984862wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2014 02:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=jo8K//C4NfbXiKG9GA4vBrBNKHhqxK5ZWDExQh89PWE=;
	b=CfT8+u/I5eomlRxVT/IlqIx/oQBe55z4dXG/Ux3BIbiT/Hn2mjhCGV2P837QN1MP7a
	Kn4Bl/jbuWwzbWBoEUdED3hG4c+AYsEVyxLpHDnd/uWrTno7SS//WtQJg45r/yBWr7bT
	gEZJsSNjO8onfC6YZGMt4bzNjHkcNDJMC7B/6Z6mv7bSML10eWdok21ALxlOm87xxgKC
	pc/jxuHNIbtxC6BfODDxGDqbs7tr5TrC2JSXw2R2hr9oSIokiLj0Vw46e9OwNar37TY+
	Yueg3R77+I+dg6MWJdiVLAQTkifSBOlIk+Oa4q5hAA39YO6pMJBdLxZpW8HQ/A6JHkM1
	Wlyg==
X-Gm-Message-State: ALoCoQkxSxneAF9YHxf28LaTzeuftcC2JNhbK+FOLL/TT5eIcnlu01Qef+Pss4NFKJ12MlSE/cWk
X-Received: by 10.180.212.48 with SMTP id nh16mr6776183wic.49.1399455698835;
	Wed, 07 May 2014 02:41:38 -0700 (PDT)
Received: from ?IPv6:2001:610:612::8cf4:da4b:7630:5689?
	([2001:610:612:0:8cf4:da4b:7630:5689])
	by mx.google.com with ESMTPSA id ez5sm25909103wjd.9.2014.05.07.02.41.37
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 07 May 2014 02:41:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <6062362.lpz6Qfmmsr@peggleto-mobl5.ger.corp.intel.com>
Date: Wed, 7 May 2014 11:41:36 +0200
Message-Id: <931BC885-E1EF-45C0-8C61-680ADD60D9B3@dominion.thruhere.net>
References: <1399445635-29373-1-git-send-email-koen.kooi@linaro.org>
	<CAMKF1so17ynGToCMO_i8mw+UpUdnZC3NL_797JJbbrbMOd=_-w@mail.gmail.com>
	<lkcqt0$j26$1@ger.gmane.org>
	<6062362.lpz6Qfmmsr@peggleto-mobl5.ger.corp.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1874)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] openldap: fix build against gnutls3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 May 2014 09:41:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 7 mei 2014, om 10:57 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> On Wednesday 07 May 2014 10:29:21 Koen Kooi wrote:
>> Khem Raj schreef op 07-05-14 09:47:
>>> On Tue, May 6, 2014 at 11:53 PM, Koen Kooi <koen.kooi@linaro.org> =
wrote:
>>>> ++                              TLS_LIBS=3D"-lgnutls -lgcrypt"
>>>=20
>>> Does this mean we need something more in DEPENDS or DEPENDS part of
>>> PACKAGECONFIG too ?
>>=20
>> Should be automatic since gnutls depends on it. It's not a new =
dependency.
>=20
> BitBake does not automatically ensure dependencies-of-dependencies are =
in the=20
> sysroot. They almost always will be, but I have seen failures in these =
kinds=20
> of situations before. Since it explicitly wants to link against =
libgcrypt,=20
> libgcrypt should be in its DEPENDS.

You are completely right! And my original explanation was bogus since =
the patch was needed since gnutls *stopped* needing gcrypt.

regards,

Koen=

