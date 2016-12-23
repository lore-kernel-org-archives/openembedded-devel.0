Return-Path: <asselsm@gmail.com>
Received: from mail-yb0-f174.google.com (mail-yb0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 391C177230
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2016 16:17:18 +0000 (UTC)
Received: by mail-yb0-f174.google.com with SMTP id d59so89942578ybi.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2016 08:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=wuLCKKVxQBthoz6s3kdjbEhnmlhmHi+GdoT0dnKVxts=;
	b=i0rD5ePvIPvd5/P1xjeZcFG+YQdZwXRV+jWVn02F/kJtPQQJRfzfL4ia8t/7nwHzBf
	f7jT4/wx7gPp56xex4qT2WqI/c6nTQ9HZEuy2ie9Gq7UhdTjOl37qhg4/WZDIHehUo6S
	4us5zpHWs9PNl7gS71fh4Mht6oJDDUojJRAmQNBP/xcXtnx3UtkKQQzh3TfvaLXYV93S
	tGZyo4CG1cxZ0KmK0Uflo6XhW12mJI9IRhH/YzhJlHXYvPNILQOmScGQOUsZ1tvQ/0L9
	jpRqf+Ao/cWLf/4IPDZYM6+kbVsfFoXbDSaB0Ik4SrUWFrOIkPZ2ZYsjPH3w18k5gjXl
	W3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=wuLCKKVxQBthoz6s3kdjbEhnmlhmHi+GdoT0dnKVxts=;
	b=SzIf9xus+Vr0iX/jDfqdagzWsYzhasphzkjX1awwFTL4mlcGIl2QWevVjmoDVOywI7
	hC7kJLE+Wc0LAk8HphQRQ6cmc+05vWOBYrdycVYYREciHNZyQ7Um8793mBOUZDKjUSIC
	HQgoUkC0cJ919YAWFTTy7xw/cOL6ggPoNKAFPMFjt5uSgzm2L8MVs/7QMK7+rucZy6ZX
	Uh5DcLGkm+6+2eDvDTPkNTWn9zJ8QjOXDvmbeth7XaMtPfNAFloq0HWMFZFkFi7Xipgt
	IVlIlx74GkEHQ5AOmHkwy2lGmtxurn5dBxVXpoEiDFjphxSDRwNDIiLRkYC86wzWps2x
	8Tpg==
X-Gm-Message-State: AIkVDXJgxvIes1dVOdpci3RD0ioakYZLd4ydOYD2C0nkZ6U7hjOmo3EpNIDtbZDuh+XdtpnyOh3tLe2BJPWu2Q==
X-Received: by 10.37.119.146 with SMTP id s140mr4103824ybc.173.1482509839950; 
	Fri, 23 Dec 2016 08:17:19 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.171.82 with HTTP; Fri, 23 Dec 2016 08:17:19 -0800 (PST)
In-Reply-To: <CADNbA1rKM35TzdhXLrwiARRQxQ4p93Ck6oBSR9awjnU6C-524Q@mail.gmail.com>
References: <1482357220-422-1-git-send-email-mark.asselstine@windriver.com>
	<CABcZANmtther94ZrkEwVn=JYgvLkT2CdTkCLSJPDo7gEHFdaCA@mail.gmail.com>
	<be954776-5d12-dbfb-c782-3f58f1d13361@windriver.com>
	<CAPuovELANjs1goqXCb3RBSKLcwV3PLT+KqokjDxRGdXnEFp=kg@mail.gmail.com>
	<CA+chaQeJ_YTOc3xjSKr=_yoafO-=U2mAxQnxRrd02hjT6YhH2w@mail.gmail.com>
	<CADNbA1rKM35TzdhXLrwiARRQxQ4p93Ck6oBSR9awjnU6C-524Q@mail.gmail.com>
From: "M. Asselstine" <asselsm@mcmaster.ca>
Date: Fri, 23 Dec 2016 11:17:19 -0500
X-Google-Sender-Auth: 0HAqZ8HS9-n0x7Fl7sfKzibSaQk
Message-ID: <CAPuovE+o7ac3gd67rTpUfHgsmQKj8s4mXdGkJ9C2+5P_2Senug@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "paul.eggleton@linux.intel.com" <paul.eggleton@linux.intel.com>
Subject: Re: [meta-webserver][PATCH] apache2: the download has been moved to the 'archives'
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
X-List-Received-Date: Fri, 23 Dec 2016 16:17:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 23, 2016 at 11:04 AM, Derek Straka <derek@asterius.io> wrote:
> It seems like we could always pull out of
> http://archive.apache.org/dist/httpd
> <http://archive.apache.org/dist/httpd/httpd-$%7BPV> in this case and avoi=
d
> the maintenance headache Martin is alluding to.

Sounds good. I see your uprev RR so all is fine with me, glad to see
this corrected, on to other distractions.

Thanks,
MarkA


>
> On Fri, Dec 23, 2016 at 10:59 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> Your original change was already supersedded by the upgrade sent by some=
one
>> else.
>>
>> On Fri, Dec 23, 2016 at 4:56 PM, M. Asselstine <asselsm@mcmaster.ca>
>> wrote:
>>
>> > On Fri, Dec 23, 2016 at 10:51 AM, Mark Hatle <mark.hatle@windriver.com=
>
>> > wrote:
>> > > On 12/21/16 4:26 PM, Christopher Larson wrote:
>> > >> On Wed, Dec 21, 2016 at 2:53 PM, Mark Asselstine <
>> > >> mark.asselstine@windriver.com> wrote:
>> > >>
>> > >>> This release of apache2 is no longer found in the main downloads a=
rea
>> > >>> but has been moved to the 'archives'. We should uprev apache2 but =
for
>> > >>> now this will at least get the builds working again.
>> > >>>
>> > >>> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> > >>>
>> > >>
>> > >> Wouldn=E2=80=99t it make sense to do a recipe-local addition to MIR=
RORS to
>> > >> automatically fall back to the apache archive?
>> > >>
>> > >
>> > > That seems wrong to me.  The recipe should point to the proper upstr=
eam
>> > location
>> > > for the archive.  If the archive moves, then the recipe should be
>> > updated to match.
>> > >
>> > > I know you can easily do local workarounds for mirrors and such, but=
 I
>> > wouldn't
>> > > consider putting them into a recipe directly as a good approach as i=
t
>> > will hide
>> > > problems from people and make it unclear where the official download
>> > location is.
>> > >
>> > > --Mark
>> >
>> > Agreed. I also think that the concept is a bad one as if our apache2
>> > recipe is so far behind that the upstream has moved it to archived
>> > that things should break just to give us a kick in the pants to get on
>> > top of things and complete and uprev. So rather than mess around to
>> > paper this over I hope my original change can be merged to allow
>> > builds to complete and I will look to getting a review out for an
>> > uprev after the holidays.
>> >
>> > MarkA
>> >
>> >
>> > > --
>> > > _______________________________________________
>> > > Openembedded-devel mailing list
>> > > Openembedded-devel@lists.openembedded.org
>> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

