Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id C8D1B7E6B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 15:57:06 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id i1so24598988wro.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 08:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=to:from:subject:organization:message-id:date:user-agent
	:mime-version:content-language;
	bh=RhaZRbqbT5P4ix5vqEUEViQ5Irof4CRLp9KMCBvaeck=;
	b=DUG+Deb09lFw20JaeFMFL8mY6SRS1PbJZWgmNXk8PLOPSIFwdGb1fvy3YUg8a6HS55
	ZJKOWlHwT+YyBcDa4BaWvao8BlxQx7gw52ZdPDPxU5IAX6jNtdwvcIOdQMdEgPHKTeUj
	samP7uX2Gds+VtqZ2B10Xv/5dF/eZpD12V3Ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:organization:message-id:date
	:user-agent:mime-version:content-language;
	bh=RhaZRbqbT5P4ix5vqEUEViQ5Irof4CRLp9KMCBvaeck=;
	b=mSH2GyC40RK4plaUroHtVYEWwugsY9A6CZz4bdjbJO7m10y6i2IaLnNc+UluXnEZFw
	0keshW2NRtAfz6H+oFNOzsUGr1xhU1NZfDFWXqIVsHQi6QYLcBgz1uHO1dZ9Pa1tUXaU
	Wy2ExKmnrJPTHJNscomI52BcwBUv1droOqQtzjJxEW/Ewdc3Bu+26d0kyFmEws3B15GP
	i8INFietogieHDjj6wlJKTVlyUXt6k499PQowlEJxuP0b3GZ/Ee29hKcY5FqUGp4nyFw
	b4m1c51/d7dWyD32MqEfc5OxxLyxXjTM/qWMcC/MoUw4sJbfvmoQ865zf+J37EPiSmHe
	jweQ==
X-Gm-Message-State: APjAAAUcb5JoIhlHQyuEYbjSPGCQIhZVvyTMl3vJVFutVhS/4LfCh3HK
	KXWDFrWzX6Vk89ZVukwDCW5dEkdNtPIBFw==
X-Google-Smtp-Source: APXvYqwL9uxJmwCeaCYgivTJklPt2/Q3v4k3NUwOFtF4bsmGAFHEDndQHrEcx/FMmenvmShcT5Zu0Q==
X-Received: by 2002:a5d:4d42:: with SMTP id a2mr31885522wru.66.1568217426997; 
	Wed, 11 Sep 2019 08:57:06 -0700 (PDT)
Received: from localhost.localdomain ([194.99.106.148])
	by smtp.gmail.com with ESMTPSA id
	q192sm4814457wme.23.2019.09.11.08.57.05
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 11 Sep 2019 08:57:06 -0700 (PDT)
To: yocto-infrastructure@yoctoproject.org,
	openembedded-devel@lists.openembedded.org
From: Michael Halstead <mhalstead@linuxfoundation.org>
Organization: Linux Foundation
Message-ID: <51abca86-c102-8d00-c36a-3f76eb776874@linuxfoundation.org>
Date: Wed, 11 Sep 2019 08:57:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
Subject: LayerIndex timeouts, downtime, and mitigation Sept. 11th 12:04-15:12UTC
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
X-List-Received-Date: Wed, 11 Sep 2019 15:57:07 -0000
X-Groupsio-MsgNum: 79612
Content-Type: multipart/mixed; boundary="------------E182316D12235E5A45E3AC9B"
Content-Language: en-US

--------------E182316D12235E5A45E3AC9B
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I recently updated https://layers.openembedded.org/ to expose additional
data via the API. Following the update we experienced downtime due to
resource exhaustion. The time line follows:

September 11th, 12:04 UTC - heavy usage of the application lead to
resource exhaustion and intermittent timeouts
September 11th, 13:16 UTC - effectively offline
September 11th, 15:12 UTC - migrated to a more powerful VM restoring
normal operation

I am continuing to monitor the application and I'm working on rate
limiting rules to prevent this in the future. If you have experience
optimizing Django apps and have time to help please reach out to me and
Paul Eggleton.

--=20
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

--------------E182316D12235E5A45E3AC9B
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

