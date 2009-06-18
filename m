Received: from [17.148.16.86] (helo=asmtpout011.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MH9c3-0006gt-Fx
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 06:52:35 +0200
MIME-version: 1.0
Received: from [87.201.169.51] by asmtp011.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLF00DM63PO0L50@asmtp011.mac.com> for
	openembedded-devel@lists.openembedded.org; Wed,
	17 Jun 2009 21:42:03 -0700 (PDT)
Message-id: <83DED6ED-879A-47C9-8843-925EABC257D7@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: Robert Schuster <theBohemian@gmx.net>
In-reply-to: <E701E0BB-B8EC-482B-8808-47449E0FD322@mac.com>
Date: Thu, 18 Jun 2009 08:41:36 +0400
References: <9050EA3F-01E5-479A-8AF2-C6553F347FE7@mac.com>
	<4A396EBD.2010207@gmx.net>
	<E701E0BB-B8EC-482B-8808-47449E0FD322@mac.com>
X-Mailer: Apple Mail (2.935.3)
Cc: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
Subject: Re: classpath_0.98 recipe failure
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
X-List-Received-Date: Thu, 18 Jun 2009 04:52:35 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi,
	I also noticed one thing.

The classpath_0.9.8.bb recipe applies 3 patches,

SRC_URI += "\
   file://SimpleName.diff;patch=1;pnum=0 \
   file://ecj_java_dir.patch;patch=1 \
   file://autotools.patch;patch=1 \
   "

but if you look at the patch files themselves, they are intended for  
classpath_0.97.2.

Index: classpath-0.97.2/lib/gen-classlist.sh.in
===================================================================
--- classpath-0.97.2.orig/lib/gen-classlist.sh.in	2008-06-02  
03:37:29.000000000 +0200
+++ classpath-0.97.2/lib/gen-classlist.sh.in	2008-08-01  
00:00:58.055208770 +0200
@@ -148,4 +148,7 @@
    done
  fi

+# hack for javac that uses -d and do not make the directories
+awk -F " " '{print $1}' classes.1 | uniq | awk -F " " '{system("mkdir  
-p " $0)}'
+
  exit 0


Isn't this an issue?

I have even tried manually applying these patches after converting the  
gnu classpath-0.98 sources into a local git repository, and then  
reapply these patches, extracted them and even tried a modified recipe  
but that gave the same type of configure failures.

Best regards,

Elvis



