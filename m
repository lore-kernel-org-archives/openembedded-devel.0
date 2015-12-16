Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3DE826072C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Dec 2015 09:21:48 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id ph11so134164523igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Dec 2015 01:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Ry+GXUOEl5dvdb81qAlQAxXVtDhPKujb+tmQqJzt0Ys=;
	b=btKsQg4CuL4LdNYK396BYhCGKeioaVe4bsATdLRcE2wrCuhY3jd2RZhqytA6I8DePT
	jhDgEe47JX8VOEqrAg+kMoWuxd78slDCBv6QKrV9zz7VXabJeXPHpE4h/hkb9sk7eNaY
	ooUn/lMON+QfCJgnBDVyMCSWSubVdS3UpCLLRShsMuO7leb+SmfKTu7ySeJVFE/0YJCS
	pB73OKZMn2XGcJNEEIJb6/uB2Teq7ATdfaeiidcYJjjsaEWexKr32ujDRprC3QUcbg7h
	k+x0pUJpoOj/pVhYIdz/apWyUNgppwb+M4Qbr0PZMWzAbi8SISpUZC3MK9UG4T8+IPd8
	QERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Ry+GXUOEl5dvdb81qAlQAxXVtDhPKujb+tmQqJzt0Ys=;
	b=kwgroAx1SWly0UeikrjqO8yuVZtroRum8sgxy73tvc7IbABA6+QxvxZ1AR5zr8Iqne
	Acc8p77DRuI9vFxCeeFXz+3Ki0BorI3j8dxXjwAMg7znOVV91wRIuWWJfCFCnHIlAbP1
	uEWBIsneWbpAoGAouPyR8kgd7yBIct+wFnFTYCIHSpcjdMB68Z5utf2+sXwUFnik73cQ
	4gxkAIy5FHi4ZBS4gTb0r7DwzYhGIxrC39xAQyY3n14khJAj6E7w0ZfimhECC2HnxAbW
	ZrYdal8qcsibRIT0gmzKSXnEafpHnOu5ZX4yS71s29b9WzUaYfKc4iMjbOmsACrr3Eqv
	1QLw==
X-Gm-Message-State: ALoCoQlGV0SW0rJPrMsLoZ58g3nLfpTsblFgzz6wd7VCZ45FGeZ3etUulZWHTOWNZi5gIDgHFFQslhVru8vFnmHffktwmHQuJlC8ntL/CqgWz1eDnYFUk/g=
X-Received: by 10.107.3.154 with SMTP id e26mr6712362ioi.99.1450257709343;
	Wed, 16 Dec 2015 01:21:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Wed, 16 Dec 2015 01:21:29 -0800 (PST)
In-Reply-To: <3230301C09DEF9499B442BBE162C5E48ABABDD6C@SESTOEX04.enea.se>
References: <567039E1.5000205@linux.intel.com>
	<3230301C09DEF9499B442BBE162C5E48ABABDD6C@SESTOEX04.enea.se>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Dec 2015 09:21:29 +0000
Message-ID: <CAJTo0LYO9ptJ4PDmR49N-Yw9TbTFGsuyCUBUc4zW2FLk2CNoWQ@mail.gmail.com>
To: Sona Sarmadi <sona.sarmadi@enea.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC] Mark of upstream CVE patches
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
X-List-Received-Date: Wed, 16 Dec 2015 09:21:49 -0000
Content-Type: text/plain; charset=UTF-8

On 16 December 2015 at 09:03, Sona Sarmadi <sona.sarmadi@enea.com> wrote:

> We are supposed to have reference to the CVE identifier both in the patch
> file/s
>  and the commit message(e.g.  xxx- CVE-2013-6435.pacth) according to the
> guidelines
> for "Patch name convention and commit message" in the Yocto
> Wiki https://wiki.yoctoproject.org/wiki/Security.
>
> If a patch address multiple CVEs, perhaps we should name the patch:
> Fix-for-multiple-CVEs.patch and list all CVEs in the patch file.
>
> Will this not solve the problem? Do you think there is still need for a
> new tag "CVE"?
>

I'd say a new tag is essential if we want to automate tooling, to reduce
the chance of false-positives from simply searching the patch for something
that looks like a CVE reference.

Ross

