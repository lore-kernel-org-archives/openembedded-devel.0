Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1M8JKg-0003h9-PA
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 May 2009 21:26:06 +0200
Received: from 88-109-34-80.dynamic.dsl.as9105.com ([88.109.34.80]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1M8JD1-0005V8-PH
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 May 2009 20:18:11 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1243189985-19060-1-git-send-email-ihar.hrachyshka@gmail.com>
References: <1243189985-19060-1-git-send-email-ihar.hrachyshka@gmail.com>
Date: Sun, 24 May 2009 20:18:10 +0100
Message-Id: <1243192690.4869.8.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [PATCH 1/2] udev: fixed obsolete udevadm syntax for udev	init.d script.
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
X-List-Received-Date: Sun, 24 May 2009 19:26:06 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-05-24 at 21:33 +0300, Ihar Hrachyshka wrote:
> Fixed the following warning message when executing udev init script:
> "udevadm control commands requires the --<command> format, this will
> stop working in a future release."
> 
> Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
> ---
>  recipes/udev/udev-124/init |    4 ++--
>  recipes/udev/udev-141/init |    4 ++--
>  recipes/udev/udev_124.bb   |    2 +-
>  recipes/udev/udev_141.bb   |    2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)

There doesn't seem much point in patching udev 124 for this: that
version doesn't actually emit the warning as far as I can tell.  If the
initscript is maintained separately for different versions then you
might as well just patch the -141 version and save a rebuild/reinstall
for people using 124.  Or, alternatively, if the two initscripts are
actually the same, maybe you could unify them and save on future
maintenance.

p.




