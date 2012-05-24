Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dasty82@gmail.com>) id 1SXcT0-0007Xr-Kx
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 May 2012 20:08:54 +0200
Received: by ggnp4 with SMTP id p4so69062ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2012 10:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=MgHJEeqC4dDbEowv4VLgKK+zqKIqnnHHtIlb03Yvmic=;
	b=haXVCTOCcqX08XYL9xS5MAsx9uSkR2X/ZeVv0l+aNzAkcoAiRmZZlKTFkcmlNhgPng
	rrpoXrK+uVyTkdOK44twHvKfV2Uk8LC9Q3T4MwTxIzLGbZB5vyU2iLM5ZUIKET7T1dmG
	8ciTenQncAtF3PG7Wjh9ZmkKKmup7ps6Axfem0JD8/44nISSSk4aIbNSEFvWraD1G0Y/
	CpccL6892Nhg/pES6vhldrNoNinMVPLXd6eitecFyC7+gKW9v0JB3PGxnnhwMsi/xOA5
	IIneHwSL3D/kA3lA9BENxT5R9vWYMJaMeDLK20YdYG7ltuomE8bPuBK8L6vCBZ8sSPQQ
	KX6w==
MIME-Version: 1.0
Received: by 10.60.28.162 with SMTP id c2mr411267oeh.3.1337882322685; Thu, 24
	May 2012 10:58:42 -0700 (PDT)
Sender: dasty82@gmail.com
Received: by 10.76.92.66 with HTTP; Thu, 24 May 2012 10:58:42 -0700 (PDT)
In-Reply-To: <1337875543-28325-1-git-send-email-rd@radekdostal.com>
References: <1337875543-28325-1-git-send-email-rd@radekdostal.com>
Date: Thu, 24 May 2012 19:58:42 +0200
X-Google-Sender-Auth: COeViSpRNs32z-FytcDPX8Bfy10
Message-ID: <CAOpW-VCTXkNLoh=0QZ_Mz_Yn1wUkqUyzZkhseT3jFQkMSNveww@mail.gmail.com>
From: Radek Dostal <rd@radekdostal.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] ntpd-systemd: ntpd is started with -g parameter
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
X-List-Received-Date: Thu, 24 May 2012 18:08:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Please ignore this patch, now I understand how ntp works togehter with ntpd=
ate.

Thanks,
Radek

On Thu, May 24, 2012 at 6:05 PM, Radek Dostal <rd@radekdostal.com> wrote:
> needed for correct functionality in systems without battery backed RTC
>
> Signed-off-by: Radek Dostal <rd@radekdostal.com>
> ---
> =A0meta-oe/recipes-support/ntp/files/ntpd.service | =A0 =A02 +-
> =A0meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb =A0 =A0 | =A0 =A02 +-
> =A02 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/ntp/files/ntpd.service b/meta-oe/rec=
ipes-support/ntp/files/ntpd.service
> index bd87b1e..0102ef0 100644
> --- a/meta-oe/recipes-support/ntp/files/ntpd.service
> +++ b/meta-oe/recipes-support/ntp/files/ntpd.service
> @@ -5,7 +5,7 @@ After=3Dnetwork.target
> =A0[Service]
> =A0Type=3Dforking
> =A0PIDFile=3D/run/ntpd.pid
> -ExecStart=3D/usr/bin/ntpd -p /run/ntpd.pid
> +ExecStart=3D/usr/bin/ntpd -g -p /run/ntpd.pid
>
> =A0[Install]
> =A0WantedBy=3Dmulti-user.target
> diff --git a/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb b/meta-oe/recipes=
-support/ntp/ntp_4.2.6p3.bb
> index ece8720..91d93c1 100644
> --- a/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
> +++ b/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
> @@ -1,6 +1,6 @@
> =A0require ntp.inc
>
> -PR =3D "r5"
> +PR =3D "r6"
>
> =A0inherit systemd
>
> --
> 1.7.5.4
>


