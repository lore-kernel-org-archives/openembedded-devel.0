Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1ORRSR-0001BS-T6
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 17:01:47 +0200
Received: by fxm1 with SMTP id 1so1227313fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jun 2010 07:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Jq5YawW1U+gkBka4jkl6UVjHEvCacW8+8gUnLCQmUvs=;
	b=idd8KxB4ek+5t7D3R7+Fh+S3yxijImcrsKJoQWU92CFo/rVRKxfJWrfTl45WasethL
	i6kbbvgrqGE3VyHC1g5Tj/X67jkYwXtBpuSVnhfOss3JR+XGvAvwEQPEweO4hbM7SIE4
	iIHebQROzfWuMfGTAMHwCKxbHn/cz8rDYn28Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=fSTHXjAKMlAVVvShxoN83rioNxZYnwX7HUvFad2MiCrt/Ccca52+sBmivx3j4UFdIb
	hiActKndmYPIxEK8MwuVlTMsuqzCUV+4/8mNRUpscM/0sMH2Sgqs8S6+ihFetWduVTaC
	dGnYr48QTAv4hwW1ieqZWza6rjGKUGD5hDFGM=
MIME-Version: 1.0
Received: by 10.239.187.205 with SMTP id m13mr559293hbh.44.1277305025700; Wed, 
	23 Jun 2010 07:57:05 -0700 (PDT)
Received: by 10.239.182.83 with HTTP; Wed, 23 Jun 2010 07:57:05 -0700 (PDT)
In-Reply-To: <4C221A64.1020002@jak.nl>
References: <4C221A64.1020002@jak.nl>
Date: Wed, 23 Jun 2010 07:57:05 -0700
Message-ID: <AANLkTikxjC0tXsg2Tz0ilTykFtmhBN7qm5GHMl3HixVK@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: DISTRO=Angstrom on i686-generic build failure on base-image
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
X-List-Received-Date: Wed, 23 Jun 2010 15:01:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

I keep erroring out on the same thing currently.



On Wed, Jun 23, 2010 at 7:29 AM, Arjan <arjan@jak.nl> wrote:

> Hello all,
>
> I'm new here, so maybe this is a known issue. But I couln't find the
> solution.
>
> Building  the 'base-image' using:
>
> DISTRO   = "angstrom-2008.1"
> MACHINE ?= "i686-generic"
> this error occurs:
>
>  | checking for cups-config... /usr/bin/cups-config
>> | checking cups/cups.h usability... no
>> | checking cups/cups.h presence... no
>> | checking for cups/cups.h... no
>> | configure: error: *** Sorry, cups-config present but cups/cups.h
>> missing.
>> | ERROR: Function do_configure failed
>> NOTE: package gtk+-native-2.20.0-r8.0: task do_configure: Failed
>> ERROR: TaskFailed event exception, aborting
>> ERROR: Build of
>> virtual:native:/media/disk/prj/alcons/angstrom/sources/openembedded/recipes/gtk+/gtk+_
>> 2.20.0.bb do_configure failed
>> ERROR: Task 2060
>> (virtual:native:/media/disk/prj/alcons/angstrom/sources/openembedded/recipes/gtk+/gtk+_
>> 2.20.0.bb, do_configure) failed with 256
>> ERROR:
>> 'virtual:native:/media/disk/prj/alcons/angstrom/sources/openembedded/recipes/gtk+/gtk+_
>> 2.20.0.bb' failed
>>
>>
>
> Anybody any ideas?
>
> Thanks.
> Arjan
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

