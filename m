Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NVlRz-0004iq-B2
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 13:38:54 +0100
Received: by pzk30 with SMTP id 30so552921pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2010 04:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:subject:date:to
	:mime-version:content-transfer-encoding:from:organization:message-id
	:user-agent; bh=OJXPU8GMCTZjxd8hb5iBCBaYTBrMrdZzvy42gJ4BSkU=;
	b=XxagUVnOhBKdToscz6Og2kibCGia/FUtvEmO4p2jarIcud/aEaHewgc9AZUvfBgI9r
	09qVjr32nFdSfu3ahG1pZZYUcSUbqXSSrM3gfjfYBtDLhZ1wdb6q/x9JQ7sctaZ2ggwT
	a0YdtqSrx3L72NPsqwwP9eOH/vzBGe5mTL3R4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:subject:date:to:mime-version:content-transfer-encoding
	:from:organization:message-id:user-agent;
	b=NrxKJkFoOGdUS5f/eMrOwiHfZv9nP2qPefi+zJUoqH4F76bTPVKHj+D9DEqN8C5qiC
	ooWuTAav2p8OQMu4PY+T0tEfaengWfafeAHmETEsGdBMv75UVe0HXdt6RQg69nGCHA0O
	PF5jmXynFdQWWj2KRYtSALhL5HZj28r5wJJlI=
Received: by 10.142.61.19 with SMTP id j19mr1605964wfa.184.1263558994658;
	Fri, 15 Jan 2010 04:36:34 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.101.24])
	by mx.google.com with ESMTPS id 20sm1378492pzk.9.2010.01.15.04.36.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 15 Jan 2010 04:36:34 -0800 (PST)
Date: Fri, 15 Jan 2010 20:36:22 +0800
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6kqmwfcmn1qzu@guohr-laptop-ubuntu>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: what rwwork_stampfixing_eventhandler is used for?
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
X-List-Received-Date: Fri, 15 Jan 2010 12:38:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi guys,
   I can not figure out what what rwwork_stampfixing_eventhandler is used  
for. But I think it does something unreasonable. I built an OE project and  
all files in openembedded directory have not changed at all, the next  
building should do nothing but report:
NOTE: Tasks Summary: Attempted 65 tasks of which 65 didn't need to be  
rerun and 0 failed.
and exit. But the fact is that the rwwork_stampsfixing_eventhandler  
removes some stamps files and force lots of packages to rebuild even  
though nothing changed at all.

    After I applied the following patch, the behavior is what I expected.  
Who can give some information about this handler?

Thanks a lot!


diff --git a/classes/rm_work.bbclass b/classes/rm_work.bbclass
index a53d12b..1335395 100644
--- a/classes/rm_work.bbclass
+++ b/classes/rm_work.bbclass
@@ -32,19 +32,3 @@ do_rm_work_all () {
  do_rm_work_all[recrdeptask] = "do_rm_work"
  addtask rm_work_all after do_rm_work

-
-addhandler rmwork_stampfixing_eventhandler
-python rmwork_stampfixing_eventhandler() {
-    if bb.event.getName(e) == "StampUpdate":
-        for (fn, task) in e.targets:
-            if task == 'rm_work_all':
-                continue
-            stamp = "%s.do_rm_work" % e.stampPrefix[fn]
-            if os.path.exists(stamp):
-                dir = "%s.*" % e.stampPrefix[fn]
-                bb.note("Removing stamps: " + dir)
-                os.system('rm -f '+ dir)
-
-    return NotHandled
-}
-


-- 
Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


