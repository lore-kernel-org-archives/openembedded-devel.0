Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.11079.1588342644795818136
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 May 2020 07:17:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jx61TvXY;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: sakoman@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id o27so6362800wra.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 May 2020 07:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=6mFmL25N4foizWD1+uAzi80sG7JDnJqXd6DMu7G+T5Y=;
        b=jx61TvXYYMZFpc7GAE5cR/2fUN3j7R4DP7N/4stApcQD5F+Xgc1poazmQTGavnhHAo
         qFLbA9yTI8J0pMEh+gemYlIpPpJtONwgJzT5LQsIC2kwOGtsc/1OQKeJYhRO1RYcAP7T
         Y4wf207gr3ocGFc0u0lZrXLVOEKxcekYS9dhMcqP6Dh3V9S5krdazijj/46DZUJKwdO7
         wEfETZYhtI5lYt4IRlqwYlAOExPTfiE8WhwJB3TFJ8b0xSMn4f4lGNxT3wg319o1QwNf
         XBgZeOs7NI9RtDkiZ6Scc4EnV0W1PKCaNnSQHYEED4DLNG1rBk1xTwFjWPaiXA23nSsm
         5qrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=6mFmL25N4foizWD1+uAzi80sG7JDnJqXd6DMu7G+T5Y=;
        b=Bd9aW6eFxto0rCS3xo4YDraOPlLFhvqgDZBRViPiapwMwS8u2/aqzIakK5aGCx8w6Z
         7YuQGbkBfmz6q9yJcWl9V7gyChdEyZIYzfWoKUjmpAAiU+2kprAQKxC77doqf62lE7pb
         KCvsMf02guQkqd2buvnth9JHzIaNf+HQvD+i2qrh0ZOxxajEDUjLWacaKldFmQFS2Q8f
         rtcqh9nKXZQeyz2dLmc+6u5kMxhp1Kz5JSOcE5L0APRGRNbAx6A0VvehyRTXE1xSVZ06
         AoMLJ1gU4x6DtmmOD64WztzuW/YVk/98YRaAj9QxR0y1h4Wd1fntCmr4eerCOhCrkD7j
         X28g==
X-Gm-Message-State: AGi0PuakRMR0hcCyIyddbpnFDkWOdJYqQKRQbNI7yl9p8DqaqOYc0jig
	EluPjFycvuLympOBVsb6OEnziQIMOReGa0DAn/TXIMqm
X-Google-Smtp-Source: APiQypIP6CDpC6cCVnWLb+s+2jdc+unoasVG+rsicYxd60af+woRNeKV5hHyEmjNCMx9mcQ3G7lQHxfpDD4k1jmeQVw=
X-Received: by 2002:adf:df04:: with SMTP id y4mr4404199wrl.413.1588342642946;
 Fri, 01 May 2020 07:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200501044509.13144-1-pkj@axis.com>
In-Reply-To: <20200501044509.13144-1-pkj@axis.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Fri, 1 May 2020 04:17:11 -1000
Message-ID: <CAGDS+nk1mmoOL==L7LbvUUmcx6zsNf=HKGPMoquYyr45=LeKXQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][master][dunfell][PATCH] paho-mqtt-c: Update to the real 1.3.2, and correct the license
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 30, 2020 at 6:45 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> In commit b0345e3f (paho-mqtt-c: upgrade 1.3.1 -> 1.3.2), paho-mqtt-c
> was supposedly updated to 1.3.2. However, the SRCREV did not match the
> v1.3.2 tag.
>
> With the update to 1.3.2, the license was changed from EPL-1.0 | EDL-1.0
> to EPL-2.0 | EDL-1.0. This was updated in commit b0345e3f for
> LIC_FILES_CHKSUM, but not in LICENSE.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  .../paho-mqtt-c/paho-mqtt-c_1.3.2.bb             | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>
> diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.2.bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.2.bb
> index fa8c714ce..071d51fc6 100644
> --- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.2.bb
> +++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.2.bb
> @@ -2,19 +2,19 @@ SUMMARY = "Paho MQTT - C libraries for the MQTT and MQTT-SN protocols"
>  DESCRIPTION = "Client implementation of open and standard messaging protocols for Machine-to-Machine (M2M) and Internet of Things (IoT)."
>  HOMEPAGE = "http://www.eclipse.org/paho/"
>  SECTION = "console/network"
> -LICENSE = "EPL-1.0 | EDL-1.0"
> +LICENSE = "EPL-2.0 | EDL-1.0"
>
>  LIC_FILES_CHKSUM = " \
> -        file://edl-v10;md5=3adfcc70f5aeb7a44f3f9b495aa1fbf3 \
> -        file://epl-v20;md5=d9fc0efef5228704e7f5b37f27192723 \
> -        file://notice.html;md5=943f861069889acecebf51dfa24478e2 \
> -        file://about.html;md5=e5662cbb5f8fd5c9faac526e4077898e \
> +    file://edl-v10;md5=3adfcc70f5aeb7a44f3f9b495aa1fbf3 \
> +    file://epl-v20;md5=d9fc0efef5228704e7f5b37f27192723 \
> +    file://notice.html;md5=943f861069889acecebf51dfa24478e2 \
> +    file://about.html;md5=e5662cbb5f8fd5c9faac526e4077898e \
>  "
>
>  SRC_URI = "git://github.com/eclipse/paho.mqtt.c;protocol=http \
>             file://0001-Fix-bug-of-free-with-musl.patch"
>
> -SRCREV = "fbe39064c4416f879308a8a5390b19d544970789"
> +SRCREV = "3148fe2d5f4b87e16266dfe559c0764e16ca0546"
>
>  DEPENDS = "openssl"
>
> @@ -29,7 +29,3 @@ do_install_append() {
>  }
>
>  EXTRA_OECMAKE = "-DPAHO_WITH_SSL=ON"
> -
> -do_configure_prepend_libc-musl() {
> -    sed -i -e "s/SET(LIBS_SYSTEM c dl pthread anl rt)/SET(LIBS_SYSTEM c dl pthread rt)/g" ${S}/src/CMakeLists.txt
> -}
> --

You are also removing do_configure_prepend_libc-musl(), but the reason
for this isn't mentioned in the commit message.

Steve

> 2.21.1
>
> 
