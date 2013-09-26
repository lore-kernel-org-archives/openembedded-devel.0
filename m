Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 276CC6B8AB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2013 10:46:00 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	r8QAjtSu028812
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2013 12:45:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1380192358;
	bh=3K3Xw4eLXFdA76tB9oyq0U01WkW4ZxVneMtJFJrw1RY=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=dJoZeIwbrGsb5USwgA+rKs0IF93Lg3RZ49fQXfJCA+zTgmu6n+fAH5TKGsvRmjMmc
	5hZkR0IjDK4p0loIcEJN9dcZ2GU6Rw9zurf5donNeWlr4UUkO/AgART9ucznXw6ydw
	ptvXMfS46XXZlgfJzX48yv2Yxg7KF4Nio2p1X/do=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r8QAjkIL022357
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2013 12:45:49 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1VP94s-0003nK-O5
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Sep 2013 12:45:46 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <1380188747-9731-1-git-send-email-schnitzeltony@googlemail.com>
	<52440392.5080908@communistcode.co.uk>
	<CAJTo0LagmtFYtGFzRGs5yxc8Ua60zFH298SyKwFKYrPH41Drvw@mail.gmail.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Thu, 26 Sep 2013 12:45:46 +0200
In-Reply-To: <CAJTo0LagmtFYtGFzRGs5yxc8Ua60zFH298SyKwFKYrPH41Drvw@mail.gmail.com>
	(Ross Burton's message of "Thu, 26 Sep 2013 10:58:38 +0100")
Message-ID: <lyr4cbhndx.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.83
X-Spam-Score: -6.0
X-Spam-Level: ------
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.74
Subject: Re: [meta-qt5] fix do_rootfs for images with dev-pkgs in IMAGE_FEATURES
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
X-List-Received-Date: Thu, 26 Sep 2013 10:46:03 -0000
Content-Type: text/plain

"Burton, Ross" <ross.burton@intel.com> writes:

>> I ran into this problem the other day, and after speaking to Ross
>> Burton, he suggested that the better way to fix this is with:
>>
>> RDEPENDS_${PN}-dev = ""
>>
>> I'm starting to get the feeling that the dev-pkgs feature is also a
>> little broken, as it seems as though it doesn't handle cases where
>> sub-packages are installed, but the main package is not.
>
> Well, the problem is the default dependency on the main package in the
> -dev package, which happens whether or not the main package even
> exists.  That's why I prefer removing the dependency instead of
> creating empty packages just for the bad dependency.

ack.  This causes also problems with populate_sdk as it can add
conflicting packages to the package set.  E.g. when having 'dropbear'
and 'openssh-sftp-server' in the image, the -dev RDEPENDS tries to add
the conflicting 'dropbear' and 'openssh' packages to the sdk.

Instead of (or better: additional to) changing 'RDEPENDS_${PN}-dev', I
would prefer the removal of 'ALLOW_EMPTY_${PN}-dev' from bitbake.conf.
There is not reason to create -dev packages for applications.

In 'meta/conf/bitbake.conf' the '${PN}' in

|:RDEPENDS_${PN}-dev = "${PN} (= ${EXTENDPKGV})"

should be replaced by something which means the "library" package(s).


Enrico

