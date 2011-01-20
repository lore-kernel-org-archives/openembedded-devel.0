Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PfiuT-0004nk-2L
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Jan 2011 02:01:57 +0100
Received: by pzk12 with SMTP id 12so10152pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 17:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:content-type;
	bh=UkxfLQYaz/hLQG3xbGCVlUqtAPEO2xPkHcE57ots0f8=;
	b=wQu0ELtPmR09PHfL1y7liX575J5tUMtko/2bKpjpU1Eh6nKyL21tfcnx9IArrP2syj
	f5Lajkr0n1qkN7gJf1moIbBtzChm6Yyl4cVgPtl8Jv+Wwa9kebB083vf7rMtTc6w9AlP
	RnANjTInWmwKNxQ4UR/jXHOEcVg+SHyFqL4sc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=q2/8ipzp/sIee981jNXjmRKMbU8a9YdSiaAW4hFXYQC+i+S6sX8alml3jaMlkYm9Ck
	PySOqMLDYI1fEiAaOgRMX64FZvxx1ugpKFPf0VlP4SnKnex2wugx/2/yaK/lbFwVi/4n
	86TJ7uGnhZhK54umBorQgCEHa+xY8uaPvnTEY=
Received: by 10.142.239.14 with SMTP id m14mr61629wfh.138.1295485274935; Wed,
	19 Jan 2011 17:01:14 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.132.18 with HTTP; Wed, 19 Jan 2011 17:00:54 -0800 (PST)
In-Reply-To: <AANLkTikYazjAUC3MpsKZt3xOJYHA=AoZGtfooLHgAe2R@mail.gmail.com>
References: <1294796586-24723-1-git-send-email-kergoth@gmail.com>
	<AANLkTikYazjAUC3MpsKZt3xOJYHA=AoZGtfooLHgAe2R@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 19 Jan 2011 18:00:54 -0700
X-Google-Sender-Auth: bWrfyl4DZhl8157Vyi80hODUtqs
Message-ID: <AANLkTinh7jzZ69dDSejipeSq2UUfPME8F5EFmkB-eGSV@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] busybox: move syslog config to /etc/default
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
X-List-Received-Date: Thu, 20 Jan 2011 01:01:57 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 19, 2011 at 1:10 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Here it's right but to OE you've pushed version of patch where it is
> also renamed to
> default/busybox-syslog, but that patern in sed call
> 's,/etc/default/busybox-syslog,' should still read
> 's,/etc/default/syslog,', otherwise nothing is replaced and
> syslog.busybox is still trying to read /etc/default/syslog which does
> not exist
>
> or rename it to busybox-syslog in files/syslog file too
> http://git.openembedded.org/cgit.cgi/openembedded/commit/recipes/busybox/files/syslog?id=a25c0750c7892990c59e8d6048b8c4d99410bcee
>

Bah, damnit, thanks.  Well spotted.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


