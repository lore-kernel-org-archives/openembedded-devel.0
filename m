Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tracker.indexer@gmail.com>) id 1R49F4-0000nv-R1
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 12:32:26 +0200
Received: by wwf10 with SMTP id 10so5170100wwf.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2011 03:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=D1Xj2fIoX6sISvQtVjQ1tQn5eqveIVl08ydBRD594FU=;
	b=WAAblbwz9nvrgm7zjDf5tUP5asxYJ99l1HqR8oh7qtwTsyFKE5h1OjU5KT3Z6Aor/i
	S/t+LLLsPQNcOaKBQNHqPGL2s2BZ3GHqrkxP2pPB2jOPqUdyHm25ucDTqA+d/9AV/DWk
	FbA1jImK90e1G85U7LoL2vFc1lUaa43as7n10=
MIME-Version: 1.0
Received: by 10.227.154.66 with SMTP id n2mr1034374wbw.3.1316082435590; Thu,
	15 Sep 2011 03:27:15 -0700 (PDT)
Received: by 10.180.101.131 with HTTP; Thu, 15 Sep 2011 03:27:15 -0700 (PDT)
Date: Thu, 15 Sep 2011 15:57:15 +0530
Message-ID: <CA+QZjQMK8r8pwKAAmMbaxo0o+5YY3Fyn0vd6mZAFTxwOm4CP0A@mail.gmail.com>
From: John stacy <tracker.indexer@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: glib-2.0 iconv support configure error
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
X-List-Received-Date: Thu, 15 Sep 2011 10:32:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Team,

I am using glib-2.0 using the bitbake file glib-2.0_2.28.0.bb

I have the eglibc enabled with the ICONV support.

Now if I add another EXTRA_CONF option "with-libiconv=native", I am getting
configuration error.

It says libc do not installed with ICONV option and I dont want to use the
libiconv library as my eglibc already has the iconv support.

 checking for i686-pc-linux-gnu-pkg-config... no
| checking for pkg-config...
/home/prafulla/Perforce/tmp/sysroots/i686-linux/usr/bin/pkg-config
| configure: WARNING: using cross tools not prefixed with host triplet
| checking pkg-config is at least version 0.16... yes
| checking for gawk... (cached) gawk
| checking for perl5... no
| checking for perl... perl
| checking for indent... no
| checking for perl...
/home/prafulla/Perforce/tmp/sysroots/i686-linux/usr/bin/perl
| checking for a Python interpreter with version >= 2.4... python
| checking for python... /usr/bin/python
| checking for python version... 2.6
| checking for python platform... linux2
| checking for python script directory...
${prefix}/lib/python2.6/dist-packages
| checking for python extension module directory...
${exec_prefix}/lib/python2.6/dist-packages
| checking for iconv_open in -liconv... no
*| configure: error: *** No iconv() implementation found in C library or
libiconv*
NOTE: package glib-2.0-2.28.0-r1: task do_configure: Failed
ERROR: Function 'do_configure' failed (see
/home/prafulla/Perforce/tmp/work/i686-pc-linux-gnu/glib-2.0-2.28.0-r1/temp/log.do_configure.15989
for further information)
ERROR: Task 10 (/home/prafulla/Perforce/pkg-oss/glib-2.0/glib-2.0_2.28.0.bb,
do_configure) failed with exit code '1'
ERROR: '/home/prafulla/Perforce/pkg-oss/glib-2.0/glib-2.0_2.28.0.bb' failed


To fetch this information correctly, Do I have to provide any extra options
to bitbake?
Could some throw some light on this one?

Thanks,
John

