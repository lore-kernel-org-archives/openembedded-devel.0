Received: from mail-fx0-f209.google.com ([209.85.220.209])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NAjfN-0000ks-7N
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 13:29:48 +0100
Received: by fxm1 with SMTP id 1so1056541fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2009 04:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=O3ugvCI2oZDQ4gpFHJEDPqBPBd0q5aqJDTgYePPef/o=;
	b=M1wLHjDUly46w31NcalsvNKzt6OnWS1+SSJ50SD+aixfpx71LnCgUFOVRP9ccvvYbi
	hTnxvACoEjJsQtp0rqfjK5yShb0ENZ7pEauQqiUVuapBpJtVKTcR6jBWGdmeYNrEOsm5
	1sdjCVE6qY1qK957mtmMoTQd1C8jPVTpJ0QvY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=HQTgYwijKJbH7a2UfUuGcZUqbFncsDp3SmUuFOIuSTekYtuaRIllfcegJNA9fUQpnH
	9dUJZt8VA+X1xlUC0iOTn8gB2/V2Jpq6l67LLpWCUBGv0Hj3rYf+2ewG26A8/Vrwygfn
	f1pyL97YyCWkCAmjqs0sfEHEVb13+d9s2mW6g=
Received: by 10.204.155.73 with SMTP id r9mr67308bkw.14.1258547299493;
	Wed, 18 Nov 2009 04:28:19 -0800 (PST)
Received: from s42.loc (85-127-251-67.dynamic.xdsl-line.inode.at
	[85.127.251.67])
	by mx.google.com with ESMTPS id 15sm1528bwz.8.2009.11.18.04.28.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 18 Nov 2009 04:28:18 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NAjfp-0001xd-08; Wed, 18 Nov 2009 13:30:13 +0100
Date: Wed, 18 Nov 2009 13:30:12 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091118123012.GD2919@mx.loc>
References: <he0ijk$kqa$2@ger.gmane.org> <20091118114113.GC2919@mx.loc>
	<c384c5ea0911180344u7aa5a29ao71528ff23547643e@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <c384c5ea0911180344u7aa5a29ao71528ff23547643e@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.209
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert of 406cd0fee12ad99ba6d6f7d55f743cc4c6697955
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
X-List-Received-Date: Wed, 18 Nov 2009 12:29:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 18, 2009 at 12:44:39PM +0100, Leon Woestenberg wrote:
>Hello Bernhard,
>
>On Wed, Nov 18, 2009 at 12:41 PM, Bernhard Reutner-Fischer
><rep.dot.nop@gmail.com> wrote:
>> On Wed, Nov 18, 2009 at 11:34:28AM +0100, Koen Kooi wrote:
>>>Hi,
>>>
>>>Since 406cd0fee12ad99ba6d6f7d55f743cc4c6697955 broke all
>>>glibc-internal-iconv builds and I'm too lazy/stupid to fix it
>>>properly for uclibc I reverted this commit.
>>
>> for unpatched uClibc you could just
>> TARGET_CPPFLAGS += -D_Exit=_exit
>>
>Thanks, and what's the patched uClibc alternative (and where's the
>patch)? It defines _Exit()?

I suggest to just #define it to _exit, yes.
(glibc has it as weak alias but i'd prefer to get away with a define),
like:

_Exit(): define to _exit()

Signed-off-by: Bernhard Reutner-Fischer <me>
---
 include/stdlib.h |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/include/stdlib.h b/include/stdlib.h
index e462c1c..c993f8f 100644
--- a/include/stdlib.h
+++ b/include/stdlib.h
@@ -545,12 +545,14 @@ extern void exit (int __status) __THROW
__attribute__ ((__noreturn__));
 libc_hidden_proto(exit)
 __END_NAMESPACE_STD
 
-#ifdef __USE_ISOC99
+#if 0 /* def __USE_ISOC99 */
 __BEGIN_NAMESPACE_C99
 /* Terminate the program with STATUS without calling any of the
    functions registered with `atexit' or `on_exit'.  */
 extern void _Exit (int __status) __THROW __attribute__
((__noreturn__));
 __END_NAMESPACE_C99
+#else
+# define _Exit _exit
 #endif
 
 
-- 
1.6.5.2


