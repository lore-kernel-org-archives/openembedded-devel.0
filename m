Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1OJRNU-0002qg-LA
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 15:19:33 +0200
Received: (qmail 89 invoked by uid 1003); 1 Jun 2010 13:15:16 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 1 Jun 2010 13:15:16 -0000
Message-ID: <4C0507DF.8080707@balister.org>
Date: Tue, 01 Jun 2010 09:15:11 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-3.fc13 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C04F6FD.4070804@mlbassoc.com>
In-Reply-To: <4C04F6FD.4070804@mlbassoc.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Is Angstrom dead?
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
X-List-Received-Date: Tue, 01 Jun 2010 13:19:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2010 08:03 AM, Gary Thomas wrote:
> It sure feels like it :-(

More that the core Angstrom devs are really popular people so we have 
lots of work at the moment.

Philip


>
> For a week, I've been trying to build various images in Angstrom
> and the problems I've faced have gone totally unanswered on either
> the Angstrom or OE mailing lists. I'm not the only one facing
> these problems either.
>
> I'm mostly interested in building beagleboard-linuxtag2010-demo-image
> which [at least] implies it should be a great demo to show at
> LinuxTag (which starts in only a few days now). Surely a show
> piece would be something that a popular project would want to
> support and be available to the masses??
>
> I tried again today, updating to org.openembedded.dev branch,
> commit a2834c64fb3ed535fca51c25547754fa907e4ca5 Sadly, new
> problems (and probably still the old ones) remain:
>
> | checking for CHEESE... configure: error: Package requirements (
> glib-2.0 >= 2.16.0 gobject-2.0 >= 2.12.0 gio-2.0 >= 2.16.0 gtk+-2.0 >=
> 2.19.1 gdk-2.0 >= 2.14.0 gnome-desktop-2.0 >= 2.26.0 gconf-2.0 >= 2.16.0
> gstreamer-0.10 >= 0.10.23 gstreamer-plugins-base-0.10 >= 0.10.23 cairo
>  >= 1.4.0 dbus-1 >= 1.0 dbus-glib-1 >= 0.7 pangocairo >= 1.18.0
> librsvg-2.0 >= 2.18.0
> | libcanberra-gtk gudev-1.0) were not met:
> |
> | No package 'gstreamer-plugins-base-0.10' found
> |
> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> | installed software in a non-standard prefix.
> |
> | Alternatively, you may set the environment variables CHEESE_CFLAGS
> | and CHEESE_LIBS to avoid the need to call pkg-config.
> | See the pkg-config man page for more details.
> |
> NOTE: package cheese-2.30.1-r0: task do_configure: Failed
>
> Nothing special - out of the box config file with
> MACHINE="beagleboard"
> DISTRO="angstrom-2008.1"
>


