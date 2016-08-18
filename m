Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id E85AA77028
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 18:09:09 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20160818180908784_0486
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 18:09:08 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-devel@lists.openembedded.org>
Received: from [174.114.62.25] (port=45348 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1baRmR-00051h-IQ for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2016 14:11:03 -0400
Date: Thu, 18 Aug 2016 14:09:00 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <10C3DF54-CD57-4E94-B989-E87C3122127D@gmail.com>
Message-ID: <alpine.LFD.2.20.1608181408250.25743@localhost.localdomain>
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
X-List-Received-Date: Thu, 18 Aug 2016 18:09:10 -0000
Content-Type: multipart/mixed; BOUNDARY="8323328-337258838-1471543741=:25743"

--8323328-337258838-1471543741=:25743
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

  since i did that more than once, i'll resubmit those patches. if i'm
going to be annoyingly nitpicky, i might as well do it correctly.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-337258838-1471543741=:25743--
