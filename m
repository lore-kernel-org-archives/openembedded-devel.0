Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LqTYh-0000fY-PX
	for openembedded-devel@openembedded.org; Sun, 05 Apr 2009 16:42:55 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LqTVy-00012y-RB
	for openembedded-devel@openembedded.org; Sun, 05 Apr 2009 14:40:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 05 Apr 2009 14:40:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 05 Apr 2009 14:40:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 05 Apr 2009 16:38:08 +0200
Message-ID: <grafog$2h4$2@ger.gmane.org>
References: <1238927767-18963-1-git-send-email-jeremy.laine@bolloretelecom.eu>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090328 Shredder/3.0b3pre
In-Reply-To: <1238927767-18963-1-git-send-email-jeremy.laine@bolloretelecom.eu>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH] sqlite: use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Sun, 05 Apr 2009 14:42:55 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05-04-09 12:36, Jeremy Lainé wrote:
> From: Jeremy Lainé<jeremy.laine@m4x.org>

Acked-by: Koen Kooi <koen@openembedded.org>

>
>
> Signed-off-by: Jeremy Lainé<jeremy.laine@m4x.org>
> ---
>   .../sqlite-2.8.17/mainmk_build_dynamic.patch       |   18 ++++++++++--------
>   recipes/sqlite/sqlite_2.8.17.bb                    |    2 +-
>   2 files changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/recipes/sqlite/sqlite-2.8.17/mainmk_build_dynamic.patch b/recipes/sqlite/sqlite-2.8.17/mainmk_build_dynamic.patch
> index e936f81..914422f 100644
> --- a/recipes/sqlite/sqlite-2.8.17/mainmk_build_dynamic.patch
> +++ b/recipes/sqlite/sqlite-2.8.17/mainmk_build_dynamic.patch
> @@ -1,6 +1,6 @@
> -diff -bur sqlite-2.8.17~orig/main.mk sqlite-2.8.17/main.mk
> ---- sqlite-2.8.17~orig/main.mk	2005-04-23 17:43:23.000000000 -0500
> -+++ sqlite-2.8.17/main.mk	2006-02-13 03:31:03.000000000 -0600
> +diff -urN sqlite-2.8.17.orig/main.mk sqlite-2.8.17/main.mk
> +--- sqlite-2.8.17.orig/main.mk	2005-04-23 22:43:23.000000000 +0000
> ++++ sqlite-2.8.17/main.mk	2009-04-02 20:10:36.000000000 +0000
>   @@ -139,7 +139,7 @@
>    # This is the default Makefile target.  The objects listed here
>    # are what get build when you type just "make" with no arguments.
> @@ -17,13 +17,15 @@ diff -bur sqlite-2.8.17~orig/main.mk sqlite-2.8.17/main.mk
>   -libsqlite.a:	$(LIBOBJ)
>   -	$(AR) libsqlite.a $(LIBOBJ)
>   -	$(RANLIB) libsqlite.a
> -+libsqlite.so:	$(LIBOBJ)
> -+	$(CC) -shared -o libsqlite.so -Wl,-soname,libsqlite.so.0 $(LIBOBJ)
> -
> +-
>   -sqlite$(EXE):	$(TOP)/src/shell.c libsqlite.a sqlite.h
> -+sqlite$(EXE):	$(TOP)/src/shell.c libsqlite.so sqlite.h
> - 	$(TCCX) $(READLINE_FLAGS) -o sqlite$(EXE) $(TOP)/src/shell.c \
> +-	$(TCCX) $(READLINE_FLAGS) -o sqlite$(EXE) $(TOP)/src/shell.c \
>   -		libsqlite.a $(LIBREADLINE) $(THREADLIB)
> ++libsqlite.so:	$(LIBOBJ)
> ++	$(CC) $(LDFLAGS) -shared -o libsqlite.so -Wl,-soname,libsqlite.so.0 $(LIBOBJ)
> ++
> ++sqlite$(EXE):	$(TOP)/src/shell.c libsqlite.so sqlite.h
> ++	$(TCCX) $(LDFLAGS) $(READLINE_FLAGS) -o sqlite$(EXE) $(TOP)/src/shell.c \
>   +		-lsqlite $(LIBREADLINE) $(THREADLIB)
>
>    sqlite_analyzer$(EXE):	$(TOP)/src/tclsqlite.c libsqlite.a $(TESTSRC) \
> diff --git a/recipes/sqlite/sqlite_2.8.17.bb b/recipes/sqlite/sqlite_2.8.17.bb
> index b5939d9..9f6ec7e 100644
> --- a/recipes/sqlite/sqlite_2.8.17.bb
> +++ b/recipes/sqlite/sqlite_2.8.17.bb
> @@ -4,7 +4,7 @@ SECTION = "libs"
>   PRIORITY = "optional"
>   DEPENDS = "readline ncurses"
>   LICENSE = "PD"
> -PR = "r2"
> +PR = "r3"
>
>   SRC_URI = "http://www.hwaci.com/sw/sqlite/sqlite-${PV}.tar.gz \
>          file://mainmk_build_dynamic.patch;patch=1 \




