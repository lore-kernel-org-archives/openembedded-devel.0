Return-Path: <akuster@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6198DC32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 15:56:42 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web08.33621.1661270197793150910
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 08:56:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dRbjY2k4;
 spf=pass (domain: mvista.com, ip: 209.85.219.45,
 mailfrom: akuster@mvista.com)
Received: by mail-qv1-f45.google.com with SMTP id j1so10839450qvv.8
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 08:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:from:to:cc;
        bh=0HM+WaZLp4LUihuUQ3D3hfhTVLBKLZek/Peb1Gkb7/w=;
        b=dRbjY2k4UewGpTL24EGpA3qZnFOQkN3jBfybu4ijDaXddT4nJo/b/TfzijQPVyM9kj
         Zf92YhSFPfeK+gmhYNkiRxndcmxApIPKgw8fAWPgttFz3XaX8HS1gJQT4oNl5TsGov3G
         hf53gi4Ph3N1nqAU3UHzFtFn+lgrexCuGoPBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:x-gm-message-state:from:to:cc;
        bh=0HM+WaZLp4LUihuUQ3D3hfhTVLBKLZek/Peb1Gkb7/w=;
        b=rKqP3OJ5p3/G3Ts4KG+bQFf9sQP8ZYA+yDTfWoBerY56I7+gTWJ17MaZUvVJRl8YUo
         Qc0RtV/OUtagFFBUfFKNCXgopBfMsTWEsizCLv9FiV7ZYRwVhsIZ2/ZntpHSN+ee22hO
         dYY6Pb6OX7pe5Esxat5En1Vlpla8YQSLTNshcm5MRe9jSo1FhGpCnzY83iQpItl5Lhqv
         O2zjzw3QirxabIrEUqwuY8cnDgI9EFxjfaFVhqrdwDfTms4GzMMm+D5tkj4UEfMvR5Iu
         55+37YA1qjVk56ZImzyvXO011lRNN7p/8vBY5JYg75gGPgDwYdW890QZ6mG91QJUe+7p
         91dg==
X-Gm-Message-State: ACgBeo3SP0qxQM+32yirYELvWtgISP01XrDD22WZu25XHs9RXiWY5OpE
	7fZq4CGe3LWkvuECR4p6dML6OA==
X-Google-Smtp-Source: 
 AA6agR44/KSdAuEd4TVneGR6kWnKa6/kZUhh2hf/dLiq10RSylYwl4OQA1YNKNRjKwYrdGtY6DOQ4w==
X-Received: by 2002:a05:6214:e69:b0:476:b991:586f with SMTP id
 jz9-20020a0562140e6900b00476b991586fmr20279498qvb.48.1661270196781;
        Tue, 23 Aug 2022 08:56:36 -0700 (PDT)
Received: from smtpclient.apple ([2600:1700:9190:ba10:3973:e67b:2d5a:eb69])
        by smtp.gmail.com with ESMTPSA id
 l18-20020a37f912000000b006bc1512986esm5593075qkj.97.2022.08.23.08.56.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Aug 2022 08:56:35 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
Message-Id: <278E6D6F-9AC8-4B79-A632-7F2EDE7DAB32@mvista.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: Question for tshark
Date: Tue, 23 Aug 2022 11:56:35 -0400
In-Reply-To: 
 <AM0PR01MB4546E90CF9CC3FE041C2C9FBEB709@AM0PR01MB4546.eurprd01.prod.exchangelabs.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
To: "Yang, Liang" <liang.yang@afry.com>
References: 
 <AM0PR01MB4546E90CF9CC3FE041C2C9FBEB709@AM0PR01MB4546.eurprd01.prod.exchangelabs.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256;
	boundary="000000000000f9433b05e6ea9b44"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Aug 2022 15:56:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98392

--000000000000f9433b05e6ea9b44
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_5B349A09-C53A-40F8-B7F3-569CA97064B2"


--Apple-Mail=_5B349A09-C53A-40F8-B7F3-569CA97064B2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Aug 23, 2022, at 9:12 AM, Yang, Liang <liang.yang@afry.com> wrote:
>=20
> Hi=EF=BC=9A
> I used meta-openembedded/meta-networking/recipes-support/wireshark/ to =
built and installed wireshark-3.4.11 successful, the command of rawshark =
can be used on console, but the command of =E2=80=9Ctshark=E2=80=9D can =
not found, how can I solve it? My target is tshark.
> =20

