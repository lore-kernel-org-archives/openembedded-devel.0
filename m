Return-Path: <paul.betafive@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2D90A6AFD4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jul 2013 21:34:42 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id wc20so754087obb.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jul 2013 14:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=7Uzd2jJalyL5J9lSXLnas3iBhk61Bk+YY5E4SiaVARk=;
	b=s44kotSlx8NvghWXPL/Z8JpjVV73LFxfhY2r7SaY+I3th5E8MoBzDMe2/i/2cEsxEL
	iB9d/hRaZHOX/HR7az3v3QFsB5hsPPp/yIsX8znmm9lEH4tvYWlFTbxHnh8LTZpJQXm4
	dWwnqi4ra65AB3ARCQvmxAM+vBCW7SDXYCVcfB8J1uLvMwMr/EJnItm+rNpEiFsT91r8
	VnKySonuKdyZKLUDn1iaXMMqVY6TWYGGVRid28ExubkOLHELVEXmvcnkLj7UrccbfX39
	K+h8x6xqTVVQb+SUwg4qgmsoiO0pl/tU73Ozc2wsmNXB0w5cQWdtYhgJGaWF+tJ/TGK+
	l00g==
X-Received: by 10.60.150.231 with SMTP id ul7mr2804693oeb.87.1372887282730;
	Wed, 03 Jul 2013 14:34:42 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.76.102.11 with HTTP; Wed, 3 Jul 2013 14:34:02 -0700 (PDT)
In-Reply-To: <CAP9ODKpfZ51PorenwkNq1HccwU0N=3AtGzOAOC4yp1iE1=LJGw@mail.gmail.com>
References: <1372864933-17240-1-git-send-email-otavio@ossystems.com.br>
	<CAJTo0LbQA+r7B0RVDy_0CJivi8H+3yktHUZqCFzz1=AcTkXDiw@mail.gmail.com>
	<CAP9ODKoyQfZRmikLwxVcxCXdtikVGNKk8DwRsfNaRURqp4+HPA@mail.gmail.com>
	<CAJTo0Lar2HO_cr6Az31Sqkxp=7ATSg+jG_b5DkD=t9vCUaJa0g@mail.gmail.com>
	<CAP9ODKpfZ51PorenwkNq1HccwU0N=3AtGzOAOC4yp1iE1=LJGw@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 3 Jul 2013 22:34:02 +0100
X-Google-Sender-Auth: rKie3v67JemsSnsTtalMH32PbAg
Message-ID: <CANyK_8fswhsiKeGegomSvgW9QSp4SqQYqJ_o1SEvpGbB0A=w1A@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe PATCH] lmbench: Add /run onto package
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
X-List-Received-Date: Wed, 03 Jul 2013 21:34:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 3 July 2013 19:30, Otavio Salvador <otavio@ossystems.com.br> wrote:
> On Wed, Jul 3, 2013 at 3:28 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> /run is volatile.  Both systemd (directly) and sysvinit (through
>> fstab) put a tmpfs on /run, so that's not going to achieve much.
>
> Ok; I will remove the /run and send a v2.
>

Just FYI, you may be interested in reading
http://article.gmane.org/gmane.comp.handhelds.openembedded/58530 which
explains how to fix unshipped files in '/run'.

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

