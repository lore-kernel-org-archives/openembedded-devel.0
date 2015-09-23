Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3863A756C5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 19:52:49 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so126396283igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 12:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=S8Ps7RQk3waUImHwtNxS6LijzLa5Z8BN2QtL29xSzns=;
	b=gkd8rp62jvy2mDsC6cIBx9lpa+n7K79+CMV3CAxAzLg/BbX2MFXeVQJquZdGpiQX4s
	W1bh++2zzxe99EqqstZbnzZwYbB09kcKaDnAKt6hQyGc2n1LmP8kdfbTtwwLC/BoCbl+
	IFZ4s3i/2F8b9Z6nM4vrNedU+0WlNhXK7vejCTt2bJsOoqnGCTB3PT+xNzn4Qe3XWsDh
	81CL2EjT+wvi7cgELy3gARj5A9nEiZeb8hOXi6LF1nT3dyCxjhBX8EqRHeh20vuyBb7y
	OtgQxwyoCg6LaMVO6PdVNR+kC05sj2+uVifLd5Ql4kVOz/lr90IYgrXhR3UgIYLcS9hn
	d/LA==
MIME-Version: 1.0
X-Received: by 10.50.43.161 with SMTP id x1mr24074974igl.64.1443037969904;
	Wed, 23 Sep 2015 12:52:49 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Wed, 23 Sep 2015 12:52:49 -0700 (PDT)
In-Reply-To: <20150923140957.GG2384@jama>
References: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
	<1442450491-14912-6-git-send-email-schnitzeltony@googlemail.com>
	<20150923140957.GG2384@jama>
Date: Wed, 23 Sep 2015 21:52:49 +0200
Message-ID: <CALbNGRRY-9Xpe_tDSN-vd1qBL30U52s5OQke2WNn3kicDps1-g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 05/19] cdrkit: initial add 1.1.11
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
X-List-Received-Date: Wed, 23 Sep 2015 19:52:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2015 at 4:09 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Thu, Sep 17, 2015 at 02:41:17AM +0200, Andreas M=C3=BCller wrote:
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb | 18 ++++++++
>>  ...te-a-run-test-to-determine-order-of-bitfi.patch | 53 +++++++++++++++=
+++++++
>>  2 files changed, 71 insertions(+)
>>  create mode 100644 meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
>>  create mode 100644 meta-oe/recipes-multimedia/cdrkit/files/0001-do-not-=
create-a-run-test-to-determine-order-of-bitfi.patch
>
> I've skipped this one, please add PACKAGECONFIG/dependency on bzip2:
>
> cdrkit-1.1.11: cdrkit rdepends on libbz2, but it isn't a build
> dependency? [build-deps]
>
I've put this one and the gudev dependency floaters on my todo.

Andreas

