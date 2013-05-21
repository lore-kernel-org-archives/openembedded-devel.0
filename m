Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 692F160897
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2013 14:31:27 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id c13so1753671ieb.38
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2013 07:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=KcV9Z25ZHfYEBRIEZe56qcZZL+4pgbGKEZ+WOnBk7kI=;
	b=twzb5QNbzqaEpxoUuuqWujK105JP6Tjtyeqs5poHbSqyJa7CWKtOoHlKhPrUQpqWcv
	GTdJ+HkF+QC3FHgHnTFA9omI1b5mVjeBpVn4U8GdwfLKdjryZuhSH7XK8pjFAdD4NbEx
	ai/KwlXOjE+zkQNiIgRBHA5ZP2ZITzyVSbomISom6D92IeshOpwe/XWwt+nhYxXt/a8L
	cQ/Km8LEz8mzLhP0icqVi2EeRck5Jvw6MLt3fATdmhTPVoLmSqcb0LJUDBC/QS1ZmmwS
	xErDjg/rwRysD7V0TmCOrmpYsZoM58lQmbY14+I10aipTrEPASNG/GkhDCI13/3BZJWN
	xsbw==
X-Received: by 10.50.85.12 with SMTP id d12mr8306712igz.91.1369146688107; Tue,
	21 May 2013 07:31:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.109.133 with HTTP; Tue, 21 May 2013 07:30:58 -0700 (PDT)
In-Reply-To: <CALbNGRSri1rP7CXVEum_QYx2a7ArHuDUQDCwVVrtw2kwVAMDKA@mail.gmail.com>
References: <1368959233-28288-1-git-send-email-schnitzeltony@googlemail.com>
	<1368959233-28288-4-git-send-email-schnitzeltony@googlemail.com>
	<CAMKF1soZP1zxrEtopAdi6dTPuRcb5CMnSapgfOE8KCD5t6a-Ow@mail.gmail.com>
	<CALbNGRSri1rP7CXVEum_QYx2a7ArHuDUQDCwVVrtw2kwVAMDKA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 May 2013 07:30:58 -0700
Message-ID: <CAMKF1sq1C3vLr0OyWdHx+YWNbhsDC9TKOLTU2d348Q6po1GYsQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe++/master 03/11] glibmm: merge glibmm.inc into recipe - and stylize a bit
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
X-List-Received-Date: Tue, 21 May 2013 14:31:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2013 at 12:51 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Sun, May 19, 2013 at 9:58 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> Why merge inc ? Generally its helpful in writing recipes in other layers=
 we
>> can share common code
>>
> Before doing this I have checked: Nothing except glibmm itself
> includes glibmm.inc in the layers I use. So for me it looked like a
> remnant from classic oe where we had more than one version for many
> recipes. So if this code is not really shared I prefer clean recipes
> without includes. Do you have a use case for this include - then I
> should send V2.

I think this case looks ok if its lone case. Although keeping .incs do
have advantages.

>
> Andreas
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

