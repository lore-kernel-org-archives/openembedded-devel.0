Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PFe4O-0002qc-Qh
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Nov 2010 03:36:25 +0100
Received: by wwb39 with SMTP id 39so738546wwb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Nov 2010 18:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=YkNZ9P5xGh7v5LfgQ/t+IT14/Y7NrmPiWfD0m1L7bkQ=;
	b=hGjKEnyS8B+Magr6yZNeHhZRLX6vUAF1Sd2EnDmU1ebe5AxoWtpkjwmv6UCYMO3CVO
	Z/kl0fjnmOFxmKfGFhSb7kv6Y2zgd+Bo6E0xaRwRzmTvSVHlDVsZzy/+7m7davo2rVKM
	cR2YTM43BHQp5M9pRBGlSdK/hvxuNKRZy2rg8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=h4kfOl4fbi+qF1AepneCaMrftIliU8f70aNcYUsQHrp4mg2c66keZjrn/6+3TiuGKO
	R7W6NwgEAcGq93rcTSa7OVEyczQP/+dpjUDPj22oM9XCpgbE7zjj4xDBIPuopNPokv+m
	aYbsmO0/4fCVhjbDncU4XBuvOh+oGOymtpA38=
Received: by 10.216.178.83 with SMTP id e61mr204192wem.12.1289270127894; Mon,
	08 Nov 2010 18:35:27 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Mon, 8 Nov 2010 18:35:07 -0800 (PST)
In-Reply-To: <AANLkTikVxU787_ktH03HKBdCCFiGZOvxXk6pJ94+RK6Q@mail.gmail.com>
References: <AANLkTikVxU787_ktH03HKBdCCFiGZOvxXk6pJ94+RK6Q@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 8 Nov 2010 19:35:07 -0700
X-Google-Sender-Auth: UUUbenQj7DWGDdOHCPoabuf_W8g
Message-ID: <AANLkTikKbo9JQGzRMFjU+ud7QYkEZTMxc2PynO23SZV6@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.41
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Fail to build eglibc on testing
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
X-List-Received-Date: Tue, 09 Nov 2010 02:36:25 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 8, 2010 at 7:31 PM, Otavio Salvador <otavio@ossystems.com.br>wrote:

> I got this build fail. Anyone knows anything about it?
>
> | nscd.c:(.text+0x573): undefined reference to `__stack_chk_guard'
> | nscd.c:(.text+0x5cd): undefined reference to `__stack_chk_guard'
> |
> /home/otavio/hacking/ossystems/oe/oetmp-current/work/i586-oe-linux/eglibc-2.12-r15.6+svnr11762/build-i586-oe-linux/nscd/nscd.o:
> In function `parse_opt':
> | nscd.c:(.text+0x5fc): undefined reference to `__stack_chk_guard'
> | nscd.c:(.text+0x8cf): undefined reference to `__stack_chk_guard'
>


I've run into this before in the past.  Never had time to investigate, but
throwing out a "me too" :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

