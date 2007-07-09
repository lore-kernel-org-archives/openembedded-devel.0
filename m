Received: from [64.233.184.235] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1I7tpn-0001eR-FE
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jul 2007 16:03:29 +0200
Received: by wr-out-0506.google.com with SMTP id 36so403549wra
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2007 06:57:52 -0700 (PDT)
Received: by 10.78.193.19 with SMTP id q19mr1570787huf.1183989471193;
	Mon, 09 Jul 2007 06:57:51 -0700 (PDT)
Received: from ?192.168.20.110? ( [82.193.98.21])
	by mx.google.com with ESMTP id g8sm29000264muf.2007.07.09.06.57.49
	(version=SSLv3 cipher=OTHER); Mon, 09 Jul 2007 06:57:50 -0700 (PDT)
Date: Mon, 9 Jul 2007 16:57:35 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) UNREG / CD5BF9353B3B7091
X-Priority: 3 (Normal)
Message-ID: <161888669.20070709165735@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1005211919.20070709153513@vanille-media.de>
References: <513012886.20070708041151@gmail.com> <f6q30v$s2$1@sea.gmane.org>
	<128309124.20070709154303@gmail.com>
	<20070709131744.GC2336@p3n3tr4t0r.internal>
	<1005211919.20070709153513@vanille-media.de>
MIME-Version: 1.0
Subject: Re: [RFC] Adding screen dimensions to machine configs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jul 2007 14:03:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Dr.,

Monday, July 9, 2007, 4:35:13 PM, you wrote:

[]

> I agree with Paul's "they provide *some default* screen resolution and
> orientation.". Almost all our screen devices can be rotated on-the-fly
> anyway. The MACHINE_DISPLAY_ namespace is mainly UI frameworks and
> applications, as much as native framebuffer rotations and stuff are
> important to know, they're less relevant here.

  Yes, that's why I responded to Koen's discussion of formfactor
package. We won't get around runtime support for multiple resolutions,
rotations, etc. What it will be, is another question for further
consideration.


  As for the machine settings in question, they serve very specific
purpose, and not hardcode that device is bound to be in that
resolution and rotation all the time. To sum up, their purpose is:

1. Provide consistent way to configure packages which require screen
resolution parameter (usecase: fbreader)
2. To not install large-size graphic resources which won't be
needed/used on a specific device "by default", and at the same time,
to install the resource which will fit a device best (again just in
its default config). (usecase: opie-taskbar's background images).

> Regards,

> :M:



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



