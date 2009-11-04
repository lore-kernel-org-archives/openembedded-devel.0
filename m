Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N5blm-0005NK-Nh
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 10:03:14 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N5bkE-0002YP-TQ for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 04:01:35 -0500
Date: Wed, 4 Nov 2009 04:01:11 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.00.0911040359150.19657@localhost>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] User manual typoes and aesthetics, chapter 2 only.
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
X-List-Received-Date: Wed, 04 Nov 2009 09:03:14 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  Some minor cleanups for Chapter 2 of the User Manual:

  * add some DocBook tags for filenames
  * update BitBake version to 1.8.16
  * add missing space after "wget" command
  * correct misspelled "local/conf" to "local.conf"

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/docs/usermanual/chapters/getting_oe.xml b/docs/usermanual/chapters/getting_oe.xml
index e8d1f2c..8d9c5b7 100644
--- a/docs/usermanual/chapters/getting_oe.xml
+++ b/docs/usermanual/chapters/getting_oe.xml
@@ -30,9 +30,9 @@ $ <command>cd</command> $OEBASE</screen>
 	you to build your applications and images.
     </para>

-	<para>The <varname>$OEBASE</varname> will also contain both bitbake/ and
-	openembedded/ directories. These will be discussed in
-	<xref linkend="gettingoe_getting_bitbake"/> and
+	<para>The <varname>$OEBASE</varname> will also contain both of the
+	<literal>bitbake/<literal> and <literal>openembedded/</literal> directories.
+	These will be discussed in <xref linkend="gettingoe_getting_bitbake"/> and
 	<xref linkend="gettingoe_getting_oe"/>.
 	</para>
   </section>
@@ -47,19 +47,19 @@ $ <command>cd</command> $OEBASE</screen>
     directory of <literal>openembedded/</literal>
     and <literal>build/</literal> directories. Indeed, as bitbake is written
     in python it does not need compilation for being used. You'll just have to
-    set the PATH variable so that the BitBake tools are accessible (see
-    <xref linkend="gettingoe_configuring_oe"/>).</para>
+    set the <varname>PATH</varname> variable so that the BitBake tools are
+    accessible (see <xref linkend="gettingoe_configuring_oe"/>).</para>

 	<section><title>Downloading a <application>BitBake</application> release</title>
 	  <para>Releases are available from the berlios project website. The current
           release series is <application>BitBake</application> <emphasis>1.8</emphasis>
-          and the current release is <emphasis>1.8.12</emphasis>. To download execute
+          and the current release is <emphasis>1.8.16</emphasis>. To download execute
 	  the following commands:
 		<screen>
 $ <command>cd</command> $OEBASE
-$ <command>wget</command>http://download.berlios.de/bitbake/bitbake-1.8.12.tar.gz
-$ <command>tar</command> -xvzf bitbake-1.8.12.tar.gz
-$ <command>mv</command> bitbake-1.8.12 bitbake
+$ <command>wget</command> http://download.berlios.de/bitbake/bitbake-1.8.16.tar.gz
+$ <command>tar</command> -xvzf bitbake-1.8.16.tar.gz
+$ <command>mv</command> bitbake-1.8.16 bitbake
 </screen>
 	  </para>

@@ -270,7 +270,7 @@ MACHINE = "om-gta01"</screen>
       BitBake file is a logical unit of tasks to be executed. Normally this is
       a package to be built. Inter-recipe dependencies are obeyed. The recipes
       are located by BitBake via the <varname>BBFILES</varname> variable (set
-      in your <filename>$OEBASE/build/conf/local/conf</filename>), which is a
+      in your <filename>$OEBASE/build/conf/local.conf</filename>), which is a
       space separated list of <filename>.bb</filename> files, and does handle
       wildcards.
     </para>

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


