Received: from fg-out-1718.google.com ([72.14.220.154])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1O2gng-0005Tb-Ad
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Apr 2010 10:21:21 +0200
Received: by fg-out-1718.google.com with SMTP id 19so927001fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 01:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type;
	bh=WTJP4QV17Gb69v7GkoiROIED/aluA6HarMl4mhAcOCc=;
	b=KGKHBEpGp+UEE4OeCOyZc1MnwB3+/HI8gafSHqtOBCrslnVvBJcssVtshuAhie5QcV
	munWyc5AcRMPlfU4c0FoAkGwkq+QcuQliiZZNJC12v3Z8AaPCJL6scuPwn4HlvJEyjdx
	6vvLmvLoTvRaNAY+5JG2Vqm7mWXQfxkjz5vZI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=KuE2+K4PIdzTB8sKqbkrBTZRM3hvOdnFDPdEUiUm5UX+pQrE0I0wAwDJydTmKT+aHF
	9aL8MMqaqs7x/pxRKyicV1Khct9ANgBPv9t+H/MYh8aQz2Aaxz+fFNGXK3/FaicdTWLI
	e8t3Z0u2GpFpIW2X6SQfsXwx5a4PGHMmPmSLo=
MIME-Version: 1.0
Received: by 10.223.108.72 with HTTP; Fri, 16 Apr 2010 01:17:52 -0700 (PDT)
In-Reply-To: <1271157835-27308-1-git-send-email-Martin.Jansa@gmail.com>
References: <1271157835-27308-1-git-send-email-Martin.Jansa@gmail.com>
Date: Fri, 16 Apr 2010 10:17:52 +0200
Received: by 10.223.56.216 with SMTP id z24mr556288fag.82.1271405872686; Fri, 
	16 Apr 2010 01:17:52 -0700 (PDT)
Message-ID: <n2n141020e31004160117uafdaf45mb8a05ba17903a1de@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 72.14.220.154
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Partial merge of SRCPV
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
X-List-Received-Date: Fri, 16 Apr 2010 08:21:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Apr 13, 2010 at 1:23 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Please consider applying this patch series.
>
> Proposed and discussed in [1], the main reason for NACK (multiple builders
> uploading to shared feeds) was resolved with bitbake patch [2] and it's
> enabled by default in PATCH 1/6. It needs bitbake 1.10 or master, but Koen
> confirmed yesterday that he is using 1.10 already.
>
> People not using multiple builders or any of changed recipes don't need to
> upgrade their bitbake, just keep your tmp/cache dir even for rebuilds from
> scratch (as you already should, if you have ever used AUTOREV).
>
> I'll keep SRCPV changes for other recipes in shr/unstable branch so maintainers
> of other recipes can move to SRCPV easily too.
>
> WARNING: don't use BB_LOCALCOUNT_OVERRIDE with AUTOREV, it will make revision
> counter in PV constant and chaning SRCREV is not enough to ensure increasing PV.
>
> [1] : http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg01325.html
> [2] : http://git.openembedded.org/cgit.cgi/bitbake/commit/?h=1.10&id=2f32735463159e9e42e03819d6b505dba49c7f17

No comment?

if nobody care then maybe we can push it even without
BB_LOCALCOUNT_OVERRIDE enabled by default.
It will be closer to current state and whoever needs it, can enable it
for his local.conf or distro easily,
without forcing AUTOREV people to enable it imediately after this push.

If there is no reply before ie sunday night, can I push it?

Regards,


