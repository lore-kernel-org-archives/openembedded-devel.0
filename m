Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P7BRB-00041f-T6
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Oct 2010 20:24:58 +0200
Received: by wwe15 with SMTP id 15so2028473wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Oct 2010 11:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=LtHOVFZ2IA4rsX5BgC0tC40m4nV8zx3lkEz3e9Wxhug=;
	b=TJLElOg0xFMY7TEfiHspLz5E2xf+QqHN677tpQF9NoQqNShpgfQcKK2x4aWQBziUPO
	LTumoCJbcUAZiKNp6OK37xhLltx1VmbSQpPgbujd9SNRmP9kr8EQ2a/3/gf09lLRDgmb
	LZ8km+D8vARkeTFM4DK7trvXqI+4n4V8JbS/k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=ByXgiXWfIWpsLQ79hnRSmyD+WMPtNPZJCkYSzSJPxNzFk8WV2OIr5Vya2GvZnnqV3L
	AYA5DcS9SSLHWSiiPVdLbQI2Wx1Qp3MMPfYQ/U3/OnKjViglF2X9ivODKyykK8isjyH6
	h2ANutsEioHIWKGFwZNK2r4KhLnuGwPYsTh6k=
Received: by 10.216.17.72 with SMTP id i50mr3168389wei.77.1287253466743; Sat,
	16 Oct 2010 11:24:26 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.142 with HTTP; Sat, 16 Oct 2010 11:24:06 -0700 (PDT)
In-Reply-To: <AANLkTinse8QO1RjTSFqQ10_SOR68C7wbhRq=qPGhDhzh@mail.gmail.com>
References: <1287113787-21268-1-git-send-email-kergoth@gmail.com>
	<AANLkTinse8QO1RjTSFqQ10_SOR68C7wbhRq=qPGhDhzh@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 16 Oct 2010 11:24:06 -0700
X-Google-Sender-Auth: uVhF9VDFNcdSZJenJOR58nas60E
Message-ID: <AANLkTikrgw76+iAr8n3a3Kv+1joHN0ZAKTMcmOvNXrbU@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] Reverse the order of OVERRIDES
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
X-List-Received-Date: Sat, 16 Oct 2010 18:24:58 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Oct 16, 2010 at 11:04 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> Probably needs reversed OVERRIDES order also in bitbake.conf FILESPATH
>
> FILESPATH = "${@':'.join([os.path.normpath(os.path.join(fp, p, o)) for
> fp in d.getVar('FILESPATHBASE', 1).split(':') for p in
> d.getVar('FILESPATHPKG', 1).split(':') for o in (d.getVar('OVERRIDES',
> 1) + ':').split(':')])}"
>

Yes, you're right.  OVERRIDES in bitbake is used such that the *last*
defined overridden variable is used, but FILESPATH uses the *first* file it
finds.  Reversing it there should indeed fix it.  Nicely spotted, thanks.  I
have some errands to run, so won't have a chance to apply a fix until this
evening, so if someone else wants to get it in, feel free.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

