Received: from [160.45.40.10] (helo=mail.math.fu-berlin.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1Ki6yS-0004L7-KO
	for openembedded-devel@openembedded.org; Tue, 23 Sep 2008 14:26:36 +0200
Received: (qmail 12102 invoked from network); 23 Sep 2008 14:23:04 +0200
Received: from lusin.mi.fu-berlin.de (HELO mi.fu-berlin.de) (160.45.117.141)
	by leibniz.math.fu-berlin.de with SMTP; 23 Sep 2008 14:23:04 +0200
Received: (qmail 32477 invoked by uid 9804); 23 Sep 2008 14:23:03 +0200
Received: from localhost (HELO mi.fu-berlin.de) (127.0.0.1)
	by localhost with SMTP; 23 Sep 2008 14:22:59 +0200
Received: (qmail 32448 invoked by uid 9804); 23 Sep 2008 14:22:59 +0200
Received: from leibniz.math.fu-berlin.de (HELO math.fu-berlin.de)
	(160.45.40.10)
	by lusin.mi.fu-berlin.de with SMTP; 23 Sep 2008 14:22:59 +0200
Received: (qmail 12085 invoked from network); 23 Sep 2008 14:22:59 +0200
Received: from omsk.mi.fu-berlin.de (160.45.45.210)
	by leibniz.math.fu-berlin.de with (AES256-SHA encrypted) SMTP;
	23 Sep 2008 12:22:59 -0000
Received: from heinold by omsk.mi.fu-berlin.de with local (Exim 4.63 #1
	(Debian)) id 1Ki6ux-00006L-Fw
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2008 14:22:59 +0200
Date: Tue, 23 Sep 2008 14:22:59 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080923122259.GA32730@mi.fu-berlin.de>
References: <gbaldf$39s$2@ger.gmane.org>
X-Envelope-Sender: heinold@mi.fu-berlin.de
X-Virus-Scanned: by AMaViS
	0.3.12pre7-L41+ClamAV[32451](NAI-uvscan@mi.fu-berlin.de)
X-Remote-IP: 160.45.45.210
MIME-Version: 1.0
In-Reply-To: <gbaldf$39s$2@ger.gmane.org>
User-Agent: Mutt/1.5.13 (2006-08-11)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
Subject: Re: pkgconfig.bbclass changes
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
X-List-Received-Date: Tue, 23 Sep 2008 12:26:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 23, 2008 at 01:54:23PM +0200, Koen Kooi wrote:
> Hi,
> 
> Henning fixed up pkgconfig.bbclass (which should die, since 
> autotools.bbclass does a much better job), but I think this:
> 
> -       for pc in `find ${S} -name '*.pc' -type f | grep -v -- 
> '-uninstalled.pc$'`; do
> +       for pc in `find ${D} -name '*.pc' -type f | grep -v -- 
> '-uninstalled.pc$'`; do
> 
> breaks -native recipes.
> 
> regards,
> 
> Koen

Hi,

sorry you are right. This indeed breaks native packages I didnt
thought of it, while fixing the pc file of xine. 

I think we can not let die pkgconfig.bbclass, because not all features are
in autotools.class and there are cases where staging or install
do not depend on the autotools install routines.

Bye Henning


