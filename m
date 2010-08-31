Received: from mailout-de.gmx.net ([213.165.64.22] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1OqSDl-0002c6-B0
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 16:54:24 +0200
Received: (qmail invoked by alias); 31 Aug 2010 14:53:08 -0000
Received: from mail2.zera.de (EHLO [192.168.142.128]) [62.225.102.139]
	by mail.gmx.net (mp008) with SMTP; 31 Aug 2010 16:53:08 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+bbGlVQ1ab/AWsHrduzZrYY/92PHea0za0WZMkRb
	E/ZenKMHlHVr7w
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Aug 2010 16:41:00 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
References: <201008271556.24288.schnitzeltony@gmx.de>
	<201008301816.41691.schnitzeltony@gmx.de>
	<i5ieth$qi2$2@dough.gmane.org>
In-Reply-To: <i5ieth$qi2$2@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201008311641.00363.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.22
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][v2] clutter: Bump revisions to latest stable & cleanup
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
X-List-Received-Date: Tue, 31 Aug 2010 14:55:42 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 31 August 2010 10:36:01 am Koen Kooi wrote:
> It is used to seperate the clutter api/abi change. 0.8 is parallel
> installable with 1.0 (0.9 is 1.0rc), so the naming is there to support
> both kinds of clutter.
> What I wanted to do, but didn't find time for:
> 
> 1) name the clutter 0.8 series clutter-*-0.8
> 2) name the post 0.8 series clutter-*
> 
> That should be safe to do since clutter 1.2 is supposed to be compatible
> with 1.0.
I would like to take care for this. Before I dive into it how about this schedule:

1. remove very old recipes: clutter*svn*.  As far as I saw are the o-hand svn-sources for clutter no more available. Replace DEPENDS on clutter-cairo to clutter & cairo.

2a. all recipes with v >=0.9 rename to clutter*_v
2b. all recipes with v < 0.9 rename to clutter-*-0.8
2c. recipes depending on clutter*: Those depending on v >= 0.9 will get DEPENDS on clutter* / those depending on v < 0.9 ( think it will only be recipes/gnome/libchamplain-gtk_0.2.8.bb ) get 
DEPENDS on clutter*-0.8 ( maybe this can be changed later to clutter* )

3. Add the recipes I made for latest stable versions

What do you think?

Andreas



