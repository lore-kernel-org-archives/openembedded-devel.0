Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N5bvb-0005ol-M2
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 10:13:23 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N5bu3-0003T3-AD for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 04:11:43 -0500
Date: Wed, 4 Nov 2009 04:11:19 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.00.0911040409060.19894@localhost>
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
Subject: [PATCH] User Manual: Warn readers about mmap and SELinux issue.
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
X-List-Received-Date: Wed, 04 Nov 2009 09:13:23 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


On some Linux distros, if you set the kernel /proc file
/proc/sys/vm/mmap_min_addr to zero, you will probably get an SELinux
violation if you're running SELinux in enforcing mode.  Explain to the
reader how to get around that.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/docs/usermanual/chapters/getting_oe.xml b/docs/usermanual/chapters/getting_oe.xml
index e8d1f2c..1e0112b 100644
--- a/docs/usermanual/chapters/getting_oe.xml
+++ b/docs/usermanual/chapters/getting_oe.xml
@@ -257,7 +257,13 @@ MACHINE = "om-gta01"</screen>
         If your system does not provide
         the <filename>/etc/sysctl.conf</filename> mechanism, you can try adding
         the above <command>echo</command> command line to
-        your <filename>/etc/rc.local</filename>.
+        your <filename>/etc/rc.local</filename>.  But that's not all.
+
+        On some systems (such as Fedora 11), changing that kernel setting
+        will cause an SELinux violation if you're running SELinux in enforcing
+        mode.  If that's the case, you can either disable SELinux or run:
+
+        <screen># setsebool -P allow_unconfirmed_mmap_low 1</screen>
       </para>
     </note>


========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


