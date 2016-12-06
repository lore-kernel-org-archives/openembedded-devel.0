Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f177.google.com (mail-ua0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id EBB626011B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Dec 2016 10:26:49 +0000 (UTC)
Received: by mail-ua0-f177.google.com with SMTP id b35so376369728uaa.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2016 02:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=zJ8t+47+WuCBSjEhjuABDx9RSk+PTo9mL25HRD+wfrw=;
	b=LeSULV96lb6QJ2UBlkYBVwFazH2Z+EKbeA6Zx7YAsa+KjvlJz8RlH7haV7c48Cg5he
	221NhaXnLEhUu4XWNQzMvyUxFhPS3ZFRGE2QnHKzb+6CzgbqXqoiCfc75GduTF+mLUm1
	pymvGVqNs8y2ekZvs7t9o3lfzVAuRd9DkU6o5LYLPQ6yQippDq4ZN3F4/3HrKmfoJnUU
	gHpTPLXd3HP01+82JLPb8v+1SGjRaM9qp95EW7rquHYhBPAYvhJ5mLUgpGjTKyMZDsDZ
	R9GnDb4bWVFm5Cz9Kl+yCAmBYZ0/9ykJF3u+S3361HU14Y6ykysPtTu5Dpj/9DPK2BmY
	7cmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=zJ8t+47+WuCBSjEhjuABDx9RSk+PTo9mL25HRD+wfrw=;
	b=H451rz8i7kYHclnxEBWMbwQBMRIzz6OQVYYG0R3wgGreELa0xL0INgzCDZ8Jw2Elk7
	Le78YK1LTzr22Wh1g3vOsoj3loTV9u4rkF8JesioT1KnD17UhYH6P+zrvdYO9wdoWNbq
	0WL3XbhcEtCWd6/BK2oHyn9GhycM4eLXagmxw25GZn8eqYYPfWYyi/xcCX3vjQSz8+Z4
	Mc7NZvYRzxY3sqyLw1S/dSvJodpFa2WnxK0gB5G54up4dIrgNcxiaGuJHNSTY4HgE6zo
	soivcZIkHSnzkCgqnjUpFCd7mWMBzct0sDPGl79i/O6O4EaG7vy/9RKnXy8AwwnFvJAm
	wlTw==
X-Gm-Message-State: AKaTC01Oz17hDDwutmZjdtt/0qViJy2jlM4WlpaJ5NesDA3JYATuAMII6EcX8haEJTy/UrQV5V5XWSNctu4mow==
X-Received: by 10.176.5.130 with SMTP id e2mr48534323uae.108.1481020010777;
	Tue, 06 Dec 2016 02:26:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.85.157 with HTTP; Tue, 6 Dec 2016 02:26:50 -0800 (PST)
In-Reply-To: <CAMKF1sqjjTooJzi_8hknVNj_OaYAFcOcsL8QZVSw-zOSuwdoFg@mail.gmail.com>
References: <1480979306-21331-1-git-send-email-schnitzeltony@googlemail.com>
	<689CB891-7D18-4FEB-9BE5-DF2CD80B066E@gmail.com>
	<CALbNGRQLu7rhbQP9S0MDBVLdbCPbCybu_nqu++yZpD2fSbn6=g@mail.gmail.com>
	<CAMKF1sqjjTooJzi_8hknVNj_OaYAFcOcsL8QZVSw-zOSuwdoFg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 6 Dec 2016 11:26:50 +0100
Message-ID: <CALbNGRRx2gVVkugwtjGhX3ndThEDFY=y4Wm+odgCCxsV1xzsOA@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH 1/2] exo: fix build after perl update
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Dec 2016 10:26:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 6, 2016 at 1:26 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Ok
>
> On Dec 5, 2016 3:59 PM, "Andreas M=C3=BCller" <schnitzeltony@googlemail.c=
om>
> wrote:
>
>> On Tue, Dec 6, 2016 at 12:32 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> >> On Dec 5, 2016, at 3:08 PM, Andreas M=C3=BCller <
>> schnitzeltony@googlemail.com> wrote:
>> >>
>> >> fixes:
>> >>
>> >> | checking for perl5... no
>> >> | checking for perl... perl
>> >> | checking for perl module URI::Escape... no
>> >> | checking for perl module URI::file... no
>> >> | checking for perl module URI::URL... no
>> >> | configure: error: Atleast one of the required Perl modules
>> (URI::Escape, URI::file and URI::URL) was not found on your system
>> >>
>> >
>> > I was seeing same errors. Should this be using native perl instead ?
>> For exo case I think we already do: The only 'perlish' is
>> liburi-perl-native in DEPENDS and perlnative in inherit
>>
>> Andreas
Please forget this series. Root cause for configure failure is broken
liburi-perl-native caused by perl update. I will send out an update of
liburi-perl-native to oe-core and V2 here

Andreas

