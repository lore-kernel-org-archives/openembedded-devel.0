Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0BjD-0007V0-Md
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 13:55:27 +0100
Received: by lahc1 with SMTP id c1so9106799lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2012 04:47:07 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.112.38.37 as permitted sender)
	client-ip=10.112.38.37; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.112.38.37 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.112.38.37])
	by 10.112.38.37 with SMTP id d5mr11466767lbk.5.1329914827592 (num_hops
	= 1); Wed, 22 Feb 2012 04:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Ax/mVbofoB/qXftjNkT6XnqDHOI5fe3boV2khN3vqfI=;
	b=B0MeX7R3coHvvx/YOIj4Az+zSjRp622sCyOIbywWYDXbqmqHaJgeqZ7Oznb45WhSAX
	REqAB6TvkLDQAVheHgdvo4X1xWVWUYE8RFnzmHWVacsZkgjXoA0BmRL0muqgwZzAfnwz
	DDvTuzbivxOYPeLOZuBQr2TF5URFrxNqB6p/U=
MIME-Version: 1.0
Received: by 10.112.38.37 with SMTP id d5mr9558767lbk.5.1329914827464; Wed, 22
	Feb 2012 04:47:07 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Wed, 22 Feb 2012 04:47:07 -0800 (PST)
In-Reply-To: <20120220160415.GH3953@jama.jama.net>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<20120220124013.GG3953@jama.jama.net>
	<CALbNGRTeigkZyBQzHogt6EeZSzK80ZP05CKyqHwEOMnaJFZyuQ@mail.gmail.com>
	<20120220160415.GH3953@jama.jama.net>
Date: Wed, 22 Feb 2012 13:47:07 +0100
Message-ID: <CALbNGRQkNRcf3gHbscAvVFqZv0nGRR5_U2kTHSZ_uVCASWGtYQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 22 Feb 2012 12:55:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 20, 2012 at 5:04 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Mon, Feb 20, 2012 at 04:56:46PM +0100, Andreas M=FCller wrote:
>> On Mon, Feb 20, 2012 at 1:40 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> > On Thu, Feb 16, 2012 at 03:02:54AM +0100, Andreas M=FCller wrote:
>> >> V1 -> V2:
>> >> [2] =A0do not check configuration variables for cross and nativesdk
>> >> [3] =A0rename systemd_package to systemd_generate_package_scripts
>> >> [6] =A0parse unit files to determine the files to pack
>> >> [7] =A0create warning if *-systemd package already rdepends
>> >> =A0 =A0 =A0it's base package
>> >> added in V2:
>> >> [8]-[20] remove obsolet systemd code from recipes (these were used as
>> >> =A0 =A0 =A0test cases)
>> >> [21] dhcp-(relay) test case for multiple systemd packages
>> >> [22] modified to start service
>> >>
>> >> The following tests were performed:
>> >> * build from scratch with [1]-[7] / run test
>> >> * build from scratch / apply patches / build -> check buildhistory di=
ff
>> >> * build from scratch w/o patches / build from scratch with patches ->=
 check
>> >> =A0 buildhistory diff
>> >>
>> >> Additional patches were prepared for other recipes inheriting systemd=
. These are
>> >> not yet send because they move systemd support from ${PN} to ${PN}-sy=
stemd which
>> >> currently needs modifications on tasks/images. I'd be happy if a comm=
on accepted
>> >> solution would be suggested/implemented (image-feature?).
>> >
>> > Today I've noticed one more issue (not sure if it's caused by this
>> > patchset or not).
>> I think it is
>> >
>> > Some images are failing for me with:
>> > For package xserver-nodm-init-systemd SYSTEMD_SERVICE-entry xserver-no=
dm.service does not exist
>> > from systemd.bbclass:populate_packages_prepend
>> >
>> > I guess it's because sstate package:
>> > sstate-xserver-nodm-init-all-oe-linux-2.0-r13-all-2-2ac030a94ddbd202f5=
4b99c2e32c6312_package.tgz
>> >
>> > has only
>> > package/lib/systemd/system/xserver-nodm.service
>> >
>> > but systemd.bbclass:populate_packages_prepend is looking only in ${D}
>> > (image directory).
>> >
>> I assume you are working with temp files deleted (don't know the exact
>
> Yes temp files were deleted (and inherit rm_work).
>
>> config option now). To fix: Is there a variable pointing to package
>> dir?
>
> classes/package.bbclass:PKGD =A0 =A0=3D "${WORKDIR}/package"
>
> should help
>
I am working on this and checked rm_work.bbclass. Seems that complete
package contents are retained / respectively are recovered by sstate.
Hence I have another question:

Will it cause problems to run the whole code in
populate_packages_prepend only (once) in case ${D} exists? Any fallout
to expect by this simple solution?

Please let me know if so because this would save me from long build tests.

Andreas


