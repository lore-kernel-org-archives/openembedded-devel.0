Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PqreO-0006HA-Qu
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Feb 2011 19:35:24 +0100
Received: by iyj8 with SMTP id 8so4541625iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Feb 2011 10:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=ezWOrCzXQ5cQ+ske4B00ZG+apUy8E9kRhGpKhPLp3vQ=;
	b=b6F4SuVUPc8yQ/vmKNB7JynKSjxo9QxxpDs0oBO42ePA5Bc2gLIbXjRVtE++mGDMY3
	WnKYIZpV+K3ZU8rcRLnLfpiKHeItyfTpTKt6cpQNFhsW9BI/oTDGUzHVfVFXre0nIOWn
	+WD7LfJkSiLYrowjEJAkmiS63lhZ+TLXJsrYE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=g0HBT9XnphTmQk/Z1ADcFcZY9Tc0GhtwhLytPsp/tGGQJGHLDyX4yNHBaeJtDXHM4g
	iQs0IOS2ZXNSX5T+TAZyld2eeAIP41LmSU5HzPANw2jBrn2wjj14Bx5uwivg+/xypotV
	qbGlNbQ/Gx1tkCdOsW6rl9mStUhF8YpoxV3ks=
MIME-Version: 1.0
Received: by 10.231.157.211 with SMTP id c19mr1520508ibx.172.1298140071277;
	Sat, 19 Feb 2011 10:27:51 -0800 (PST)
Received: by 10.231.30.73 with HTTP; Sat, 19 Feb 2011 10:27:51 -0800 (PST)
In-Reply-To: <4D5FFF05.5050603@freyther.de>
References: <1298057187-2466-1-git-send-email-tom_rini@mentor.com>
	<4D5FFF05.5050603@freyther.de>
Date: Sat, 19 Feb 2011 19:27:51 +0100
Message-ID: <AANLkTinHKrUjZu=09=wotnxzYmZFczV76PcQBE-6knM+@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] insane.bbclass: Make RPATH a non-fatal error
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
X-List-Received-Date: Sat, 19 Feb 2011 18:35:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/2/19 Holger Freyther <holger+oe@freyther.de>:
> On 02/18/2011 08:26 PM, Tom Rini wrote:
>> In order to make the user experience better we now use bb.warn
>> on non-fatal QA errors and bb.error on fatal errors.
>
>
> hmm. for every binary with a bad RPATH in your distribution your product can
> get bad press very fast. I think the commit message should reflect this in a
> way that we are aware of this and don't care.
>
> holger
>
That's why I suggested to at least make it user/distro configurable,
so those of us who do care can easily enable it.

Frans


