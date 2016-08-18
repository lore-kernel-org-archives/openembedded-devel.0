Return-Path: <rpjday@crashcourse.ca>
X-Greylist: delayed 607 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 18 Aug 2016 18:18:27 UTC
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id CD6BE77026
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 18:18:26 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20160818180819466_0685
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 11:08:19 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-devel@lists.openembedded.org>
Received: from [174.114.62.25] (port=45346 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1baRld-0004o0-KW for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2016 14:10:13 -0400
Date: Thu, 18 Aug 2016 14:08:06 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <10C3DF54-CD57-4E94-B989-E87C3122127D@gmail.com>
Message-ID: <alpine.LFD.2.20.1608181407420.25743@localhost.localdomain>
References: <alpine.LFD.2.20.1608180535210.16814@ca624034.mitel.com>
	<10C3DF54-CD57-4E94-B989-E87C3122127D@gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: Re: [PATCH] meta-oe: php, given "_append", remove superfluous "+="
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
X-List-Received-Date: Thu, 18 Aug 2016 18:18:28 -0000
Content-Type: multipart/mixed; BOUNDARY="8323328-794133172-1471543691=:25743"

--8323328-794133172-1471543691=:25743
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Thu, 18 Aug 2016, Khem Raj wrote:

>
> > On Aug 18, 2016, at 2:37 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> >  again, not compile-tested since it seems obvious
> >
> > diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
> > index ee7a143..23de2b1 100644
> > --- a/meta-oe/recipes-devtools/php/php.inc
> > +++ b/meta-oe/recipes-devtools/php/php.inc
> > @@ -15,7 +15,7 @@ SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
> >            file://0001-acinclude-use-pkgconfig-for-libxml2-config.patch \
> >           "
> >
> > -SRC_URI_append_class-target += " \
> > +SRC_URI_append_class-target = “ \
>
> nitpick: You do not need a space here since its already added after newline
>
> >             file://iconv.patch \
> >             file://imap-fix-autofoo.patch \
> >             file://pear-makefile.patch \
> >

  ah, quite so.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-794133172-1471543691=:25743--
