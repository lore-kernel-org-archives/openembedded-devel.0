Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id E68B2782F6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 12:31:50 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1513686711; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=TDPtfR5x+9sF83s9eTODtNjEYKYg2QHDn/OKlXdad9s=;
	b=q+iZ005QS5i0B0LSUOb32yZtqxZPyKnASrStRehbhTbrXH5/4RgxA3w4G6wXFD5OZqhuW8Dn
	siCw+9xqeaBAltQpywFMkPatFn7G877y9i+TGeLw8BdxhkbTWYaNIMZDlmKCrKzElM2Ig9YD
	sB4+Z9/yR5BFJusndE1a82ikFBI=
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Sender: derek@asterius.io
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mxa.mailgun.org with ESMTP id 5a3906b7.7f312014c1f0-smtp-out-n03;
	Tue, 19 Dec 2017 12:31:51 -0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id x7so4848002qkb.0;
	Tue, 19 Dec 2017 04:31:51 -0800 (PST)
X-Gm-Message-State: AKGB3mIJSYFPzf0AFE4HQ3avTUD7KyBn3B7yY2G8RgrG16lZ4do8Ubmx
	FOL3ySObcSkz5QpljML/1DMrJTJekPX34upou74=
X-Google-Smtp-Source: ACJfBott8mh25ZKzo0RhRwr/zb2NGB+J5TugtvlmPv3m9Oburtg+D/szyGw4TIt94zXCYROqiWuJ6jw5TtLdgxX+Or4=
X-Received: by 10.55.191.1 with SMTP id p1mr4526262qkf.152.1513686710560; Tue,
	19 Dec 2017 04:31:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.177 with HTTP; Tue, 19 Dec 2017 04:31:49 -0800 (PST)
Received: by 10.140.21.177 with HTTP; Tue, 19 Dec 2017 04:31:49 -0800 (PST)
In-Reply-To: <2bc1c40c-3f63-7311-b8a3-81bd05ea474f@linux.intel.com>
References: <1512414044-1012-1-git-send-email-mark.asselstine@windriver.com>
	<CADNbA1qnmF3-MKo=fqQQeWEedE5A-wzkUkCgdCNArOePjMaXQw@mail.gmail.com>
	<CAPuovEKdqQP35XwP3bgBrE4EFbM2LwpHrHzxF3my9qaWfAaCbA@mail.gmail.com>
	<CABcZANku-aE5a69GpJxXmd2F0+uYVhiRZB3Uut7F2RG1e3R9EA@mail.gmail.com>
	<CAPuovEJNf=qefXX6wKJGaH+HkM6aan49AgVQ3TEWVWPSCn3cNw@mail.gmail.com>
	<711527ad-77fa-947f-2186-1d7835e1783e@linux.intel.com>
	<CAPuovE+yd0kA_MmT4GuqXgvNDASsKLszL4uiypKDSa31icwgXg@mail.gmail.com>
	<CADNbA1psOtOeCcsLaSM4VWJV5PXqe=HmE9BuxcR4UYkJp5Erdw@mail.gmail.com>
	<20171218210256.GQ27580@vctlabs.com>
	<2bc1c40c-3f63-7311-b8a3-81bd05ea474f@linux.intel.com>
From: Derek Straka <derek@asterius.io>
Date: Tue, 19 Dec 2017 07:31:49 -0500
X-Gmail-Original-Message-ID: <CADNbA1oCH=x1SoZn-pb50bZabf+rurd1w_o7D9P9FM4u=FXXsQ@mail.gmail.com>
Message-ID: <CADNbA1oCH=x1SoZn-pb50bZabf+rurd1w_o7D9P9FM4u=FXXsQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Mark Asselstine <mark.asselstine@windriver.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: splitting python's standard library
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
X-List-Received-Date: Tue, 19 Dec 2017 12:31:51 -0000
Content-Type: text/plain; charset="UTF-8"

Well, I've been able to do it just fine for the majority of packages in
meta-python by myself.  Since I contribute the majority of the patches and
maintain the layer, I want this capability maintained in meta-python.  If
you plan on removing that functionality in oe-core, I'd like to have the
opportunity to maintain the python recipes there as well rather than have a
feature unilaterally removed.  I don't consider it a burden and my
customers find it valuable to split things out.

On Dec 19, 2017 2:55 AM, "Alexander Kanavin" <
alexander.kanavin@linux.intel.com> wrote:

On 12/18/2017 11:02 PM, S. Lockwood-Childs wrote:

> On Mon, Dec 18, 2017 at 03:17:25PM -0500, Derek Straka wrote:
>
>> I have several customers who have optimized for space and would like to
>> see
>> the capability maintained unless core removes the ability to split python
>> packages out.  They also remove the *.py files in favor of *.pyo files
>> (via
>> a custom packaging mechanism).  I have automated tests that go through the
>> module importing on each of the meta-python packages to ensure it works on
>> minimal python installations.  When other contributors don't do provide
>> that functionality, I either catch it when I do package update or when it
>> breaks for one of my customers.  I'm fine if you don't want to perform the
>> checks yourself and it breaks my use case with missing dependencies, but I
>> would prefer that you don't remove the dependencies that are currently in
>> place.  Thanks.
>>
>
> Me too -- some of my projects still use NAND for rootfs, where space is
> tight and
> ability to split out python modules is very useful. Thus it is not an
> unused
> feature, though many projects have SD/eMMC for rootfs and those ones
> generally
> will not care about it.
>

This configuration can be supported by making a custom python3-modules
package that whitelists precisely the needed files. But it shouldn't be
imposed on everyone else - it's a significant burden to maintain the
dependencies in every single python package, and keep the splitting working
correctly in core python as well.

So I'd like to drop that - do keep in mind that very few people maintain
oe-core (as opposed to sending occasional drive-by patches to fix specific
issues raised in product development), and the headcount keeps getting
smaller.

Alex

