Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id E515C78A91
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2018 14:23:27 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id y19-v6so7318107qto.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2018 07:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XykZYCzlEjLiecQHMu8Q7SFktoqeQAt06/9M7Dyl4nM=;
	b=YRZGM2sbKOxLHk0T4UHTDyYEm5ZnbXOtMvLSI3mn21xrh6HnlHsPOIaonxhqycGkxd
	4JFg70Io7yWU/WZZYKE7Xf+GsIa7lJF3lOD5sLu5coTkJE+SIcWMJkH785C1qCtu2Zcu
	IQSXv/+aucJtWtQKLlTva5Y8y2hVqzpxbOK+3mjOup7nJ7ITr9vsQmBHh/da9JIPu39D
	S7TkUBGxgzGFdD2ce0ObXsCoPFQt45mRApw4HIhar+EwPqpgSkREwrtJiRZcHLOiPKrt
	yPmq1uCkz2qbTwxxI2bRPoC2RTNJ3PCAIZ7U1gvRmyOwO9l8hOxCyaYQydcrvYr+263o
	xIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XykZYCzlEjLiecQHMu8Q7SFktoqeQAt06/9M7Dyl4nM=;
	b=ORuNJ6OeGDk7adxqaL5Y84ypAFyFkPOGphvHQ1cgI75byn783fdXv5W8OVEOl4oimT
	PYlgEOiEHvJWvopJhDVpekhOuJqQXyaFCRqaurLL9FSMCTz+c+q7Dnj4RADEXcxIENw3
	Wsfz8w/N4t+ie2qQ3fcIsR4lBfWBTjmOPoU+UJgIViz9Y+iN20SVA8uqS6q6hsLPY17c
	FLTteVlzwFgREjkM15DQ/bvqvfdlthtzjKIayXx1mwMBnlYtpwRJBGDVukYEDncf47ik
	CSzHFJfC12DjP3qlYDpP3nlz/u3zIMHPy8cujxCeIV3w6zUECC1Zx3kJotmoK+6Z4rZH
	MaNQ==
X-Gm-Message-State: AOUpUlG7p3FGKgP1I6fP2hoXpxu2bvOwZSUQ/Ui9fo1SZmJ0DmhRvspU
	nCqr5KA1AqOI537rZ/9thGDK6rTWlI+XzyKGDuM=
X-Google-Smtp-Source: AAOMgpfjf8IYJX+4kzJEbJvIIFsdjE+DtVjRHw+RzNKX+Sf1/i47CLnWkNlE5EXhEatJj5OLxdHXKSzuWuXNL3d/tSw=
X-Received: by 2002:ac8:70c5:: with SMTP id
	g5-v6mr9967625qtp.376.1532010208641; 
	Thu, 19 Jul 2018 07:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <1527446036-4930-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1B56A49860EB2D45ADE3731B15C959FD019455969C@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <1B56A49860EB2D45ADE3731B15C959FD019455969C@G08CNEXMBPEKD01.g08.fujitsu.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 Jul 2018 07:23:02 -0700
Message-ID: <CAMKF1sq5csd9-5OHfzumJtVQejxb7hx_4TKofATUMwwr4dKmPg@mail.gmail.com>
To: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] Fix confilct error in do_rootfs.
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
X-List-Received-Date: Thu, 19 Jul 2018 14:23:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 19, 2018 at 2:00 AM Lei, Maohui <leimaohui@cn.fujitsu.com> wrote:
>
> ping
>

can you rebase on latest master and resend ?

> > -----Original Message-----
> > From: Lei, Maohui
> > Sent: Monday, May 28, 2018 2:34 AM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Lei, Maohui
> > Subject: [oe] [meta-networking][PATCH] Fix confilct error in do_rootfs.
> >
> > Error: Transaction check error:
> >   file /usr/bin/mailq conflicts between attempted installs of esmtp-1.2-
> > r0.x86_64 and postfix-3.2.2-r0.x86_64
> >   file /usr/bin/newaliases conflicts between attempted installs of esmtp-1.2-
> > r0.x86_64 and postfix-3.2.2-r0.x86_64
> >
> > Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> > ---
> >  meta-networking/recipes-daemons/postfix/postfix.inc | 7 ++++---
> >  meta-networking/recipes-support/esmtp/esmtp_1.2.bb  | 6 +++---
> >  2 files changed, 7 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-
> > networking/recipes-daemons/postfix/postfix.inc
> > index 09447d5..a5e8618 100644
> > --- a/meta-networking/recipes-daemons/postfix/postfix.inc
> > +++ b/meta-networking/recipes-daemons/postfix/postfix.inc
> > @@ -219,9 +219,10 @@ do_install_append_class-target() {
> >      sed -i 's:-fdebug-prefix-map[^ ]*::g; s:--
> > sysroot=${STAGING_DIR_TARGET}::g' ${D}/etc/postfix/makedefs.out
> >  }
> >
> > -ALTERNATIVE_${PN} = "sendmail"
> > -ALTERNATIVE_TARGET[sendmail] = "${sbindir}/sendmail.postfix"
> > -ALTERNATIVE_LINK_NAME[sendmail] = "${sbindir}/sendmail"
> > +ALTERNATIVE_${PN} += "mailq newaliases"
> > +ALTERNATIVE_TARGET[mailq] = "${bindir}/mailq"
> > +ALTERNATIVE_TARGET[newaliases] = "${bindir}/newaliases"
> > +
> >  ALTERNATIVE_PRIORITY = "120"
> >
> >  ALTERNATIVE_${PN}-doc += "mailq.1 newaliases.1 sendmail.1"
> > diff --git a/meta-networking/recipes-support/esmtp/esmtp_1.2.bb b/meta-
> > networking/recipes-support/esmtp/esmtp_1.2.bb
> > index 2da73e7..9fb817b 100644
> > --- a/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
> > +++ b/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
> > @@ -18,10 +18,10 @@ EXTRA_OECONF = "--with-libesmtp=${STAGING_EXECPREFIXDIR}"
> >
> >  inherit autotools update-alternatives
> >
> > -ALTERNATIVE_${PN} = "sendmail"
> > +ALTERNATIVE_${PN} += "mailq newaliases"
> > +ALTERNATIVE_TARGET[mailq] = "${bindir}/mailq"
> > +ALTERNATIVE_TARGET[newaliases] = "${bindir}/newaliases"
> >
> > -ALTERNATIVE_LINK_NAME[sendmail] = "${sbindir}/sendmail"
> > -ALTERNATIVE_TARGET[sendmail] = "${bindir}/esmtp"
> >  ALTERNATIVE_PRIORITY = "10"
> >
> >  ALTERNATIVE_${PN}-doc += "mailq.1 newaliases.1 sendmail.1"
> > --
> > 1.9.1
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