mQENBF13fTkBCAClvac608cisaG9YFWRyH8lTo8Hs9UQLXedH0wlOILJJl5apA+Y
hA/nLtS678OwyMBC8Gc1n/zPFtH7Aagw9BRObENutD7UtjJ6juz/1u2CJFMaYHeu
z6FqBoHFeRJC0sNhTxQkOzk97hyJesgNhcKcXuEAZ09Pi3RBXUxeru9ZTv2azjjJ
vV3ULSXL6AUnpXMeuvMGwb8HqAM1mqTtn4WcIiqqa6nEp+VvPFr3PGU/alA/9S2N
2OqA9/37tGMWFu34z/s/SHRROEUhVb8LRhz7NkuBtF3nAA5R0RRxT/qK2m0LnyDt
WuPtLHMfNt2KDLusctK+nub60+p3CY4OKo8tABEBAAG0ME1pY2hhZWwgSGFsc3Rl
YWQgPG1oYWxzdGVhZEBsaW51eGZvdW5kYXRpb24ub3JnPokBVAQTAQgAPhYhBHXA
FTA0Glu9zfX2sne7QvI6aljTBQJdd305AhsDBQkB4TOABQsJCAcCBhUKCQgLAgQW
AgMBAh4BAheAAAoJEHe7QvI6aljTuUUH/jWg/RepKzUnzJIzp2vLALFDhlKeg6Tw
m7uukiI8CF4TN7JctdBVk32sAvttAwdRUOmv8kTzkcuAiy8CGQpIoKDpbnXDfuds
2mxr9Z7SGqzIjTAKqgEIhFpnWCTPZooAAzyqCTEdu5UpWNHuRiZk1PnFNIyCSDN4
P4Kt3fcOZrRPtDkx4I9910O60ald0NtEfKSx01cfhhgEGbIbM7Ui2lui996jtsX7
E4G+qtrnfpNo0XGMoyiqLDFkNYqXG7VwaU6Kt1R1XsHG7zrttz1H8NcEXhtg8HX+
mxEfhK8YdRKs97aJvqv1uJVxNB2aA/sQYFcXsoeGm9H+EOreX0au0Va5AQ0EXXd9
OQEIALNgB4lRYpXgHPgdx7zUghVknXLCuFAN9XDRButxPlwpsbv+n9Ce2OH7bUae
7GJtoz1TfBU16XJrvbiwe8NiHxCBke3vjzmqIpkyi0ABbM+Rqk1H5U+TGr1qIcwG
8Xs2Ksat87kwORV8cQryGx7fIOB5t12Zp7wy8nQr+E1cyUo/JBm5FY2JQnH+D7QE
Fept/XLgW/UEiqrDYlrNnxZPfzh8Ka8l/gj2B8IYq1pNe99hqCvbBfnhQ8DYI4Ze
93nkOBTXVGKyz6FcaZy/pSfA0N2q7r9FgAOVxEN5usXwkwSmukDw4OVMtQm9sRvL
BiF04qMGRD/JCHPozYFUQYy1xcEAEQEAAYkBPAQYAQgAJhYhBHXAFTA0Glu9zfX2
sne7QvI6aljTBQJdd305AhsMBQkB4TOAAAoJEHe7QvI6aljT7IUIAJTasNuqjZXA
bWFdwzQ6lv2o1S9uZ244rCzJlD/nKpTGHCzhZ4dUDArjk6Wq5U66gmkwYdKc9gmu
6B81tBI4Tihv7dyh7BtX83VuY73TwveLfRrZfMmD1WR61K4I4NaFO9zV/9dT3sSB
vtVRi+hxEv50O1aNBqYqMUC/4zp4NV0/F3jzRSd+PSkuiASZ4U/za/SDorkNoRa5
aWSyRMfuI3FGATRUwbtt4zLeLdx5NUmKcPJCXuC1101n8C0TrP+fjr0TmyDibYF+
lSYycwE89ixVahQDFiQ7EiqzLJRaYbhNhbC8ZcrMhjaWRQRFlSk+CtjXCOaZSiiA
SpP9CcOd05I=3D
=3DtSXc
-----END PGP PUBLIC KEY BLOCK-----

--------------E182316D12235E5A45E3AC9B--
