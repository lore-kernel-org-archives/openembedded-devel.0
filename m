Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PbJro-00020f-O0
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 22:29:00 +0100
Received: (qmail 1269 invoked by uid 503); 7 Jan 2011 21:00:42 -0000
Received: from b9.ovh.net (HELO mail421.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 7 Jan 2011 21:00:41 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 7 Jan 2011 23:28:36 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 7 Jan 2011 23:28:35 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Jan 2011 22:28:30 +0100
Message-Id: <1294435710-2622-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9620533229738569033
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH] busybox-1.8.1 : add latest fixes
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
X-List-Received-Date: Fri, 07 Jan 2011 21:29:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

patches from : http://busybox.net/downloads/fixes-1.18.1/
* hush : fix wrong prompt problem on empty interactive commants
http://git.busybox.net/busybox/commit/?id=642e71a789156a96bcb18e6c5a0f52416c49d3b5
* mkswap : selinux build fix
http://git.busybox.net/busybox/commit/?id=e66a212081bcca521760ccff3a2da0deccd99340
* suppress "'fast_strtol_10' defined but not used" warning
http://git.busybox.net/busybox/commit/?id=f42c7b8fc161f5b3eb4e9c13f392daf7a11760c8

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 .../busybox-1.18.1/busybox-1.18.1-hush.patch       |   28 ++++++++++++++++---
 .../busybox-1.18.1/busybox-1.18.1-mkswap.patch     |   12 ++++++++
 .../busybox-1.18.1/busybox-1.18.1-warning.patch    |   28 ++++++++++++++++++++
 recipes/busybox/busybox_1.18.1.bb                  |    4 ++-
 4 files changed, 66 insertions(+), 6 deletions(-)
 create mode 100644 recipes/busybox/busybox-1.18.1/busybox-1.18.1-mkswap.patch
 create mode 100644 recipes/busybox/busybox-1.18.1/busybox-1.18.1-warning.patch

diff --git a/recipes/busybox/busybox-1.18.1/busybox-1.18.1-hush.patch b/recipes/busybox/busybox-1.18.1/busybox-1.18.1-hush.patch
index 3e189a9..5281a52 100644
--- a/recipes/busybox/busybox-1.18.1/busybox-1.18.1-hush.patch
+++ b/recipes/busybox/busybox-1.18.1/busybox-1.18.1-hush.patch
@@ -1,6 +1,6 @@
 diff -urpN busybox-1.18.1/shell/hush.c busybox-1.18.1-hush/shell/hush.c
 --- busybox-1.18.1/shell/hush.c	2010-12-21 05:31:04.000000000 +0100
-+++ busybox-1.18.1-hush/shell/hush.c	2010-12-21 21:20:02.493651813 +0100
++++ busybox-1.18.1-hush/shell/hush.c	2011-01-07 14:59:19.649956156 +0100
 @@ -913,7 +913,7 @@ static const struct built_in_command blt
   */
  #if HUSH_DEBUG
@@ -177,7 +177,25 @@ diff -urpN busybox-1.18.1/shell/hush.c busybox-1.18.1-hush/shell/hush.c
  			prn++;
  		}
  		pi = pi->next;
