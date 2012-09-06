Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T9fQP-0006ul-4m
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 18:59:29 +0200
Received: by wgbdr1 with SMTP id dr1so1494886wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2012 09:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=WJwDu7EvQrbe8vNFscb8lR/JSoDs8V6sBjTFn+n/dko=;
	b=Zg9qugFyz9egden1DsAvzlwQjQvqUgQO3OCXpBCO2C48nqX8Zo6cgEGrbJbELT8dt/
	4OL3AqMq4beAe9CVUqCu2ERau9vt4Lmt+1E/CMGwG7NXF7nDEnZyq3X2l+6KnFWdTgCs
	WAYqNYbF5IFT4QNBEaux1J8zsmvP88nkrda1zoOmIfjFZx+4U3Ai6/0PREHDDP2EycN0
	wVVYcnNLh9GPCiSsEWMufEWKibXWgoqTk5+nIcmMbxAjLBOrYY7jjJEk1RNx3Z35489w
	UcNpUtiFlt0gNXRw5ri2tbGYUFkCDq7DJ9syyJF8nVIJXLEGFXQ3ZZUtgJbmX0OKTAz4
	WMGw==
Received: by 10.180.80.134 with SMTP id r6mr6142572wix.1.1346950023885;
	Thu, 06 Sep 2012 09:47:03 -0700 (PDT)
Received: from ?IPv6:2001:610:612::4908:ca0a:f01a:394b?
	([2001:610:612:0:4908:ca0a:f01a:394b])
	by mx.google.com with ESMTPS id eu4sm4908876wib.2.2012.09.06.09.47.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Sep 2012 09:47:02 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A657F94@039-SN1MPN1-003.039d.mgd.msft.net>
Date: Thu, 6 Sep 2012 18:47:01 +0200
Message-Id: <BE26FFE4-B5E9-4C9C-9398-4A164C12BB88@dominion.thruhere.net>
References: <1346930610-2977-1-git-send-email-koen@dominion.thruhere.net>
	<1346930610-2977-3-git-send-email-koen@dominion.thruhere.net>
	<70CC66F5C30A414DADDA6973E4CA391A657F94@039-SN1MPN1-003.039d.mgd.msft.net>
To: McClintock Matthew-B29882 <B29882@freescale.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQnE64n92X5xcU7Hgc6eH3wQF0wkGXaSpFViM84XVoZh17tJ5f2pzrpoogsMKDsKFQVO7yGp
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	=?iso-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Subject: Re: [meta-oe][for-denzil][PATCH 3/8] kernel: Add kernel headers to kernel-dev package
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
X-List-Received-Date: Thu, 06 Sep 2012 16:59:29 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 6 sep. 2012, om 18:43 heeft McClintock Matthew-B29882 =
<B29882@freescale.com> het volgende geschreven:

> On Thu, Sep 6, 2012 at 6:23 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>> From: Darren Hart <dvhart@linux.intel.com>
>>=20
>> [YOCTO #1614]
>>=20
>> Add the kernel headers to the kernel-dev package. This packages what =
was
>> already built and kept in sysroots for building modules with bitbake.
>> Making this available on the target requires removing some additional
>> host binaries.
>>=20
>> Move the location to /usr/src/kernel
>>=20
>> Before use on the target, the user will need to:
>>=20
>>    # cd /usr/src/kernel
>>    # make scripts
>>=20
>> This renders the kernel-misc recipe empty, so remove it.
>>=20
>> As we use /usr/src/kernel in several places (and I missed one in the
>> previous version), add a KERNEL_SRC_DIR variable and use that =
throughout
>> the class to avoid update errors in the future.
>>=20
>> Now that we package the kernel headers, drop the
>> kernel_package_preprocess function which removed them from PKGD.
>>=20
>> All *-sdk image recipes include dev-pkgs, so the kernel-dev package =
will
>> be installed by default on all such images.
>>=20
>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>> CC: Bruce Ashfield <bruce.ashfield@windriver.com>
>> CC: Tom Zanussi <tom.zanussi@intel.com>
>> CC: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>=20
> Why did you resent this? Are there changes or by accident? Just asking
> before I make a patch for denzil with my previous fix.

This is for the meta-oe kernel.bbclass, not the oe-core one :)=


