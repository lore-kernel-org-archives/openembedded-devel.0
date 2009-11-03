Received: from [209.85.216.182] (helo=mail-px0-f182.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1N589I-0007cj-Ux
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Nov 2009 02:25:32 +0100
Received: by pxi12 with SMTP id 12so2983604pxi.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Nov 2009 17:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=3pdKdN2Klpdzh6pt8bF4cwusmQk/LdYceNXX1x3tBz8=;
	b=sH8Zd7XRcLBw3d98OIoPtkBKcGp1YILXnbS7Y7Sbamc696McXULDX/o6968BvpBoQQ
	AaP9+5o29tNUvnsWPgjgvQBhdO58KA0eDPB7rj5BEcIEyBALuvXfuvXEmEIM10nXlLPH
	LV+q7pkzg7Lj5gpWyHFkBODpq/dS91cCLoAcU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=NNrXha1/YBLw637OJP3VLew8QptWuB9w6fdXSSCOo5TTemQAychmUi/cNih2bXVTS6
	nXp0Pma6vITgfJVZV9cZxUdbYZ+r1M3aDrxlh0szCcqKxRmyHYWX2WGMhm2trp38E4Xy
	UxdLNH9uI7Qtzk9se2E9FI7Z+8uaTfVe0ZjI8=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.202.20 with SMTP id z20mr991731wff.171.1257211457079; Mon, 
	02 Nov 2009 17:24:17 -0800 (PST)
In-Reply-To: <1257199740.10804.41.camel@dax.rpnet.com>
References: <1257169407.11338.71.camel@dax.rpnet.com>
	<1257199740.10804.41.camel@dax.rpnet.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 2 Nov 2009 18:23:57 -0700
X-Google-Sender-Auth: a276e4e4a3c91e8d
Message-ID: <b6ebd0a50911021723t681afa02xf4ffb54ce4acc376@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: kergoth@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Staging - time to end the current mess - now with patches
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
X-List-Received-Date: Tue, 03 Nov 2009 01:25:32 -0000
Content-Type: text/plain; charset=UTF-8

On commits 4adf2f2 through 54d5f30:

Acked-by: Chris Larson <clarson@kergoth.com>

On Mon, Nov 2, 2009 at 3:09 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> This is much more interesting with patches so we now have:
>
> http://cgit.openembedded.net/cgit.cgi/openembedded/log/?h=rpurdie/work-in-progress
>
> I ended up cleaning a lot of stuff up as I went but the two really
> interesting things this branch contains are:
>
> a) Removal of the layout_* variables. This allows Poky's cross canadian
> SDK functionality to be merged. It also cleans up things quite a bit,
> I've not tested how the other canadian implementation fairs with this
> but the intent is to replace that with the Poky implementation which is
> much cleaner (no boatloads of duplicated variables and uses
> BBCLASSEXTEND).
>
> b) Change the way do_stage operates.
>
> The intent is that do_install installs to ${D}. Nothing should operate
> directly on ${D} other than the install.
>
> do_package takes a copy of ${D} into ${PKGD} and then runs the functions
> in PACKAGE_PREPROCESS_FUNCS which can alter this directory. The result
> is then packaged.
>
> do_stage detects if the do_stage function is defined. The default is
> there is no definition anymore. If it is defined we go into legacy mode
> which works like current staging, we take a lock, take a snapshot of
> staging, run do_stage, run any SYSROOT_PREPROCESS_FUNCS which operate
> against SYSROOT_DESTDIR="", see what changed, take a copy of the changes
> and release the lock.
>
> If we're not legacy, SYSROOT_DESTDIR=${WORKDIR}/sysroot-destdir, we copy
> ${D} into ${SYSROOT_DESTDIR}/${STAGING_DIR_TARGET}, we any
> SYSROOT_PREPROCESS_FUNCS against SYSROOT_DESTDIR, save the result for
> creating the staging package, take the staging lock and copy into
> staging ("install the package"), release the lock.
>
> For fun, we also detect two special cases - where autotools_stage_all is
> used by itself and where native.bbclass is used with an autotooled
> recipe with no do_stage changes. In those two cases we don't need to use
> legacy mode.
>
> Porting Guide
> =============
>
> There is a bb.debug in base.bbclass which tells us which functions are
> using legacy staging functions. We can raise the profile of this message
> as we work through the recipes dealing with the staging functions.
>
> As a guide:
>
> * Any do_stage where we do an autotools_stage_all can just be deleted.
>
> * Any do_stage which matches the do_install can just be removed.
>
> * Native packages with delete do_install should not anymore.
>
> * Any do_stage function which installs extra things compared to
> do_install is very suspect and needs an explanation of why. Most likely
> do_install should be fixed and do_stage then deleted.
>
> * If do_stage really needs to do something other than what is in
> do_install a function should be written to operate on SYSROOT_DESTDIR
> and that function should be appended to SYSROOT_PREPROCESS_FUNCS. There
> are some -native binary special cases which will need this but almost
> everything should *not* need this.
>
> * Any other cases, post to the list and we'll work something out
>
> Comments and experiments with the branch welcome. If I get some time
> I'll try and start adding a few conversions to the branch.
>
> FWIW in Poky I have about 25% legacy staging and 75% using the new
> functions since I've been pushing autotools_stage there heavily the past
> few months.
>
> Cheers,
>
> Richard
>
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


