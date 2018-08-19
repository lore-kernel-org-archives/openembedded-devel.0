Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3AB9D6003C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Aug 2018 16:28:29 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id 126-v6so9372137qke.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Aug 2018 09:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GHFanK7CciVrSkKilf/QsAS4CL6mKzAxj42lhHLvZ1E=;
	b=uB/gqsr3yhwoWYrxyMlhMhaL8a+xIYkzZPvYAonCGS3S1vQQXtTW3cN/WGNObo4fBF
	b9c+GxAUBRWU0lan28FQOo0ai/JSL5KE6i7aIlRvmOLVP+PjSkCw6uTDQ34iQiPnKIq9
	Rov7LR15P6H/4UiVefTF48TpEpuiqRaoa7uz//PAHBWpws4p8LnmY2QjUw75GfLtFIyK
	MmC1kLzhiNbRn7kOaeXZ+KnQae92quUnhggYfsdwP7tXfMH/nRvyAsIOBZz2Wuzp8vBo
	+u9JqS8WJAjk3et91g0v3dfXuokeUbmVtdR6SIG8DDBxJAecXbBPEVwcKAhzTTBjNhFv
	bTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GHFanK7CciVrSkKilf/QsAS4CL6mKzAxj42lhHLvZ1E=;
	b=rkufHeA3xS1rZ+OuNh2LpC1h6+f/1OuCVUEp+SV3u2evrXBtTVuByHwtjaPZoOwFsk
	hOJlaQjSSKR/G1v6mxi1U7clcfeW4AJOyKl0y83qvhKukQvTlC5K8DzfJPIEizgkRa65
	9IcLyHLMoPopFH7HLmrauUdKe+uD+WS4MnUX/TtMNYKTursV98vQYAwLuCCV3HNIB9iW
	7dVr32l+w+F7le15r0VtjCi4azsmd7COCzzKUHKcxHYx3Uos2RQ9R+Xun5m6BBNT0zq/
	PlyKOea+aXkAOuQ20Xla0A9fAE7ITCTUt8H5pxXUvcWrLW3Kv07ktV2OlOjNZrzhAqsI
	E7cA==
X-Gm-Message-State: AOUpUlEnBJE2pR/UHBoyUoQ5eIpZ0R9cn682b5koSS0sOYnqEx8OoX2a
	Xr4dWU+ph/zwuyYjO/envdzpgPOQ4RDnsrL728Y=
X-Google-Smtp-Source: AA+uWPwF51HovqGFPHI4a92zWiSbZKGQfJ3kZrScdS64E/gVCesQbVTHWdjhIXOPi/Zq31Led0eM2A1F+a5pnAOvPJg=
X-Received: by 2002:a37:4a94:: with SMTP id
	x142-v6mr37771716qka.110.1534696109814; 
	Sun, 19 Aug 2018 09:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <1534690217-30223-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1534690217-30223-1-git-send-email-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 19 Aug 2018 09:28:03 -0700
Message-ID: <CAMKF1so7Dqxb744zENOYBGum-n4f=cD9DoyEomSV0fyjd6T=1w@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [SUMO][meta-networking][PATCH] wireshark: update to 2.4.8
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
X-List-Received-Date: Sun, 19 Aug 2018 16:28:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 19, 2018 at 7:50 AM Armin Kuster <akuster808@gmail.com> wrote:
>
> Bug fix update only
>
> includes security fixes:
>
> wnpa-sec-2018-25 The LDSS dissector could crash. (Bug 14615)
> wnpa-sec-2018-28 Multiple dissectors could consume excessive memory. (Bug 14678)
> wnpa-sec-2018-29 The DNS dissector could crash. (Bug 14681)
> wnpa-sec-2018-30 The GSM A DTAP dissector could crash. (Bug 14688)
> wnpa-sec-2018-31 The Q.931 dissector could crash. (Bug 14689)
> wnpa-sec-2018-33 Multiple dissectors could crash. (Bug 14703)
>

LGTM

> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../wireshark/{wireshark_2.4.7.bb => wireshark_2.4.8.bb}              | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-support/wireshark/{wireshark_2.4.7.bb => wireshark_2.4.8.bb} (95%)
>
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.4.7.bb b/meta-networking/recipes-support/wireshark/wireshark_2.4.8.bb
> similarity index 95%
> rename from meta-networking/recipes-support/wireshark/wireshark_2.4.7.bb
> rename to meta-networking/recipes-support/wireshark/wireshark_2.4.8.bb
> index 2b2acae..7c81ad3 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_2.4.7.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_2.4.8.bb
> @@ -11,8 +11,8 @@ SRC_URI += "file://libgcrypt.patch"
>
>  UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
>
> -SRC_URI[md5sum] = "a78f3fd231154d6c93a2fec202c9d2bb"
> -SRC_URI[sha256sum] = "5ecb3c68734fb89c83ac283e6cdf264eb15b9c7e7ea63dcfd4f0bad3e77c4f44"
> +SRC_URI[md5sum] = "25f93aa6a2b3fdd9d1f01a49f84d224f"
> +SRC_URI[sha256sum] = "db8ed7828c157e4ffb91fb8c41fa5a2f37fd44259175951a5c37848bf641f5e8"
>
>  PE = "1"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

