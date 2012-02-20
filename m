Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RzVjc-0006nj-MF
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Feb 2012 17:05:04 +0100
Received: by lahc1 with SMTP id c1so6546061lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2012 07:56:46 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.152.133.3 as permitted sender)
	client-ip=10.152.133.3; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.152.133.3 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.152.133.3])
	by 10.152.133.3 with SMTP id oy3mr15937987lab.2.1329753406601 (num_hops
	= 1); Mon, 20 Feb 2012 07:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=MPYB+K0wlUf9ulQLtzieTmiXkm81Lw2i6B4N2iixs80=;
	b=DCosGc+VGQjasFC7Ygftb4KGAnLLEty6qhCniSqA6B7HRuvKZQPQ42cqVdjWWEIXI+
	UNRAtndI1uoSRSHbGvMTMLF+uFO7Ib8NOtl1w9OFwTV1d1YGL+vwVub9ZoHKxLba4T+7
	64zog4AbKMojPqHq+c5ZqqUcq5AWdteXA1hbc=
MIME-Version: 1.0
Received: by 10.152.133.3 with SMTP id oy3mr13330297lab.2.1329753406540; Mon,
	20 Feb 2012 07:56:46 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Mon, 20 Feb 2012 07:56:46 -0800 (PST)
In-Reply-To: <20120220124013.GG3953@jama.jama.net>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<20120220124013.GG3953@jama.jama.net>
Date: Mon, 20 Feb 2012 16:56:46 +0100
Message-ID: <CALbNGRTeigkZyBQzHogt6EeZSzK80ZP05CKyqHwEOMnaJFZyuQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][v2] 00/22] systemd rework
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
X-List-Received-Date: Mon, 20 Feb 2012 16:05:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 20, 2012 at 1:40 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Thu, Feb 16, 2012 at 03:02:54AM +0100, Andreas M=FCller wrote:
>> V1 -> V2:
>> [2] =A0do not check configuration variables for cross and nativesdk
>> [3] =A0rename systemd_package to systemd_generate_package_scripts
>> [6] =A0parse unit files to determine the files to pack
>> [7] =A0create warning if *-systemd package already rdepends
>> =A0 =A0 =A0it's base package
>> added in V2:
>> [8]-[20] remove obsolet systemd code from recipes (these were used as
>> =A0 =A0 =A0test cases)
>> [21] dhcp-(relay) test case for multiple systemd packages
>> [22] modified to start service
>>
>> The following tests were performed:
>> * build from scratch with [1]-[7] / run test
>> * build from scratch / apply patches / build -> check buildhistory diff
>> * build from scratch w/o patches / build from scratch with patches -> ch=
eck
>> =A0 buildhistory diff
>>
>> Additional patches were prepared for other recipes inheriting systemd. T=
hese are
>> not yet send because they move systemd support from ${PN} to ${PN}-syste=
md which
>> currently needs modifications on tasks/images. I'd be happy if a common =
accepted
>> solution would be suggested/implemented (image-feature?).
>
> Today I've noticed one more issue (not sure if it's caused by this
> patchset or not).
I think it is
>
> Some images are failing for me with:
> For package xserver-nodm-init-systemd SYSTEMD_SERVICE-entry xserver-nodm.=
service does not exist
> from systemd.bbclass:populate_packages_prepend
>
> I guess it's because sstate package:
> sstate-xserver-nodm-init-all-oe-linux-2.0-r13-all-2-2ac030a94ddbd202f54b9=
9c2e32c6312_package.tgz
>
> has only
> package/lib/systemd/system/xserver-nodm.service
>
> but systemd.bbclass:populate_packages_prepend is looking only in ${D}
> (image directory).
>
I assume you are working with temp files deleted (don't know the exact
config option now). To fix: Is there a variable pointing to package
dir?

Andreas


