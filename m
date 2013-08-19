Return-Path: <raj.khem@gmail.com>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by mail.openembedded.org (Postfix) with ESMTP id E7DD46010E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Aug 2013 06:38:42 +0000 (UTC)
Received: by mail-oa0-f41.google.com with SMTP id j6so5373072oag.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2013 23:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=E6l5nxmFoehZynihetPiFUBE5nUFcxvbhg7TEKbv9/M=;
	b=YGhzFZnYDUtiTa0nq+7fEjmUusPAy1HTE52qu7uOhiJLJY0Gjj1KXexeBIzq0taDYj
	l8GcO36+3hzGMf15gBB/5yFhwKhlIj6CvycMZSkG+HWDR1AaBuV+83aeRd38bJQiNT08
	hXIkzyLkLstaRcayLZkospF+/38FnpekUQh9oFNbFIFH4olbioId+qU5n18xaC+Ousci
	cGGKWEgAIWlVB18+tDj0c/R+PH91LksFKvOryzdJNc6gaS5Hj3VeRDv+iO6793PBf98B
	1X3vGJpwOfi7wrIHRuuHcl55/OWz9iJNhuht0zPLGykVbBId4Ug2MSY3zlZ1p6YKQtzf
	A/KA==
X-Received: by 10.50.36.5 with SMTP id m5mr352765igj.3.1376894323014; Sun, 18
	Aug 2013 23:38:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.216.195 with HTTP; Sun, 18 Aug 2013 23:38:12 -0700 (PDT)
In-Reply-To: <20130819063500.GC3573@jama>
References: <1375853946-4583-1-git-send-email-raj.khem@gmail.com>
	<CAMKF1sqEn0EOz7f-Vu4+W=PNHdZ60d8Dz_g5YUVgz=Qf4wj=2Q@mail.gmail.com>
	<20130819063500.GC3573@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 Aug 2013 23:38:12 -0700
Message-ID: <CAMKF1spXgFah4jzVc3gkZuxN4M4Oi5JLfukeOcLM7KBJxWcngQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] proxy-libintl: rprovide the gettext packages
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
X-List-Received-Date: Mon, 19 Aug 2013 06:38:43 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 18, 2013 at 11:35 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, Aug 13, 2013 at 06:43:22PM -0700, Khem Raj wrote:
>> ignore this one please. I have a different one that fixes the problem
>> coming out shortly.
>
> I'm sorry, I was a bit blind when checking patches to merge last week
> and somehow I've missed this reply, should I revert it or can you send
> follow-up quickly?

its ok. No worries. It does not break anything. I will send a followup soon

>
>> On Tue, Aug 6, 2013 at 10:39 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> > This helps in stubbing out gettext when proxy-libintl is chosen
>> > usually on small/uclibc based images
>> >
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > ---
>> >  .../proxy-libintl/proxy-libintl_20100902.bb        |    2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bbb/meta-oe/recipes-core/proxy-libintl/
>> > proxy-libintl_20100902.bb
>> > index e1531dd..0c652b6 100644
>> > --- a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
>> > +++ b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
>> > @@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =
>> > "file://src/proxy-libintl/COPYING.LIB.txt;md5=bc400bc21422f9a
>> >
>> >  PR = "r1"
>> >  PROVIDES = "virtual/libintl virtual/gettext"
>> > +RPROVIDES_${PN} += "gettext"
>> > +RPROVIDES_${PN}-dev += "gettext-dev"
>> >
>> >  SRC_URI = " \
>> >
>> > http://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/${PN}-dev_${PV}_win32.zip\
>> > --
>> > 1.7.9.5
>> >
>> >
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

