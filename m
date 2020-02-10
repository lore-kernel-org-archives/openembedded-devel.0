Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6C69E60C0E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 16:47:43 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id ep11so4457764pjb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 08:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=FcPx4MtaY3w0SU/FzFPIdXbiP4CFkrsYH9Vz0FHWzYw=;
	b=MPVScZrrP4Xc1Bamsrk8Bt7kVq/Onc2LHH/3nrUYF0YO+ogr7GLJHRLUBlW/GtMpFG
	LosXNf0xPtH+TBqw8RpK6YANKsqXr41fV/qNSwJ6kgLCDyWSHCtvQYX74cAc0s5Q23A/
	FDLAKkREaALw7CwoGvmDyhjcX9wy5GibcofKbvdjY+BPfmtP9TfE2upOLGRUaLzuieW4
	nQkB08XeMphTqLSF3y+eWYdZZIU0iSbQ6xaa2NYa4tQLSJB7EWQ3bKgiOoQTxKnqD2HS
	EiHy1UdZwEMZs1y5cpoWNzeryAyTcHi+VQq/91HadRT+EMO19s3SdT1BJvzq6wNyH+EF
	eCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=FcPx4MtaY3w0SU/FzFPIdXbiP4CFkrsYH9Vz0FHWzYw=;
	b=XW89sH9U2K7jgyF47lJgNdODpb0qBVtpJk7obE0ESY0olzqiWiUmBFRzNMWRX9oK3u
	idH2g4QZ6zBwxyPfWBy3Jl4Eyr7wODNoRF5eahcfrDTMUhqzkXp9A8YrDW6PSqKJF5Eh
	rAoFi1rD1FCSsq0Iu7cAGwNxoOT0Jb/rVrX5vZfnudOKAqLOxRARJ991DQR+9APrr1HG
	541OtvxnztSxpHkqF+IZgcOA7Z/GX42hmeSBNHd3A9A416tW4iOpsdgc+aZftFlO4ECx
	aFzvvCDp0pBd8U5abK6QXlTsvu8qwg+GQ7TJmEAzjmaCN6zBXjQLfH39L0COh3Ur1AfR
	dK+w==
X-Gm-Message-State: APjAAAWu1P8Buq76M2JsW22oFGxOFaQ9minOaxBg5TIO3I+fsCXhLrPU
	yy0eW9fOEXI7OafhkMRkZW/t1Xre
X-Google-Smtp-Source: APXvYqyYGrZ5zPLCHlDQVwEjgGq0MfneZAwU/NZk7YJJOe604PeIJCaC0JT5e0gxsA6lPvGSsOUn1Q==
X-Received: by 2002:a17:902:8204:: with SMTP id
	x4mr13336284pln.225.1581353264190; 
	Mon, 10 Feb 2020 08:47:44 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:58cf:c2e4:7ede:a168?
	([2601:202:4180:a5c0:58cf:c2e4:7ede:a168])
	by smtp.gmail.com with ESMTPSA id i9sm939183pfk.24.2020.02.10.08.47.43
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 10 Feb 2020 08:47:43 -0800 (PST)
To: Mike Krupicka <Mike.Krupicka@panduit.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <DM6PR13MB298544CC39D605B40E45D333FE1C0@DM6PR13MB2985.namprd13.prod.outlook.com>
	<DM6PR13MB2985F8C14E5FF0EAF39A5830FE190@DM6PR13MB2985.namprd13.prod.outlook.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <f5ae62e2-92b4-65d5-6be8-54ff693f4bae@gmail.com>
Date: Mon, 10 Feb 2020 08:47:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <DM6PR13MB2985F8C14E5FF0EAF39A5830FE190@DM6PR13MB2985.namprd13.prod.outlook.com>
Subject: Re: [meta-networking][zeus][PATCH] mosquitto.init
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
X-List-Received-Date: Mon, 10 Feb 2020 16:47:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 2/10/20 6:41 AM, Mike Krupicka wrote:
> Config file specification is missing in start) case. It is present alre=
ady in restart) case.

This needs to go into master first.

Should just apply.

- armin
>
> Mike
> ---
> .../recipes-connectivity/mosquitto/files/mosquitto.init         | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-connectivity/mosquitto/files/mosqu=
itto.init b/meta-networking/recipes-connectivity/mosquitto/files/mosquitt=
o.init
> index 6a0c12760..9d5963c41 100644
> --- a/meta-networking/recipes-connectivity/mosquitto/files/mosquitto.in=
it
> +++ b/meta-networking/recipes-connectivity/mosquitto/files/mosquitto.in=
it
> @@ -38,7 +38,7 @@ export PATH=3D"${PATH:+$PATH:}@SBINDIR@:@BASE_SBINDIR=
@"
> case "$1" in
>      start)
>          echo "Starting Mosquitto message broker" "mosquitto"
> -        if start-stop-daemon --start --quiet --oknodo --background  --=
make-pidfile --pidfile ${PIDFILE} --exec ${DAEMON} ; then
> +        if start-stop-daemon --start --quiet --oknodo --background --m=
ake-pidfile --pidfile ${PIDFILE} --exec ${DAEMON} -- -c @SYSCONFDIR@/mosq=
uitto/mosquitto.conf ; then
>              exit 0
>          else
>              exit 1
> --
> 2.17.1



