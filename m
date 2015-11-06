Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id D938675EE7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2015 09:48:17 +0000 (UTC)
Received: by wmec201 with SMTP id c201so13067505wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Nov 2015 01:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=Sh7YNg39bhjSVxox3EkdUuTCqFdre3FenXQuZ8Xz/Zc=;
	b=LpwuNvU15DhX6JoYVU79M4CaoyasRgPdLR9CxECgXOiu26q/rh+Zu9Gmvowa4kWgY5
	HVaB1bJfJBiGVd4AuBNxsjHHCpFukamy+aXwOmjUOZHHK5Vc+TyVYcl7RtBvBYMhZ8WE
	/DqDn8fExOfer+Sepi0UVDGABv3pDYClA/3LhmeDW4TnaFsQl+95fjVKPu+ZLQFYfwM4
	RvlZu5ZDuoFsz6VQ8PTOh1hKdxflsl2usZ0SxazzobxaWzyo1zunF7KgpErszFMSdmU4
	UczNmxjF7nzJc27wS83qY+S8ip7xK7XtwXYDCXby8Mn8PS0oBTVIZDDdwubmRxG+wiTt
	zeOA==
X-Received: by 10.28.18.21 with SMTP id 21mr9342553wms.34.1446803296761;
	Fri, 06 Nov 2015 01:48:16 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	l1sm11347814wjx.13.2015.11.06.01.48.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 06 Nov 2015 01:48:16 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CABcZANnLjb5mF1SLYA+2x0er=RefobM-Dv81wYvi3OOKhoB74Q@mail.gmail.com>
Date: Fri, 6 Nov 2015 10:48:14 +0100
Message-Id: <29140561-CA7E-483E-BDC2-375A739E1C5C@gmail.com>
References: <FD578A39-55EB-46F0-8AB8-85C7F9B8CC2C@gmail.com>
	<CABcZANnLjb5mF1SLYA+2x0er=RefobM-Dv81wYvi3OOKhoB74Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-oe][PATCH] samba: systemv-init script must be executable
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
X-List-Received-Date: Fri, 06 Nov 2015 09:48:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


> Am 04.11.2015 um 20:42 schrieb Christopher Larson <clarson@kergoth.com>:
> 
> On Wed, Nov 4, 2015 at 11:09 AM, Jens Rehsack <rehsack@gmail.com> wrote:
> 
>> Fix insane permissions installing SystemV init-script for samba4 to allow
>> executing it correctly.
>> 
>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>> 
> 
> The /etc/rc our sysvinit package provides will source the startup script
> rather than executing it if its name ends in .sh, so I don't really see why

To allow people start/stop manually from shell?

$ /etc/init.d/samba.sh start
$ /etc/init.d/samba.sh stop

Might be irrelevant in some situations, but generally such a script should
be executable anyway - shouldn't it?

Cheers
-- 
Jens Rehsack - rehsack@gmail.com


