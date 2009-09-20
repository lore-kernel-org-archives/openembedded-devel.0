Received: from [74.125.92.150] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MpNwN-0004VZ-4L
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Sep 2009 17:03:06 +0200
Received: by qw-out-1920.google.com with SMTP id 4so738835qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Sep 2009 08:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=2DstZ4znjhLPzWhi61f8eDxZHFpkJPW6ekSw1paiBiA=;
	b=dkme2JIMy+Dn55uTuOym2GgxgippJsVaacOWJDRqdkGOfQ+LF2cki9yNjH0laf/IwM
	prRXjAawuA0m4IsU65pCxxaJObF/U97L2M1fLkKRtvsJ2X4dpuTnM8NvyemXTcxRJdGe
	M+B3+7HumVl++X37X0PNSP/JNxFRjxVjIQ2Gg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=V3LApTQXn8/V6SfuBGS+1geqsyDghn2sNA5yXKOCEJfJFnfWRBU8l7oaS21n+H9Ozy
	8Z6j5FCibPKIXdAhPaRF5C2gAX4bERzw4u3D+Al+U+SQUzfKf2IB+CqzbLoJc1xyoLiX
	PZBkZawTtiNNeRm9RKVrFqIMHRG9eChJupK0Q=
MIME-Version: 1.0
Received: by 10.229.13.7 with SMTP id z7mr883060qcz.96.1253458949049; Sun, 20 
	Sep 2009 08:02:29 -0700 (PDT)
In-Reply-To: <4AB5FF42.30204@iki.fi>
References: <4AB5FF42.30204@iki.fi>
Date: Sun, 20 Sep 2009 08:02:29 -0700
Message-ID: <19c1b8a90909200802j51495480w445a5cee301ae4a7@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.150
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] strace: Update to 4.5.18
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
X-List-Received-Date: Sun, 20 Sep 2009 15:03:06 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Sep 20, 2009 at 3:09 AM, Aleksandr Koltsoff <czr@iki.fi> wrote:
> Please note that only ARM (arm and thumb) has received testing. For this
> reason DEFAULT_PREFERENCE is set to -1.
>
> --
> Signed-off-by: Aleksandr Koltsoff <czr@iki.fi>
>
>

somehow the patch does not appear inline. anyway here are few comments.

PR is r0 to start with you set it to r1

comment should be only tested on arm

you comment out
DEFAULT_PREFERENCE_arm = "1"
so probably you intended to make it default on arm.



>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


