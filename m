Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OMoQG-0000rG-R8
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jun 2010 22:32:21 +0200
Received: by pvc30 with SMTP id 30so156592pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jun 2010 13:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=JheVTCiv1AjvebTDXqN8p4VQeaQBMIXHiR27RWUxwq0=;
	b=rKwM3Jz2JlROZjr5WVCuIy7pc5VbJQIVArlR84SK8PmjeSaTieCEZoGvnE4LTG86Xv
	3ntNGdXWUuk8KweSNa+FyGp6+8Tn06uMu87Fwub8/7spcfgdGnUiGxLvYOK2gcCS+zZQ
	ywzBs1qMLiozkmAOWSRKAKKT6S74yf03K/Vzg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=Tds2WSCjuwFLOCiCcX79W2SLJ2hEbbi0MJ4+AwoiTPLJ5aIw+N5axS6Rd59OOpQQy1
	XtlHYzDTdBtP423BTS6YNuAw2xJwOKrGvPYxMX9PITp3otgaDwjcCl4Ajk+fcev6R/gb
	PTX7anmOL50Ktwef0zq1cVKBAgP5/hm6WNCEQ=
Received: by 10.142.66.10 with SMTP id o10mr495158wfa.326.1276201676103; Thu, 
	10 Jun 2010 13:27:56 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.211.2 with HTTP; Thu, 10 Jun 2010 13:27:36 -0700 (PDT)
In-Reply-To: <1276201371.13179.20.camel@lenovo.internal.reciva.com>
References: <1276114963.4424.42.camel@lenovo.internal.reciva.com> 
	<1276199208-31929-2-git-send-email-rep.dot.nop@gmail.com> 
	<AANLkTin367SqiCodgs_CxGiwAihL-SI0nlCJKUWqUZjq@mail.gmail.com> 
	<1276201371.13179.20.camel@lenovo.internal.reciva.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 10 Jun 2010 13:27:36 -0700
X-Google-Sender-Auth: AYcZ9OiFYjjJw-ws5QHZMqQVFX8
Message-ID: <AANLkTinAFdiBJ6jN3WwY75KsNwTPmkyoOL0iTgJ8UPFC@mail.gmail.com>
To: Phil Blundell <philb@gnu.org>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] busybox: configure according to {MACHINE, DISTRO}_FEATURES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Jun 2010 20:32:21 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 10, 2010 at 1:22 PM, Phil Blundell <philb@gnu.org> wrote:

> On Thu, 2010-06-10 at 12:55 -0700, Chris Larson wrote:
> > Should this (ipv6 at least) use COMBINED_FEATURES, since it requires
> > kernel/machine support for it to be useful, along with distro support?
>
> I don't think it's machine dependent in any meaningful way; there is, to
> my knowledge, no OE-supported hardware which is actually incapable of
> supporting ipv6.  Any distro that wants to use it just needs to make
> sure that the kernel support is present (either built-in or as a module)
> on all the supported targets.  In any case, most packages will cope
> gracefully with ipv6 being selected on in the configuration and then
> found to be absent at runtime.
>
> If you start factoring MACHINE_FEATURES into that kind of decision then,
> logically, the package needs to have PACKAGE_ARCH=${MACHINE}.  I don't
> think it would be a very good thing to start forcing packages down that
> path unnecessarily.


Fair enough, that seems reasonable for this particular case.  Now that you
bring it up, we adjust package arch to machine when we use a machine
specific file:// file, but maybe we need to teach it to check for references
to MACHINE_FEATURES or COMBINED_FEATURES, somehow.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

