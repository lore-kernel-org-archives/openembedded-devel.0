Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TDtWk-00026U-GX for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 10:51:30 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TDtKa-0008Uh-5n for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 10:38:56 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 10:38:56 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 10:38:56 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 18 Sep 2012 10:38:47 +0200
Message-ID: <k39bug$tlg$1@ger.gmane.org>
References: <1347905904-814-1-git-send-email-fcooper@ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <1347905904-814-1-git-send-email-fcooper@ti.com>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-oe][PATCH] thttpd: Port thttpd from oe-classic.
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
X-List-Received-Date: Tue, 18 Sep 2012 08:51:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 17-09-12 20:18, Franklin S. Cooper Jr schreef:
> * Port thttpd recipe from oe-classic to meta-oe.

It should go into meta-networking

> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com> ---

> diff --git a/meta-oe/recipes-extended/thttpd/thttpd-2.25b/init
> b/meta-oe/recipes-extended/thttpd/thttpd-2.25b/init new file mode 100644 
> index 0000000..df6d648 --- /dev/null +++
> b/meta-oe/recipes-extended/thttpd/thttpd-2.25b/init @@ -0,0 +1,47 @@ +#!
> /bin/sh +# +# This is an init script for openembedded +# Copy it to
> /etc/init.d/thttpd and type +# > update-rc.d thttpd defaults 60 +# + + 
> +thttpd=/usr/sbin/thttpd +test -x "$thttpd" || exit 0 + + +case "$1" in +
> start) +    echo -n "Starting thttpd" +    start-stop-daemon --start
> --quiet --exec $thttpd -- -d @@SRVDIR +    echo "." +    ;; +  stop) +
> echo -n "Stopping thttpd" +    start-stop-daemon --stop --quiet --exec
> $thttpd +    echo "." +    ;; +  reload|force-reload) +
> start-stop-daemon --stop --quiet --signal 1 --exec $thttpd +    ;; +
> restart) +    echo -n "Stopping thttpd" +    start-stop-daemon --stop
> --quiet --exec $thttpd -- -d @@SRVDIR +    echo "." +    echo -n "Waiting
> for thttpd to die off" +    for i in 1 2 3 ; +    do +        sleep 1 +
> echo -n "." +    done +    echo "" +    echo -n "Starting thttpd" +
> start-stop-daemon --start --quiet --exec $thttpd -- -d @@SRVDIR +    echo
> "." +    ;; +  *) +    echo "Usage: /etc/init.d/thttpd
> {start|stop|reload|restart|force-reload}" +    exit 1 +esac + +exit 0

And that's not LSB compliant.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQWDMXMkyGM64RGpERAuzAAJ44UYtqHx35wKF9m0vy6rDY1d67zwCfbYyv
dqzWiGMeiAdkWYrHLR9EAt4=
=hJhu
-----END PGP SIGNATURE-----



