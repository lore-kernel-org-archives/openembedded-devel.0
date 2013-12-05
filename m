Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f173.google.com (mail-ve0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id DF0A66DF66
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Dec 2013 10:04:02 +0000 (UTC)
Received: by mail-ve0-f173.google.com with SMTP id oz11so13232349veb.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2013 02:04:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=dnQKqvhE9bv/JVr45kDKdTaCkCUmufexRRB/2wpSR8c=;
	b=ZHmhrxodmiHR04IIV5D1PdFVXVsadlKXSu75trBAkx0WT3DosBfo98exs2DrGuil6E
	+7NIzVbVmHecn7P/SdLwayJxHO/S/sPy4mQHMQkK8nZ+9Iq74oeUyK6V3bvd6UgU5/n7
	cBe5C4JZIR96zLhfkT+Os7us/J/yp4Np5NAJTfhqm6llbsf18i3MfAWLOd70F+VCehpL
	1ZAQ9DKlbevXX3rSixvi9PC0rIqtHtkWk7f18mkzMSzBg3xhuxJo8qbCO5G/f5yxqQy7
	zAGXcy9NS5D4SpMz9NBE8wVT6Z4g5SP4Zcm8y803jD9qbAY3uXY/B8neekfl+9DcUfAA
	ZigQ==
X-Gm-Message-State: ALoCoQlWPPL6Asxspet+F6OXBeXrjp/QdcJu4sR67tjtNiFBaq+Mob6dy/HSGkcze77DcEFl+okm
X-Received: by 10.58.228.231 with SMTP id sl7mr2825vec.49.1386237841534; Thu,
	05 Dec 2013 02:04:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 5 Dec 2013 02:03:40 -0800 (PST)
In-Reply-To: <52A04BAC.7040706@herbrechtsmeier.net>
References: <1386203938-13338-1-git-send-email-ross.burton@intel.com>
	<20131205005501.GB3724@jama> <52A04BAC.7040706@herbrechtsmeier.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Dec 2013 10:03:40 +0000
Message-ID: <CAJTo0LaFai8YuoTNzBj3fYNLy_eUQMbQEQLc4Ros2tJJwE48Jw@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-core] [RFC][PATCH] cmake: respect ${S} and ${B}
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Dec 2013 10:04:03 -0000
Content-Type: text/plain; charset=UTF-8

On 5 December 2013 09:47, Stefan Herbrechtsmeier
<stefan@herbrechtsmeier.net> wrote:
> I think deleting ${B} before building is wrong. If the build directory makes
> problem you should have the same problems when ${S} and ${B} are same or you
> should remove the ${B} directories when you remove the build files from
> ${S}.

Yes, without S!=B there are problems, and the solution is to put B in
a separate directory and delete the old one when starting a build.
Removing the build files from ${S} is "non-trivial", running "make
clean" isn't universal, and even for autotools distclean isn't always
enough.

oe-core has this as opt-in behaviour for as many modules as possible
and it makes switching machines so much nicer, as you don't get
modules using the previous sysroot.  libproxy does this on demand
currently, and anything using libtool will also have this problem.

Ross

