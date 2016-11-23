Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id 596A471AC0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 18:36:15 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20161123183611185_0485
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 18:36:11 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-devel@lists.openembedded.org>
Received: from [174.118.92.171] (port=33230 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c9cOr-0006Vb-GV for openembedded-devel@lists.openembedded.org;
	Wed, 23 Nov 2016 13:36:05 -0500
Date: Wed, 23 Nov 2016 13:34:59 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1611231326510.15876@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: mozjs/unhandled signal 11/64k page patch/__powerpc64__ ???
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Nov 2016 18:36:16 -0000
Content-Type: text/plain; charset=US-ASCII


  i know nothing about this issue, i'm asking on behalf of a colleague
who has allegedly tracked down a bug in wind river linux, and
comparing sources, it *appears* the very same thing would happen in
OE.

  the symptom running "poweroff" in a qemuppc session;

... snip ...
polkitd[680]: unhandled signal 11 at 00000000 nip 0fa69198 lr 0fa69174code 30001
... snip ...

further investigation shows the very same thing happening with:

# systemctl start httpd
polkitd[680]: unhandled signal 11 at 00000000 nip 0fa69198 lr 0fa69174code 30001
Error getting authority: Error initializing authority: Error calling
StartServiceByName for org.freedesktop.PolicyKit1: Timeout was reached
(g-io-error-quark, 24)
Failed to start httpd.service: Connection timed out
#

  to make a long story short, said colleague followed bug reports and
ended up here:

https://bugzilla.redhat.com/show_bug.cgi?id=1289432

eventually, he got the problem to go away by tweaking the patch
"0005-aarch64-64k-page.patch" for mozjs with the following adjustment:

@@ -113,7 +113,7 @@ struct Cell
 #if defined(SOLARIS) && (defined(__sparc) || defined(__sparcv9))
 const size_t PageShift = 13;
 const size_t ArenaShift = PageShift;
-#elif defined(__powerpc__)
+#elif defined(__powerpc__) || defined(__aarch64__)
               ^^^^^^^^^^^ change that to __powerpc64__
 const size_t PageShift = 16;
 const size_t ArenaShift = 12;
 #else

  as my colleague reads it, the original patch above is necessary for
PPC64, but *breaks* PPC32. i haven't followed the logic, but does any
of this make sense? by making that change, the error went away and
things work fine.

  thoughts?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


