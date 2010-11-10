Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PFzHU-0006qL-RI
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Nov 2010 02:15:21 +0100
Received: by wyb34 with SMTP id 34so184528wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Nov 2010 17:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=g9f3+4eZ+7C4FRgt1ENah5wIL0xJUP1TygmzYBL8zmU=;
	b=dhjnu7Co4nVDFM0VKj05nNH6HbxdLI6CfBY4aV0Ci3gmoP1639OOjJq+zyO9ID/HmH
	rNcsrUwlSTmf09wuyHssT7QnXqHr6hzsPVP3agBAb6UkWeWsymXz+EiGhAs7oVVK7ZdF
	FZKXBEub+A8tDym1uHf3oxXe0snf1lt3Biklg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=YyEPLyGnV1u/6y86TOXL/iLxcBdNv2No7QYooM1Z/OgwU/0RPsbM77EElwUYpQIyam
	BYFo5d90tgd2CxPPOidNP1TfXonfM5efM9Mnd2SLFhkO2VeKECemUTp9ApVXWdaSZdLM
	cC8NCkyCVRM55x6aCs0bttgSdIvyMKDGlhHgo=
Received: by 10.216.239.199 with SMTP id c49mr5181234wer.12.1289351662633;
	Tue, 09 Nov 2010 17:14:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.216.67.67 with HTTP; Tue, 9 Nov 2010 17:14:02 -0800 (PST)
In-Reply-To: <AANLkTinL42CzA6aa3zSfAfHOz9NUGh+ExnfNZL5=bthP@mail.gmail.com>
References: <1289344708-26165-1-git-send-email-kergoth@gmail.com>
	<AANLkTinL42CzA6aa3zSfAfHOz9NUGh+ExnfNZL5=bthP@mail.gmail.com>
From: Chris Larson <kergoth@gmail.com>
Date: Tue, 9 Nov 2010 18:14:02 -0700
Message-ID: <AANLkTi=cw28bW_a=ra_mU9+R0LYY6uByKXTOS184T8s8@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC] [PATCH 1/2] Implement variable typing
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
X-List-Received-Date: Wed, 10 Nov 2010 01:15:21 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 9, 2010 at 4:59 PM, Chris Larson <kergoth@gmail.com> wrote:

> See https://github.com/kergoth/openembedded/compare/master...typing for
> the current version, just reworked to decouple the types from the metadata
> to make their unit testing a bit cleaner.  Note that the __new__ use for
> Choice and Regex is pretty ugly, really only using those classes as a
> container to make setting the name and flags attributes on the callable less
> ugly :P  Comments welcome.
>

Fixed.  I'm fairly happy with that branch now, so am going to stop messing
with it, other than adding more type flags to the metadata.  Let me know
what you think.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

