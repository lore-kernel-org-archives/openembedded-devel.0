Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id D43D2767DB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 12:30:20 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ZP8h5-0004Rc-Oi for openembedded-devel@lists.openembedded.org;
	Tue, 11 Aug 2015 14:30:15 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 14:30:15 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 14:30:15 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 11 Aug 2015 14:30:04 +0200
Message-ID: <mqcpsd$esk$1@ger.gmane.org>
References: <1436171379-32162-1-git-send-email-rongqing.li@windriver.com>
	<55C986FA.9050404@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.1.0
In-Reply-To: <55C986FA.9050404@windriver.com>
Subject: Re: [PATCH] ypbind-yocto.init: add status command
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Aug 2015 12:30:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 11-08-15 om 07:24 schreef Rongqing Li:
> ping

While you're there, can you please fix the name of this file? Either change
it to 'yoctoproject' or rename it to something sensible, but the current
situation is just wrong.

> 
> -Roy
> 
> On 2015年07月06日 16:29, rongqing.li@windriver.com wrote:
>> From: Zhu Yanjun <yanjun.zhu@windriver.com>
>> 
>> Add the "status" command to check the status of ypbind.
>> 
>> Signed-off-by: Zhu Yanjun <yanjun.zhu@windriver.com> --- 
>> meta-networking/recipes-support/nis/files/ypbind-yocto.init | 7
>> +++++++ 1 file changed, 7 insertions(+)
>> 
>> diff --git
>> a/meta-networking/recipes-support/nis/files/ypbind-yocto.init 
>> b/meta-networking/recipes-support/nis/files/ypbind-yocto.init index
>> 5f50a53..da533a1 100644 ---
>> a/meta-networking/recipes-support/nis/files/ypbind-yocto.init +++
>> b/meta-networking/recipes-support/nis/files/ypbind-yocto.init @@ -21,6
>> +21,9 @@ #    the NIS binding information. ### END INIT INFO
>> 
>> +# Need to use status function +. /etc/init.d/functions + 
>> YPBIND_BIN=/usr/sbin/ypbind pidfile=/var/run/ypbind.pid
>> 
>> @@ -92,6 +95,10 @@ case "$1" in echo -n "Reload service ypbind" 
>> start-stop-daemon --stop --quiet --signal 1 --pidfile $pidfile ;; +
>> status) +    echo -n "Checking for ypbind: " +    status $YPBIND_BIN +
>> ;; *) echo "Usage: $0 
>> {start|stop|status|try-restart|restart|force-reload|reload|probe}" exit
>> 1
>> 
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFVyerMMkyGM64RGpERAsGEAJ4wrA9wavFzQZfyIiZwLntHXnLVPACfW0Dc
GihWGohDCHjH8dKz+cq5fLo=
=mkrk
-----END PGP SIGNATURE-----


