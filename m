Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P8IaL-0005Dz-Bj
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 22:15:02 +0200
Received: by wwi17 with SMTP id 17so81162wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 13:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=d9C4vXhT2Sm/1sFDXlZe+AwVnC28OcxWGHWA2sm1koE=;
	b=FZHA7KRFPQDkueP+QNGt1VKMbfHBRpZ2guKBHjj6+uxfcEDC7kKUQoHy+e+rXm2o2H
	SU7GCWyg8xQtskPQ1yBN54IN2+/UMc601WnIp9EremJ5fydiWTvoWdiJExvRJyRZAVAV
	9lNK2GyXLH+hd348YUnnRqmU7MG3/BAxjgjXs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=iqoN2wvw+5bLDZhm5jM1D9717pUHefkQo4Bs3hfDS9AU/W3YToXyLoefwTsjLYz1eO
	qq3GJJdllBR6Qs3Ru7DorFDZV1Q5hHMi6MvFWtkXyIYm7fCCsEdoVQGS6ijejzEyH9Bk
	Hcwkh07ZA2wMlmlr6jxOSinbFYWxzLPYQAMok=
Received: by 10.216.154.131 with SMTP id h3mr7164635wek.74.1287519262076; Tue,
	19 Oct 2010 13:14:22 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.139 with HTTP; Tue, 19 Oct 2010 13:14:01 -0700 (PDT)
In-Reply-To: <1287515589-25224-2-git-send-email-raj.khem@gmail.com>
References: <1287515589-25224-1-git-send-email-raj.khem@gmail.com>
	<1287515589-25224-2-git-send-email-raj.khem@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 19 Oct 2010 13:14:01 -0700
X-Google-Sender-Auth: V3rnvlEwZaQ2VaYEl-T9ksYNIGk
Message-ID: <AANLkTin9TG8KHT9yRgO1UuKpe_obb=31xos9zM9wRkkL@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 2/2] gcc-configure-target.inc: Filter out --with-sysroot
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
X-List-Received-Date: Tue, 19 Oct 2010 20:15:02 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 19, 2010 at 12:13 PM, Khem Raj <raj.khem@gmail.com> wrote:

> +python __anonymous () {
> +       cfg = oe_filter_out('^--with-sysroot
> , bb.data.getVar('CONFIGUREOPTS', d, 1) or "", d)
> +       bb.data.setVar('CONFIGUREOPTS', cfg, d)
> +}


Try this instead, *after* the inherit of autotools, to avoid the anonymous
python:

CONFIGUREOPTS := "${@oe_filter_out('--with-sysroot=', '${CONFIGUREOPTS}',
d)}"

(also note the ^ isn't necessary, filter_out uses re.match(), not
re.search(), so its required to match at the beginning of the word)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

