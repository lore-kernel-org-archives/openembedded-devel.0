Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gwossum@pager.net>) id 1K5o7F-0004ko-U2
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jun 2008 22:37:22 +0200
X-ASG-Debug-ID: 1213043524-268e00010000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from mail.pager.net (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 2490CC9A1A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jun 2008 15:32:04 -0500 (CDT)
Received: from mail.pager.net (lrs-ad1.longragesystems.local [192.168.1.254])
	by barracuda.pager.net with ESMTP id KVKGDdIujmu2Z1zx for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jun 2008 15:32:04 -0500 (CDT)
X-ASG-Whitelist: Sender
Received: from [192.168.1.71] ([192.168.1.71]) by mail.pager.net with
	Microsoft SMTPSVC(6.0.3790.1830); Mon, 9 Jun 2008 15:36:49 -0500
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] DEPENDS="gettext" vs. DEPENDS="virtual/libintl"
Date: Mon, 9 Jun 2008 15:32:04 -0500
User-Agent: KMail/1.9.9
References: <200806061706.11880.geoffrey@pager.net>
	<200806091432.37869.geoffrey@pager.net>
	<20080609201110.GA2975@aesgaard.hyboria>
In-Reply-To: <20080609201110.GA2975@aesgaard.hyboria>
MIME-Version: 1.0
Message-Id: <200806091532.04748.geoffrey@pager.net>
X-OriginalArrivalTime: 09 Jun 2008 20:36:49.0968 (UTC)
	FILETIME=[8B253B00:01C8CA70]
X-Barracuda-Connect: lrs-ad1.longragesystems.local[192.168.1.254]
X-Barracuda-Start-Time: 1213043524
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: Re: DEPENDS="gettext" vs. DEPENDS="virtual/libintl"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 09 Jun 2008 20:37:22 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 09 June 2008 03:11:10 pm Graeme Gregory wrote:
> On Mon, Jun 09, 2008 at 02:32:37PM -0500, Geoffrey Wossum wrote:
> > It works!  I got rid of gettext.  It didn't fix all my problems, but it
> > fixed crashes with aplay and Xfbdev.  avahi still crashes, must be a
> > separate issue...
>
> avahi segfaults if you dont have a /etc/resolv.conf which a lot of
> machines dont by default.

I had an /etc/resolv.conf, but it was empty.  Added a couple of nameserver 
entries.  avahi-daemon still segfaults on startup.  Gonna have to hook the 
debugger up at some point.  Thanks for the tip, though.

---
Geoffrey


