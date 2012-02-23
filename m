Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0U8t-00020Q-Oi
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 09:35:11 +0100
Received: by lahc1 with SMTP id c1so1195831lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 00:26:50 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.112.8.68 as permitted sender)
	client-ip=10.112.8.68; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.112.8.68 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.112.8.68])
	by 10.112.8.68 with SMTP id p4mr159779lba.47.1329985610455 (num_hops =
	1); Thu, 23 Feb 2012 00:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=2ncjHda4SHSdB0SyLq486xC0gGDKn9zapPrIIR/ZxjQ=;
	b=WFZku1keYMNINOlsagMcSiPlFYqoCgDMnk8caLed3MLII/eF8pGL+wCLSo1mVgLoPZ
	idqPd3TTXfWaSzkiq4VeBIFSImSsuUGIvma82r3sNNy3YsXRlrH0ia6bg6F1PvXuMQhF
	33G0Og7IW93DCgU5W6/FbE23JyG8cG9W/K8LU=
MIME-Version: 1.0
Received: by 10.112.8.68 with SMTP id p4mr136186lba.47.1329985610375; Thu, 23
	Feb 2012 00:26:50 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Thu, 23 Feb 2012 00:26:50 -0800 (PST)
In-Reply-To: <20120220124013.GG3953@jama.jama.net>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<20120220124013.GG3953@jama.jama.net>
Date: Thu, 23 Feb 2012 09:26:50 +0100
Message-ID: <CALbNGRQ-drXQR9AfSQxOp7EfeL184-RstqOezfPfAdWJiY3zpw@mail.gmail.com>
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
X-List-Received-Date: Thu, 23 Feb 2012 08:35:11 -0000
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
I prepared V3 and up to now all tests look good. Regarding this issue:
What is a test case to reproduce if the modification are OK?

Andreas


