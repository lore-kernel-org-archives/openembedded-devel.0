Received: from [209.85.198.249] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1KIZwF-0000zi-DQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jul 2008 04:06:47 +0200
Received: by rv-out-0708.google.com with SMTP id f25so5854733rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2008 19:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:reply-to:to:cc
	:in-reply-to:references:content-type:date:message-id:mime-version
	:x-mailer:content-transfer-encoding;
	bh=lzaFAT0SJygduJLl3vLecJLmc2UVOaMgS2q8vCw1CXI=;
	b=QnDKHcAO01broXZYdmJdcB4CTZJOpgHefnpHo0rPkQ9tU8ULiXPGbdHpXqjjif7yvA
	hRgIl6wqZI37FNsdz0ydJsB5OHJ5Hx30/mgqBC3+6T8QrWvFDTRPjZEEdyBlA2vijk+N
	W7lsI5zfqzCPjRS1XVdandCp2g934FpFmftwU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:reply-to:to:cc:in-reply-to:references:content-type
	:date:message-id:mime-version:x-mailer:content-transfer-encoding;
	b=JK2E5r9U8pCWRrfkVGeiIdLZDyKXlF4Z/A+YEQq2n5IXLVg9+mqpLx4k8mq7h7aTtd
	jXy/H/hVxSW/bZtU6eHKvNhl4HiEho9yro/rZTO2gy5WzZwM1B+C9Bnfn+pUqFo/B0jg
	wahHPZBp/bDeC44MZwu91qJtTIGXTa/mn2ep8=
Received: by 10.141.176.6 with SMTP id d6mr7032605rvp.214.1216087573202;
	Mon, 14 Jul 2008 19:06:13 -0700 (PDT)
Received: from ?192.168.1.71? ( [71.146.10.255])
	by mx.google.com with ESMTPS id c20sm9558262rvf.1.2008.07.14.19.06.12
	(version=SSLv3 cipher=RC4-MD5); Mon, 14 Jul 2008 19:06:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <3972542e0807141258i256cab38kb2023270a0aa14e9@mail.gmail.com>
References: <3972542e0807141258i256cab38kb2023270a0aa14e9@mail.gmail.com>
Date: Mon, 14 Jul 2008 19:06:11 -0700
Message-Id: <1216087571.10214.10.camel@isis>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.2 
Cc: openembedded-devel@openembedded.org
Subject: Re: Strange header file error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 15 Jul 2008 02:06:48 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Mon, 2008-07-14 at 14:58 -0500, E Robertson wrote:
> Hi All,
> I'm trying to explain this pthread.h header file error.
> I include this header file in my program. The snip of interest is this:
> 
> #ifndef _PTHREAD_H
> #define _PTHREAD_H  1
> 
> #include <features.h>
> 
> #include <sched.h>
> #include <time.h>
> 
> #define __need_sigset_t
> #include <signal.h>
> #include <bits/pthreadtypes.h>
> #include <bits/initspin.h>
> 
> __BEGIN_DECLS
> 
> /* Initializers.  */
> 
> #define PTHREAD_MUTEX_INITIALIZER \
>   {0, 0, 0, PTHREAD_MUTEX_ADAPTIVE_NP, __LOCK_INITIALIZER}
> #ifdef __USE_GNU
> # define PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP \
>   {0, 0, 0, PTHREAD_MUTEX_RECURSIVE_NP, __LOCK_INITIALIZER}
> # define PTHREAD_ERRORCHECK_MUTEX_INITIALIZER_NP \
>   {0, 0, 0, PTHREAD_MUTEX_ERRORCHECK_NP, __LOCK_INITIALIZER}
> # define PTHREAD_ADAPTIVE_MUTEX_INITIALIZER_NP \
>   {0, 0, 0, PTHREAD_MUTEX_ADAPTIVE_NP, __LOCK_INITIALIZER}
> #endif
> 
> 
> This is included in another header file where I place some #ifdef
> statements for  _PTHREAD_H,
> PTHREAD_MUTEX_INITIALIZER, PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP, and
> __USE_GNU.
> I also defined __USE_GNU just before the header file and none of these
> are redefined anywhere else.
> 
> >From this I notice all these defines are valid and present _except_
> PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP.
> I haven't figured out why this is so wired I don't see any possible
> reason how this could be possible.
> Am I out of my mind here? Is this really possible? Unless my
> arm-uclibc is doing something strange, I don't see how this could be.
> Anyone seen this before?  Thanks much.
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




Its not clear from your email what you might be facing. You can
preprocess your source file with -E and see whats getting included

what happens when you use  -D_GNU_SOURCE ?

Thx

-Khem



