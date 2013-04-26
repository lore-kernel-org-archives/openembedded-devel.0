Received: from mail-pa0-f43.google.com ([209.85.220.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UVjoy-0006XQ-FI
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Apr 2013 16:40:36 +0200
Received: by mail-pa0-f43.google.com with SMTP id hz1so2557436pad.16
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2013 07:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=fQz2WL35sW57q3AuOucLrakp5AKDA7PA+hlsexmtHYc=;
	b=Kqhq6qUwkL9TJ2AOo/O516GEqb1/pN2edpmJ8g7LwKC9EqHjTj2xKRrnN7SFGcXCDm
	RThfNvFmjt6/y+KSdIaAJgFPSHy3ev0fNLIbWHr13BqXXRYkVYqJJPllBTT9TFGkCosZ
	3OxIeAhKFS7rn3nkny5V5bwAyOYeiRaEgn61UBemT7/BVXa9ygwFxjoAL5RGMyXLu2xA
	xkXyS/Cily6yNtxj1xwKCC3uIQ+V7d4CiFin6MaMyknmbldYRPzK0NhyLkh6p5eZFgxW
	n63a8YZUiz8N9CiA+rQ7gmolfGB+UgpMx1M6eMntrcf0wvgcor4ZbsdQo00zTKNrkUvD
	ELGw==
X-Received: by 10.67.3.35 with SMTP id bt3mr31077262pad.157.1366986154880;
	Fri, 26 Apr 2013 07:22:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.66.254.102 with HTTP; Fri, 26 Apr 2013 07:22:14 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Apr 2013 15:22:14 +0100
Message-ID: <CAJTo0LZ1F6YBrNiQx9-Jy5wR35_Oc1WV5UOQAS4kHLBHwy=yeQ@mail.gmail.com>
To: yocto@yoctoproject.org, 
	OE-devel <openembedded-devel@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnYJk65cX1cINVPYtoLukFic/05Xce6UAOxdSL+nURJYHV+dCZLOY26tOWaU0cFKAIkl3nV
Subject: Matchbox Panel usage
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
X-List-Received-Date: Fri, 26 Apr 2013 14:40:49 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I'm currently porting the Matchbox Panel to GTK+ 3 and thinking about
cleaning up the options and panel size handling.  The current code is
rather complex and could do with some sanity.  My idea was to reduce
the options down to:

1) put the panel in the titlebar (assuming Matchbox WM and a suitable
theme), as Sato does
2) put the panel on a specified screen border, with a specified
"height", and either a specified width or expand to fill that border

I'm putting "width" and "height" in quotes as for a panel on the left
or right edge, "height" would be the physical width.  Maybe those
should be renamed "depth" and "length" to avoid confusion.

So, anyone is using the Matchbox panel, please speak up with your
usage.  As far a I know everyone either puts it in the MBWM titlebar
or full width along the top/bottom, but I want to be sure!

Cheers,
Ross


