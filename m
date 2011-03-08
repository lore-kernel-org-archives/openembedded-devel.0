Received: from mail-gw0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PwzbN-00037k-7b
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Mar 2011 17:17:37 +0100
Received: by gwaa20 with SMTP id a20so3196948gwa.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Mar 2011 08:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=zYxkDsUPTI6VYmIWfS7L+VQ4yGW+4+z2d2CZubBlLh0=;
	b=W7B7baCwoKVhlB8uTAUoL4/X3/c7UYQEsFev0WMNJnfVuBpaJpEcZnDuYeWIat+F47
	sspJISsVDllXc0ISiPSp5mvRq7TXDA0XeNdpHxvmJIgMKwWbeh2FAEHOai5KNixZM0Kb
	hefCE8KpPvmj+fUDyxvdu8+ZBDjVSvhi2p/uM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=sd+xPJj29aZnth7LjnFqvryjfD4GG5WEUnyJ9pJlWxFFrZyuf/xWYm0YjChkib6DDz
	ocVZq58PMiyszYxQ1TpUCUO0kjQjGvb1M22vlNV7SOol+8MO89sMpjOcPx33NVZyBT24
	YwZG1iH6MNjDiT/QZlFhLHNMWw+7UcYz7lvEY=
Received: by 10.43.44.197 with SMTP id uh5mr6661423icb.276.1299600958047; Tue,
	08 Mar 2011 08:15:58 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.42.141.8 with HTTP; Tue, 8 Mar 2011 08:15:38 -0800 (PST)
In-Reply-To: <AANLkTik9UybhDf+RjdLcm-TBjiT6Ur36sDoyoA4VX65m@mail.gmail.com>
References: <AANLkTik9UybhDf+RjdLcm-TBjiT6Ur36sDoyoA4VX65m@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 8 Mar 2011 09:15:38 -0700
X-Google-Sender-Auth: aqe-VYvQvf9FSgVb-oBz2FJZVbk
Message-ID: <AANLkTikPOKkShDF841y3xR=uj3YTigf1nEQv0fezFka2@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: What does PACKAGES_DYNAMIC do?
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
X-List-Received-Date: Tue, 08 Mar 2011 16:17:37 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 7, 2011 at 7:47 PM, Charles Manning <cdhmanning@gmail.com> wrote:
> What is the rationale behind PACKAGES_DYNAMIC.
>
> I tried to RTFM, but that's in one of the Todo sections :-(.

It informs bitbake about the emission of binary packages when we don't
know what packages will be emitted until runtime (e.g. the locale
packages, kernel modules, etc.  Note kernel.bbclass sets
PACKAGES_DYNAMIC += "kernel-module-*").
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