Tshark is a separate package. Was this installed?

IMAGE_INSTALL:append =3D =E2=80=9C tshark=E2=80=9D

-armin

> =20
> Thank you and best wish
> "This e-mail may contain confidential and corporate proprietary =
information. If received in error, kindly notify us immediately and =
delete the communication from your system. Our contacts with you may =
further involve processing of personal data. Please read more about how =
and why AFRY processes personal data on our website www.afry.com =
<http://www.afry.com/>."
>=20
> '.


--Apple-Mail=_5B349A09-C53A-40F8-B7F3-569CA97064B2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Aug 23, 2022, at 9:12 AM, Yang, Liang &lt;<a =
href=3D"mailto:liang.yang@afry.com" class=3D"">liang.yang@afry.com</a>&gt;=
 wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><meta=
 charset=3D"UTF-8" class=3D""><div class=3D"WordSection1" style=3D"page: =
WordSection1; caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><div style=3D"margin: 0cm; text-align: justify; font-size: =
10.5pt; font-family: =E7=AD=89=E7=BA=BF;" class=3D""><span lang=3D"EN-US" =
class=3D"">Hi</span>=EF=BC=9A<span lang=3D"EN-US" class=3D""><o:p =
class=3D""></o:p></span></div><div style=3D"margin: 0cm; text-align: =
justify; font-size: 10.5pt; font-family: =E7=AD=89=E7=BA=BF;" =
class=3D""><span lang=3D"EN-US" class=3D"">I used<span =
class=3D"Apple-converted-space">&nbsp;</span></span><span lang=3D"EN-US" =
style=3D"font-size: 11pt; font-family: =E5=AE=8B=E4=BD=93;" =
class=3D"">meta-openembedded/meta-networking/recipes-support/wireshark/ =
to built and installed wireshark-3.4.11 successful, the command of =
rawshark can be used on console, but the command of<span =
class=3D"Apple-converted-space">&nbsp;</span></span><span lang=3D"EN-US" =
style=3D"font-size: 11pt;" class=3D"">=E2=80=9C</span><span lang=3D"EN-US"=
 style=3D"font-size: 11pt; font-family: =E5=AE=8B=E4=BD=93;" =
class=3D"">tshark</span><span lang=3D"EN-US" style=3D"font-size: 11pt;" =
class=3D"">=E2=80=9D</span><span lang=3D"EN-US" style=3D"font-size: =
11pt; font-family: =E5=AE=8B=E4=BD=93;" class=3D""><span =
class=3D"Apple-converted-space">&nbsp;</span>can not found, how can I =
solve it? My target is tshark.</span><span lang=3D"EN-US" class=3D""><o:p =
class=3D""></o:p></span></div><div style=3D"margin: 0cm; text-align: =
justify; font-size: 10.5pt; font-family: =E7=AD=89=E7=BA=BF;" =
class=3D""><span lang=3D"EN-US" class=3D""><o:p =
class=3D"">&nbsp;</o:p></span></div></div></div></blockquote><div><br =
class=3D""></div>Tshark is a separate package. Was this =
installed?</div><div><br class=3D""></div><div><pre style=3D"padding: =
0px; margin-top: 0px; margin-bottom: 0px; caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0); font-size: 13.333333015441895px;" =
class=3D"">IMAGE_INSTALL:append =3D =E2=80=9C tshark=E2=80=9D</pre><pre =
style=3D"padding: 0px; margin-top: 0px; margin-bottom: 0px; caret-color: =
rgb(0, 0, 0); color: rgb(0, 0, 0); font-size: 13.333333015441895px;" =
class=3D""><br class=3D""></pre><pre style=3D"padding: 0px; margin-top: =
0px; margin-bottom: 0px; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); =
font-size: 13.333333015441895px;" class=3D"">-armin</pre><div =
class=3D""><br class=3D""></div><blockquote type=3D"cite" class=3D""><div =
class=3D""><div class=3D"WordSection1" style=3D"page: WordSection1; =
caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><div =
style=3D"margin: 0cm; text-align: justify; font-size: 10.5pt; =
font-family: =E7=AD=89=E7=BA=BF;" class=3D""><span lang=3D"EN-US" =
class=3D""><o:p class=3D"">&nbsp;</o:p></span></div><div style=3D"margin: =
0cm; text-align: justify; font-size: 10.5pt; font-family: =E7=AD=89=E7=BA=BF=
;" class=3D""><span lang=3D"EN-US" class=3D"">Thank you and best =
wish<o:p class=3D""></o:p></span></div></div><p style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"font-size: 8pt;" =
class=3D"">"This e-mail may contain confidential and corporate =
proprietary information. If received in error, kindly notify us =
immediately and delete the communication from your system. Our contacts =
with you may further involve processing of personal data. Please read =
more about how and why AFRY processes personal data on our website<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"http://www.afry.com/" =
class=3D"">www.afry.com</a>."</span></p><span style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">'.</span></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_5B349A09-C53A-40F8-B7F3-569CA97064B2--

