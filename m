Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0CPJ-00012Z-Cp
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 14:38:57 +0100
Received: by bkwq11 with SMTP id q11so41633bkw.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2012 05:30:37 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.112.8.68 as permitted sender)
	client-ip=10.112.8.68; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.112.8.68 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.112.8.68])
	by 10.112.8.68 with SMTP id p4mr599226lba.47.1329917437336 (num_hops =
	1); Wed, 22 Feb 2012 05:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=M+GX9he7TmCnlDua4P6y2v4Hn+uXdE4QlFXOrP6G09Q=;
	b=CLLVQPrunep8y751SebgdNvlWgwF41QZJnOvp52Htxn7B04Do+K464aMmDdn81IamV
	iYAXSkY8eM21tMnaRpdmUSV+lSaSsMOkB8xRBHBUF5yC3vAS43Rhosm5qxggGDS5WDeB
	Wdoa+z9OP5nDgYVklDAfw6ceB5ISkNFyfsKPw=
MIME-Version: 1.0
Received: by 10.112.8.68 with SMTP id p4mr499627lba.47.1329917437158; Wed, 22
	Feb 2012 05:30:37 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Wed, 22 Feb 2012 05:30:37 -0800 (PST)
In-Reply-To: <20120222131548.GK3769@jama.jama.net>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<20120220124013.GG3953@jama.jama.net>
	<CALbNGRTeigkZyBQzHogt6EeZSzK80ZP05CKyqHwEOMnaJFZyuQ@mail.gmail.com>
	<20120220160415.GH3953@jama.jama.net>
	<CALbNGRQkNRcf3gHbscAvVFqZv0nGRR5_U2kTHSZ_uVCASWGtYQ@mail.gmail.com>
	<20120222131548.GK3769@jama.jama.net>
Date: Wed, 22 Feb 2012 14:30:37 +0100
Message-ID: <CALbNGRTwehO9j0RPRCSMnxjHBk51cOvxXY=kg2Hw3h5_nCUOzw@mail.gmail.com>
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
X-List-Received-Date: Wed, 22 Feb 2012 13:38:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2012 at 2:15 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Wed, Feb 22, 2012 at 01:47:07PM +0100, Andreas M=FCller wrote:
>> On Mon, Feb 20, 2012 at 5:04 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> > On Mon, Feb 20, 2012 at 04:56:46PM +0100, Andreas M=FCller wrote:
>> >> On Mon, Feb 20, 2012 at 1:40 PM, Martin Jansa <martin.jansa@gmail.com=
> wrote:
>> >> > On Thu, Feb 16, 2012 at 03:02:54AM +0100, Andreas M=FCller wrote:
>> >> >> V1 -> V2:
>> >> >> [2] =A0do not check configuration variables for cross and nativesd=
k
>> >> >> [3] =A0rename systemd_package to systemd_generate_package_scripts
>> >> >> [6] =A0parse unit files to determine the files to pack
>> >> >> [7] =A0create warning if *-systemd package already rdepends
>> >> >> =A0 =A0 =A0it's base package
>> >> >> added in V2:
>> >> >> [8]-[20] remove obsolet systemd code from recipes (these were used=
 as
>> >> >> =A0 =A0 =A0test cases)
>> >> >> [21] dhcp-(relay) test case for multiple systemd packages
>> >> >> [22] modified to start service
>> >> >>
>> >> >> The following tests were performed:
>> >> >> * build from scratch with [1]-[7] / run test
>> >> >> * build from scratch / apply patches / build -> check buildhistory=
 diff
>> >> >> * build from scratch w/o patches / build from scratch with patches=
 -> check
>> >> >> =A0 buildhistory diff
>> >> >>
>> >> >> Additional patches were prepared for other recipes inheriting syst=
emd. These are
>> >> >> not yet send because they move systemd support from ${PN} to ${PN}=
-systemd which
>> >> >> currently needs modifications on tasks/images. I'd be happy if a c=
ommon accepted
>> >> >> solution would be suggested/implemented (image-feature?).
>> >> >
>> >> > Today I've noticed one more issue (not sure if it's caused by this
>> >> > patchset or not).
>> >> I think it is
>> >> >
>> >> > Some images are failing for me with:
>> >> > For package xserver-nodm-init-systemd SYSTEMD_SERVICE-entry xserver=
-nodm.service does not exist
>> >> > from systemd.bbclass:populate_packages_prepend
>> >> >
>> >> > I guess it's because sstate package:
>> >> > sstate-xserver-nodm-init-all-oe-linux-2.0-r13-all-2-2ac030a94ddbd20=
2f54b99c2e32c6312_package.tgz
>> >> >
>> >> > has only
>> >> > package/lib/systemd/system/xserver-nodm.service
>> >> >
>> >> > but systemd.bbclass:populate_packages_prepend is looking only in ${=
D}
>> >> > (image directory).
>> >> >
>> >> I assume you are working with temp files deleted (don't know the exac=
t
>> >
>> > Yes temp files were deleted (and inherit rm_work).
>> >
>> >> config option now). To fix: Is there a variable pointing to package
>> >> dir?
>> >
>> > classes/package.bbclass:PKGD =A0 =A0=3D "${WORKDIR}/package"
>> >
>> > should help
>> >
>> I am working on this and checked rm_work.bbclass. Seems that complete
>> package contents are retained / respectively are recovered by sstate.
>> Hence I have another question:
>>
>> Will it cause problems to run the whole code in
>> populate_packages_prepend only (once) in case ${D} exists? Any fallout
>> to expect by this simple solution?
>
> If I understand you right, then looks good to me.
>
>> Please let me know if so because this would save me from long build test=
s.
>
> For me this whole series can go in as it is now and my comments can be
> implemented as followup patches (which will be easier to review then
> whole patchset again).
>
> Maybe only add that variable for /lib/systemd/system so I can push my
> "systemd rework" patchset for meta-smartphone with this variable
> already.
>
I am afraid I have embedded all comments already - will send a new
version after test...

* the modifications will be documented
* commits untouched will remain Otavio's ack

so efforts for another review are few.

Cheers

Andreas


