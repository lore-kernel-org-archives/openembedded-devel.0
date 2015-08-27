Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 496C960043
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 10:49:27 +0000 (UTC)
Received: by iodv127 with SMTP id v127so52057594iod.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 03:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=H9MjFFchyR4WQQ0rjw6z8Bc5fD+lBrqfAnC2wiroB9U=;
	b=RQpOFgBSNWdvpDPNUpc9LaHuikrrnUqJm6zYqlmW3R0PdWtnD7ddXu9vyYdlvo6Nj5
	/sTf/kKTEudcznrppLtovV2OEquJLVyP0Z4443yHiOUGe4JQiT8TDjuGnf0Mvq6B3DG5
	JzqQK/+l8ya6wvcWWOqusbc0wit94/AqLNm060/tP7xk/YhyjvmsEyyXWSUtSocCBHvc
	nX43spnczsBsRzIFv2kf2gOlQjIgfeUea/IMj02FRowuRJwUhsH5gl9rI/AeodjpeAQC
	liMLUsxBGFeKJ9VpCR6Zsf8iCVmoYrNusT28zhhIpUPyI2cnjouXIEO547jm4qSLR0M1
	eHnA==
MIME-Version: 1.0
X-Received: by 10.107.150.68 with SMTP id y65mr9932585iod.133.1440672567823;
	Thu, 27 Aug 2015 03:49:27 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Thu, 27 Aug 2015 03:49:27 -0700 (PDT)
In-Reply-To: <1721551.0sTJOXpHQ2@peggleto-mobl.ger.corp.intel.com>
References: <1440583622-11664-1-git-send-email-alexander.kanavin@linux.intel.com>
	<55DD9BFE.6050807@linux.intel.com>
	<CALbNGRR_j3f-KzA4iPQsdGsYe_VcqZYhhGBZ-8+FiHHRuwiDbA@mail.gmail.com>
	<1721551.0sTJOXpHQ2@peggleto-mobl.ger.corp.intel.com>
Date: Thu, 27 Aug 2015 12:49:27 +0200
Message-ID: <CALbNGRTyXco+x4NrbQkNSV6F+aA42r_8ZycgfBKPYuQcxyn6Kw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Tanu Kaskinen <tanuk@iki.fi>,
	Alexander Kanavin <alexander.kanavin@intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/3] libnotify3: remove the recipe
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
X-List-Received-Date: Thu, 27 Aug 2015 10:49:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2015 at 10:23 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Wednesday 26 August 2015 20:01:28 Andreas M=C3=BCller wrote:
>> On Wed, Aug 26, 2015 at 12:59 PM, Alexander Kanavin
>>
>> <alexander.kanavin@linux.intel.com> wrote:
>> > On 08/26/2015 01:40 PM, Tanu Kaskinen wrote:
>> >>>   # needs libnotify3 which conflicts with libnotify, mixing them in
>> >>>   build
>> >>>
>> >>> breaks couple of packages
>> >>
>> >> This last comment seems to be out of date after this patch.
>> >
>> > Actually, this whole thing can be removed:
>> >
>> > # needs libnotify3 which conflicts with libnotify, mixing them in buil=
d
>> > breaks couple of packages
>> > EXCLUDE_FROM_WORLD =3D "1"
>> >
>> > Whoever applies this patch, please amend it accordingly.
>> >
>> >
>> > Alex
>>
>> I think it's not that easy. We need an libnotify append here with some
>> RREPLACES / RPOVIDES for libnotify3. Right?
>
> I was wondering about that myself. Really those RREPLACES + RPROVIDES +
> RCONFLICTS need to go into the recipe in OE-Core though.
>
> Cheers,
> Paul
>
Sorry to insist: I think it should be appended here: Users without
meta-gnome in their layers have never seen libnotify3.

Andreas