--000000000000f9433b05e6ea9b44
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIR4QYJKoZIhvcNAQcCoIIR0jCCEc4CAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg8qMIIGTjCCBTagAwIBAgIQBK55YGZmkBq5xX+mbFvczTANBgkqhkiG9w0BAQsFADBlMQswCQYD
VQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29t
MSQwIgYDVQQDExtEaWdpQ2VydCBBc3N1cmVkIElEIFJvb3QgQ0EwHhcNMTMxMTA1MTIwMDAwWhcN
MjgxMTA1MTIwMDAwWjBlMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYD
VQQLExB3d3cuZGlnaWNlcnQuY29tMSQwIgYDVQQDExtEaWdpQ2VydCBTSEEyIEFzc3VyZWQgSUQg
Q0EwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDc+BEjP2q178AneRstBYeiEEMx3w7U
FRtPd6Qizj6McPC+B47dJyq8AR22LArK3WlYH0HtagUf2mN4WR4iLCv4un7JNTtW8R98Qn4lsCMZ
xkU41z1E+SB8YK4csFoYBL6PO/ep8JSapgxjSbZBF1NAMr1P5lB6UB8lRejxia/N/17/UPPwFxH/
vcWJ9b1iudj7jkUEhW2ZzcVITf0mqwI2Reo2119q4hqCQQrc6dn1kReOxiGtODwT5h5/ZpzVTdlG
2vbPUqd9OyTDtMFRNcab69TvfuR7A+FEvXoLN+BPy4KKDXEY5KbgiSwb87JzPMGwkp4Yfb2rfcV9
CKEswp9zAgMBAAGjggL4MIIC9DASBgNVHRMBAf8ECDAGAQH/AgEAMA4GA1UdDwEB/wQEAwIBhjA0
BggrBgEFBQcBAQQoMCYwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNvbTCBgQYD
VR0fBHoweDA6oDigNoY0aHR0cDovL2NybDQuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0QXNzdXJlZElE
Um9vdENBLmNybDA6oDigNoY0aHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0QXNzdXJl
ZElEUm9vdENBLmNybDAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwggGzBgNVHSAEggGq
MIIBpjCCAaIGCmCGSAGG/WwAAgQwggGSMCgGCCsGAQUFBwIBFhxodHRwczovL3d3dy5kaWdpY2Vy
dC5jb20vQ1BTMIIBZAYIKwYBBQUHAgIwggFWHoIBUgBBAG4AeQAgAHUAcwBlACAAbwBmACAAdABo
AGkAcwAgAEMAZQByAHQAaQBmAGkAYwBhAHQAZQAgAGMAbwBuAHMAdABpAHQAdQB0AGUAcwAgAGEA
YwBjAGUAcAB0AGEAbgBjAGUAIABvAGYAIAB0AGgAZQAgAEQAaQBnAGkAQwBlAHIAdAAgAEMAUAAv
AEMAUABTACAAYQBuAGQAIAB0AGgAZQAgAFIAZQBsAHkAaQBuAGcAIABQAGEAcgB0AHkAIABBAGcA
cgBlAGUAbQBlAG4AdAAgAHcAaABpAGMAaAAgAGwAaQBtAGkAdAAgAGwAaQBhAGIAaQBsAGkAdAB5
ACAAYQBuAGQAIABhAHIAZQAgAGkAbgBjAG8AcgBwAG8AcgBhAHQAZQBkACAAaABlAHIAZQBpAG4A
IABiAHkAIAByAGUAZgBlAHIAZQBuAGMAZQAuMB0GA1UdDgQWBBTnAiOAAE/Y17yUC9k/dDlJMjyK
eTAfBgNVHSMEGDAWgBRF66Kv9JLLgjEtUYunpyGd823IDzANBgkqhkiG9w0BAQsFAAOCAQEATtSJ
J7n9HYd3fg8oBZDxCi/JOz69k5yQxq/6kVGHMlRr6MrBcVFcmY61+uBiGZmmB5p8Eyfb5QKihBLZ
FfYKRFfENI9tcx861qABPd7jguRFa7LrJf2AXh05kL5bQvbOkWDj+aBWDEgQzjNoe82Tq/Bqy09Y
D7l7XRsEgZ6nIuJXSSfukpMIvmkIUwI6Ll3IGfRQgE4C2bBdkbSTh/mWloFVQI5m7YLYuyhf7Uxh
7QZYKBlTEUS8RyApsgRs2IlUmTt122d4LB6SeMZVPVgSETJuvUMMTTTbe8ZC2+y+q5thTAaS447f
ISpQVwTAYKI11SSeZjcJSc/V+GWz4OJuwjCCA7cwggKfoAMCAQICEAzn4OUX2Eb+j+Vg/BvwMDkw
DQYJKoZIhvcNAQEFBQAwZTELMAkGA1UEBhMCVVMxFTATBgNVBAoTDERpZ2lDZXJ0IEluYzEZMBcG
A1UECxMQd3d3LmRpZ2ljZXJ0LmNvbTEkMCIGA1UEAxMbRGlnaUNlcnQgQXNzdXJlZCBJRCBSb290
IENBMB4XDTA2MTExMDAwMDAwMFoXDTMxMTExMDAwMDAwMFowZTELMAkGA1UEBhMCVVMxFTATBgNV
BAoTDERpZ2lDZXJ0IEluYzEZMBcGA1UECxMQd3d3LmRpZ2ljZXJ0LmNvbTEkMCIGA1UEAxMbRGln
aUNlcnQgQXNzdXJlZCBJRCBSb290IENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
rQ4VzuRDgFyxh/O3YPlxEqWu3CaUiKr0zvUgOShYYAz4gNqpFZUyYTy1sSiEiorcnwoMgxd6j5Cs
iud5U1wxhCr2D5gyNnbM3t08qKLvavsh8lJh358g1x/isdn+GGTSEltf+VgYNbxHzaE2+Wt/1LA4
PsEbw4wz2dgvGP4oD7Ong9bDbkTAYTWWFv5ZnIt2bdfxoksNK/8LctqeYNCOkDXGeFWHIKHP5W0K
yEl8MZgzbCLph9AyWqK6E4IR7TkXnZk6cqHm+qTZ1Rcxda6FfSKuPwFGhvYoecix2uRXF8R+HA6w
tJKmVrO9spftqqfwt8WoP5UW0P+hlusIXxh3TwIDAQABo2MwYTAOBgNVHQ8BAf8EBAMCAYYwDwYD
VR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQUReuir/SSy4IxLVGLp6chnfNtyA8wHwYDVR0jBBgwFoAU
Reuir/SSy4IxLVGLp6chnfNtyA8wDQYJKoZIhvcNAQEFBQADggEBAKIOvN/i7fDjcnN6ZJS/93Jm
2DLkQnVirofr8tXZ3lazn8zOFCi5DZdgXBJMWOTTPYNJRViXNWkaqEfqVsZ5qxLYZ4GE338JPJTm
uCYsIL09syiJ91//IuKXhB/pZe+H4N/BZ0mzXeuyCSrrJu14vn0/K/O3JjVtX4kBtklbnwEFm6s9
JcHMtn/C8W+GxvpkaOuBLZTrQrf6jB7dYvG+UGe3bL3z8R9rDDYHFn83fKlbbXrxEkZgg9cnBL5L
zpe+w2cqaBHfgOcMM2a/Ew0UbvN/H2MQHvqNGyVtbI+lt2EBsdKjJqEQcZ2t4sP5w5lRtysHCM4u
5lCyp/oKRS+i8PIwggUZMIIEAaADAgECAhABmeiIGxb92d1jHUeNPLJ7MA0GCSqGSIb3DQEBCwUA
MGUxCzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdp
Y2VydC5jb20xJDAiBgNVBAMTG0RpZ2lDZXJ0IFNIQTIgQXNzdXJlZCBJRCBDQTAeFw0yMTEwMjkw
MDAwMDBaFw0yMzEwMjcyMzU5NTlaMEAxGzAZBgNVBAMMEmFrdXN0ZXJAbXZpc3RhLmNvbTEhMB8G
CSqGSIb3DQEJARYSYWt1c3RlckBtdmlzdGEuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
CgKCAQEA60Rtp117FyjzKFRYeZrx5QdhlSA7VUEQxYtnCtN656+u6Vjq/R0I4KAIMaAEOlS3Purp
DrHBMf1gqCKZHdzCkmj5L8GtBkB6yT1NoJnBTH83TgLbRFPB3WnTFmWTSnBkFyyrkoc8JKIzu/p0
CM/+pHHH9IR5lmzdraoKnHx9ZUwaNltEPZpDWo7zxqQXS+uToztNNuhYPOZhMQmGBVOzczliElcm
+DOgmn89Va8QVYqzPglbvjsYSIk2kzaKVffLxyY2p0yvWY8w7CAEYk2gLfPuZiqIdXGYmEyKH86H
27AP1uMrYQjEw1R9VY4JrpDLehuUs/RGYWyMAjfo1NDh0QIDAQABo4IB6DCCAeQwHwYDVR0jBBgw
FoAU5wIjgABP2Ne8lAvZP3Q5STI8inkwHQYDVR0OBBYEFL0akMb3LmLy7bKAAO6QDtKy8WI7MAwG
A1UdEwEB/wQCMAAwHQYDVR0RBBYwFIESYWt1c3RlckBtdmlzdGEuY29tMA4GA1UdDwEB/wQEAwIF
oDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwQwYDVR0gBDwwOjA4BgpghkgBhv1sBAEB
MCowKAYIKwYBBQUHAgEWHGh0dHBzOi8vd3d3LmRpZ2ljZXJ0LmNvbS9DUFMwgYUGA1UdHwR+MHww
PKA6oDiGNmh0dHA6Ly9jcmwzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydFNIQTJBc3N1cmVkSURDQS0x
LmNybDA8oDqgOIY2aHR0cDovL2NybDQuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0U0hBMkFzc3VyZWRJ
RENBLTEuY3JsMHkGCCsGAQUFBwEBBG0wazAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNl
cnQuY29tMEMGCCsGAQUFBzAChjdodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRT
SEEyQXNzdXJlZElEQ0EuY3J0MA0GCSqGSIb3DQEBCwUAA4IBAQCUY9qc+vTg/KOKUB9htYLvs1km
5XF3yyLnIoMBvbmx4zatz0YddFP7UT0esHLGDEW2suAlq44A6SRd2fTUe0tyjGAxsblGwxKp0ypw
p6xjYeJAkp0nEemsYGxGSOf1HP9BIT1bFT9CHHCoX26wxtf7RF2fePncJ4wPBxFzJdecBcKgL8uN
yQnDtPyJ0DC4bVz9Z67nEFJcFTyrzbvo4sk9A8QKYANnjmCYPSEIlis8o7zERwxC/xNTgzAXzlDS
8mJM7ja9otySdENt1tyty90IOWryaSvfeHDffO0YCDvbAVCcisvjni5esAu0sDrJr+ODF4laEVBF
z4PNrDvNN2gGMYICezCCAncCAQEweTBlMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQg
SW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMSQwIgYDVQQDExtEaWdpQ2VydCBTSEEyIEFz
c3VyZWQgSUQgQ0ECEAGZ6IgbFv3Z3WMdR408snswDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcN
AQkEMSIEIEZfm4dtUKxCD/sWSYcguJo7kGZtBl17s2P+tvNqultvMBgGCSqGSIb3DQEJAzELBgkq
hkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIyMDgyMzE1NTYzN1owaQYJKoZIhvcNAQkPMVwwWjAL
BglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG
9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQB3SDujWcNx
4sZGq+3i+wU/PYZuc32wBIxOUUZghK6wR3/NHLbDVgbgknL9ld4TJMDXSf/IkOWMR8qNc+RpiYmH
VBXc37CHtJCworLushuXQC/6sUezyboohfRmsJdtPXfH3r/Lq0cjX0V/ho0NU8TrH+7eUZnvFALz
EUwGCf3hNFIicKnaDqOPtSjuuBQ5vUMEmnmQ+9kwzNmQbjoGB4wIcs2Yn40Qm5+JnL/RFqcm2N5p
np8iwsiXDasi/ADxJKwBhAbGHzsVdHbFMQvoOMwR30wfuZqLf2LYAAYspP/uPfWuG/bAgk6wL4s/
bH4gRLBQQt37Lzv8T668bVxbnJEY
--000000000000f9433b05e6ea9b44--

