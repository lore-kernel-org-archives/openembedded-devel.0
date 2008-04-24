Received: from [209.85.146.177] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Jp9zM-0003lX-Fk
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Apr 2008 00:32:24 +0200
Received: by wa-out-1112.google.com with SMTP id l24so5449768waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Apr 2008 15:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=mItQs8mtT9ahMs8OBDfNTESe/xJdQoYKCk+77hxxx8c=;
	b=YJILY2St5c97WJ61eJnh/QrrBZFpCP1IWVu2kvRxONLUA3zfn0pdzc0cELvIwgKxOJTIven8n40Sm4bFaFvUdoaFrtKU6u0qWT4mMbvynWkey3sF/6aw0Ji4Yy95JCsEjK8RS4Gy+upAdha1AsuePsMltTXyruQSBk3s7PjjqH4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=xBEYEqdy3cKbpwAkW4Nhmfl5Vz/yG9H1WU0caSxm8f3NjtRgXitzIsOis6xqG/OAK1V6bOhyCIYcMsOHiq99lxxH4t6ROaK+64XKleDuaUlb0ewQLZ4ktYmT64n5yNwJKC50a8C810e8rsTvAVr3lRsYcSPa/0j+nAYbPPjDMAs=
Received: by 10.114.191.1 with SMTP id o1mr2468582waf.117.1209076329013;
	Thu, 24 Apr 2008 15:32:09 -0700 (PDT)
Received: by 10.114.234.12 with HTTP; Thu, 24 Apr 2008 15:32:08 -0700 (PDT)
Message-ID: <19c1b8a90804241532l4f084b50m77c588a8a768ccbc@mail.gmail.com>
Date: Thu, 24 Apr 2008 15:32:08 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1209073881.5108.79.camel@dax.rpnet.com>
MIME-Version: 1.0
References: <f96d234e0804241325l64a85878q905dc02eb177266d@mail.gmail.com>
	<1209073881.5108.79.camel@dax.rpnet.com>
Subject: Re: bitbake -c rebuild not running all tasks
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
X-List-Received-Date: Thu, 24 Apr 2008 22:32:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Apr 24, 2008 at 2:51 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Thu, 2008-04-24 at 16:25 -0400, Cliff Brake wrote:
>  > I'm trying to sort out the xorg fonts stuff, and am running into an
>  > issue where "bitbake -c rebuild" does not re-run all tasks when
>  > rebuilding font-util.  It seems to me that bitbake should be running
>  > all tasks including configure, compile, etc.
>  >
>  > I'm using bitbake 1.8 HEAD, and a week old or so version of OE.  I'll
>  > try the OE HEAD as soon as I get a build to finish.
>
>  There is a clue here:
>
>
>  > NOTE: package font-util-1_1.0.1-r2: task do_prepackaged_stage: started
>  > NOTE: Uninstalling any existing package from staging...
>  > Removing package staging-font-util-geode-angstrom-linux from root...
>  > NOTE: Following speedup
>  >
>  > Installing staging-font-util-geode-angstrom-linux (1.0.1-r2) to root...
>  > Configuring staging-font-util-geode-angstrom-linux
>  > NOTE: package font-util-1_1.0.1-r2: task do_prepackaged_stage: completed
>
>  You have packaged staging enabled, it found the staging package and used
>  it, "accelerating" the build.
>
>  When we run clean, the do_clean_append() in packaged-staging.bbclass
>  takes care of removing the staging package but it didn't. I can tell you
>  why too, basically rebuild is totally flawed with bitbake 1.8 HEAD and
>  some of the recent core changes :(.
>
>  Please don't use the rebuild command for now, use -c clean and then
>  rerun it.

I was also being bitten by this problem on many packages. Thanks for clue.
I was trying this inadvertently so far.

I will think about this problem but its a nasty tricky to
>  solve one. The best idea I have so far is we always have a clean task
>  that runs before any other, it just only does something in certain cases
>  governed by stamps.
>
>  Cheers,
>
>  Richard
>
>
>
>
>
>  _______________________________________________
>  Openembedded-devel mailing list
>  Openembedded-devel@lists.openembedded.org
>  http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


