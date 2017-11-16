Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f54.google.com (mail-pg0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id E059B60685
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Nov 2017 03:13:39 +0000 (UTC)
Received: by mail-pg0-f54.google.com with SMTP id s75so19568115pgs.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Nov 2017 19:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZjhFwjafq7eVrDSWPTT7OVdPa3fFO0opcQSGnnG9+Dk=;
	b=G6XZBjmujmuGPcZ3zYad27pcUuyrT0VrAoZlAdRaIdjmZNP8+bm7EzhaQPfAqLhf3t
	+x1nk7gxDAetblM4JrXzUXy6XsGQvjJBzgQ1iSFsqQ1t78Y5bLdpkcKUB5s3W+bbct+4
	R/C9/anRmhMsseNavP9z7da16XTp6UsoKp/Xc0bkb30UoPQKFFbBnJ4I0ik3x6LXhgGv
	Cs1MQPUrlAsEQPF8wWFxh9ODyd8Px5SAjsQe7OYp1ioCT42xyysj/dAq/O5PUtPq5ZAg
	SfAB3rwLrJPWEqM37phdP57rIDi3bMkVp3dCvO7RhUZ4gkQ0RpPsaCeO3pFppYh12mC+
	CrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZjhFwjafq7eVrDSWPTT7OVdPa3fFO0opcQSGnnG9+Dk=;
	b=EV/aJ7NA9piFNjLvPYH0GXKaQE8N/27wG7TNeZAFSl/W7dwqlI6Qjb6rIi9VpY1QYB
	+dwZzqCLnqODRQGenbFTttVwyfTTSCYzYOxLDVRKG4t34TzUAiV0jRJK83wUsgRY8Of3
	yXODDWQF+ZiJyn/NIeuma3+PClyS52+1KWiLpZEFabKPBRr1868PnMt3lILDbNE0Tqfv
	niUU+FBrYnZK3OrLjrN+1DRBk2VIt3Ng+0WAl6rtPBEVoJ0BhlQDHjoeL12zs3c60LkF
	EBJVQMglwWZMPjZVDo8fAb0Mp0EoBSE6hUnUhn+/+ifc6/m6sli81R0ItA1Z/9ou6Wr+
	samw==
X-Gm-Message-State: AJaThX4BNph8BXY+fY7kZzAADQKF8RPEI1YtqqeDxHlArjaaU9CAo6WV
	iARiu67EVUxUCL2wPZ7iPUFkpLLVtykF0nOIawQ=
X-Google-Smtp-Source: AGs4zMYQWxy3AC3rTaHaL4uF2gIocfSH/TbbIcZNJQXFKnn1hPNWUGvEXwfaiCqardwpRXE1br88C3PAUW/x511lsMo=
X-Received: by 10.159.207.147 with SMTP id z19mr221621plo.441.1510802021122;
	Wed, 15 Nov 2017 19:13:41 -0800 (PST)
MIME-Version: 1.0
References: <20171115203806.25651-1-mkelly@xevo.com>
	<20171115203806.25651-2-mkelly@xevo.com>
In-Reply-To: <20171115203806.25651-2-mkelly@xevo.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Nov 2017 03:13:30 +0000
Message-ID: <CAMKF1sqxrpmQWyo9L0WAUzUBdpS27kHjPD6LDXZ9D7-EEH+Riw@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 2/2] gpsd: add gpsdctl@.service for USB autoplug
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Nov 2017 03:13:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 15, 2017 at 12:53 PM Martin Kelly <mkelly@xevo.com> wrote:

> This service allows gpsd to automatically recognize USB devices but is
> currently missing from our packaging. Without this service and the
> matching udev rules from upstream, gpsd will fail to recognize USB
> devices when they are plugged in.
>
> Signed-off-by: Martin Kelly <mkelly@xevo.com>
> ---
>  meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
> b/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
> index e94d6a108..80d9b0edf 100644
> --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
> @@ -80,6 +80,7 @@ do_install_append() {
>      #support for systemd
>      install -d ${D}${systemd_unitdir}/system/
>      install -m 0644 ${S}/systemd/${BPN}.service
> ${D}${systemd_unitdir}/system/${BPN}.service
> +    install -m 0644 ${S}/systemd/${BPN}ctl@.service
> ${D}${systemd_unitdir}/system/${BPN}ctl@.service
>      install -m 0644 ${S}/systemd/${BPN}.socket
> ${D}${systemd_unitdir}/system/${BPN}.socket
>  }
>
> @@ -121,7 +122,7 @@ RDEPENDS_python-pygps = "python-core python-curses
> gpsd python-json"
>  RPROVIDES_${PN} += "${PN}-systemd"
>  RREPLACES_${PN} += "${PN}-systemd"
>  RCONFLICTS_${PN} += "${PN}-systemd"
> -SYSTEMD_SERVICE_${PN} = "${PN}.socket"
> +SYSTEMD_SERVICE_${PN} = "${PN}.socket ${PN}ctl@.service"


This should be BPN as well I think

>
>
>
>  ALTERNATIVE_${PN} = "gpsd-defaults"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

