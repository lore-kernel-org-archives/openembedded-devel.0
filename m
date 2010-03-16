Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NrTao-0003mY-Rs
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 11:01:47 +0100
Received: by gwj23 with SMTP id 23so1535443gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Mar 2010 02:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=wLhu66euYKxOS4JhA0vijzhaQ++gqG5zAPDJknxwoos=;
	b=rq+DwnQ6dPxVxJNCh0yeRmOlfO0x7yHhdjP3QtvwJ8sebLMWsrx+mCsgD7U5APdxqJ
	vwc1lbeBX8/vMzTfaBejaro4qkGTERFSKCOIHW+aZmrzwWP9j63aNJLuPWtaUlXnNZwy
	E+fXBU67nbMnxQ44e7xDQ7HWPxCTkMkqDnFDs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=mCJy6F8YzHg4vY+wNRZE3KaOospzS/pQOdIzbQHYWW3iqM6hwn/e7HCjNpcmxYGOuu
	NY2FGK8YyXbo1wuygv5R1ggVW7yIzIX3EO98wft1lWhoqI5mbmsYckFhLoCT2vJKnI0D
	dv5rhGavD37+G7KVi6mvwMZ3KAUEaJW7ngpus=
MIME-Version: 1.0
Received: by 10.101.177.16 with SMTP id e16mr7982827anp.153.1268733519756; 
	Tue, 16 Mar 2010 02:58:39 -0700 (PDT)
In-Reply-To: <1268732997.3990.6.camel@mattotaupa>
References: <1268732997.3990.6.camel@mattotaupa>
Date: Tue, 16 Mar 2010 10:58:39 +0100
Message-ID: <ac9c93b11003160258m2433be87s9794def341e14fc1@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] ffmpeg: Stage `avconfig.h` which is built at compile time.
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
X-List-Received-Date: Tue, 16 Mar 2010 10:01:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/3/16 Paul Menzel <paulepanter@users.sourceforge.net>:
> This header is needed for `libvalhalla`.
>
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
> Could someone please test this with `ffmpeg_0.4.9-pre1.bb` as it includes=
 `ffmpeg.inc` too.
> ---
> =A0recipes/ffmpeg/ffmpeg.inc | =A0 =A02 ++
> =A01 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/ffmpeg/ffmpeg.inc b/recipes/ffmpeg/ffmpeg.inc
> index cd330f8..437a822 100644
> --- a/recipes/ffmpeg/ffmpeg.inc
> +++ b/recipes/ffmpeg/ffmpeg.inc
> @@ -61,6 +61,8 @@ do_stage() {
> =A0 =A0 =A0 =A0 =A0 =A0install -m 0644 ${S}/libavutil/$h =A0 =A0 =A0 =A0$=
{STAGING_INCDIR}/ffmpeg/$h
> =A0 =A0 =A0 =A0 =A0 =A0install -m 0644 ${S}/libavutil/$h =A0 =A0 =A0 =A0$=
{STAGING_INCDIR}/libavutil/$h
> =A0 =A0 =A0 =A0 done
> + =A0 =A0 =A0 =A0install -m 0644 ${B}/libavutil/avconfig.h ${STAGING_INCD=
IR}/ffmpeg/
> + =A0 =A0 =A0 =A0install -m 0644 ${B}/libavutil/avconfig.h ${STAGING_INCD=
IR}/libavutil/
>
> =A0 =A0 =A0 =A0 install -d ${STAGING_INCDIR}/libswscale/
> =A0 =A0 =A0 =A0 install -m 0644 ${S}/libswscale/*.h ${STAGING_INCDIR}/ffm=
peg/
> --
> 1.7.0
>

It might be better to try to move to the new default staging (by
removing the do_stage and testing whether it installs the required
things in staging).

FM


