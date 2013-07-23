Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 03CC36A549
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2013 12:09:37 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id eh20so9789648obb.39
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2013 05:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=KSq86LiMg3HZOM+zLNaJxIfHLgaa7W+b61yotqO4474=;
	b=e8qVFcc5D0iMpxQYrkvXf3lKwSUK8AME1rH2kDifyPLJ6CGYmSisP6sNanQ61lFv9I
	B2VrReilNjYS/BmwDs55wLGEnEWnkATgYs5aH3PE9xf8/8ZBpNwO7llw/5QHNiY/ASW3
	Y3aHYhCZHsiTqa7HyNwpH7XwdY/qXaJYSERC9YNbsfRAVrXMgdllAnEt4EoytBQbFlaq
	QX42SYmizrPeYlHUywIz9CUZa/tF6AyFr71FtkPQ/vbwBBMvMAvxkc5FRXJNCDEztvod
	PmAQv2iocgykHtZPAPW/JSBFWKkjArhVWy4VaS3z4rImQbUItCPzp4/ZN/XBQ7joLULs
	ymoA==
MIME-Version: 1.0
X-Received: by 10.182.165.133 with SMTP id yy5mr24723038obb.89.1374581377811; 
	Tue, 23 Jul 2013 05:09:37 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.60.166 with HTTP; Tue, 23 Jul 2013 05:09:37 -0700 (PDT)
In-Reply-To: <3799962.PMtSgBuqpH@helios>
References: <1373043676-5621-1-git-send-email-otavio@ossystems.com.br>
	<20130705194525.667209b0@e6520eb> <10175102.kSY1axEz5R@helios>
	<3799962.PMtSgBuqpH@helios>
Date: Tue, 23 Jul 2013 09:09:37 -0300
X-Google-Sender-Auth: Y-jtTGHNTIoQaZycEehWEikKZjQ
Message-ID: <CAP9ODKpz26sbQfot2mJJR8VDoLDQuMw=TzJg4Zmrut2imacpfg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Subject: Re: [meta-oe PATCH] busybox: Follow OE-Core update to 1.12.1 version
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
X-List-Received-Date: Tue, 23 Jul 2013 12:09:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2013 at 6:44 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Monday 08 July 2013 13:35:21 Paul Eggleton wrote:
>> On Friday 05 July 2013 19:45:25 Eric B=E9nard wrote:
>> > Le Fri, 05 Jul 2013 18:29:04 +0100,
>> >
>> > Paul Eggleton <paul.eggleton@linux.intel.com> a =E9crit :
>> > > Could someone *please* figure out what this bbappend is needed for a=
nd
>> > > get
>> > > it into OE-Core if it is still needed so we can drop it here?
>> >
>> > it's only here to install /etc/default/busybox-syslog which contains
>> > only one line : OPTIONS=3D"-C64" which sets the size of the logbuffer.
>> > So obviously this could go into OE-Core.
>>
>> Yes but why is this needed? If we are to merge this into OE-Core we'll n=
eed
>> to say why this change is needed in the commit message.
>
> ping...

I am working in something else so I cannot work on busybox now. Feel
free to handle this.

The syslog support would be good to be kept.

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

