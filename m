Received: from [209.85.200.170] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lf1r6-0004pq-FY
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Mar 2009 01:54:47 +0100
Received: by wf-out-1314.google.com with SMTP id 28so4342575wff.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2009 16:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=ERdIQwWVd3febW4aE900xRkrfQtNhnxptgLC85qVm5I=;
	b=Mn6WxJHVhFkiANnRVNPcK3tB217XnRhqgtYI2PPOiAsJkhJL83IcrX+uJt4gL4v2Mr
	qIYomhpgRdtOOtMwdjlPYbD5gtmfdaxnwkAWAMiOLDSZLF/Cik4cOaWKLoLFy9ppemHF
	wlK12i8lrLTHZW8t65tkhc02iP+oOYE5PJu6A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=drW15iuyF7byhCBZ+AQxNmJ/zLKItFprJWNGH69SHGpqquPFOznGYlFbYm/ndF0VoZ
	uHNxB996HcIZD8mcpyKzSxC6I8J4qsE70R0qWhWVPK94f2K3gPTlo9QJ0PGJc5JFDau/
	OvR2h0MPwSmTnvUEDAnwFtdgXqqu3KYWYGWAQ=
Received: by 10.142.102.5 with SMTP id z5mr214887wfb.334.1236214216721;
	Wed, 04 Mar 2009 16:50:16 -0800 (PST)
Received: from gmail.com (adsl-71-146-1-99.dsl.pltn13.sbcglobal.net
	[71.146.1.99])
	by mx.google.com with ESMTPS id 30sm4180755wfa.18.2009.03.04.16.50.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Mar 2009 16:50:16 -0800 (PST)
Date: Wed, 4 Mar 2009 16:50:13 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090305005013.GB9605@gmail.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Subject: [PATCH] Replace siginterrupt () in gnutls
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
X-List-Received-Date: Thu, 05 Mar 2009 00:55:19 -0000
X-Groupsio-MsgNum: 8253
Content-Type: multipart/mixed; boundary="oyUTqETQ0mS9luUI"
Content-Disposition: inline

--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi 

This patch replace use of siginterrupt () by sigaction as reccommended
on opengroup docs

http://www.opengroup.org/onlinepubs/000095399/functions/siginterrupt.html

uclibc have conditionalized this function as SUSV4_LEGACY. I could have
enabled this option but I chose to fix gnutls

OK for .dev

Thx

-Khem


--oyUTqETQ0mS9luUI
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="gnutls-replace-siginterrupt.patch"

Index: gnutls-2.4.2/src/tests.c
===================================================================
--- gnutls-2.4.2.orig/src/tests.c	2008-09-15 13:04:19.000000000 -0700
+++ gnutls-2.4.2/src/tests.c	2009-03-04 15:25:09.000000000 -0800
@@ -491,6 +491,7 @@
   int old, secs = 6;
 
 #ifndef _WIN32
+  struct sigaction act;
   signal (SIGALRM, got_alarm);
 #endif
 
@@ -511,7 +512,9 @@
     return TEST_FAILED;
 
 #ifndef _WIN32
-  old = siginterrupt (SIGALRM, 1);
+  (void) sigaction(SIGALRM, NULL, &act);
+  act.sa_flags &= ~SA_RESTART;
+  old = sigaction(SIGALRM, &act, NULL);
   alarm (secs);
 #else
   setsockopt ((int)gnutls_transport_get_ptr (session), SOL_SOCKET, SO_RCVTIMEO,
@@ -525,7 +528,12 @@
   while (ret > 0);
 
 #ifndef _WIN32
-  siginterrupt (SIGALRM, old);
+  (void) sigaction(SIGALRM, NULL, &act);
+  if (old)
+    act.sa_flags &= ~SA_RESTART;
+  else
+    act.sa_flags |= SA_RESTART;
+  sigaction(SIGALRM, &act, NULL);
 #else
   if (WSAGetLastError () == WSAETIMEDOUT ||
       WSAGetLastError () == WSAECONNABORTED)

--oyUTqETQ0mS9luUI--
