Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PE2O1-0008Mr-S9
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 17:10:02 +0100
Received: by ewy2 with SMTP id 2so1084666ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 09:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=VmZEZQNZ5wFa1RFB19ShZWqNXl8LG8LVEM3SDBbSivA=;
	b=knWmMtiK62E8FGKSAofDo+XYiEUOr8TyK6Peg/hMUWtCi5CHh2CBaxrx/zaXJOFQMB
	UWez3fnNLrCoor3X5hPpPYrhsMXaPSMy+J+HexIC/dtt7plY+teopQLF0jvvkZ3KbruN
	0ddJVoZT+GG5RJNrCC348+CRz6JRv3+Da8lc4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=H8kKiVbI817k4EmR7Zy6aZeHIC9s2BXSwkVme08oc8whkIsaqCHWpvwOxyJrVGmG/m
	6dx+Yp8+OTbCJk2kT9C0hxPw0C1oH2Uw1+NwUFOAfI4sBefllkW7ISm6XBle4m9wAnNf
	umv8UxYPS5ZemMNy3uFdkMQ7fdTXdJrof/Ab0=
Received: by 10.216.30.10 with SMTP id j10mr38009wea.8.1288886949728; Thu, 04
	Nov 2010 09:09:09 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.139 with HTTP; Thu, 4 Nov 2010 09:08:48 -0700 (PDT)
In-Reply-To: <AANLkTikWb39zWvmK=4LT4W4_okpKPwVhk+rLJ6ogRC-H@mail.gmail.com>
References: <1288824035-27654-1-git-send-email-raj.khem@gmail.com>
	<AANLkTi=OOneV24BDurQ+ECpQJ+-U4AH=MpFZ-YM0jOJq@mail.gmail.com>
	<20101104001342.GG3440@jama>
	<AANLkTim6PdzTRY-9zANa5t90dcYaSTrCudCKYNWsUV--@mail.gmail.com>
	<AANLkTinPkXnf0iSakku7hkMHge_NqXPW_7WS1DHsqjHu@mail.gmail.com>
	<AANLkTin2tSJxYOwwkS4QSR=RH8VEfBp68VeHrE-GiBsO@mail.gmail.com>
	<AANLkTikWb39zWvmK=4LT4W4_okpKPwVhk+rLJ6ogRC-H@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 4 Nov 2010 09:08:48 -0700
X-Google-Sender-Auth: 7UWcfdJl-FuZBn9zevQ0XfRcvmM
Message-ID: <AANLkTin2R5j0vC=P=0DDOWXBKbh09-HZbxxy-YnGTegX@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] metadata_scm.bbclass: get the metadata revision for current HEAD
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
X-List-Received-Date: Thu, 04 Nov 2010 16:10:02 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 4, 2010 at 8:59 AM, Khem Raj <raj.khem@gmail.com> wrote:

> > The issue is, show-ref shows all refs which match the supplied search
> > string.  show-ref HEAD will show all the HEAD refs, both local and the
> ones
> > in all your remotes, which isn't what we want for METADATA_REVISION.  I'm
> > testing a patch which changes it to use rev-parse to get the commit hash
> for
> > HEAD rather than show-ref.
>
> FWIW you could also use git show-ref --head <branch>


Yeah, that will work if the <branch> is the full path including refs/heads/,
but it's not using the right plumbing tool for the job.  show-ref is
designed to *list* refs in the repo, not resolve a single one.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

