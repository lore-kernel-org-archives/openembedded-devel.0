Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1S090P-0008J8-Qr
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 11:01:02 +0100
Received: by pbcum15 with SMTP id um15so2579072pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2012 01:52:40 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.adami@gmail.com designates
	10.68.132.229 as permitted sender) client-ip=10.68.132.229; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of andrea.adami@gmail.com
	designates 10.68.132.229 as permitted sender)
	smtp.mail=andrea.adami@gmail.com;
	dkim=pass header.i=andrea.adami@gmail.com
Received: from mr.google.com ([10.68.132.229])
	by 10.68.132.229 with SMTP id ox5mr78602476pbb.65.1329904360975
	(num_hops = 1); Wed, 22 Feb 2012 01:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=EHIv5BREJny8IqgmN2mvlp1FzcibtmHUoFpelPl1myI=;
	b=mv9xqhVIDbIDGWzmlTYs9GubRX1x0qsm+h6cNqBQbCfpztgkRBdCZVGPoA8zZ+9yax
	8Hp/8XssPd+82xgwrc84vhbFmdiiaRazyVMYGe76bDmlQcE7lJD5+ldAXAyw5VeF2WAG
	vt2h7X9awxGe4Dx6msxeVD89mrjSkbsepKHb4=
MIME-Version: 1.0
Received: by 10.68.132.229 with SMTP id ox5mr64655973pbb.65.1329904360913;
	Wed, 22 Feb 2012 01:52:40 -0800 (PST)
Received: by 10.143.147.17 with HTTP; Wed, 22 Feb 2012 01:52:40 -0800 (PST)
In-Reply-To: <20120222101227.59546393@eb-e6520>
References: <1329745909-21013-1-git-send-email-eric@eukrea.com>
	<4F429115.3070907@opendreambox.org>
	<20120222101227.59546393@eb-e6520>
Date: Wed, 22 Feb 2012 10:52:40 +0100
Message-ID: <CAAQYJAs2FdO0STqq837wajztxv_7x7FPesZJM5OisQrjm+c6LA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] vsftpd: add new package
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
X-List-Received-Date: Wed, 22 Feb 2012 10:01:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2012 at 10:12 AM, Eric B=E9nard <eric@eukrea.com> wrote:
> Hi Andreas,
>
> Le Mon, 20 Feb 2012 19:29:41 +0100,
> Andreas Oberritter <obi@opendreambox.org> a =E9crit :
>> On 20.02.2012 14:51, Eric B=E9nard wrote:
>> > - imported 2.0.5 from oe-classic
>> > - upgrade to 2.3.5 which is latest stable
>> > - tested on ARMv5 with Angstrom
>>
>> I created a recipe for vsftpd, too. Here's my version for your
>> reference. All patches were taken from the Debian or Ubuntu package.
>>
>> It differs from your recipe in these ways:
>> - uses openssl
>> - uses pam if available
>> - uses xinetd
>> - allows to set custom default configuration options in bbappends
>> - only build-tested with OE-core, no runtime tests so far.
>>
> your recipe was just pushed (with this email as the commit message ...).
> I think it would have need a little rework, at least to not depend on
> xinetd by default and be runtime tested before being pushed.
>
> Eric

And preferably should be committed in meta-oe/recipes-connectivity/vsftpd/
Now is in root of meta-openembedded.
Cheers
Andrea

> --
> http://eukrea.com/en/news/104-2012
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


