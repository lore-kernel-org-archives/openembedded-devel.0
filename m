Received: from qw-out-1920.google.com ([74.125.92.148])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NzAjd-0005cn-Rm
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Apr 2010 17:30:41 +0200
Received: by qw-out-1920.google.com with SMTP id 4so1561897qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Apr 2010 08:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:received:message-id
	:subject:to:content-type;
	bh=8nAjE1wmRfv6luq5XYfU16lDDpN0iCLWofuovCVR9Yg=;
	b=vXOyDrLyuzlwTTHdkl5/iUztFPm7AW1tgB1aSBJrwbaGmK91NcBVErdZEFSjrkhf7w
	VHSe1oWQ9yjbCJhCoDvMwSH6y0jt0sY9nhoaWzqWP/0ANjuabdyIn2+u6t05fI/S++9d
	tOrhqAtdMTjDUEHO/BHjuobuX9ZkkntVFn6kA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=U+02fHTg9IfUcbJrjKOK6xT7WE7DEShU7H66bD1SQg6h4p76cm8MBBpXQ7mBb/sq8t
	wluDFJEbcSPaXF5zJyNTrgLXLMZfS5hQXTyXA1pibyYz3eLd4u1NQX0Gg+xy5JMv0ay3
	WpiDd9mTLbrvuODscnb0On2YeF5jIwHFhpK9s=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.232.131 with HTTP; Tue, 6 Apr 2010 08:25:11 -0700 (PDT)
In-Reply-To: <1270566559.3340.9.camel@trini-m4400>
References: <E1NxKhE-0007AF-AE@melo.openembedded.org>
	<1270160485.6277.143.camel@trini-m4400> 
	<1270564528.9623.19.camel@localhost.localdomain>
	<1270566559.3340.9.camel@trini-m4400>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 6 Apr 2010 08:25:11 -0700
X-Google-Sender-Auth: bb43a37c02c7c86f
Received: by 10.229.214.7 with SMTP id gy7mr9194321qcb.12.1270567636416; Tue, 
	06 Apr 2010 08:27:16 -0700 (PDT)
Message-ID: <w2kb6ebd0a51004060825yc9696da3z4076cf2acf6112e9@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.148
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [oe-commits] Joshua Lock : packaged-staging: enhancements from Poky for fetching and relocatability
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
X-List-Received-Date: Tue, 06 Apr 2010 15:31:00 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 6, 2010 at 8:09 AM, Tom Rini <tom_rini@mentor.com> wrote:

> On Tue, 2010-04-06 at 15:35 +0100, Joshua Lock wrote:
> > On Thu, 2010-04-01 at 15:21 -0700, Tom Rini wrote:
> > > On Thu, 2010-04-01 at 13:44 +0000, git version control wrote:
> > > > Module: openembedded.git
> > > > Branch: rpurdie/work-in-progress
> > > > Commit: ccbb586b3cfdc723ccad73dd71d85f6d41f0e6a3
> > > > URL:
> http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=ccbb586b3cfdc723ccad73dd71d85f6d41f0e6a3
> > > >
> > > > Author: Joshua Lock <josh@linux.intel.com>
> > > > Date:   Wed Mar 31 11:22:02 2010 +0100
> > > >
> > > > packaged-staging: enhancements from Poky for fetching and
> relocatability
> > >
> > > Question.  Do we really want to rename DEPLOY_DIR_PSTAGE to PSTAGE_DIR.
> > > Is that really a nomenclature change like that?  I see it's still soft
> > > assign so outsideof TMPDIR can work still, so it's fine otherwise.
>  Just
> > > checking.
> > >
> >
> > I changed the name because we now have two pstage directories and wanted
> > the change to be apparent and I dropped the DEPLOY_ prefix as I moved
> > the default location outside of the deploy dir.
> >
> > Does that seem reasonable?
>
> I think so, but I must be missing something.  Are you talking about the
> dir where we assemble packages as the 2nd one?  Or something else?
> Haven't made my coffee yet today...


I haven't looked at the patches in a while, but from what I recall, he
splits the dir where the pstage .ipk files go from the rest of the files
that cluttered up DEPLOY_DIR_PSTAGE.  I could be remembering incorrectly, of
course (do that a *lot* :).
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

