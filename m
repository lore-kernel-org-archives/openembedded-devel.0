Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KPFrD-0001Zt-Aw
	for openembedded-devel@openembedded.org; Sat, 02 Aug 2008 14:05:11 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KPFpM-0001an-31
	for openembedded-devel@openembedded.org; Sat, 02 Aug 2008 12:03:16 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 02 Aug 2008 12:03:16 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 02 Aug 2008 12:03:16 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 02 Aug 2008 14:03:08 +0200
Message-ID: <g71idt$s09$1@ger.gmane.org>
References: <1216087105.10214.7.camel@isis>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird/3.0a2pre (Macintosh; 2008071203)
In-Reply-To: <1216087105.10214.7.camel@isis>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC]: Toolchain build sequence alteration.
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
X-List-Received-Date: Sat, 02 Aug 2008 12:05:11 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
  Currently we do
>
> cross-binutils ->  kernel-headers ->  uclibc-headers ->  cross-gcc
> (--disable-shared) ->  uclibc ->  cross-gcc
>
> I think this can be improved and I implemented the following steps.
>
> cross-binutils ->  cross-gcc (--disable-shared) ->  kernel-headers ->
> eglibc/glibc/uclibc headers + startup files + dummy libc.so ->  cross-gcc
> (--enable-shared) ->  glibc/eglibc/uclibc ->  cross-gcc

As we've noticed this breaks the iconv modules from glibc since they get 
a NEEDED entry for /lib/libc.so (which in in libc6-dev) instead of 
/lib/libc.so.6 (which in is libc6). You attempted to fix this with:

--- a/packages/gcc/gcc-cross-intermediate.inc
+++ b/packages/gcc/gcc-cross-intermediate.inc
@@ -16,6 +16,13 @@ EXTRA_OECONF = "--with-local-

+do_stage_prepend () {
+	# get rid of dummy libc.so
+	if [ -z "`file ${STAGING_DIR_TARGET}${layout_libdir}/libc.so | grep 
"ASCII C program text"`" ]; then
+		rm -rf ${STAGING_DIR_TARGET}${layout_libdir}/libc.so
+	fi
+}

That breaks building a toolchain from scratch with "cannot find -lc" 
during glibc-cross-intermediate staging. So I committed this:

--- a/packages/gcc/gcc-cross-intermediate.inc
+++ b/packages/gcc/gcc-cross-intermediate.inc
@@ -16,7 +16,7 @@ EXTRA_OECONF = "--with-local-

-do_stage_prepend () {
+do_stage_append () {
  	# get rid of dummy libc.so

This fixes builds from scratch for me (tried with armv5te and armv7a), 
but I haven't tested if it breaks iconv again since I value working 
builds over working iconv atm. I'm fairly sure it doesn't break iconv, 
because the bogus libc.so is gone before glibc gets built, but as I 
said, I haven't tested it.

regards,

Koen



