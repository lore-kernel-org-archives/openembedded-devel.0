Received: from mail-iw0-f202.google.com ([209.85.223.202])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NVg1a-0003NS-Ui
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 07:51:18 +0100
Received: by iwn40 with SMTP id 40so351174iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2010 22:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=Aocc/Jm60hM8C3x2GfQpKFDZ4CqJoNu+MTctXdadAo8=;
	b=qN4oey0PFpl0uOB3SZTfbzfrAW9vKhPBnJsO/2SgWQPHFqnMH9HZMPQTnYve2nq8Sn
	OXMFKzL/8ZHS7absA/zlM9DRKpir2+dJuaJtbDj3TA+qvZ99Z9bYyZWnOm52paAIXotX
	9DyhTRI5F674MR03Z5OUBtPDggbD71TSwoyVw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=gqOnTQPV0/vbS/Poxz2602BetGQGWFEwTfb3mmqbmf53g835G6ddywthlxjwCqqzVb
	8mql4daul4jp3yEmlnUyAae7KDCvV80+OnL66+3s29auFwd6LUI9ueU4F5IiaSToYypp
	1THYCqVvF8buf9ryiGYqR7731rQCYyrUsV+Uk=
MIME-Version: 1.0
Received: by 10.231.147.210 with SMTP id m18mr1944628ibv.48.1263538142149; 
	Thu, 14 Jan 2010 22:49:02 -0800 (PST)
In-Reply-To: <1263507455.3757.37.camel@gnutoo-desktop>
References: <1263507455.3757.37.camel@gnutoo-desktop>
Date: Thu, 14 Jan 2010 22:49:02 -0800
Message-ID: <19c1b8a91001142249r1301da16h6abc63071ce9acc4@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.202
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: illume-image
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
X-List-Received-Date: Fri, 15 Jan 2010 06:51:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 14, 2010 at 2:17 PM, GNUtoo <GNUtoo@no-log.org> wrote:
> hi,
> every time I build the illume image I've the following failures:
>
>
> First failure:
> --------------
> The first failure is about libefso and its deps,it has missing includes
> and so it fails,long time ago I tried to fix it but at a point I
> abandonned,so is it ok to remove the following from illume-image:

Remove or not its up to you. But the failure can be fixed easily of you just add
#include <stdio.h>

to efso-dict-helper.c


