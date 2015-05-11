Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9DD9F60043
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 18:44:40 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so78729098igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 11:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=jsc0kQwVoGtRuBRfI7dsbDxVEeFZ1GLw7L3bT4rxUvs=;
	b=UHtA9K3v4wRf5CXPxTrD/zBToCyA15BIvJ4s5zvEQFMlvheXFIXczMFXScaTGMELkr
	ycvM1RGP5lxBVhHjFdemTpnjyLdywZcYMJ+ZvLtAF8+NHeAwGQC9WvrtOfJaFGNhivhP
	wSSQOPwtVL6HkJfKgz5dZ+dOd2CCUhyK+DQToqvz4O3PBSgicS0fqnNC2RmxtYlm/2pJ
	rN7viYit7B6tuC3huXsc/5jt1Stv/rogeCLFjlwWn2cALUYg86EuqVhmrzmgjFE0NxIZ
	ryzfG+PSVXIQzC74O9JJdqqLYyPPr9qGRrnO30z8+0FOXw6s3XJeHxkbaqQ85eQ4t+W5
	6e2w==
X-Received: by 10.43.173.70 with SMTP id ob6mr12511379icc.45.1431369881699;
	Mon, 11 May 2015 11:44:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.112.34 with HTTP; Mon, 11 May 2015 11:44:11 -0700 (PDT)
In-Reply-To: <20150511090952.GF2400@jama>
References: <1430795900-25986-1-git-send-email-akuster808@gmail.com>
	<20150511090952.GF2400@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 May 2015 11:44:11 -0700
Message-ID: <CAMKF1sp5Vg3U6kWfRfJgCZki-EKpmSmYCJiizS6K5GnkzSKb5g@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 11 May 2015 18:44:41 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 11, 2015 at 2:09 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> +PACKAGECONFIG[polkit] = "--enable-polkit, --disable-polkit, , polkit"
>
> Shouldn't it have polkit as build time dependency (3rd argument, not 4th)

if something is added to RDEPENDS it automatically gets added to DEPENDS too

