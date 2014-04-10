Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id DD14965E65
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 09:59:56 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id hu19so3226773vcb.15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 02:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=sR/OzfE0cwEIOiBoyQ0kjYzTSux5RFuh2foVQrkDdJM=;
	b=EIaaLfeJmrFIXQWV9+8cWv2JKCGJtn9cCNP95k2mDd08w59ISFXxnFRhlBnueY9FcG
	Lm2npI8Ah2tPRcHfqMriDUosBCQE6qALlu1qMd1F2QqSN8i5Sn8w8f42qiV1M6doS8Et
	y0clNASNyGF9zXf/FJXT/A2W4/mHk96MaesUCXb/I6gYW1zfGK0dgsIEV55xiwE6P/Py
	mYFy4c5vB0jDkH3ICB9tZhKzdfA5h0OrLgjyYJNwRuqU/emNDRBYrY9n4Z9wiwx32NC5
	G8ZR5RTkC2ILiSRtK7v0Ez+E+WIpyjnGTcB4BBAOEMY/1YkS57I2PBDw4ImVs5ccyoZQ
	h40A==
MIME-Version: 1.0
X-Received: by 10.52.90.37 with SMTP id bt5mr11577650vdb.7.1397123996862; Thu,
	10 Apr 2014 02:59:56 -0700 (PDT)
Received: by 10.52.120.4 with HTTP; Thu, 10 Apr 2014 02:59:56 -0700 (PDT)
In-Reply-To: <20140410082533.GL2132@jama>
References: <1396860746-17944-1-git-send-email-schnitzeltony@googlemail.com>
	<1396860746-17944-2-git-send-email-schnitzeltony@googlemail.com>
	<20140410082533.GL2132@jama>
Date: Thu, 10 Apr 2014 11:59:56 +0200
Message-ID: <CALbNGRSfO06FY6z1VguW1e5VSqhyFn3ssvzxnUY1=e40z4E+HA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-gnome] abiword: workaround compile races by disabling parallel make
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
X-List-Received-Date: Thu, 10 Apr 2014 10:00:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2014 at 10:25 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Mon, Apr 07, 2014 at 10:52:26AM +0200, Andreas M=C3=BCller wrote:
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb b/meta-gn=
ome/recipes-gnome/abiword/abiword_3.0.0.bb
>> index 69d62ef..875cfd6 100644
>> --- a/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb
>> +++ b/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb
>> @@ -24,6 +24,11 @@ SHRT_VER =3D "${@d.getVar('PV',1).split('.')[0]}.${@d=
.getVar('PV',1).split('.')[1]
>>
>>  inherit autotools pkgconfig
>>
>> +# TBD: fix Makefile
>> +# | make[3]: *** No rule to make target `../goffice-bits2/libgoffice.la=
', needed by `libabiword-3.0.la'.  Stop.
>> +# | make[3]: *** Waiting for unfinished jobs....
>> +PARALLEL_MAKE =3D ""
>
> BTW: this seems to happen only when something is detected in sysroot
> (abiword fails in test-dependencies when building in fully-populated
> sysroot and builds ok with minimal).
>
> But maybe it's coincidence..
>
Whatever causes this I think you should better take Trevor's patch [1]
instead of mine. It seems (have not tested) to address the problem
more specific and reduces build time.

Andreas

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2014-April/0=
95138.html

