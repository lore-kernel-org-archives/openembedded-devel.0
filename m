Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LPixn-0004kb-QJ
	for openembedded-devel@openembedded.org; Wed, 21 Jan 2009 20:42:11 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LPiqu-0003S2-Vz
	for openembedded-devel@openembedded.org; Wed, 21 Jan 2009 19:35:05 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 21 Jan 2009 19:35:04 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 21 Jan 2009 19:35:04 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 21 Jan 2009 20:34:51 +0100
Message-ID: <gl7tcr$55v$1@ger.gmane.org>
References: <gl7r2t$sge$1@ger.gmane.org> <49777438.8070108@balister.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090114 Shredder/3.0b2pre
In-Reply-To: <49777438.8070108@balister.org>
Sender: news <news@ger.gmane.org>
Subject: [RFC] Add option for strict checksumming, was: Re: checksums...
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
X-List-Received-Date: Wed, 21 Jan 2009 19:42:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21-01-09 20:15, Philip Balister wrote:
> Koen Kooi wrote:
>> Hi,
>>
>> Could people adding new recipe and people git-am'ing patches adding
>> new recipes please add the corresponding checksums to checksums.ini?
>>
>> It's not hard:
>>
>> 1) bitbake <recipe>
>> 2) watch it fail
>> 3) cd $TMPDIR ; cat /OE/org.openembedded.dev/conf/checksums.ini >>
>> checksums.ini ; python
>> /OE/org.openembedded.dev/contrib/source-checker/oe-checksums-sorter.py
>> checksums.ini > /OE/org.openembedded.dev/conf/checksums.ini
>> 4) git commit --amend /OE/org.openembedded.dev/conf/checksums.ini
>
> I screwed this up once (and committed a recipe without the checksum)
> when I left ALLOW_INSECURE_DOWNLOADS set in my local.conf. Now I have it
> commented out and am really careful only to use it only when hacking.

What about this:

 From a48ee59ac6ea569a5f88066d86de4b66d8f606c3 Mon Sep 17 00:00:00 2001
From: Koen Kooi <koen@openembedded.org>
Date: Wed, 21 Jan 2009 20:29:53 +0100
Subject: [PATCH] base.bbclass: only error out on missing checksums when 
OE_STRICT_CHECKSUMS is set
  * we want to error out on non-matching sums, missing ones are less bad

---
  classes/base.bbclass |    8 +++++++-
  1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index fca0edd..411adc9 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -71,7 +71,13 @@ def base_chk_file(parser, pn, pv, src_uri, localpath, 
data):

          file.write("[%s]\nmd5=%s\nsha256=%s\n\n" % (src_uri, md5data, 
shadata))
          file.close()
-        return False
+        if not bb.data.getVar("OE_STRICT_CHECKSUMS",data, True):
+            bb.note("This package has no entry in checksums.ini, please 
add one")
+            bb.note("\n[%s]\nmd5=%s\nsha256=%s" % (src_uri, md5data, 
shadata))
+            return True
+        else:
+            bb.note("Missing checksum")
+            return False

      if not md5 == md5data:
          bb.note("The MD5Sums did not match. Wanted: '%s' and Got: 
'%s'" % (md5,md5data))
-- 
1.5.6.3

Non-mangled version at 
http://dominion.thruhere.net/koen/OE/0001-base.bbclass-only-error-out-on-missing-checksums-wh.patch

regards,

Koen



