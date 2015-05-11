Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0DB6A60043
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 18:59:55 +0000 (UTC)
Received: by wgin8 with SMTP id n8so138280877wgi.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 11:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=6BdDC/V+c8BB7KnFH+fNODIGV7d198qWK5M+DFXyyIM=;
	b=FGhC2JCyTP/JzTq+UEf5mJx3LNNfKon+79/lnZmmDOSxzDZX3k2PczUB+Ky160kwXM
	sa+M0kP0ci056zNERQl8GiJyE3f9ktc00vSMbPFTp5px74KnZdxoeRzp1DFxQUTvjeJG
	H4VDe7UsW7bzuHZIWLQ5vVRmQQyWNQYPY05wOZYKtj5Vl8NHs9TQWJXL3KYCLT5teXaZ
	/30kPcjB6k4HP9PMBV8voFxixs29nN0JTkMWSHnAwOriwDVRLLlt7vLd4J85iKCnzenv
	LmqY1Yel6n0Mr571LkRJXBdMxNXVTpsaL61UCdqJcVxE0jQB/7+UhQRoQbBLuZ0LLAax
	gIrA==
X-Received: by 10.180.188.193 with SMTP id gc1mr22907615wic.7.1431370796295;
	Mon, 11 May 2015 11:59:56 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id a4sm1097433wic.1.2015.05.11.11.59.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 May 2015 11:59:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 11 May 2015 21:00:27 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150511190027.GK2400@jama>
References: <1430795900-25986-1-git-send-email-akuster808@gmail.com>
	<20150511090952.GF2400@jama>
	<CAMKF1sp5Vg3U6kWfRfJgCZki-EKpmSmYCJiizS6K5GnkzSKb5g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp5Vg3U6kWfRfJgCZki-EKpmSmYCJiizS6K5GnkzSKb5g@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] networkingmanager: QA warning for rdepends on polkit
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
X-List-Received-Date: Mon, 11 May 2015 18:59:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2015 at 11:44:11AM -0700, Khem Raj wrote:
> On Mon, May 11, 2015 at 2:09 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> >> +PACKAGECONFIG[polkit] =3D "--enable-polkit, --disable-polkit, , polki=
t"
> >
> > Shouldn't it have polkit as build time dependency (3rd argument, not 4t=
h)
>=20
> if something is added to RDEPENDS it automatically gets added to DEPENDS =
too

No that's not true.

RDEPENDS adds dependency only between do_package tasks for build time
dependency you need do_configure depending on do_populate_sysroot

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

