Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QWPnB-000402-Ua
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jun 2011 11:20:14 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>)
	id 1QWPju-00040N-Mz; Tue, 14 Jun 2011 11:16:50 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1308037783-31218-1-git-send-email-james@digitalmatter.com.au>
References: <1308037783-31218-1-git-send-email-james@digitalmatter.com.au>
Date: Tue, 14 Jun 2011 10:16:49 +0100
Message-ID: <1308043009.25285.219.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: James Limbouris <james@digitalmatter.com.au>
Subject: Re: [PATCH] prelink: Added prelink-20100106, which works on ARM.
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
X-List-Received-Date: Tue, 14 Jun 2011 09:20:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-14 at 15:49 +0800, James Limbouris wrote:
> This version of prelink, together with a patch by
> Carsten Munk <carsten@maemo.org>, taken from MeeGo,
> fixes an ARM incompatibility with 20090925.
> 
> Signed-off-by: James Limbouris <james@digitalmatter.com.au>
> ---
>  .../prelink-20100106-arm-fix.patch                 |   86 ++++++++++++++++++++
>  recipes/prelink/prelink_20100106.bb                |   53 ++++++++++++
>  2 files changed, 139 insertions(+), 0 deletions(-)
>  create mode 100755 recipes/prelink/prelink-20100106/prelink-20100106-arm-fix.patch
>  create mode 100644 recipes/prelink/prelink_20100106.bb
> 
> diff --git a/recipes/prelink/prelink-20100106/prelink-20100106-arm-fix.patch b/recipes/prelink/prelink-20100106/prelink-20100106-arm-fix.patch
> new file mode 100755
> index 0000000..a694541
> --- /dev/null
> +++ b/recipes/prelink/prelink-20100106/prelink-20100106-arm-fix.patch
> @@ -0,0 +1,86 @@
> +diff -ru prelink-old/src/arch-arm.c prelink/src/arch-arm.c
> +--- prelink-old/src/arch-arm.c	2009-06-15 07:37:50.000000000 -0400
> ++++ prelink/src/arch-arm.c	2010-08-17 03:35:05.000000000 -0400
> +@@ -832,7 +832,7 @@
> +   .R_COPY = R_ARM_COPY,
> +   .R_RELATIVE = R_ARM_RELATIVE,
> +   .rtype_class_valid = RTYPE_CLASS_VALID,
> +-  .dynamic_linker = "/lib/ld-linux.so.2",
> ++  .dynamic_linker = "/lib/ld-linux.so.3",

That looks like it's going to break OABI binaries.  I'm not sure to what
extent we care about those anymore, but I'm not sure I would describe
this as a "fix" exactly.

> +-  switch (vfork ())
> ++  switch (pid=fork ())
> +     {
> +     case -1:
> +       error (0, errno, "Could not run %s", path);
> +@@ -63,7 +65,9 @@
> + 	  close (p[1]);
> + 	}
> +       dup2 (1, 2);
> +-      execve (path, argv, envp);
> ++      while (*envp) 
> ++        putenv(*envp++);
> ++      execv (path, argv);
> +       _exit (127);

What's that about?

p.



