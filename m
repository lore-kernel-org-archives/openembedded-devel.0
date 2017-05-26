Return-Path: <marek.belisko@gmail.com>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1EED078251
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 May 2017 06:07:53 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id m18so919813lfj.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 May 2017 23:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UqFbwJoZJVMu4e5Yga1FjGSZyuepBO3a6pEgsOFd92A=;
	b=pxjOCHoRQ0P0Jf26t6py1RzOOFpRuYrlQdjJm6cNnlF4ozoPMxrjQnL4DmmdxBlpEa
	cCp25BJHBTQMFLF90z8QNMKyza38ldEi8QxivepqKRPJRa+TBBrYTSNIWr4AJQPr9WNR
	NytNU7LN6myIVLbg+3h0U42Pob7nnPrQutaJN92n2EkkvOceVswG0yty3FZGF1lk2v+h
	Jq3oHPw2FZPUsunkFTA7WoC6SnVedSXj5N3xmnqXdj16QU3Xh2Q+5xWEeorT1GYuPqwM
	eCPsQx0/QaK1NsrY+Uy/y+1cSl33BJz0tRqlkIixJmlnOrACZu+WzqBdl1aRcoqXJkRe
	LVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UqFbwJoZJVMu4e5Yga1FjGSZyuepBO3a6pEgsOFd92A=;
	b=j1u5P6kz1kxpb+OIe5VGKn4l7za2PZqJgyCCNWmWCheH1hBGiNnTopseKSvHMyNHdS
	O72NHCQVrHx6HoG95MrFjbae/Ck1fOjiz4928XCJemoPRg/gb2biA1sUeRXk4mG6gtza
	piG/bRhZ5H+4ifBbgaryp4ResGiS2U2zEtvyAuQr80nHNowCkJeCsWHU5v7TIqY9+l0y
	C04sRfNyasQX7Rt83+M2iYYgCiiARXzeffqwsWUfg1o4qjBFTu2oq6gT6OrDuksofY+i
	sj1QJ1kHAujSYfKfUMkSQQIy5XESQT2XYJJ9noyEYvy2Bzgg3mIWZ0Nqp93knwINdeLq
	xGTw==
X-Gm-Message-State: AODbwcCGkJfwa0//bgh4GjOH8svNWOpCInMTXFXogcbBGVElAB2EJe/E
	43/32XlLHl38teiFpflGNtIiB74o2g==
X-Received: by 10.46.88.89 with SMTP id x25mr120741ljd.4.1495778874600; Thu,
	25 May 2017 23:07:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.141.202 with HTTP; Thu, 25 May 2017 23:07:54 -0700 (PDT)
In-Reply-To: <CAC+thW0NcmnQXvyfEYHxY=Ko2S69cUEnc2rQd2aDk0RnnMMdPw@mail.gmail.com>
References: <alpine.LFD.2.20.1705250847490.19265@localhost.localdomain>
	<CAAfyv3517VgOHsPWRRHs2vdTr3hBt-dp+u=UGmwHZ+jdNh3sMw@mail.gmail.com>
	<alpine.LFD.2.20.1705251637150.5533@localhost.localdomain>
	<CAAfyv34V=J2dHaF35QUFASGP=-QWS8V8zj_Oe4cv7CKWpx6SZw@mail.gmail.com>
	<CAC+thW0NcmnQXvyfEYHxY=Ko2S69cUEnc2rQd2aDk0RnnMMdPw@mail.gmail.com>
From: Belisko Marek <marek.belisko@gmail.com>
Date: Fri, 26 May 2017 08:07:54 +0200
Message-ID: <CAAfyv34HE8niva2Z4NBiqa_XYncwx1P3=CtVn3+PGQd+e+KOQw@mail.gmail.com>
To: Andrea Galbusera <gizero@gmail.com>
Cc: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: Re: is there a reason meta-openembedded/meta contains a lonely libgpiod.bb recipe?
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
X-List-Received-Date: Fri, 26 May 2017 06:07:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 26, 2017 at 8:04 AM, Andrea Galbusera <gizero@gmail.com> wrote:
>
>
> On Thu, May 25, 2017 at 10:44 PM, Belisko Marek <marek.belisko@gmail.com>
> wrote:
>>
>> Hi Robert,
>>
>> On Thu, May 25, 2017 at 10:38 PM, Robert P. J. Day
>> <rpjday@crashcourse.ca> wrote:
>> > On Thu, 25 May 2017, Belisko Marek wrote:
>> >
>> >> On Thu, May 25, 2017 at 9:10 PM, Robert P. J. Day
>> >> <rpjday@crashcourse.ca> wrote:
>> >> >
>> >> >   is there some rationale for libgpiod.bb to be the lone recipe
>> >> > under meta-openembedded/meta? would that recipe not fit into some
>> >> > other layer?
>> >
>> >> I posted few days ago recipe for libgpiod. Please look at:
>> >>
>> >> http://lists.openembedded.org/pipermail/openembedded-devel/2017-May/112810.html
>> >
>> >   but that doesn't really answer the question as to why that recipe
>> > went into meta-openembedded/meta and not meta-openembedded/meta-oe.
>> > even the subject refers to "meta-oe", so why was that recipe placed in
>> > a directory named "meta"? was that perhaps a typo?
>> Yes probably type. First version of patch was placed in meta-oe. My
>> bad. I'll fix that but didn't get any feedback on patch yet. Thanks.
>
>
> Your patch was already merged with the 'suspicious' path. I'd suggest
> sending a new patch that moves it under meta-oe/.
Hmm thanks. I wasn't  aware of that that it was already merged. Thanks
I'll post updated version.


BR,

marek


-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com