-@@ -7445,7 +7461,7 @@ int hush_main(int argc, char **argv)
+@@ -4106,7 +4122,16 @@ static struct pipe *parse_stream(char **
+ 				if (IS_NULL_CMD(ctx.command)
+ 				 && dest.length == 0 && !dest.has_quoted_part
+ 				) {
+-					continue;
++					/* This newline can be ignored. But...
++					 * without the below check, interactive shell
++					 * will ignore even lines with bare <newline>,
++					 * and show the continuation prompt:
++					 * ps1_prompt$ <enter>
++					 * ps2> _   <=== wrong prompt, should be ps1
++					 */
++					struct pipe *pi = ctx.list_head;
++					if (pi->num_cmds != 0)
++						continue;
+ 				}
+ 				/* Treat newline as a command separator. */
+ 				done_pipe(&ctx, PIPE_SEQ);
+@@ -7445,7 +7470,7 @@ int hush_main(int argc, char **argv)
  	unsigned builtin_argc;
  	char **e;
  	struct variable *cur_var;
@@ -186,7 +204,7 @@ diff -urpN busybox-1.18.1/shell/hush.c busybox-1.18.1-hush/shell/hush.c
  
  	INIT_G();
  	if (EXIT_SUCCESS) /* if EXIT_SUCCESS == 0, it is already done */
-@@ -7454,17 +7470,17 @@ int hush_main(int argc, char **argv)
+@@ -7454,17 +7479,17 @@ int hush_main(int argc, char **argv)
  	G.argv0_for_re_execing = argv[0];
  #endif
  	/* Deal with HUSH_VERSION */
@@ -209,7 +227,7 @@ diff -urpN busybox-1.18.1/shell/hush.c busybox-1.18.1-hush/shell/hush.c
  	cur_var = G.top_var;
  	e = environ;
  	if (e) while (*e) {
-@@ -7479,8 +7495,8 @@ int hush_main(int argc, char **argv)
+@@ -7479,8 +7504,8 @@ int hush_main(int argc, char **argv)
  		e++;
  	}
  	/* (Re)insert HUSH_VERSION into env (AFTER we scanned the env!) */
@@ -220,7 +238,7 @@ diff -urpN busybox-1.18.1/shell/hush.c busybox-1.18.1-hush/shell/hush.c
  
  	/* Export PWD */
  	set_pwd_var(/*exp:*/ 1);
-@@ -7840,18 +7856,6 @@ int hush_main(int argc, char **argv)
+@@ -7840,18 +7865,6 @@ int hush_main(int argc, char **argv)
  	parse_and_run_file(stdin);
  
   final_return:
diff --git a/recipes/busybox/busybox-1.18.1/busybox-1.18.1-mkswap.patch b/recipes/busybox/busybox-1.18.1/busybox-1.18.1-mkswap.patch
new file mode 100644
index 0000000..41dff57
--- /dev/null
+++ b/recipes/busybox/busybox-1.18.1/busybox-1.18.1-mkswap.patch
@@ -0,0 +1,12 @@
+diff -urpN busybox-1.18.1/util-linux/mkswap.c busybox-1.18.1-mkswap/util-linux/mkswap.c
+--- busybox-1.18.1/util-linux/mkswap.c	2010-12-20 01:41:27.000000000 +0100
++++ busybox-1.18.1-mkswap/util-linux/mkswap.c	2011-01-05 11:41:24.455856773 +0100
+@@ -15,7 +15,7 @@ static void mkswap_selinux_setcontext(in
+ 	if (!is_selinux_enabled())
+ 		return;
+ 
+-	xfstat(fd, &stbuf, argv[0]);
++	xfstat(fd, &stbuf, path);
+ 	if (S_ISREG(stbuf.st_mode)) {
+ 		security_context_t newcon;
+ 		security_context_t oldcon = NULL;
diff --git a/recipes/busybox/busybox-1.18.1/busybox-1.18.1-warning.patch b/recipes/busybox/busybox-1.18.1/busybox-1.18.1-warning.patch
new file mode 100644
index 0000000..cda94bd
--- /dev/null
+++ b/recipes/busybox/busybox-1.18.1/busybox-1.18.1-warning.patch
@@ -0,0 +1,28 @@
+diff -urpN busybox-1.18.1/libbb/procps.c busybox-1.18.1-warning/libbb/procps.c
+--- busybox-1.18.1/libbb/procps.c	2010-12-21 05:29:45.000000000 +0100
++++ busybox-1.18.1-warning/libbb/procps.c	2011-01-07 13:41:22.000000000 +0100
+@@ -154,6 +154,7 @@ static unsigned long fast_strtoul_10(cha
+ 	return n;
+ }
+ 
++# if ENABLE_FEATURE_FAST_TOP
+ static long fast_strtol_10(char **endptr)
+ {
+ 	if (**endptr != '-')
+@@ -162,6 +163,7 @@ static long fast_strtol_10(char **endptr
+ 	(*endptr)++;
+ 	return - (long)fast_strtoul_10(endptr);
+ }
++# endif
+ 
+ static char *skip_fields(char *str, int count)
+ {
+@@ -448,7 +450,7 @@ procps_status_t* FAST_FUNC procps_scan(p
+ //FIXME: is it safe to assume this field exists?
+ 			sp->last_seen_on_cpu = fast_strtoul_10(&cp);
+ # endif
+-#endif /* end of !ENABLE_FEATURE_TOP_SMP_PROCESS */
++#endif /* FEATURE_FAST_TOP */
+ 
+ #if ENABLE_FEATURE_PS_ADDITIONAL_COLUMNS
+ 			sp->niceness = tasknice;
diff --git a/recipes/busybox/busybox_1.18.1.bb b/recipes/busybox/busybox_1.18.1.bb
index 2f78be9..69daef5 100644
--- a/recipes/busybox/busybox_1.18.1.bb
+++ b/recipes/busybox/busybox_1.18.1.bb
@@ -1,10 +1,12 @@
 require busybox_1.1x.inc
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 SRC_URI += " \
 	file://busybox-1.18.1-hush.patch \
 	file://busybox-1.18.1-cpio.patch \
 	file://busybox-1.18.1-bzip2.patch \
+	file://busybox-1.18.1-mkswap.patch \
+	file://busybox-1.18.1-warning.patch \
 	"
 
 SRC_URI[md5sum] = "f15fe752d8b7012aa5e59f83b88ccb1c"
-- 
1.6.3.3



