Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 867BE732FE
	for <Openembedded-devel@lists.openembedded.org>;
	Sat, 14 Feb 2015 13:09:18 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id f51so17289996qge.12
	for <Openembedded-devel@lists.openembedded.org>;
	Sat, 14 Feb 2015 05:09:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mTP15OGQaSWXyMIVQkKvD+M0S6ql/b8F4pin5Xx/eaY=;
	b=av9JdNKf536byLMS/1Jl/n8n+nSqb6SMtJs64309r5xI5/d073WqkTn6Fu5C/d1FA6
	0ZFbo4C7eEjuVC3fWgLLW1PRLsmSdKS5Og6m+1NoNw+ruJrm1r1jfJpERnFKJQg9D6Y0
	bdWsMOucLYyI8FBLeITgU9ZEuWLM46OC5H3FujgmgS09z+KGk0kYd3Q5SPmb7C18JAZe
	rXU8Y9ejjbBreuPVhaMLaZAbsT0SrKucg2MZeVtMED12zUE2Zj5BVnIHHTmn0vqC+9SY
	zrudz1VXXPWWmCiFa/UE0c3rQ9+AI8IRwX7X1+QRgmnBGJhDCI5344AAqVP4IYKd6z5B
	1x6A==
X-Gm-Message-State: ALoCoQnnDJn7UO+DtjOtCPOjNqGjVl8znpP/bwasZABrzFr+Dpfq4HHXesPQmWoU0yitXyaZvtLg
X-Received: by 10.140.133.69 with SMTP id 66mr6674483qhf.17.1423919359590;
	Sat, 14 Feb 2015 05:09:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Sat, 14 Feb 2015 05:08:59 -0800 (PST)
In-Reply-To: <1423908404.20217.100.camel@linuxfoundation.org>
References: <CAMKF1souj1-FLTjkQb0y8myTiKMJyNeAa7wiM5-pW1fz0EtheA@mail.gmail.com>
	<CAJTo0LaN3HMhjrpii2pPbJw5zWbywgr1keZe=iQmuKFMFFf=gQ@mail.gmail.com>
	<CAMKF1sq8NsuNYZDQRPtXruBeRndOP+0qwBuTO2ahb6q-fS8XGw@mail.gmail.com>
	<CAJTo0LYpKbwOHg-DBMJycy+KNayTCsnhToJR8K-REKZ2jxhnhw@mail.gmail.com>
	<EA0C9DE9-9E5F-4B74-8464-138895268F2F@gmail.com>
	<CAJTo0LbSFesauhA_H39Znd07SR5JCs45izy2us=cFWVGXtW8hg@mail.gmail.com>
	<80920FD0-CA08-45D7-9A41-3971FB2D58D7@gmail.com>
	<CAJTo0LbqTrQzk0KeHDxYnmtZrrFdZD12DWrjA=Y4RtbQzwM0ow@mail.gmail.com>
	<CAMKF1sr7bYpKqzTmvX5rCuYc-Rb2se7Vsrr4aYA43E_b1Z=vWA@mail.gmail.com>
	<CACS+7ZRNm2Y0SJn76imF6DNoEsL2+ppC1zG45iGspOmL0EN0BQ@mail.gmail.com>
	<CAMKF1sqjQm+n5xKfS0utm9B9h_S+RYWrgnGUCboRNCk5XSUmzg@mail.gmail.com>
	<1423908404.20217.100.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 14 Feb 2015 13:08:59 +0000
Message-ID: <CAJTo0La6i2hDqPcZFjvrcPsRReNhirfsbOxD-_udJJDQ7YrKhw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [yocto] [RFT] upcoming glibc 2.21 and gcc 4.9 upgrade
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
X-List-Received-Date: Sat, 14 Feb 2015 13:09:19 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

On 14 February 2015 at 10:06, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Right now, poky-tiny failed due to warning are errors and unused
> symbols. Minnow failed due to SSE instruction issues. Full build logs
> are also available on the autobuilder:
>

Now those SSE errors I thought were fixed - is this more of the same or did
I manage to drop a patch when merging?

Ross

