Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id AB163606A8
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 02:30:51 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id t123-v6so25126400iof.7
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 24 Apr 2018 19:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=YN2qH9Q3rfCHwOYV43UchECGIC8S37MEkE9anXdoFWA=;
	b=HDmwVGY7WeFx88oiDIGQhKNOcd8rw1+CJJaPbd3OJaRre6sSUknKPdj+aXtai903Ln
	iJ+LgPWUVV8Z8d6MytoKHzPqPD1rPJ9bf4LOPWVZwZU4D6dLEyTIztsgHfuqlPsjtNtY
	RmHRILCTppmzR/mfszolVSZpSYWSiRIlWuEGS1gw5I5+qaW4QVUQBVHrMKYThOhBg1qu
	CMLAcCHgsgKUZMtL01g1m7cCmaZVi6fq/BoXDLCymKj4tLM32ohDRVZvlvBb0vp04u/T
	kAZB9Mw4OrVKPMgLXAD988I1pNBpmFb5DEbEdz8jj4QzQDR8Xb95lyZuHrim56bEjLrG
	Sjig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=YN2qH9Q3rfCHwOYV43UchECGIC8S37MEkE9anXdoFWA=;
	b=XlSWD2Gzp8FDAPIZHvTOxtpdHcLz7UJH5q5BBGkOA2zVnwCdOtVP28BCf5bYE34FRR
	b8tq2ATj2dw2erAbL+dfH1WptNIKAhixf7p9ZmVui/KHUDYlC2KI++qTCuJ3QYEx4Q3h
	qCnwnBNQlQ0hAULGYGdGp9WZXIjc9PBO4CjoONa8gY6WEiuK2opYjymW9WuXDQ1Ftf80
	QsEwWjhbVwxrTq4fUbZ9uILMcyvfPOHt+aSsYHmCxh/wCpFLhnves00IPEXy9KuGXyRF
	N14QNZj/ASFx4HylVR/H4Tu283r2tv+m87T5XxSHmIWPr/trARHCPMn1iYULla8+s5dS
	btBQ==
X-Gm-Message-State: ALQs6tAV/dX0nZbCebxXeB4IzkbBV8PEL5KoP0q9sZ+HSbt9K6IZTGt3
	sPLRE2WfLQBTkc8dJtPxXdj068gf
X-Google-Smtp-Source: AB8JxZrZdAZ4pcFxdY6tLQWCtuYXuEocqadWnFSZYdPCfu0SYw/l7jmb6zMO1WSbuFCz3C/93WUzZw==
X-Received: by 2002:a6b:80d5:: with SMTP id
	k82-v6mr28274196ioi.253.1524623451568; 
	Tue, 24 Apr 2018 19:30:51 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95]) by smtp.gmail.com with ESMTPSA id
	q67-v6sm6349276ita.11.2018.04.24.19.30.50
	for <Openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Apr 2018 19:30:50 -0700 (PDT)
Date: Tue, 24 Apr 2018 22:30:48 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Openembedded-devel@lists.openembedded.org
Message-ID: <20180425023048.GA27713@linux-uys3>
MIME-Version: 1.0
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: meta-bsp
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Apr 2018 02:30:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi,

I'm tempted to reply to RP's "2.6 planning proposals and meeting" email thread
to ask if there could be some support added for common BSP things, but I have
a feeling it probably won't go down well. Also, I've been trying to get some
traction on https://bugzilla.yoctoproject.org/show_bug.cgi?id=11881 for a
while (i.e. since last August), but no dice.

Basically, I believe there are a small number of basic, general things that
many BSP layers could use (or need) and it'd be nice to see them available in
one place so everyone could use them, instead of having everyone create their
own, or copy+paste (I'm not sure which of those is worse).

Bug 11881 is an example of one such thing, but others exist.

Many embedded boards will come with repositories somewhere of that board's
vendor kernel and vendor bootloader. Many BSP layers have recipes to make
building with these repositories easier. However, we're seeing more and more
boards getting upstream {kernel|u-boot} support. This means users are
increasingly having a choice between using the vendor's repositories or
upstream. But often the choice of bootloader, kernel, and graphics are tied
together; if you want one, it means using or not using the others in specific
combinations. Therefore it's not simply a matter of providing two kernel
recipes and letting the user PREFERRED_PROVIDER_virtual/kernel one or the
other. So bug 11881 points to a class (written by Otavio) that allows a BSP to
offer different sets that the user then selects (either by doing nothing and
selecting the default, or setting a one-liner in a configuration to choose the
other).

Another example of something that might be useful to various BSP
layers is a common recipe for the upstream linux kernel itself
(git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git). Many BSP
layers provide a vendor recipe and an upstream recipe, but I believe it would
be better if the upstream recipe were common instead of requiring every BSP
layer to keep theirs current. Maybe the same is true for linux-next or
linux-stable?

Also some common mali (or perhaps the upcoming lima) recipes might be nice?

Since it seems unlikely I'll be able to convince openembedded-core to add
these things, maybe meta-openembedded would be a better home?

Best regards,
	Trevor

