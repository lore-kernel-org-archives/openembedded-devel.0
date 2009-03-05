Received: from [209.85.220.167] (helo=mail-fx0-f167.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1LfAm1-0008Fj-UU
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Mar 2009 11:25:57 +0100
Received: by fxm11 with SMTP id 11so3165402fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2009 02:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=lw7wZ6DOotc+n7yvhkD3qg0qQt8DjCY+PRGNhDvAT4c=;
	b=X+NVmG/0mdzva8l3VfmumQb+ffdRgj+/RyZAgl9Wz1+BQx4+OhuiUWGmXjat8Nr03y
	+nw9Ue7YGUwGmC1yVMRulvmuVpepLorjUFQHgxaxg7UkP6qLAvSccYB6Z/loxPJosKrY
	juw5kqgGqpLcQ6/ytWC0wbV7j5vvitNwzqBSI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=cJG8WUCGoykQTPYRvC+HLpt4F57qvWoYZNIo+ywsrkxBfSwcd6PpTZvUCretQzBTIl
	R1O5kXxA3USxHjdfD/pXZGYLWP0suACWynN63d/0qMcYymnY6hxGMyPDEs1p9tAzA2dZ
	QsdRPj5/tr1f5M9maRoNlrGFubwXFozPJSFsU=
Received: by 10.223.114.208 with SMTP id f16mr772182faq.91.1236248493243;
	Thu, 05 Mar 2009 02:21:33 -0800 (PST)
Received: from s42.loc (85-127-157-236.dynamic.xdsl-line.inode.at
	[85.127.157.236])
	by mx.google.com with ESMTPS id k29sm7224004fkk.36.2009.03.05.02.21.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 05 Mar 2009 02:21:32 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1LfAhz-0003fF-6Z; Thu, 05 Mar 2009 11:21:43 +0100
Date: Thu, 5 Mar 2009 11:21:43 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090305102143.GB13650@mx.loc>
References: <20090304235032.GA29159@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20090304235032.GA29159@gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] Make coreutils 6.x+ install utility to honor	STRIP env variable
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
X-List-Received-Date: Thu, 05 Mar 2009 10:26:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 04, 2009 at 03:50:32PM -0800, Khem Raj wrote:
>Hi
>
>As reported in bug 5052 and also on irc, install calls strip directly. We should make it use STRIP
>env variable which is set to <cross-strip> in OE env.
>
>This is a patch which does that
>
>OK for .dev ?
>
>Thx
>-Khem
>
>

>Index: coreutils-6.0/src/install.c
>===================================================================
>--- coreutils-6.0.orig/src/install.c	2009-03-04 15:37:45.000000000 -0800
>+++ coreutils-6.0/src/install.c	2009-03-04 15:38:57.000000000 -0800
>@@ -526,7 +526,14 @@
> strip (char const *name)
> {
>   int status;
>-  pid_t pid = fork ();
>+  pid_t pid;
>+  char *strip_name;
>+
>+  strip_name = getenv ("STRIP");
>+  if (strip_name == NULL)
>+    strip_name = "strip";
>+
>+  pid = fork ();
> 
>   switch (pid)
>     {
>@@ -534,7 +541,7 @@
>       error (EXIT_FAILURE, errno, _("fork system call failed"));
>       break;
>     case 0:			/* Child. */
>-      execlp ("strip", "strip", name, NULL);
>+      execlp (strip_name, "strip", name, NULL);

perhaps it would be nicer to use the basename of strip_name instead of
hardcoding "strip" ?

>       error (EXIT_FAILURE, errno, _("cannot run strip"));

indicating the actual binary that failed may be nice, too.

My install(1) uses STRIPCMD and STRIPARGS, I suggest you add a way
to pass additional arguments to that strip, too.
Just a thought..
>       break;
>     default:			/* Parent. */


