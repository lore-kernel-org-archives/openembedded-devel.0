Received: from mailout-de.gmx.net ([213.165.64.23] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1OrS7P-0005Gt-G8
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Sep 2010 11:00:22 +0200
Received: (qmail invoked by alias); 03 Sep 2010 08:58:55 -0000
Received: from mail2.zera.de (EHLO [192.168.142.128]) [62.225.102.139]
	by mail.gmx.net (mp005) with SMTP; 03 Sep 2010 10:58:55 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/RSnMjOtbRAuB11VvAlhDGZt8vrCkdvpUd9CFMAt
	/df2+NCzmbLCvQ
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 3 Sep 2010 10:46:30 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
MIME-Version: 1.0
Message-Id: <201009031046.30672.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.23
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: linux-omap-psp_2.6.32.bb fails at do_compileconfigs
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
X-List-Received-Date: Fri, 03 Sep 2010 09:00:47 -0000
X-List-Received-Date: Fri, 03 Sep 2010 09:00:47 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I have

* pulled last night 261676fed0818a60a6f5b4dc781235cc6c49ba86
* deleted tmp dir for fresh build
* tried baking single packages (round the clutter stuff I posted)

Now I get

ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/Superandi/OpenEmbedded/gumstix-oe/recipes/linux/linux-omap-psp_2.6.32.bb do_compileconfigs failed
ERROR: Function do_compileconfigs failed
NOTE: Task failed: ('function do_compileconfigs 
failed', '/home/Superandi/OpenEmbedded/tmp/work/overo-angstrom-linux-gnueabi/linux-omap-psp-2.6.32-r88+gitra6bad4464f985fdd3bed72e1b82dcbfc004d7869/temp/log.do_compileconfigs.12972')
ERROR: Logfile of failure stored 
in: /home/Superandi/OpenEmbedded/tmp/work/overo-angstrom-linux-gnueabi/linux-omap-psp-2.6.32-r88+gitra6bad4464f985fdd3bed72e1b82dcbfc004d7869/temp/log.do_compileconfigs.12972
Log data follows:
| Multiple configs found, building those first
| cp: cannot stat `/home/Superandi/OpenEmbedded/tmp/work/overo-angstrom-linux-gnueabi/linux-omap-psp-2.6.32-r88+gitra6bad4464f985fdd3bed72e1b82dcbfc004d7869/configs/*': No such 
file or directory
| ERROR: Function do_compileconfigs failed
NOTE: package linux-omap-psp-2.6.32-r88+gitra6bad4464f985fdd3bed72e1b82dcbfc004d7869: task do_compileconfigs: Failed

My last fresh build was based on 

7ec84b10a33241350d53efe50b7ca31bdecb2204
Date:   Mon Aug 30 14:51:47 2010 -040

I checked for changes within recipes/linux for changes during the time perioud and found nothing helpful for this issue.

But I found several commits at base.bbclass. Is it possible that these are related to the problem?

Andreas  


