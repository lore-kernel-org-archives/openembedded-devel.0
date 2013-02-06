Received: from mail-vb0-f43.google.com ([209.85.212.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U36vR-0002ty-OE
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Feb 2013 16:28:53 +0100
Received: by mail-vb0-f43.google.com with SMTP id fs19so905856vbb.30
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Feb 2013 07:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=JZQnjrZqi1xjbRFUr6SFNbvUiM6okf+ZNFxZT77e7Ek=;
	b=ZbeNZaD6QJ9aL0QxV4YT0tVW8YkRHCyh/nETT/+Fa3da54MEXW1VQ4NgWz8QHqE7TP
	4H97EfB5D3xXq1xMvpnDH1eREeIJOy72budXB0rasOtf8Mqme3xu5Vn6JIOjYeQ9c/OU
	a4/3vz/WvETtLWMquX+KvGpYshdeeXLhIWf2jHH2RVbFSVrOdF7mMwuMHMxvlbwS3dEN
	wrOkXjEKIcm1XJ0jtEFCdAhRegL4oybhgkI9fXSoQPVb84ZZ3rNWVw5NK1d4lUu3pG0z
	H1Y8bbAbvel+IYJVPJKClEGKoL7ZT8n1KiTbPWGqkdGu5GFLLhWJVNloBuCXP6USGdg5
	NKuA==
MIME-Version: 1.0
X-Received: by 10.52.66.168 with SMTP id g8mr3092446vdt.27.1360163570231; Wed,
	06 Feb 2013 07:12:50 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Wed, 6 Feb 2013 07:12:50 -0800 (PST)
In-Reply-To: <20130206144840.GZ3271@jama>
References: <1360102723-27891-1-git-send-email-schnitzeltony@googlemail.com>
	<1360102723-27891-5-git-send-email-schnitzeltony@googlemail.com>
	<20130206144840.GZ3271@jama>
Date: Wed, 6 Feb 2013 16:12:50 +0100
Message-ID: <CALbNGRR9isWgLJmRL3thvhkFhirwLR2YqoXfrHPtgMqOHrYQBw@mail.gmail.com>
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
X-List-Received-Date: Wed, 06 Feb 2013 15:28:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 6, 2013 at 3:48 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> On Tue, Feb 05, 2013 at 11:18:42PM +0100, Andreas M=C3=BCller wrote:
>> Calibration values are stored now in /etc/xorg.conf.d/99-<device>.conf. =
After
>
> So the plan to replace pointercal-xinput in BSP layers
> is to convert pointercal.xinput files to 99-<device>.conf files provided
> by xserver-xf86-conf bbappend?
I would have appended it to xinput-calibrator because that's where the
configuration files are used. I can put them also to xserver-xf86-conf
bbappend - have no strong opinion here.
>
> And do you have some script to convert them or do you convert them
> manually?
>
I wanted to convert them manually but a script is more reliable - will
do that next week.

Andreas


