Received: from mail-vb0-f51.google.com ([209.85.212.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UG3Xx-000638-4B
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Mar 2013 09:30:02 +0100
Received: by mail-vb0-f51.google.com with SMTP id fq11so1046321vbb.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Mar 2013 01:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=xV8YgjSzZlldk4ib5oRvinkXQRdOdLVc0Byb1HDTLCk=;
	b=JBgrsfYifxQp7X0YjABMGhjenbd5kjLpCgjRbwmMeMDzhRtoACT/3h12YU9gErJrNe
	1HPdrynT+7H8nt7kiOxEo+aSmouzdSRPwWw8m1Pzp4wJqFEsq/g1wUwFT/xNhTZD0/UY
	yL7gHw9nUvI8HNcLfDdxOQHPjSq/1RL0KFJL9GH4lb4j5PpsAnCW4+IM3DVHCwnLa/6o
	Rvi2owgz5Jwm0LL4dZ+adu32jC+3AMDeqXGTViEbC2xyrJeE1wxKSfargLWkOgkDooHJ
	ax+mQ8aOHqTS9lkO5hBDMbY9mrVwAaDP8a44jEn1IWoRTKP7sAAoe+vevrnU0zKCKNWt
	89ww==
MIME-Version: 1.0
X-Received: by 10.220.176.73 with SMTP id bd9mr637068vcb.63.1363248794913;
	Thu, 14 Mar 2013 01:13:14 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Thu, 14 Mar 2013 01:13:14 -0700 (PDT)
In-Reply-To: <20130313163811.GV3260@jama>
References: <1362521704-25965-1-git-send-email-Martin.Jansa@gmail.com>
	<CALbNGRT+RDine-AZQx+K8oaf25mncrHvvbYq5FMNS7TnXQU0Pw@mail.gmail.com>
	<20130313163811.GV3260@jama>
Date: Thu, 14 Mar 2013 09:13:14 +0100
Message-ID: <CALbNGRQS_gSEKuQgKS_sV7V1VsbGeYULTHDb8hHRtF+8LO8hMg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCHv2] poppler: upgrade to 0.18.4
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
X-List-Received-Date: Thu, 14 Mar 2013 08:30:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2013 at 5:38 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Fri, Mar 08, 2013 at 12:25:04PM +0100, Andreas M=C3=BCller wrote:
>> On Tue, Mar 5, 2013 at 11:15 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> > * 0.18.0 was failing to build after libpng was upgraded to 1.6 in oe-c=
ore
>> >
>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> > ---
>> >  meta-oe/recipes-support/poppler/poppler_0.18.0.bb | 12 ------------
>> >  meta-oe/recipes-support/poppler/poppler_0.18.4.bb | 10 ++++++++++
>> >  2 files changed, 10 insertions(+), 12 deletions(-)
>> >  delete mode 100644 meta-oe/recipes-support/poppler/poppler_0.18.0.bb
>> >  create mode 100644 meta-oe/recipes-support/poppler/poppler_0.18.4.bb
>> >
>> Maybe it is a temporary problem but I get
>>
>> ERROR: Fetcher failure: Fetch command failed with exit code 4, no output
>> ERROR: Function failed: Fetcher failure for URL:
>> 'http://poppler.freedesktop.org/poppler-0.18.4.tar.gz'. Unable to
>> fetch URL from any source.
>> ERROR: Logfile of failure stored in:
>> /home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-g=
nueabi/poppler/0.18.4-r0/temp/log.do_fetch.20883
>> ERROR: Task 4 (/home/Superandy/data/oe-core/sources/meta-openembedded/me=
ta-oe/recipes-support/poppler/poppler_0.18.4.bb,
>> do_fetch) failed with exit code '1'
>
> It still downloads here, so I assume it was really temporary, applied
> now (because old was failing anyway).
>
>>
>> Andreas
Same here - server seems up and it fixes the build error - thanks

Andreas


