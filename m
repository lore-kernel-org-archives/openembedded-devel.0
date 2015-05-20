Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 58D65601E3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2015 12:41:24 +0000 (UTC)
Received: by wgfl8 with SMTP id l8so51492212wgf.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2015 05:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=JlMe6rjqEn1Owa/OZnTcbgR6Qo4FPDbYxDao1B1PG58=;
	b=O9REwhQjUdHSfN5t2eoXeCa7+3fHJF8dLzr52o3FPOwK1XgZjvg6PSrOCyV/WKE8vz
	8kFgKVOlRHLzWuTQJnGYsj4egR94ImW0OzIELmjw+7F1daees/msycvYJF9fEH41IUz1
	+KhVR2l2FamiL0SwW4cIXZJJkIP6NDsAQezd5DYPFXmj+fKY/SxZ7FKxWmXCYZpBjOXo
	reCbQ+OZPH9QXEmHHWjRP4ADgADwVIh1dvK8DO8VmZaECAc6wWfKRrOPhvD/SzXcjJzN
	4IbTwIkfhpLqo9SGx2Fw6qnAftuEuNIcqli78R5s++cIxqXYApNenc07nOkWIbzoTNSD
	ISIA==
X-Received: by 10.180.107.38 with SMTP id gz6mr41157017wib.63.1432125685682;
	Wed, 20 May 2015 05:41:25 -0700 (PDT)
Received: from localhost ([86.49.34.37])
	by mx.google.com with ESMTPSA id u9sm26658111wjx.15.2015.05.20.05.41.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 May 2015 05:41:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 20 May 2015 14:41:34 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150520124134.GA2386@jama>
References: <555C7731.40605@pr.hu>
MIME-Version: 1.0
In-Reply-To: <555C7731.40605@pr.hu>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: How can I disable automatic subpackage naming
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
X-List-Received-Date: Wed, 20 May 2015 12:41:27 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2015 at 01:59:45PM +0200, Boszormenyi Zoltan wrote:
> Hi,
>=20
> it seems that if bitbake finds a subpackage in the PACKAGES
> variable that contain a single library, a new, automatic
> subpackage gets created that will have the name "libxxxxN"
> with libxxxx being the library name and N being the SO version.
> With this, bitbake overrides my set of subpackages.
>=20
> How can I disable this in Daisy, i.e. bitbake 1.22.0, so I get the
> explicit package name I added to PACKAGES?

Remove "debian" from INHERIT variable.

>=20
> Thanks in advance,
> Zolt=E1n B=F6sz=F6rm=E9nyi
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

