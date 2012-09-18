Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe@deserted.net>) id 1TE05k-00027g-GI
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 17:52:06 +0200
Received: by wibhq4 with SMTP id hq4so3540199wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 08:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:x-gm-message-state;
	bh=c+vV3ZJvdF0cHU8jmarj6mymshoTKS/1eDLSCvjMvz0=;
	b=kYbDRWCqCjRV2sqvxRgZEOotHz5eNqwI+hPChQ9OlrOSJoKNXmSswDxNzEQkDmUwk5
	waimtb9NlVHJ1sMzxTbsqkid9t1xnWG3t4UuwWCrsg6aQjLZYlOZDEF5dkwgy7g92L1A
	di+tTQ+QdswsxuB8d9LDbvjihAkIq6FLDSm86k/Z7cMz24Q7mRBZz9MtWSE55+oJqnle
	qmb0ybmWYz+oWoFsTkeWpKlvt0XOQq+xeJL/j+cYEPqfI0nG0htIOeC5os5mBOcNlTrn
	KKpORokS/auGDInZVspkIprIHVOkTjPTHgQSte4vEHQHNszkXDscFN0+dmxhF3yzOASs
	mw+A==
MIME-Version: 1.0
Received: by 10.217.1.7 with SMTP id m7mr89584wes.158.1347982764622; Tue, 18
	Sep 2012 08:39:24 -0700 (PDT)
Received: by 10.223.204.7 with HTTP; Tue, 18 Sep 2012 08:39:24 -0700 (PDT)
In-Reply-To: <k39bug$tlg$1@ger.gmane.org>
References: <1347905904-814-1-git-send-email-fcooper@ti.com>
	<k39bug$tlg$1@ger.gmane.org>
Date: Tue, 18 Sep 2012 11:39:24 -0400
Message-ID: <CANBf+V0uVAWNCt_E+MD42MxFjsu5XOkuaaOyx7Fy3xbBcMXFWg@mail.gmail.com>
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnYQejUsdE0GdWfXsfIZAsBFOK5kR3xNyd3B1fRD2QfotrqE7x5lHTpeXKeTEJj1oqnfLWi
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
X-List-Received-Date: Tue, 18 Sep 2012 15:52:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Sep 18, 2012 at 4:38 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 17-09-12 20:18, Franklin S. Cooper Jr schreef:
>> * Port thttpd recipe from oe-classic to meta-oe.
>
> It should go into meta-networking

Agreed.  Once it's been LSB'd, please put the recipe in
meta-networking/recipes-daemons/

Thanks,
-J.

>
>> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com> ---
>
>> diff --git a/meta-oe/recipes-extended/thttpd/thttpd-2.25b/init
>> b/meta-oe/recipes-extended/thttpd/thttpd-2.25b/init new file mode 100644
>> index 0000000..df6d648 --- /dev/null +++
>> b/meta-oe/recipes-extended/thttpd/thttpd-2.25b/init @@ -0,0 +1,47 @@ +#!
>> /bin/sh +# +# This is an init script for openembedded +# Copy it to
>> /etc/init.d/thttpd and type +# > update-rc.d thttpd defaults 60 +# + +
>> +thttpd=/usr/sbin/thttpd +test -x "$thttpd" || exit 0 + + +case "$1" in +
>> start) +    echo -n "Starting thttpd" +    start-stop-daemon --start
>> --quiet --exec $thttpd -- -d @@SRVDIR +    echo "." +    ;; +  stop) +
>> echo -n "Stopping thttpd" +    start-stop-daemon --stop --quiet --exec
>> $thttpd +    echo "." +    ;; +  reload|force-reload) +
>> start-stop-daemon --stop --quiet --signal 1 --exec $thttpd +    ;; +
>> restart) +    echo -n "Stopping thttpd" +    start-stop-daemon --stop
>> --quiet --exec $thttpd -- -d @@SRVDIR +    echo "." +    echo -n "Waiting
>> for thttpd to die off" +    for i in 1 2 3 ; +    do +        sleep 1 +
>> echo -n "." +    done +    echo "" +    echo -n "Starting thttpd" +
>> start-stop-daemon --start --quiet --exec $thttpd -- -d @@SRVDIR +    echo
>> "." +    ;; +  *) +    echo "Usage: /etc/init.d/thttpd
>> {start|stop|reload|restart|force-reload}" +    exit 1 +esac + +exit 0
>
> And that's not LSB compliant.
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFQWDMXMkyGM64RGpERAuzAAJ44UYtqHx35wKF9m0vy6rDY1d67zwCfbYyv
> dqzWiGMeiAdkWYrHLR9EAt4=
> =hJhu
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



-- 
Joe MacDonald
:wq


