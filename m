Received: from fmmailgate01.web.de ([217.72.192.221])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Reinhard.Thies@web.de>) id 1PLLbL-0003Fj-Dl
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Nov 2010 21:06:00 +0100
Received: from smtp04.web.de  ( [172.20.0.225])
	by fmmailgate01.web.de (Postfix) with ESMTP id 56FEC17C9E5B3;
	Wed, 24 Nov 2010 21:02:25 +0100 (CET)
Received: from [93.204.154.81] (helo=silent.localnet)
	by smtp04.web.de with asmtp (TLSv1:AES256-SHA:256) (WEB.DE 4.110 #24)
	id 1PLLXs-0002BM-00; Wed, 24 Nov 2010 21:02:25 +0100
From: Reinhard Thies <Reinhard.Thies@web.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Nov 2010 21:02:22 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.35-7.slh.1-aptosid-686; KDE/4.4.5; i686; ;
	)
References: <AANLkTim3cKQRr0e1VQRiLf=95jOHC5=TGPQfXbDoZCmj@mail.gmail.com>
In-Reply-To: <AANLkTim3cKQRr0e1VQRiLf=95jOHC5=TGPQfXbDoZCmj@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201011242102.22992.Reinhard.Thies@web.de>
Sender: Reinhard.Thies@web.de
X-Sender: Reinhard.Thies@web.de
X-Provags-ID: V01U2FsdGVkX19V7h07I6BGLGf1iKicRKEvSM7KNc/cVFsjdJig
	0j40N1agFpO2xuJU/4/wwNkTdadCb/1Mj3mEm0ywCvvA+I8Hos
	JArTe8PtV2QfG7eicYIQ==
X-SA-Exim-Connect-IP: 217.72.192.221
X-SA-Exim-Mail-From: Reinhard.Thies@web.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: BitBake parallel parsing testing
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
X-List-Received-Date: Wed, 24 Nov 2010 20:06:01 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

Hi Chris,

On Tuesday 23 November 2010 15:29:00 Chris Larson wrote:
> Greetings all,
> This is a request for further testers for the parallel parsing branch
> of bitbake, as well as for review of the code.  I'm fairly certain
> that the last real issue with it was resolved yesterday, and I haven't
> gotten any reports of problems from those testing it since last week,
> so I'm opening it up to more public testing, so we can be absolutely
> certain that we can merge it to master in the near future without
> risking problems.
> 
It's a great improvement :-))

I had it running on an older branch based on stable/2009.
I had to add the following workaround to get it running:

diff --git a/lib/bb/utils.py b/lib/bb/utils.py
index 19ca45d..11f9a01 100644
--- a/lib/bb/utils.py
+++ b/lib/bb/utils.py
@@ -93,6 +93,10 @@ def vercmp(ta, tb):
     (ea, va, ra) = ta
     (eb, vb, rb) = tb

+    if ea == '':
+        ea = '0'
+    if eb == '':
+        eb = '0'
     r = int(ea)-int(eb)
     if (r == 0):
         r = vercmp_part(va, vb)


With that fix it worked fine at all.

Now my CoreI7 makes fun ;-)

thx,
Reinhard 


