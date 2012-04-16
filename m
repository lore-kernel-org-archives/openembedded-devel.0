Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SJhfP-00085S-7u
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Apr 2012 10:52:11 +0200
Received: by iaag37 with SMTP id g37so7259377iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Apr 2012 01:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=oVt4C8N7XH1QNjs3+al4STteta7IpJvVHrObo2EDpxw=;
	b=oiYEkwusjJryMjmswTLWkEQq+GW0oeNy58+ATuKeSHfkZmQWTIwqGZEEaSPUA7yc6C
	LFXTBROHwsJ2Bdn0ui3Ji/IHjjMXaLs8h+fSovHGv3xyGIGcTzk1d9J54KK6SIaQLlP9
	RHrLw/0KeLfWdYvDGU6R3nHhVnVW1elbdhemHinE6QDcjQyNN9byOWp8vtQMuC1g9YhF
	V1riW70Zuq0nRyMXmuCfAP+Zcm9kV06WFyShugSEAU0TPHVZ8/XnUJed+rWp081eRG6x
	kADPJvAfIYVrqke1ZvKazJh+ovF4PXmuO/JGj6sKP+zpABCLXawxwxlOAr8A+EtznyWF
	/d1A==
MIME-Version: 1.0
Received: by 10.50.153.198 with SMTP id vi6mr4811512igb.0.1334565765833; Mon,
	16 Apr 2012 01:42:45 -0700 (PDT)
Received: by 10.231.170.15 with HTTP; Mon, 16 Apr 2012 01:42:45 -0700 (PDT)
Date: Mon, 16 Apr 2012 10:42:45 +0200
Message-ID: <CAOHjBZt=6w7D8jzj7bOe+kMAZ8oFEBThge3dopK10mFDenFbAQ@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [oe-core] requires on own .bb file
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
X-List-Received-Date: Mon, 16 Apr 2012 08:52:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

I wrote a personal .bb file and added it on the meta-<myproject> tree.
This .bb file requires a .inc file already available in the native oe-core
meta directory.
How can I include it into my .bb file? If I add "require <blablabla>.inc"
it fails because it
is not able to found the given .inc file. In other words I need to copy it
into the meta-<myproject> tree.

Suggestions are welcome.
Regards,
Giuseppe

