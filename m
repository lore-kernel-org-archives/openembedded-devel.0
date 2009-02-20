Received: from [74.125.92.148] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LaTWg-0004Xs-1r
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Feb 2009 12:27:12 +0100
Received: by qw-out-1920.google.com with SMTP id 5so237896qwf.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Feb 2009 03:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type;
	bh=ag7qgWWIjJk2/+QReEg3U1u4o+XT/pwHGB7WDmSv6us=;
	b=Nyq0HdPVmdUIGqh87/1jxxaOlV9car0WCcb3NAidSq2keHupMSnCg0t4evq9vbF5Tr
	kSxbRZl2gZTNg4Ncbfh5bknFbHHVmfCRZSGuWSR+YFnZVqQ+gyXIFyJziUAap6aZqRDI
	Oo12/RA9Z6vfjgn8X9RIJHjqiCinl5DRkV35w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type;
	b=Qopnu9mLLBGSQfDVg5rjMss+nB6zFTXQPPaz0Pty+hyQXaFf3eHRd9dHXTEszU18F6
	8L4M1jWa8xZukUki3GesoOIq2CnVQt4JQLxEsPTQruuilN9wYGx5CY4IWCb4niBDIybH
	nqRmpju5TXNFCyEVZwhF9xvN4L5iXrwHx+WF8=
Received: by 10.224.54.146 with SMTP id q18mr1144154qag.217.1235129052186;
	Fri, 20 Feb 2009 03:24:12 -0800 (PST)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 26sm1845115qwa.32.2009.02.20.03.24.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 20 Feb 2009 03:24:11 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 646A7610047; Fri, 20 Feb 2009 08:24:06 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <1235086132-21843-1-git-send-email-clarson@kergoth.com>
	<20090219234114.GD22652@denix.org>
	<b6ebd0a50902191627x48e60175o8f3e20e0a0bf2104@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.90 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Fri, 20 Feb 2009 08:24:06 -0300
In-Reply-To: <b6ebd0a50902191627x48e60175o8f3e20e0a0bf2104@mail.gmail.com>
	(Chris Larson's message of "Thu, 19 Feb 2009 17:27:34 -0700")
Message-ID: <87hc2ps65l.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Cc: Chris Larson <clarson@mvista.com>
Subject: Re: [PATCH] bitbake.conf: rework FILESPATH generation.
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
X-List-Received-Date: Fri, 20 Feb 2009 11:28:08 -0000
Content-Type: text/plain; charset=us-ascii

Chris Larson <clarson@kergoth.com> writes:

> Heh, already sent this reply out, but from the wrong email address.
> This time it should actually hit the list...
>
> On Thu, Feb 19, 2009 at 4:41 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>> On Thu, Feb 19, 2009 at 04:28:52PM -0700, Chris Larson wrote:
>>> From: Chris Larson <clarson@mvista.com>
>>>
>>> Rework FILESPATH generation to be done in bitbake.conf, avoiding the
>>> confusion about it being in multiple places.  Adds FILESPATHBASE and
>>> FILESPATHPKG which can be manipulated rather than manipulating FILESPATH
>>> directly.
>>>
>>> One usage possibility:
>>>
>>> FILESPATHBASE =. "${TOPDIR}/files:"
>>>
>>> Which would let me provide a custom busybox config for this build by
>>> copying the defconfig from the openembedded metadata into my
>>> build/files/busybox-1.0/ directory, for example.
>>
>> Can you please provide more details on this example? Thanks.
>
> Normally, all paths in FILESPATH are relative to FILE_DIRNAME, the
> location of the recipe being operated against.  With this change, you
> can place files which are in SRC_URI as file:// urls in paths relative
> to other locations.
>
> You can do package customizations via changes to file:// files without
> mucking up the local clone of the openembedded repository.
>
> My intent is to create a class to facilitate running make menuconfig
> on your kernel and busybox, and retain those changes.  Today, people
> either go into workdir and customize it there, but those changes are
> lost when you clean the package, or they overwrite files in the
> metadata repository, which can lead to conflicts, and is just all
> around more annoying to work with.  It's better to be able to have per
> build or site wide overrides of those files.

I second it; specially the "make menuconfig" feature :-)

I lose a kernel config yestarday by mistake due this :P

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


