Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id B1F5665D4A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Dec 2015 22:59:12 +0000 (UTC)
Received: by wmww144 with SMTP id w144so79673748wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Dec 2015 14:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=1StzIQF1K5sAB46tojC3/PGBqZUgcnWfNgTMHw1vOl8=;
	b=MFUCJHGi8L2LaTGBhYZ0hBkIWAdINUKYC4vB6/cIh87W0Hf2kP4JfQlTeq9HWZJSpz
	i7TJE51S1KjQ5QWzJ8AgC1U+bIoQ3PoFUByGYuQV15vbzG/DGac+fceP+0oqOaQPWApF
	VCKBcQslHh0yBi6hFwDbuRxcVw8Y25zAIPkYohAfF1eRbWlZhYv9zIWBYCVOm46tIgQN
	o+acg7+9yT6mX0ZkJyJyLv1qyDz1ko/0ICI0XQklG/bfrpDLr5AIs3Au5s4wGnf31mL9
	qAvJ82KRCSzfSIEdYclFF3FrENpHqvtZ0UCToom8irNiXLMI4pmzhRStYd65H6YVMZrY
	ELQQ==
MIME-Version: 1.0
X-Received: by 10.194.116.170 with SMTP id jx10mr19705144wjb.166.1449269953140;
	Fri, 04 Dec 2015 14:59:13 -0800 (PST)
Received: by 10.194.2.15 with HTTP; Fri, 4 Dec 2015 14:59:13 -0800 (PST)
In-Reply-To: <DUB127-W22D1770BD32DBD895E41FCB80C0@phx.gbl>
References: <DUB127-W22D1770BD32DBD895E41FCB80C0@phx.gbl>
Date: Fri, 4 Dec 2015 23:59:13 +0100
Message-ID: <CA+chaQd+6fTZwYqVDSNb+zTEnr7dKZbmS5iYTxobtvn1OhZZpg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: =?UTF-8?B?UmU6IFttZXRhLXF0NV0gR1N0cmVhbWVyLTEuMCBwYXRoIGJyZWFraW5nIDAuMSBzdXBwb3J04oCP?=
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
X-List-Received-Date: Fri, 04 Dec 2015 22:59:13 -0000
Content-Type: text/plain; charset=UTF-8

> Otherwise, why is the patch that seems to have been accepted in 2014 to
fix the 1.0 breaking 0.1 support not been implemented in the layer yet?

It's incorrectly marked as Accepted in patchwork, but it was never merged
into the repository, because the author never sent v2 with review comments
from me resolved.

There was another patch:
http://patchwork.openembedded.org/patch/85075/
which was merged and nobody was reporting broken 0.10 support since then.
I'm not using 0.10 version, so I was assuming it works now for people who
do.

Regards,


On Fri, Dec 4, 2015 at 11:24 PM, Gerhard de Clercq <
gerharddeclercq@outlook.com> wrote:

> Hi,
>
> I've just wasted a lot of time trying to get qtmultimedia to compile on a
> Fido build using the Fido branch of meta-qt5. After a lot of tinkering I
> finally got it working and have found that the problem was caused by the
> 0001-Initial-porting-effort-to-GStreamer-1.0.patch file that ships with the
> layer. I initially didn't realize that the troublesome code was coming from
> it and debugged the cached source (which it seems is patched) until it
> worked. I didn't think it would be so easy but a patch
> http://patchwork.openembedded.org/patch/79531/ I found from 2014
> completely told me how to correct the source.
>
> What bothers me is how can this can be possible. Are the recipes designed
> not to apply the patch to non 1.0 build and if so, what could prevent that
> from working? Otherwise, why is the patch that seems to have been accepted
> in 2014 to fix the 1.0 breaking 0.1 support not been implemented in the
> layer yet?
>
> PS. I see the patch file has changed a bit after Fido but unfortunately
> Fido is the latest that my board supports at the moment and I have not been
> able to test with a newer version.
>
> Regards,
> Gerhard de Clercq
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

