Received: from [209.85.146.182] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1JqcRT-0005aG-9r
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Apr 2008 01:07:27 +0200
Received: by wa-out-1112.google.com with SMTP id l24so7974418waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Apr 2008 16:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=NwsPG1tucB7G8djEV+jIBReyUtADikIRVt+J2LgOdX0=;
	b=FQqj+hD4bgqy7PI7BTjFZRDYlhkDOKijhBldEp+KluRJDdoi6Grb2wjV29vZ0YDK1AwmJhh6UybYH145bDL/lk5Xzqbs9QiPz6j9CLBOR5OI4DFUz3FITOYuQIzFpcFNDpyLfbFJ/jZit+D9Pixmk8UXvS0gB12K6wpEHJ+nkoA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=sNzto3EVubtuw6TqJDXpgc4YklXUIuWfQZuB5vvBV/lazbyAfhk82p2RRPDB4wMz3C8VQIKq6ijTAVSYbprip6n5tVW0MVYuhTkTInZIlLgCHsqbLN+WYSogB3yV5d5xK/nsxDMrFgSW4BHcdkde37QqrV7fIyMa0B7YmcsEoF0=
Received: by 10.114.93.17 with SMTP id q17mr5071747wab.70.1209424020672;
	Mon, 28 Apr 2008 16:07:00 -0700 (PDT)
Received: by 10.114.234.12 with HTTP; Mon, 28 Apr 2008 16:07:00 -0700 (PDT)
Message-ID: <19c1b8a90804281607h61ce59f6ve3fa896601aa2176@mail.gmail.com>
Date: Mon, 28 Apr 2008 16:07:00 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0804281522v4056d73an34566aac9474f9ad@mail.gmail.com>
MIME-Version: 1.0
References: <a7f8874a0804251149w4d740b1ftc40e41703de334da@mail.gmail.com>
	<3810.194.56.133.3.1209393153.squirrel@vollmann.com>
	<c384c5ea0804281522v4056d73an34566aac9474f9ad@mail.gmail.com>
Subject: Re: OE on Ubuntu 8.04?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Mon, 28 Apr 2008 23:07:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Apr 28, 2008 at 3:22 PM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
> Hi,
>
> On Mon, Apr 28, 2008 at 4:32 PM, Detlef Vollmann <dv@vollmann.ch> wrote:
> > Hans Henry von Tresckow wrote:
> >
> > > Now that Ubuntu 8.04 has been released, I would like to upgrade my build
> >  > laptop. I was wondering if anybody has had any experience with 8.04 and
> >  > knows of any OE specific pitfalls to watch for.
> >  I did some builds over the weekend (on x86-64), and apart from the
> >  usual Ubuntu problem of /bin/sh -> dash (instead of bash)
> >  everything worked fine.
> >
> Where does dash break your build?
>
> I run my builds from dash and I think we should target for POSIX
> compliance rather than bashism compliance.

I have seen reports on old glibc release build problems. There were
some patches too to get it working on dash.

>
> Regards,
>
> Leon.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


