Received: from web88307.mail.re4.yahoo.com ([216.39.53.230])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <ron_zach@yahoo.com>) id 1Oc4jA-0002EU-9c
	for Openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 00:59:11 +0200
Received: (qmail 22015 invoked by uid 60001); 22 Jul 2010 22:51:58 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1279839118; bh=EU674O4pqfnMmMxA+UN4Rl6liRhGHISI9WLHu35srQs=;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type;
	b=KfhycgZC8l9Al3hr//QyKg2sgAVl8Bx7P7r9ZmpZlIdm09MeetgbooS051B71Yz4vCIkQnvITzcPabzHDrYbIrFSp8yLCBwiYR9kjyB1GKBvLCIoAnMBXu/1WfyppQg8YdZL601MAgzb2B7BY0y21jlrU5dncbew/nUQHBD/7ZQ=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type;
	b=O1VcacvRvL7+UZUcpAiFOcAsF3INWXy2HTIzUULSCaCQDEiym2oP51PbQX/fKb/vb/oGbZKDOTt/CYVGUn41VhEc/Y/haYuLKcouSaBE0kRHFTrYnbu/b3Rhql/7JBGtqDEGr9M7rL0A982rojUQuCCTcsbFQ+bXfIjbZiYPPno=;
Message-ID: <786613.21629.qm@web88307.mail.re4.yahoo.com>
X-YMail-OSG: xghm6mYVM1mxtghw5NFYelJhw1_uehNdPfdQcgb2ZFWa5iq
	aDXnHoGhNeShuJUncrCh.lH6QWmtC4sJDET1fhDzUclPGmdFCo2T2kNrst37
	tQqitWjCYNAmvUWUiR2GlIdc6SAT1wK7TVlj4T7HbPX1m9BZtQXHZkg0fF4M
	1obBojl3qwE6YawuQ8p1tc75IPpIs1wTPRLvgyX3oxBzxN2fEV.2nEJ8s5Wa
	eZtP7uA3T3MDk6zGLir3TmPdu2fA4.YsB4JeFHlEJNrdRymDKQaxzy76cCye
	cGBGUbHf1escjVaf3M7Muj6BRYQ--
Received: from [161.44.225.74] by web88307.mail.re4.yahoo.com via HTTP;
	Thu, 22 Jul 2010 15:51:58 PDT
X-Mailer: YahooMailClassic/11.2.4 YahooMailWebService/0.8.104.276605
Date: Thu, 22 Jul 2010 15:51:58 -0700 (PDT)
From: Ron Zachariah <ron_zach@yahoo.com>
To: Openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 216.39.53.230
X-SA-Exim-Mail-From: ron_zach@yahoo.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Is it possible to have variables that contain line breaks for module_conf
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
X-List-Received-Date: Thu, 22 Jul 2010 22:59:11 -0000
Content-Type: text/plain; charset=us-ascii

I am trying to have a variable that contains a line break in it.  When I use '\n' it seems to just print out the literal characters '\' 'n' and not a line break.

The context for this is I want to create a module_conf for my device that contains more than one line in it.

In my machine.conf file I have something like
module_conf_testa = """install testa /sbin/modprobe --ignore-install testa force_testa=0,0x74; \
echo "1" > /sys/devices/plb.0/.../item1; \
echo "2" > /sys/devices/plb.0/.../item2 \
\
\n\nremove  testa /sbin/modprobe -r --ignore-remove testa"""

But when I look at the result /etc/modprobe.d/testa file there is only 1 line with explicit '\' 'n' characters.  
Is there some syntax I can use to make these appear on seperate lines? 

Thanks
Ron





