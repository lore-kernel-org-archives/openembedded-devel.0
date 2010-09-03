Received: from mailout-de.gmx.net ([213.165.64.23] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1OrKef-0003KH-G7
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Sep 2010 03:03:50 +0200
Received: (qmail invoked by alias); 03 Sep 2010 01:00:40 -0000
Received: from p508829C6.dip.t-dialin.net (EHLO [192.168.142.128])
	[80.136.41.198]
	by mail.gmx.net (mp021) with SMTP; 03 Sep 2010 03:00:40 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/2oHJx97H2dEZ9lHLk/CwOXJxk3tym+tDTlRJGWs
	25TO53MDtZymq3
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 3 Sep 2010 02:48:03 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
References: <201008271556.24288.schnitzeltony@gmx.de>
	<201008311641.00363.schnitzeltony@gmx.de>
	<i5j9ri$ie9$1@dough.gmane.org>
In-Reply-To: <i5j9ri$ie9$1@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201009030248.04405.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.23
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Fri, 03 Sep 2010 01:07:13 -0000
X-List-Received-Date: Fri, 03 Sep 2010 01:07:13 -0000
X-List-Received-Date: Fri, 03 Sep 2010 01:07:13 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 31 August 2010 06:15:46 pm Koen Kooi wrote:
> Sound like a good plan! FWIW, I think we should only keep 0.8.x, 1.0.x
> and 1.2.x (1.0 and 1.2 should be compatible) to have a complete set to
> compare things, the GLES engines tend to break from release to release,
> so keeping a handfull of versions around is good practice.

The trip was much more far than expected...
Problem was that many recipes wanted clutter-0.9 headers which were not available...
Note that it was necessary to have clutter-gtk dependent on clutter (fresh build failed for missing clutter headers). I did not (yet) make clutter-gtk machine specific.

Let me know what you think.

Andreas


