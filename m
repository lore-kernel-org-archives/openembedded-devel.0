Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OHMuJ-0000s8-Ob
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 22:09:03 +0200
Received: by pvc30 with SMTP id 30so1230003pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 May 2010 13:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=6g/pRI4uXx1tI7GxPoRQ9dZHapkMb/xz/TsOZnMRO0c=;
	b=JnJ5UeLNeJg3GUsgU/ykmL1BfQel3qtQCPpg4dECNTcknbwb4Rm9w2tB9uRi0zIm0Y
	I1pBsf8y2h31I07+vNTAPAggysz5L0JCvHFsrgX+DOhqnrjKM/XfZ0bkU1NIbkfYMdXK
	hfQeaeHN8FYDAscbcICIgnpv4ohxClhSDVbCY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=aa9OW7kw79LdjiI+B6hSf4rSXgYF77Cnn9Z3FA5pE4rda2fVh5+a5ycndmcARh5+Wb
	s+/lzl6vJF6wfr7Op7do6xzYFNpSTAQDqalT0fsBJNKvZF2/u+g4tFjj/aLlD9nBif6S
	eEra1HWOFsIhAY1EzY5h5IZQs79d0TF4Of/4s=
Received: by 10.140.56.1 with SMTP id e1mr7075881rva.136.1274904282709;
	Wed, 26 May 2010 13:04:42 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id h11sm361710rvm.9.2010.05.26.13.04.39
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 May 2010 13:04:40 -0700 (PDT)
Date: Wed, 26 May 2010 13:04:27 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100526200427.GA10091@gmail.com>
References: <AANLkTikfszFRLw6Ct-aEAUcu1xs8hRLdQRROW8OswCb7@mail.gmail.com>
	<hso7fa$2lh$2@dough.gmane.org>
	<AANLkTilux_HTutdHJZKh7hipzViaahkx7OtLOI6RFaVj@mail.gmail.com>
	<20100517214019.GA8515@gmail.com>
	<AANLkTimBQd3eDm165D0SEIE8HVyQ-QI_RD3KLpMBhGCR@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimBQd3eDm165D0SEIE8HVyQ-QI_RD3KLpMBhGCR@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add cgreen. Library to do unit test for C language
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
X-List-Received-Date: Wed, 26 May 2010 20:09:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (23/05/10 15:49), João Henrique Freitas wrote:
> Hi,
> 
> Attached a unique patch.

You could have used git send-email to send your patches. I could not pull
them from patchwork or mbox verbatim. Anyway after applying bitbake cgreen
and it ends up like below

RROR: Function do_configure failed
NOTE: Task failed: ('function do_configure failed',
'/scratch/oe/work/armv5te-oe-linux-gnueabi/cgreen-svn-r0.0/temp/log.do_configure.29618')
ERROR: Logfile of failure stored in:
/scratch/oe/work/armv5te-oe-linux-gnueabi/cgreen-svn-r0.0/temp/log.do_configure.29618
Log data follows:
| -- The C compiler identification is GNU
| -- Check for working C compiler:
/scratch/oe/cross/armv5te/bin/arm-oe-linux-gnueabi-gcc
| -- Check for working C compiler:
/scratch/oe/cross/armv5te/bin/arm-oe-linux-gnueabi-gcc -- works
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Performing Test WITH_FPIC
| -- Performing Test WITH_FPIC - Success
| -- Performing Test WITH_STACK_PROTECTOR
| -- Performing Test WITH_STACK_PROTECTOR - Success
| -- Performing Test WITH_FORTIFY_SOURCE
| -- Performing Test WITH_FORTIFY_SOURCE - Success
| -- FLEX was not found.
| -- Configuring done
| CMake Error in src/CMakeLists.txt:
|   Cannot find source file "collector.c".  Tried extensions .c .C .c++ .cc
|   .cpp .cxx .m .M .mm .h .hh .h++ .hm .hpp .hxx .in .txx
| 


it could not find FLEX.

Thx
-Khem


