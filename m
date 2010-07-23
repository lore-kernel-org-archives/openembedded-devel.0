Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1OcEfd-0000qa-Qq
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 11:36:00 +0200
Received: by fxm12 with SMTP id 12so4971493fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 02:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=OPjFFwwFm2m8gZO4ICQuML70YQ+SrGKV6b7rE4wt7aw=;
	b=Yxs4fTDJRFT8boUiJfmq2rXTCznMb1g1D232gvVG75/2Ayn/9gt3+zETYw23HBN8Mp
	wlyFAGFPt1auh/KkS8Mt6reOqRQBii5vPQZU4ptvBQBey9AZcjUfRa/sn4pEbgA5vQDj
	rSdkERUcS19H9jg/rx+q+pkhfWmwEaJnSvYX8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=B+VbQN02Vu2Tw1dYh+ZaBajx1qNWYqtqSERsschZZM6Vs1BGTR9ax/KawUb4pwpWr+
	Kc0HW1Tsz3FZN2Vp7zXWvlupR1BqPBNid/d4yqQjAWJ7ORiuKfWgEcK+NSr+YF3Z8v1N
	FRs2uWWq7cLquqOPsoqFSR+xoXETf7jZiHGzI=
MIME-Version: 1.0
Received: by 10.239.163.143 with SMTP id p15mr168222hbd.158.1279877745104; 
	Fri, 23 Jul 2010 02:35:45 -0700 (PDT)
Received: by 10.239.181.207 with HTTP; Fri, 23 Jul 2010 02:35:45 -0700 (PDT)
In-Reply-To: <1279875548.13006.32.camel@rex>
References: <1279735486-7050-1-git-send-email-raj.khem@gmail.com>
	<i2bg5t$mvp$1@dough.gmane.org>
	<1279872152.21888.149.camel@lenovo.internal.reciva.com>
	<i2bir6$un3$1@dough.gmane.org> <1279875548.13006.32.camel@rex>
Date: Fri, 23 Jul 2010 11:35:45 +0200
Message-ID: <AANLkTik8CaoY=od-BH7_ymJf1Yet5e-cJGJ3PFyPm42N@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: esbenhaabendal@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/4][RFC] Remove CROSS_DIR, install cross-packages 	into native sysroot
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
X-List-Received-Date: Fri, 23 Jul 2010 09:36:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jul 23, 2010 at 10:59 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Fri, 2010-07-23 at 10:11 +0200, Koen Kooi wrote:
>> It's all 'arm-angstrom-foo', I was just about to make the suggestion to
>> change it to 'armv7a-angstrom-foo' :)
>
> I've just been talking to Koen about this. When building for armv7a,
> TARGET_ARCH which goes into TARGET_PREFIX and TARGET_SYS is "arm".
>
> I suspect if we change TARGET_ARCH to be armv7a, nasty things will
> happen but I could be wrong.

config.sub will generally not accept something like armv7a-*

If OE had not offered the vendor part of the arch strings to distros,
it could have
been solved by (in this case) using arm-v7a-foo ...

/Esben


