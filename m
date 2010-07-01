Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1OULhX-00059f-Sc
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 17:29:22 +0200
Received: (qmail invoked by alias); 01 Jul 2010 15:24:35 -0000
Received: from mail2.zera.de (EHLO [192.168.142.128]) [62.225.102.139]
	by mail.gmx.net (mp010) with SMTP; 01 Jul 2010 17:24:35 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18fEkkh7k4fVkSAF3ONKolwCyLfpKTQEWXJI1W3fI
	3cGPcjXwjZjfZY
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 1 Jul 2010 17:21:13 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
References: <201006291747.12761.schnitzeltony@gmx.de>
	<201006301446.13623.schnitzeltony@gmx.de>
	<i0fi85$g27$1@dough.gmane.org>
In-Reply-To: <i0fi85$g27$1@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201007011721.13575.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Problems bumping clutter recipes
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
X-List-Received-Date: Thu, 01 Jul 2010 15:29:22 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 30 June 2010 03:53:09 pm Koen Kooi wrote:
> Let me repeat:
> 
> Configure uses a different gl setting per machine
> 
> So the output is machine specific. And hence PACKAGE_ARCH = MACHINE_ARCH

I do not (yet) understand why but I understand that it's not your job to teach me - but due to this situation there is on final question on that issue:

What is the rule for making (clutter-)packages machine specific? All recipes depending on clutter?

By the way: I think I have found the reason why clutter-gst does not build: The constant HAVE_COGL_GLES2 is not configured in clutter-gst.

Andreas


