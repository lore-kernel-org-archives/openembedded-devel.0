Received: from [72.14.220.155] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1N8sy3-0007xn-R8
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 11:01:26 +0100
Received: by fg-out-1718.google.com with SMTP id d23so1238190fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2009 02:00:06 -0800 (PST)
Received: by 10.86.237.18 with SMTP id k18mr3023462fgh.51.1258104771089;
	Fri, 13 Nov 2009 01:32:51 -0800 (PST)
Received: from xora-eee (www.xora.org.uk [80.68.91.202])
	by mx.google.com with ESMTPS id l12sm8692964fgb.22.2009.11.13.01.32.49
	(version=SSLv3 cipher=RC4-MD5); Fri, 13 Nov 2009 01:32:50 -0800 (PST)
Date: Fri, 13 Nov 2009 09:32:47 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091113093246.GB2180@xora-eee>
References: <alpine.LFD.2.00.0911120045170.1265@localhost>
	<ac9c93b10911120447k496f094bg478dc05ae612b4a9@mail.gmail.com>
	<alpine.LFD.2.00.0911120748300.3045@localhost>
	<200911121411.53422.holger+oe@freyther.de>
	<alpine.LFD.2.00.0911130349390.31541@localhost>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.00.0911130349390.31541@localhost>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 72.14.220.155
X-SA-Exim-Mail-From: dp@xora.org.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: xterm: either fix it, or remove it. please.
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
X-List-Received-Date: Fri, 13 Nov 2009 10:01:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 13, 2009 at 03:55:02AM -0500, Robert P. J. Day wrote:
> and it works, i just tested that.  so i'm not sure what that extended
> sed expression was supposed to accomplish but it did nothing to solve
> this issue.
> 

Panic over, the issue is nothing to do with F11, SELinux, sed or
any other crazyness. The simple problem is the install script
checks /usr/bin/X11/xterm.

I have pushed a fix after I debugged the problem and worked
out what was actually happening. The fix turns out to be
real simple.

Graeme



