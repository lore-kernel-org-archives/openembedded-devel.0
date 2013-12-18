Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id BF90F60D27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2013 16:37:25 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id e51so3073067eek.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2013 08:37:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=hkI7gqFvXGmvB185r29zFNhoBW0H382KcHHarg3UqzU=;
	b=GKJNMPhizFhrrqHqbnhRnu5LDjxnpls364FHaMCPs/3euLuADxjtKstlTaCtTVjzUx
	vTETSpncgE5+boRs8rG2MjRlkSeQpT4TvhChwluC5OeEqsaWkXBy6uzESHcRzyzO7TRv
	kIt9joZsNc6UAgyv0oN1IULq+kKrb400HOct2nmVu4BDa6IFyebllBmKQ5qan/stQz/f
	EDCcaHMmMvKr4st6nfprncYs/d8K4yDQ94aQEt7eGBMArKjNzG4VZMoMddIyBd5+kGUe
	VpY7uaEmfnEjh3bAVvk66HObxjqk9Ty6NMuK9DchnJZNxH8c+06fTpcrLQ9DxWowaLKd
	8tzg==
X-Gm-Message-State: ALoCoQmHXD/ASzWCQe54iui6Ya1lXi1UwdweoG9247MI7+uQl2+ufxMOgGWWf+H+89Yg9BUevelo
X-Received: by 10.14.218.69 with SMTP id j45mr30162178eep.22.1387384646085;
	Wed, 18 Dec 2013 08:37:26 -0800 (PST)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id v7sm1503207eel.2.2013.12.18.08.37.24
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 18 Dec 2013 08:37:24 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1822\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20131218173603.40ac0c16@e6520eb>
Date: Wed, 18 Dec 2013 17:37:24 +0100
Message-Id: <2D278DF6-68CE-4D88-B356-E70750AE2FCC@dominion.thruhere.net>
References: <1387380021-20465-1-git-send-email-eric@eukrea.com>
	<l8sf7j$ksk$1@ger.gmane.org> <20131218173603.40ac0c16@e6520eb>
To: =?iso-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
X-Mailer: Apple Mail (2.1822)
Cc: "openembedded-devel@lists.openembedded.org List"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] inetutils: fix compile error when PATH_PROCNET_DEV is undefined
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
X-List-Received-Date: Wed, 18 Dec 2013 16:37:27 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 18 dec. 2013, om 17:36 heeft Eric B=E9nard <eric@eukrea.com> het =
volgende geschreven:

> Hi Koen,
>=20
> Le Wed, 18 Dec 2013 16:33:24 +0100,
> Koen Kooi <koen@dominion.thruhere.net> a =E9crit :
>> Eric B=E9nard schreef op 18-12-13 16:20:
>>> patch taken from :=20
>>> =
http://repository.timesys.com/buildsources/i/inetutils/inetutils-1.9/inetu=
tils-1.9-PATH_PROCNET_DEV.patch
>>=20
>> Put
>>>=20
>> that in the patch itself please and also add an Upstream-Status tag.
>>=20
> I don't know which status to put there as it's not upstream : which
> one is appropriate ?

I put in "Unknown" in that case, but that's not a valid option for =
OE-core recipes.=

