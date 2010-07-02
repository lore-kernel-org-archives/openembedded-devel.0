Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OUprz-0004Ub-Vv
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Jul 2010 01:42:10 +0200
Received: by iwn34 with SMTP id 34so3818391iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Jul 2010 16:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=f/tWbtJOFRJxl0/pqH8HWSe+8Z3+ODj9rRobqfm124Q=;
	b=lNSEwkh3bHC6a4me09qvfx5sV6RGgfzAlVCuOXAy7jvVV6g7RetHZHcHnop8GPIUy4
	ISIP963M8jlapPtFzh9MC6m4QzuTrAyaiEqwludv7LVHS3v89b3IgYU1Dq22awqDqSPB
	qqGVzWOT1Dz+HnPc8vMQ36ojTNYE8ekeUYIrE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=eAL+BfAu5ZtHnoWkn2EigjNBMa+SrWQqvtLRHHz3H7+xznVyLLtvYfdVonS27KLF+D
	SpiAc8keVBE6ue1hn5teJYeTVgmwQMjtpYVQ5BLZ76VWcEkg33SRe7p76Mx1Od+mLFIu
	9GGLPjB13Rfyl/aYxyeJC6BKH/a8hzZAblqp4=
Received: by 10.231.167.146 with SMTP id q18mr1595244iby.108.1278113842976; 
	Fri, 02 Jul 2010 16:37:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Fri, 2 Jul 2010 16:37:02 -0700 (PDT)
In-Reply-To: <411868D6-A821-4909-9F5B-6323EE7F9802@keylevel.com>
References: <59209027-3666-426D-9085-D9F6647B07D5@keylevel.com> 
	<AANLkTin42ODhDbRm0CBbFVT5DtFJVCyTqfg1f0VakNEb@mail.gmail.com> 
	<411868D6-A821-4909-9F5B-6323EE7F9802@keylevel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 2 Jul 2010 16:37:02 -0700
Message-ID: <AANLkTimhN1fFCIyJK_G8WWGR903UqjtLZsXOzM6LRU4I@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: 'Generic' x86 build
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
X-List-Received-Date: Fri, 02 Jul 2010 23:42:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jul 2, 2010 at 4:18 PM, Chris Tapp <dokuwiki@keylevel.com> wrote:
>> how about MACHINE=i686-generic or MACHINE=i586-generic
>> distro could be angstrom or minimal.
>
> Thanks - Not sure how I managed to miss that one!
>
> Anyway, I've tried i586-generic / minimal for console-image.
>
> - The inittab file included in the rootfs isn't valid for busybox;
> - The 'swapper' process is using 100% cpu after the system has booted and
> it's doing nothing.
>
> Does anyone else have this, or is it just me?

if someone had, he would have spoken by now. I guess
you need to debug it. swapper is a kernel process.
probably your systems has all memory eaten up
or there are lot of background processes.

>
> Chris
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


