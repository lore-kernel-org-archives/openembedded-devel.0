Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <george.huntingtoniii@gmail.com>) id 1REPzc-0006qv-Rt
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Oct 2011 20:26:57 +0200
Received: by gyc15 with SMTP id 15so318421gyc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2011 11:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=yhGcvHHJtTDB3uucAVKPUZ/+0fgBo+PLWQYwfNj+Xuw=;
	b=MJSUkVKkzoLd2ygYdP5JLtHoYe1NiV1I5VS7dDSZyRfvc8+ueBSGcgLT1jDUr2B5fB
	U+AQ2CquAECgYbF3zy+7PcUyHVGzLXCrUKusXlbrVhNnofUROnd56hqPTS5bAZwx7rOM
	EqKPdA6b/ST5P/v6Si0Ck1BZeYITGckJGU7XY=
MIME-Version: 1.0
Received: by 10.150.48.40 with SMTP id v40mr5663760ybv.98.1318530071398; Thu,
	13 Oct 2011 11:21:11 -0700 (PDT)
Received: by 10.151.112.10 with HTTP; Thu, 13 Oct 2011 11:21:11 -0700 (PDT)
In-Reply-To: <20111013170423.GH26170@denix.org>
References: <CAFu+nvHi=pWi-bX5NrTQAk_JVv04YTa=d60Rg7YVSvLv7FNsPg@mail.gmail.com>
	<20111013170423.GH26170@denix.org>
Date: Thu, 13 Oct 2011 14:21:11 -0400
Message-ID: <CAFu+nvFi=ML98ncOtaHQU2OESoeNtZkFJZt-=gbPaVOnY0L7Bw@mail.gmail.com>
From: "George C. Huntington, III" <george.huntingtoniii@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [2011.03-maintenance] using sdk as external toolchain
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
X-List-Received-Date: Thu, 13 Oct 2011 18:26:57 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 13, 2011 at 1:04 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> On Thu, Oct 13, 2011 at 11:22:05AM -0400, George C. Huntington, III wrote:
> > I've built an sdk with oe on the 2011.03-maintenance branch, and I am now
> > trying to set up a local.conf to use the sdk as an external toolchain and
> I
> > get problems building gtk+-native.  any ideas on where I should start
> > debugging this?
>
> gtk+-native should be built by the host toolchain, not the target one from
> SDK - are you sure you are setting all the correct build variables
> properly?
>
I think I am setting the build variables properly, but I'm not quite sure
where the correct place to look would be.
I was hoping the manual or the wiki would have a "this is how you build an
SDK" and "this is how you use the SDK you just built, as an external
toolchain"
I think I get how to build an SDK with the meta-sdk recipe, the other part
is less clear.
you can talk to me on irc, I use gchiii as my nickname there.

>
> Moreover, it's hard to help you debug your issue, if you don't provide
> details, such as your local.conf and the build logs...
>
> --
> Denys
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

