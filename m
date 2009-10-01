Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MtDna-0002dV-1h
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Oct 2009 07:01:53 +0200
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id CB9841B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2009 05:08:28 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 1 Oct 2009 07:00:38 +0200
User-Agent: KMail/1.12.1 (Linux/2.6.31; KDE/4.3.1; i686; ; )
References: <1254372443.6756.1.camel@ed-hp-laptop>
In-Reply-To: <1254372443.6756.1.camel@ed-hp-laptop>
MIME-Version: 1.0
Message-Id: <200910010700.39010.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Creating the CheckSum parser failed
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
X-List-Received-Date: Thu, 01 Oct 2009 05:01:53 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 01 October 2009 06:47:23 ed wrote:
> What am I missing that keeps causing this message to be printed out in
> the log.
> 
> NOTE: Running task 10 of 2678 (ID:
> 815,
>  /home/ed/mini2440/OE/mini2440/recipes/stage-manager/stagemanager-native_0.
> 0.1.bb, do_setscene) NOTE: Running task 11 of 2678 (ID:
> 816,
>  /home/ed/mini2440/OE/mini2440/recipes/stage-manager/stagemanager-native_0.
> 0.1.bb, do_fetch) NOTE: Creating the CheckSum parser failed

Wow that is a crappy message that I created (I always bitch about bad error
messages myself). This message is generated in classes/base.bbclass and
could you try the following patch?



diff --git a/classes/base.bbclass b/classes/base.bbclass
index d29ba4b..89ee917 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -661,7 +661,7 @@ python base_do_fetch() {
                bb.note("No conf/checksums.ini found, not checking checksums")
                return
        except:
-               bb.note("Creating the CheckSum parser failed")
+               bb.note("Creating the CheckSum parser failed: %s:%s" % (sys.exc_info()[0], sys.exc_info()[1]))
                return
 
        pv = bb.data.getVar('PV', d, True)


