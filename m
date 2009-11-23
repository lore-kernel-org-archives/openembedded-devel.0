Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NCV3I-0006fB-6N
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 10:17:47 +0100
Received: by bwz9 with SMTP id 9so4618240bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 01:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=ZdyXHZCaFA5ebwwBuNOl22kkjQSyTUKBD+r4afPw9t8=;
	b=gF06Sw5b6JAV0DvHuZYx1uXJVXt0OlzJ/hOEx64PfCLPbaH0N4Fg0h968mM03VMXwz
	QkhWAH+Kqq31RpIs5I53axSmlxE6AlU2wnkTZl+p1QZp2Xkdy/2roxggZRFmdTdcaHR9
	cuQPJa2a2ovfPFCY8CE9mdPIGrAwvLvH/g0iA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=nKA4puHpJ0vOS1iuhTXTvhUJpOEz6sD8tpYN3Yh/mKXNE0jxJlCeojU6+hV4N3dghb
	bprwfeaRXpgE02UziIZTKm4/WPbM7xbN6/IJqnWWotzf9GXSPUnuRSsaennzc0Ej/99r
	bKNl4zdazaFTG0Yac/eIzP7j0kUWCBW/UZN5U=
Received: by 10.204.16.88 with SMTP id n24mr4519266bka.52.1258967776398;
	Mon, 23 Nov 2009 01:16:16 -0800 (PST)
Received: from s42.loc (85-127-251-67.dynamic.xdsl-line.inode.at
	[85.127.251.67])
	by mx.google.com with ESMTPS id 16sm1025049bwz.3.2009.11.23.01.16.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 23 Nov 2009 01:16:15 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NCV3w-0000Kv-QR; Mon, 23 Nov 2009 10:18:24 +0100
Date: Mon, 23 Nov 2009 10:18:24 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091123091824.GC436@mx.loc>
References: <1256072198-4449-1-git-send-email-rep.dot.nop@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1256072198-4449-1-git-send-email-rep.dot.nop@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: PING Re: [PATCH] improve printing dependent tasks
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
X-List-Received-Date: Mon, 23 Nov 2009 09:17:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

PING ?

On Tue, Oct 20, 2009 at 10:56:38PM +0200, Bernhard Reutner-Fischer wrote:
>Print names instead of Task-IDs (and not mentioning they're task ids).
>
>Previously we printed e.g.:
>Dependency loop #1 found:
>  Task 89 (/there/src/oe/openembedded/recipes/busybox/busybox-native_1.15.2.bb, do_configure) (depends: Set([88, 282, 92, 87]))
>
>Now we say
>Dependency loop #1 found:
>  Task 89 (/there/src/oe/openembedded/recipes/busybox/busybox-native_1.15.2.bb, do_configure) (dependent Tasks ['busybox-native, do_patch', 'update-rc.d, do_populate_staging', 'busybox-native, do_populate_staging', 'shasum-native.bb, do_populate_staging', 'busybox-native, do_unpack'])
>
>Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
>---
> lib/bb/runqueue.py |   12 ++++++++++--
> 1 files changed, 10 insertions(+), 2 deletions(-)
>
>diff --git a/lib/bb/runqueue.py b/lib/bb/runqueue.py
>index 8b6e12d..df6e673 100644
>--- a/lib/bb/runqueue.py
>+++ b/lib/bb/runqueue.py
>@@ -174,9 +174,17 @@ class RunQueue:
>         self.runq_task = []
>         self.runq_depends = []
>         self.runq_revdeps = []
>-
>         self.state = runQueuePrepare
> 
>+    def runq_depends_names(self, ids):
>+        import re
>+        ret = []
>+        for id in self.runq_depends[ids]:
>+            nam = os.path.basename(self.get_user_idstring(id))
>+            nam = re.sub("_[^,]*,", ",", nam)
>+            ret.extend([nam])
>+        return ret
>+
>     def get_user_idstring(self, task):
>         fn = self.taskData.fn_index[self.runq_fnid[task]]
>         taskname = self.runq_task[task]
>@@ -247,7 +255,7 @@ class RunQueue:
>                         valid_chains.append(new_chain)
>                         msgs.append("Dependency loop #%d found:\n" % len(valid_chains))
>                         for dep in new_chain:
>-                            msgs.append("  Task %s (%s) (depends: %s)\n" % (dep, self.get_user_idstring(dep), self.runq_depends[dep]))
>+                            msgs.append("  Task %s (%s) (dependent Tasks %s)\n" % (dep, self.get_user_idstring(dep), self.runq_depends_names(dep)))
>                         msgs.append("\n")
>                     if len(valid_chains) > 10:
>                         msgs.append("Aborted dependency loops search after 10 matches.\n")
>-- 
>1.6.5
>


