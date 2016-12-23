Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id E49FA7722B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2016 16:04:10 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1482509051; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=x844K2kRuYkFpPhEFBeXH9MFpWeGVhfQLTwehEGoO+Y=;
	b=KryNHEnulrzocMJFz+T5kAl8fDi7gKM0954E5O2SQ7jflKpCYwZLqr+2twKYdd2Cf4vucWnY
	7Lr1L4rI7oDn/FFF3Xan0M6ttYBMYwBQfCAV/tifCQ9MDtZgEQGvJRuULmU6nKeZ+m0pqYvE
	FfsW8t5pR7ndNNiuKDU1xcm6oNA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Cc: Content-Type;
	b=SganNIexguTbDnpTqgULmzkGcxaZuHXlW0LgePRQ1+z78bfAUr5xYVuzo5wP6lnZ3vp7dw
	f5W7p0ht3LyDO0Kck7SOvmKcq9qWk3e8jcdOGmmg5qakhzP7zQwfpMkvKPFZeyLFz+psUZt6
	Jr15vmHRBaXn7oV4lO4g7V8qumuqw=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mxa.mailgun.org with ESMTP id 585d4afb.7f0140e98ab0-smtp-out-n03;
	Fri, 23 Dec 2016 16:04:11 -0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id n85so23207604ioi.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2016 08:04:11 -0800 (PST)
X-Gm-Message-State: AIkVDXI9gxYa0UzKn8ItD41aLjMBoIDgrvAchah09KAxzdKXzQm+boJP227BOjWpPjVaa1+FOgu54iXDMEmRIQ==
X-Received: by 10.107.137.233 with SMTP id t102mr9391179ioi.233.1482509050889; 
	Fri, 23 Dec 2016 08:04:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.191.2 with HTTP; Fri, 23 Dec 2016 08:04:10 -0800 (PST)
In-Reply-To: <CA+chaQeJ_YTOc3xjSKr=_yoafO-=U2mAxQnxRrd02hjT6YhH2w@mail.gmail.com>
References: <1482357220-422-1-git-send-email-mark.asselstine@windriver.com>
	<CABcZANmtther94ZrkEwVn=JYgvLkT2CdTkCLSJPDo7gEHFdaCA@mail.gmail.com>
	<be954776-5d12-dbfb-c782-3f58f1d13361@windriver.com>
	<CAPuovELANjs1goqXCb3RBSKLcwV3PLT+KqokjDxRGdXnEFp=kg@mail.gmail.com>
	<CA+chaQeJ_YTOc3xjSKr=_yoafO-=U2mAxQnxRrd02hjT6YhH2w@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Fri, 23 Dec 2016 11:04:10 -0500
X-Gmail-Original-Message-ID: <CADNbA1rKM35TzdhXLrwiARRQxQ4p93Ck6oBSR9awjnU6C-524Q@mail.gmail.com>
Message-ID: <CADNbA1rKM35TzdhXLrwiARRQxQ4p93Ck6oBSR9awjnU6C-524Q@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Fri, 23 Dec 2016 16:04:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

It seems like we could always pull out of
http://archive.apache.org/dist/httpd
<http://archive.apache.org/dist/httpd/httpd-$%7BPV> in this case and avoid
the maintenance headache Martin is alluding to.

On Fri, Dec 23, 2016 at 10:59 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Your original change was already supersedded by the upgrade sent by someo=
ne
> else.
>
> On Fri, Dec 23, 2016 at 4:56 PM, M. Asselstine <asselsm@mcmaster.ca>
> wrote:
>
> > On Fri, Dec 23, 2016 at 10:51 AM, Mark Hatle <mark.hatle@windriver.com>
> > wrote:
> > > On 12/21/16 4:26 PM, Christopher Larson wrote:
> > >> On Wed, Dec 21, 2016 at 2:53 PM, Mark Asselstine <
> > >> mark.asselstine@windriver.com> wrote:
> > >>
> > >>> This release of apache2 is no longer found in the main downloads ar=
ea
> > >>> but has been moved to the 'archives'. We should uprev apache2 but f=
or
> > >>> now this will at least get the builds working again.
> > >>>
> > >>> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > >>>
> > >>
> > >> Wouldn=E2=80=99t it make sense to do a recipe-local addition to MIRR=
ORS to
> > >> automatically fall back to the apache archive?
> > >>
> > >
> > > That seems wrong to me.  The recipe should point to the proper upstre=
am
> > location
> > > for the archive.  If the archive moves, then the recipe should be
> > updated to match.
> > >
> > > I know you can easily do local workarounds for mirrors and such, but =
I
> > wouldn't
> > > consider putting them into a recipe directly as a good approach as it
> > will hide
> > > problems from people and make it unclear where the official download
> > location is.
> > >
> > > --Mark
> >
> > Agreed. I also think that the concept is a bad one as if our apache2
> > recipe is so far behind that the upstream has moved it to archived
> > that things should break just to give us a kick in the pants to get on
> > top of things and complete and uprev. So rather than mess around to
> > paper this over I hope my original change can be merged to allow
> > builds to complete and I will look to getting a review out for an
> > uprev after the holidays.
> >
> > MarkA
> >
> >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

