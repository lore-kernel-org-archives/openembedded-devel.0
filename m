Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N5mcj-0007rY-TP for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 21:38:36 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N5mbb-0006rR-FQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 21:37:23 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2009 21:37:23 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2009 21:37:23 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 04 Nov 2009 21:36:58 +0100
Message-ID: <hcsola$kqd$1@ger.gmane.org>
References: <B44D4D5BF344094DABB900C4E0F6E3533945A88B7F@srv02.nortechonline.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <B44D4D5BF344094DABB900C4E0F6E3533945A88B7F@srv02.nortechonline.net>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Mono
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
X-List-Received-Date: Wed, 04 Nov 2009 20:38:37 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04-11-09 21:11, Hodgson, Simon wrote:
> I've built Mono for OpenEmbedded to run on an arm processor. But when I try to run just a simple Hello World test I get:
>
> mini-codegen.c:1073:mono_local_regalloc: assertion failed: (ins->dreg != -1)
>
> Does anyone have any suggestion as to what I might be doing wrong?

I'm building locally with:

koen@dominion:/OE/org.openembedded.dev/recipes/asio$ git diff ../mono
diff --git a/recipes/mono/mono_2.4.2.3.bb b/recipes/mono/mono_2.4.2.3.bb
index 5e659f3..261d090 100644
--- a/recipes/mono/mono_2.4.2.3.bb
+++ b/recipes/mono/mono_2.4.2.3.bb
@@ -2,7 +2,7 @@ require mono-${PV}.inc

  DEPENDS = "mono-native mono-mcs-intermediate glib-2.0 perl-native"

-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"

  # mono makes use of non-thumb-compatible inline asm.
  ARM_INSTRUCTION_SET = "arm"
@@ -10,7 +10,7 @@ ARM_INSTRUCTION_SET = "arm"
  SRC_URI += "file://configure.patch;patch=1\
             file://mini-arm.patch;patch=1\
              file://0001-remove-docs-dir-from-build.patch;patch=1 \
-            file://mono-cross-compilation-for-amd64.patch;patch=1 \
+#            file://mono-cross-compilation-for-amd64.patch;patch=1 \
             "

  # Per http://www.mono-project.com/Mono:ARM

That seems to fix most issues for me. I suspect it breaks for amd64 
targets, but I don't care about those (yet).

regards,

Koen



