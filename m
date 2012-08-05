Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sy6se-00048t-Jr
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2012 21:52:52 +0200
Received: by eaad12 with SMTP id d12so643902eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=GO4Abv5lzJT5LFn//EqtrnGhZDk0bvGUHkTpiMqTyOQ=;
	b=trSM7BvnTGZfkUq6FPOKQHCrXQgDLG8FMg94GBBm0110HIWLl4qNedWt/yWriEr6HY
	iU05PyBxErXrUFdV4nFvIrENEyW6g2ttbyXqum43onfMIoQBeik8OiAitseSB1JLjNWr
	4AHNc0BAwhSd/4Vq1RfXQyll863ZdjxzZPtGdbOYUsUtEWAKGfepAYgtFVOpQTdJeVZi
	5YAHxl3pV9exbnG4kIPAWbpUDEtVbnJeZ0YcBUWtGW3qoCgUJeDQ3Qwb+m3GP0aPjoLB
	Ljk/j3yB89Fq7WYm7j7g0Ma7n0EHYIFkM4QvacXBgv9ajYSaiJGkJHmxSm67w/tXfzZK
	sPQQ==
Received: by 10.14.173.71 with SMTP id u47mr10110403eel.22.1344195669125; Sun,
	05 Aug 2012 12:41:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.97.141 with HTTP; Sun, 5 Aug 2012 12:40:38 -0700 (PDT)
In-Reply-To: <501E5E9F.4010005@balister.org>
References: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
	<jvbgus$ove$1@dough.gmane.org>
	<BCFACC99-6EAF-4C57-B8E2-18DA0E62BAB3@gmail.com>
	<671950423.c3foblMkXu@helios>
	<6602C8C9-45EA-47B9-B446-C96264B142B7@gmail.com>
	<jvggnd$naj$1@dough.gmane.org>
	<CAMKF1sqqyahA8QXH2eOo0SPM-vRtygE1iiyOWMLanV=mGxLfNg@mail.gmail.com>
	<jvgr60$ig7$1@dough.gmane.org>
	<CAMKF1spLej1gvXiSYX_OfqhaFK0D2bLZ-hi-8HGHiTUVG9V29w@mail.gmail.com>
	<jvk125$nh$1@dough.gmane.org>
	<CAMKF1srqhPKJfmGG+5uvkHnv18U9Ye5TM56V1C3tWKHwKHhWbA@mail.gmail.com>
	<jvlm7n$r75$2@dough.gmane.org> <501E5E9F.4010005@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 5 Aug 2012 12:40:38 -0700
Message-ID: <CAMKF1spBFAEww0=kDJDpRk7_Fk9se2xZS4wXqVj8E1H9xk_gCA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-systemd][PATCH V2 1/7] systemd: Upgrade to 187
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
X-List-Received-Date: Sun, 05 Aug 2012 19:52:52 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 5, 2012 at 4:53 AM, Philip Balister <philip@balister.org> wrote:
> Can someone provide a clear explanation of exactly what the gitpkgv class
> does and why it is needed? Furthermore, does oe-core provide something that
> could be used? It is clear that ther eis a desire for something like this in
> two layers, and that makes it a candidate for oe-core.

well oe-core does not have this functionality and it works in most
cases and 'most cases' is a problem
to get it accepted in oe-core. Its a good feature where it provides a
good incremental version from the maze of
git SHA ids. That part is good however there is another variable it
provides which is GITPKGVTAG
that relies on the tags to be incrementally sortable which is broken
since tags are arbitrary
and systemd uses GITPKGVTAG

I think I can defend GITPKGV but GITPKGVTAG will have unanswered
questions. ideally bitbake fetcher
should provide this functionality

>
> Symlinking stuff across layers is just wrong. The underlying issue has to be
> resolved.

I am in agreement. here its deemed to be a short term solution so lets
live with it


