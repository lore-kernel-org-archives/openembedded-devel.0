Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 104BF6A549
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2013 12:46:35 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id va7so10084809obc.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2013 05:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=NUMtLPTVPOALSJBD2FXmhf9U3/VjYslBguJI4YeCxAY=;
	b=nLUB9D7Qz/5wivDfN41bGYBRDGW0aB8mbLtKHlv0XgjTby/E+p0vVFXlkRUeU3FGCS
	dXtFV7e7DzneGgNEII4WmPI1Jf0y4ULcmRlahkqnWVkwEfCL9Jh4Zs+ImnI8DS3Qkqr+
	BVbxNq4Np7ShAfnvJ1tWrOI1onjhV+UjhoRKA70KUjYAiwJCm/Wm5GelHu+Z37MY2GlR
	J6X2aWMuj+UXSXQgr5TZ2omB1KP0+zKeD+NEXcwqHpq+bFSEEFdRrdxnFVlsGM43oUKw
	4K+vYKF7lQ8mzi7HlGcxKaD4Mj5a8Ihn2H12AzWSIBfAJIEH3UMMHbSX0DOvgZ48aXZl
	+a4A==
MIME-Version: 1.0
X-Received: by 10.182.118.129 with SMTP id km1mr24856141obb.15.1374583596148; 
	Tue, 23 Jul 2013 05:46:36 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.60.166 with HTTP; Tue, 23 Jul 2013 05:46:36 -0700 (PDT)
In-Reply-To: <5249302.LRk1iTvfYM@helios>
References: <1373043676-5621-1-git-send-email-otavio@ossystems.com.br>
	<3799962.PMtSgBuqpH@helios>
	<CAP9ODKpz26sbQfot2mJJR8VDoLDQuMw=TzJg4Zmrut2imacpfg@mail.gmail.com>
	<5249302.LRk1iTvfYM@helios>
Date: Tue, 23 Jul 2013 09:46:36 -0300
X-Google-Sender-Auth: v3v6QCdIFRKPrq5xAVcit0cXzXg
Message-ID: <CAP9ODKoM6TGuwfAsJOJSZr+9xqGOMHmHF069ydmxX4a66L6CeA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	=?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
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
X-List-Received-Date: Tue, 23 Jul 2013 12:46:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2013 at 9:41 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Tuesday 23 July 2013 09:09:37 Otavio Salvador wrote:
>> On Tue, Jul 23, 2013 at 6:44 AM, Paul Eggleton
>>
>> <paul.eggleton@linux.intel.com> wrote:
>> > On Monday 08 July 2013 13:35:21 Paul Eggleton wrote:
>> >> On Friday 05 July 2013 19:45:25 Eric B=E9nard wrote:
>> >> > Le Fri, 05 Jul 2013 18:29:04 +0100,
>> >> >
>> >> > Paul Eggleton <paul.eggleton@linux.intel.com> a =E9crit :
>> >> > > Could someone *please* figure out what this bbappend is needed fo=
r
>> >> > > and
>> >> > > get
>> >> > > it into OE-Core if it is still needed so we can drop it here?
>> >> >
>> >> > it's only here to install /etc/default/busybox-syslog which contain=
s
>> >> > only one line : OPTIONS=3D"-C64" which sets the size of the logbuff=
er.
>> >> > So obviously this could go into OE-Core.
>> >>
>> >> Yes but why is this needed? If we are to merge this into OE-Core we'l=
l
>> >> need
>> >> to say why this change is needed in the commit message.
>> >
>> > ping...
>>
>> I am working in something else so I cannot work on busybox now. Feel
>> free to handle this.
>>
>> The syslog support would be good to be kept.
>
> The problem is it's not clear to me what we should do here. Surely having=
 this
> bbappend or not isn't the determining factor in whether we have syslog su=
pport
> with systemd...?

With systemd we shouldn't provide it but for sysv we should provide it.

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

