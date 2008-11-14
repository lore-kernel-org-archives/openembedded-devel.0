Received: from [209.85.221.10] (helo=mail-qy0-f10.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1L1830-000090-H5
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Nov 2008 00:25:54 +0100
Received: by qyk3 with SMTP id 3so84199qyk.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2008 15:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=1n6mshrr1SQK2oAlfvzdLhP1cWJ1NhslIiOJZDoXQN8=;
	b=cQ+GL9OFm70d4jJkQgaCTXaAkmpyzWYOfaju7u1/+2UpvzJtl70kiWpOwiXunROYnP
	ScpxNh7mzBehOnSovKrXlIEVypeL9bnDkEeKejyxwKVGM3PsNuAVkohzTVTZtsuiSoR0
	9cAG0Z1n0LcpY/xErti1wLEaiXsTCD2tZ7bFM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=PATVr+zHzFdnXhBtsR5upiGNHMMt+xxzN1/FMkKUADEw8cJhja6E82LvdiLRWX7QUZ
	qPpPkEoLRC3aHY9kcQ6SBsA9F2l3f/zeor8xbKNr2lR0B0RRpm+ERpBtvLfZwrFsYQqL
	LQnaplkH5WChbOi4gQ89fdHPvehaJSO0nm48k=
Received: by 10.214.79.7 with SMTP id c7mr1581763qab.357.1226705021736;
	Fri, 14 Nov 2008 15:23:41 -0800 (PST)
Received: by 10.214.12.10 with HTTP; Fri, 14 Nov 2008 15:23:41 -0800 (PST)
Message-ID: <c384c5ea0811141523t57c346f4o87bd43c623f2f892@mail.gmail.com>
Date: Sat, 15 Nov 2008 00:23:41 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200811150004.50508.zecke@selfish.org>
MIME-Version: 1.0
References: <200811150004.50508.zecke@selfish.org>
Subject: Re: [gstreamer] Enabling binary cache (instead of the xml one)
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
X-List-Received-Date: Fri, 14 Nov 2008 23:25:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hey,

On Sat, Nov 15, 2008 at 12:04 AM, Holger Freyther <zecke@selfish.org> wrote:
> I wonder if we have ever considered in using the experimental gstreamer
> feature to build it with "--enable-binary-registry".
>
Good find.

> what do you think? Risk and use an experimental feature (it is using mmap so
> the risk of SIGBUS is there)
>
Should work, or be fixed elsewhere(tm).

+1

Regards,
-- 
Leon


