Return-Path: <twoerner@gmail.com>
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id A8CA971A18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 17:00:39 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id l82so26295573ywc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 10:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=PP22/O9q4nosbOjTRxhapaLjvdLU+qgstYem6Y1sNk0=;
	b=Po8KWpb9pSrSTwAfPWO0luOkdJy0N7CHnBgHrvMqBtU0FJQHI/KpMfgJZTYoQpTL/o
	qwdXpUfMrV2h7B9Le1lKRfhhpxMfVvGNHeDA2Tvx5nWbvdGojwExk1qeKH+y8q5IjxNe
	OL1AAnfyRpIJQUIGnLuUe12UA4IEuzRL+s5vR7/u/GGgAmFF6ErtUuMavdRMu1tYtzA2
	0t6dsrch1JN+4oLZOeQIgK7sHbCyg38OytzdV12dW1Usnu74hl2EBMtp/qeljohtIi8V
	txSUg60iKazC5ghYW6CWGsKAYBNxWG9cXtIIaZ/mI/XtFipng+3rYmUBjMQ1JKxUNcvy
	Bu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=PP22/O9q4nosbOjTRxhapaLjvdLU+qgstYem6Y1sNk0=;
	b=Ezjfqkk5fTJ/x5E9oRhSbCsmOJXoAVNMUKqrSRRmpOoeUi3EY+wlR4Cb2GoIRuF+2x
	5Cnyy7sGbAmkig/qSl+S06M+t2TrdJJ0R2H3WEZJVElCg5mMwCVxH6XbYbtlSL3O8z+6
	utbyOqOlOMmXYypDOtwT1j4DOJZXO/cEddXJRnSouFdRX8RzNm6tEWdVMrS83J13pzEr
	AO7DggFvrrMlVnY8KDDjDZ4ph4renQv2AUMB224MThsBfj8N/qX+i5Z2FFWBJueXpdUD
	HwdJBUm6ZqB/rg7HmUEYGvhg2xWJfLqbFw30BGIzYDemZpm6IHxM2Vob0mzOiIoJL8Bi
	cN6w==
X-Gm-Message-State: AHYfb5hjA67NPHPJbYmQX/LX+wbRzzut3I1VPoEYgBMZCmE9AHokDpBn
	AiSRgPA0/42UTnZbkeWCO24jlC4URw==
X-Received: by 10.37.68.67 with SMTP id r64mr2003885yba.65.1502902840144; Wed,
	16 Aug 2017 10:00:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.66.151 with HTTP; Wed, 16 Aug 2017 10:00:39 -0700 (PDT)
In-Reply-To: <CALbNGRSMbrpZ+LMdRx1ZGAGbJHM3z8E8fT7oW2cNAE9+Sg-82A@mail.gmail.com>
References: <CALbNGRQWNNvf5kLxcWz7EvUK6CO5VMX43vMrPx28yOzCq5NV8g@mail.gmail.com>
	<CAHiDW_GuabOEPc6rgh-vV+f502A5dYi8wFVYhRzqcZBGYHzz9g@mail.gmail.com>
	<CAHiDW_HFgnLbvd64hR8yE107BLtkWcp3eb=mA8towH73pMbUZQ@mail.gmail.com>
	<CALbNGRQBRFeCuz5R10qhBHQGQ3hn7WO9i1SAZ5fV=4BqGepjrQ@mail.gmail.com>
	<CALbNGRT6v530xCdqLp3CRHKOtBZpg8JqYreOsUhFL5u-eV2O2A@mail.gmail.com>
	<CAP9ODKrwUkwdESj-qKrPjsKMN2=W-ZsYBb_+OYhbvrfgcoht2w@mail.gmail.com>
	<87wp65rnfk.fsf@rkubodac-desk.ger.corp.intel.com>
	<8d04fa9f-3049-45cf-4255-bd0159b84751@gmail.com>
	<87r2wcajh6.fsf@rkubodac-desk.ger.corp.intel.com>
	<CALbNGRS1ywFbSNAoY976cPgJ4STQLqUEqzwq34XGaMH_CYhAaw@mail.gmail.com>
	<20170816160609.GA29490@linux-uys3>
	<CA+chaQdPFsk3yJzCO7e=L+=OW=SP8hdg3kUytdj36daOpwqjww@mail.gmail.com>
	<CALbNGRSMbrpZ+LMdRx1ZGAGbJHM3z8E8fT7oW2cNAE9+Sg-82A@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 16 Aug 2017 13:00:39 -0400
Message-ID: <CAHUNapS=PyHpv+G03RvmgptLxkhTK5mZLxdw4bN3z82Fo6Kvig@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: chromium detected as stripped
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
X-List-Received-Date: Wed, 16 Aug 2017 17:00:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 16, 2017 at 12:18 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Wed, Aug 16, 2017 at 6:12 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>> I think nodejs fails because of openssl-1.1 like most of the failures fr=
om
>> last report.
>> http://errors.yoctoproject.org/Errors/Details/150582/
>>
>> it was building fine with gcc7 before openssl upgrade.
>>
>> Regards,
>>
> ^^Maybe I am wrong but isn't this the wrong thread?


I won't submit anything to meta-browser until I can build and get it
running on a target (or multiple targets). Currently I can't build
because of this error, therefore I don't think it's offtopic. Khem's
provided a potential work-around.

