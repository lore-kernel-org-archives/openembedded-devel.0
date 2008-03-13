Received: from [72.14.220.152] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philipp.zabel@gmail.com>) id 1JZlcv-0003cr-2g
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Mar 2008 12:29:38 +0100
Received: by fg-out-1718.google.com with SMTP id 13so2591734fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2008 04:27:26 -0700 (PDT)
Received: by 10.82.187.2 with SMTP id k2mr22804765buf.26.1205407646018;
	Thu, 13 Mar 2008 04:27:26 -0700 (PDT)
Received: by 10.82.118.18 with HTTP; Thu, 13 Mar 2008 04:27:25 -0700 (PDT)
Message-ID: <74d0deb30803130427t16a2ac03r37732dcc08d4d443@mail.gmail.com>
Date: Thu, 13 Mar 2008 12:27:25 +0100
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <fraqbd$k6k$2@ger.gmane.org>
MIME-Version: 1.0
References: <47D71B8F.1030108@balister.org> <fraqbd$k6k$2@ger.gmane.org>
X-SA-Exim-Connect-IP: 72.14.220.152
X-SA-Exim-Mail-From: philipp.zabel@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: Git versus Hg
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
X-List-Received-Date: Thu, 13 Mar 2008 11:29:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Mar 13, 2008 at 9:58 AM, Koen Kooi
<koen@dominion.kabel.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
>  Hash: SHA1
>
>  Philip Balister schreef:
>
> | Given the only serious contenders for possible SCM's for OE appear to be
>  | git or Hg, I am curious about the expertise level available on this list.
>
>  A big problem with git:
>
>  * it cannot import a flat OE repository (e.g a mtn checkout of .dev)
>  * it cannot import a OE repo with history (e.g with mtn2git)
>
>  Why? Git can't store empty dirs, and we use that in a few key places in
>  OE. Holger 'solved' that in mtn2git by putting in a lot .dummy files
>  into those dirs, but those will end up in your packages and rootfses.

Unrelated to the SCM discussion, do we need those empty directories at all?

$ find -type d -empty
./_MTN/tmp
./packages/dbus/dbus-python
./packages/xhost
./packages/gcc/gcc-4.1.0
./packages/xmodmap
./packages/netbase/netbase/if-up.d
./packages/netbase/netbase/if-pre-up.d
./packages/netbase/netbase/if-post-down.d
./packages/netbase/netbase/if-down.d
./packages/netbase/netbase/ghi270
./packages/xproto
./packages/xrandr
./packages/linux/linux-openmoko-devel
./packages/xrdb
./packages/sqlite/sqlite3-3.4.1
./packages/sqlite/sqlite3-3.3.17
./packages/kismet/kismet-2007-10-R1
./packages/xprop
./packages/tslib/tslib-1.0
./packages/xset
./packages/xfonts

Except for the netbase directories, they look like leftovers to me.

regards
Philipp


