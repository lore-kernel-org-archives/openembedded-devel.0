Received: from mail-ve0-f172.google.com ([209.85.128.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U37Qn-00048k-Rh
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Feb 2013 17:01:06 +0100
Received: by mail-ve0-f172.google.com with SMTP id cz11so1296164veb.31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Feb 2013 07:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=nQfEr+bFREnx0xTRb7ke6J76DQ+3lSBNPRKZw+arxqA=;
	b=MF10x2s4HRgC0iVuH/iLROyLUQrAZgwvF1tNY6RCIMIMT1BLDILF/0t7NxG/XLOPNm
	tdxOuZr6rjBomIBPtSYUdF44uULiAOEOxXKtt/wzZ3Z9YsvwbVpoFx3mzQeIxkmYfMfI
	Otw0tpl8OiTIhAZDDN3aszMQinBGCWwSdyOXlja5oUJSJ5GI/lzS87glVIO3D5d14XiK
	EGgtmCMDLa5gVgh+U5BVyn9n2OXEQCXEiwr5vJUIUveGvxCtFFkYEmmIxTnReQEK/wEF
	NFWWGNixdIC2XTuZhJV84y2u6bpWo3fHUQexkHpxYvD/ZSKOkM5R1MU3Urbmk0eR0J7t
	lMYQ==
MIME-Version: 1.0
X-Received: by 10.52.28.101 with SMTP id a5mr29216344vdh.92.1360165514277;
	Wed, 06 Feb 2013 07:45:14 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Wed, 6 Feb 2013 07:45:14 -0800 (PST)
In-Reply-To: <20130206152529.GA3271@jama>
References: <1360102723-27891-1-git-send-email-schnitzeltony@googlemail.com>
	<1360102723-27891-5-git-send-email-schnitzeltony@googlemail.com>
	<20130206144840.GZ3271@jama>
	<CALbNGRR9isWgLJmRL3thvhkFhirwLR2YqoXfrHPtgMqOHrYQBw@mail.gmail.com>
	<20130206152529.GA3271@jama>
Date: Wed, 6 Feb 2013 16:45:14 +0100
Message-ID: <CALbNGRSxbdOORdEy0LrmmDaGoh53q+=CsU7QjO2YBK+X7bBVFw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe-meta-systemd 4/5] pointercal-xinput: remove
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
X-List-Received-Date: Wed, 06 Feb 2013 16:01:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 6, 2013 at 4:25 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> On Wed, Feb 06, 2013 at 04:12:50PM +0100, Andreas M=C3=BCller wrote:
>> On Wed, Feb 6, 2013 at 3:48 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>> > On Tue, Feb 05, 2013 at 11:18:42PM +0100, Andreas M=C3=BCller wrote:
>> >> Calibration values are stored now in /etc/xorg.conf.d/99-<device>.con=
f. After
>> >
>> > So the plan to replace pointercal-xinput in BSP layers
>> > is to convert pointercal.xinput files to 99-<device>.conf files provid=
ed
>> > by xserver-xf86-conf bbappend?
>> I would have appended it to xinput-calibrator because that's where the
>> configuration files are used. I can put them also to xserver-xf86-conf
>> bbappend - have no strong opinion here.
>
> xinput-calibrator does not need to be MACHINE_ARCH, that's why they were
> in separate pointercal-xinput before.
>
> xserver-xf86-config on other hand is usually MACHINE_ARCH so it would be
> better to add them there.
>
> Or create new recipe for them and RDEPEND it from xinput-calibrator...
Or don't remove pointercal-xinput :)

Andreas


