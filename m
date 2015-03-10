Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5D92173A62
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 18:27:41 +0000 (UTC)
Received: by igal13 with SMTP id l13so6160109iga.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 11:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=0Vvb7yoGAzvfhfNoIH5LSBH0x+aMDdc970FPqMWx77M=;
	b=kOyIx5fGCNMu5ECeFqSlRTDGnJTImesi64VA5XoVNW/coZYJOyzGg7FLx0ldHIW1j6
	aq+DOr2kYuUxB3WBmSRWHUZ6e5s2uCl7NrCIYdxXjmdrkfLZXg/gx71hIXrCPOSMIGj+
	kA1ASMC/t7rUSCBs+t9GkoUPWbDlEoVdNfLVHcTJPvOCByCVtc335OaAclTsbYZQe5+Z
	hf/qPZlJd5x11wFp+Cdb3cNWoWpZJU9cWIAUCS4jDqf4virMl8CowXfgTjYhDnIUM7my
	zQHzFlaWlI2SKALBGuveOBXutb+WpTjl80ZE3z7+ukPnmrzb95vDxc6ErTmPv7EkiZJv
	NTkw==
X-Received: by 10.42.88.1 with SMTP id a1mr36141974icm.29.1426012063069; Tue,
	10 Mar 2015 11:27:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Tue, 10 Mar 2015 11:27:12 -0700 (PDT)
In-Reply-To: <CAL0pqZ15mf+jANcqzD=EAYs-BOKThCdWdzO2J2aRaV1v4moO=g@mail.gmail.com>
References: <CAL0pqZ15mf+jANcqzD=EAYs-BOKThCdWdzO2J2aRaV1v4moO=g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Mar 2015 11:27:12 -0700
Message-ID: <CAMKF1sr5y0gDDgzhXRU1Dc+28Uabkh+9F7pNWDKUqXLAkCLevQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Recipe Name Change
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
X-List-Received-Date: Tue, 10 Mar 2015 18:27:43 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 10, 2015 at 10:59 AM, Leah <leah@wolfssl.com> wrote:
> Hi,
>
> We have recently changed the name of our product from CyaSSL to wolfSSL. I
> would like to update to a recipe reflecting this name. Our current recipe
> is located at
> https://github.com/openembedded/meta-oe/tree/master/meta-networking/recipes-connectivity/cyassl.
> Should I make a commit to delete cyassl and a separate commit to add the
> new wolfssl recipe? Or should this be done in one commit?
>

Doesnt matter. What matters is that new recipes adds proper PROVIDES
and RPROVIDES to keep old systems happy and adds upgrade path if
anyone is using binary feeds

