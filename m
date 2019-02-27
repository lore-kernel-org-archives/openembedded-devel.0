Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 654A27CBEC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2019 09:11:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 448VLN4m43z5Q;
	Wed, 27 Feb 2019 10:11:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1551258717;
	bh=3nMyU8cAU80PDrLnmtNW5RJKy/94MnYqHNrl27NX8j8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dp7UE81wFIYPP5P3UN1JQt9MNjkNbMvZQEohswrJ75tLrFhv6y38Gp2PNN/CZCf6P
	V+bHNqUzN0lqcybSqoLqo3TkaX0OcituisHHxKDO+qqmw3PSD2FHhtNM1PGN99uLMR
	GI12Hg1naAODn1WAzIuH2iW095KD6SgS0vWXAcf4Zajyn9vYUqw+b+PVTRjdWDEBXE
	v+aaw/xK5l/KG9378joo/6BlI+0Hk8d3U+ELvUobeCSXP3jtK+7Z0t4kqFjKVc9lwe
	JPGXCaoYb8z3szzwnqPz2CgKrZYfYk879QKbyjsjDT6Y7Vv3FFNty1qT5o1fy5rOpq
	a5/x6CMxoU9bzvcuC552CkiOzCmLAuxn/mC/1txMuOqe+tAcp/fXF9FfXFYLxhTazH
	KU6M0VRyWXGUWnY+b581Xti2QUU0bB9VmOBhM31nPnBXS4fVTNn345DGrgpM5Oi9Bj
	1BUgQb7Kq2cce8yPouM/LU00zLxp6mRPnUJQlCa/mSdxnGXfvyThQbNwjPiUYUg1vL
	VikbEK41Ehp/MbjYIpGaf6yXlNeeXRNbFGofL6pjpT5M5Ad41tJzuSZAvAkfJBy4n2
	BL3Cc6rUfFektx8DZJt9Bz90nDQwIrd4JwwBcL8sllpURxZAGc0ffD79MTOa4Zg3+n
	acEGdLcrAWT9k3TLH4y9rT+s=
Date: Wed, 27 Feb 2019 11:11:53 +0200
From: Adrian Bunk <bunk@stusta.de>
To: changqing.li@windriver.com
Message-ID: <20190227091153.GA10723@localhost>
References: <1551256910-119653-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1551256910-119653-1-git-send-email-changqing.li@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 0/4] Add PACKAGECONFIG
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
X-List-Received-Date: Wed, 27 Feb 2019 09:11:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Feb 27, 2019 at 04:41:46PM +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> Add PACKAGECONFIG for 4 recipes
> 
> Changqing Li (4):
>   net-snmp: add PACKAGECONFIG disable-des
>   krb5: add PACKAGECONFIG disable-pkinit
>   openhpi: add PACKAGECONFIG disable-snmpbc
>   freeradius: add PACKAGECONFIGs
>...

It would be better having all variables consistently as enable-options,
instead of having some as disable/no negative options.

Keeping options enabled by default can instead be done with the
PACKAGECONFIG default.

In other words, instead of
  PACKAGECONFIG ??= "libgcrypt non32bit"
  ...
  PACKAGECONFIG[disable-snmp-bc] = "--disable-snmp_bc,--enable-snmp_bc"

to do
  PACKAGECONFIG ??= "libgcrypt non32bit snmp-bc"
  ...
  PACKAGECONFIG[snmp-bc] = "--enable-snmp_bc,--disable-snmp_bc"


cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


