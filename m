Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 88CD065C66
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 00:41:53 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id ey11so1117085pad.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jan 2015 16:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=w3dKJBrZfw9oH0Ut2654tvYD5cxHfvZhi98BxyRUXt0=;
	b=BTlvE+q/ZKbTCJW7L48uqQ39IWqOoMTxTjB1SqDw9uQbjl7HXiqVh17rVlggn4PKTR
	uHROjUsKyOox3ar8NyauVft7cVeWzFDtdv0hwxjqiq2CouwM++OaRigpIyBbfZE48gjr
	OCnbbdbg3AqSkVG33LS6F66p1Nr6BP1OX6hl2sZMwvRaR8w12qyFwLjRffR/QrQoF+9j
	rfq7DWXvjKVcCAd3QS5uh9eQIuWJXD3qNlqHVNxwjOD8OWJRsgn9vQaPBFyU9Mn7yoZG
	99ezxlIvgUTnO2e7ADnGa9ZQAzyhxdln7FYQzz2lcUkJyxooeWQL43NnNO0QtrP2zTlP
	7T2Q==
X-Received: by 10.67.22.162 with SMTP id ht2mr209573pad.49.1420591314481;
	Tue, 06 Jan 2015 16:41:54 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:68b5:70a5:21d:f567?
	([2601:9:3580:84c:68b5:70a5:21d:f567])
	by mx.google.com with ESMTPSA id xx2sm69317pab.17.2015.01.06.16.41.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 06 Jan 2015 16:41:53 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <54A97D15.4080801@gmail.com>
Date: Tue, 6 Jan 2015 16:41:52 -0800
Message-Id: <B851B2EA-9E81-40E6-A1E9-B8C30DD9E194@gmail.com>
References: <54A97D15.4080801@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1993)
Subject: Re: recent addition of libgxim depends issue
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
X-List-Received-Date: Wed, 07 Jan 2015 00:41:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Jan 4, 2015, at 9:49 AM, akuster808 <akuster808@gmail.com> wrote:
>=20
> Hello,
>=20
> While building world I found and issue with libgxim.
>=20
> libgxim depends on ruby-native. meta-ruby is not a layer depends for =
meta-oe.
>=20
> Can meta-oe have layer depends other then 'core' ? if so, this is an =
easy fix.

I would not like to have such a dependency. May be move this recipe to =
meta-ruby

>=20
> regards,
> Armin
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


