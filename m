Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TGo04-00011P-V5
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Sep 2012 11:33:48 +0200
Received: by wibhj13 with SMTP id hj13so1573298wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2012 02:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Pj6zgEmQFTnqbct+FKLXRTRMVRMEOUnLzlsiLq4+Uys=;
	b=YvsfhCSIN3XD6JeXaGFyRS76kxFqYBU7UX3xvOu836Ce0m3oeQxcDOGJsVEPTT0gB9
	hoboC11FxiCzOp+GSLAsh3buN9IJyn05bDk8cpzA6y8k/ulgxopAPm3XDNBwfE8b0axS
	obJjstBZiu+rs4cvKNhGQoJ/LEzQSlRxnhdZMMW0RgqzYvgyb0fumHoCixZ1XFo+2Dzh
	6MQN42kJWXFhch77DI90h9AF/pQ46Qg8wusvJqULR650meA4F8UrZ/VvpRjjflS1Yu7S
	aXT5jFdaKvz70LczoEhcxlBez7M4zpVSl03uXkW8fGVxiOo7nyOr+MsMjctnW2uUNA2S
	POhA==
Received: by 10.180.100.101 with SMTP id ex5mr24705095wib.16.1348651258875;
	Wed, 26 Sep 2012 02:20:58 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id m14sm17768016wie.8.2012.09.26.02.20.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 02:20:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <5062C8B1.1080901@windriver.com>
Date: Wed, 26 Sep 2012 11:20:56 +0200
Message-Id: <2DD337DC-F013-4F8A-8BAE-6E7BCB4F4991@dominion.thruhere.net>
References: <1348631669-22341-1-git-send-email-jackie.huang@windriver.com>
	<k3uap8$evl$1@ger.gmane.org> <5062C8B1.1080901@windriver.com>
To: jhuang0 <jackie.huang@windriver.com>
X-Mailer: Apple Mail (2.1498)
X-Gm-Message-State: ALoCoQn4HCNo61eDeqQndxjyoyitJT1ayDir1dLJiYdV0BYFtCkaGqSCsr7httygbE8G5wJrNUv7
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking] [PATCH] ptpd: migrate from meta-oe into meta-networking and uprev to ptpd 2.2.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Sep 2012 09:33:49 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 26 sep. 2012, om 11:19 heeft jhuang0 <jackie.huang@windriver.com> het =
volgende geschreven:

>=20
>=20
> On 9/26/2012 3:27 PM, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>=20
>> Op 26-09-12 05:54, jackie.huang@windriver.com schreef:
>>> From: Jackie Huang <jackie.huang@windriver.com>
>>>=20
>>=20
>>> meta-networking/recipes-daemons/ptpd/ptpd_1.0.0.bb |   20 +++++++
>>> meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb |   32 ++++++++++
>>=20
>> First: why do we need 2 versions?
>=20
> I thought we need to keep the versions we ever had. I will remove the =
old one.

That would be 2 patches: 1 move, 1 update=


