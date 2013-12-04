Return-Path: <khimov@altell.ru>
Received: from mx.altell.ru (mx.altell.ru [178.16.156.18])
	by mail.openembedded.org (Postfix) with ESMTP id A81C06DC00
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2013 11:29:08 +0000 (UTC)
Received: from sencha.localnet (unknown [10.180.21.135])
	by mx.altell.ru (Postfix) with ESMTPS id D116940E4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2013 15:28:49 +0400 (MSK)
From: Roman Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 04 Dec 2013 15:28:40 +0400
Message-ID: <9496065.268AkWkQYa@sencha>
Organization: ALTELL Ltd.
User-Agent: KMail/4.10.5 (Linux/3.7.10-1.16-desktop; KDE/4.10.5; x86_64; ; )
In-Reply-To: <1386154747-14820-1-git-send-email-patrick.patat@innotis.org>
References: <1386154747-14820-1-git-send-email-patrick.patat@innotis.org>
MIME-Version: 1.0
X-Altell-MailScanner-ID: D116940E4.AD7D5
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-Spam-Status: No
Subject: Re: [meta-perl][PATCH] add libcrypt-openssl-rsa-perl
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
X-List-Received-Date: Wed, 04 Dec 2013 11:29:11 -0000
X-Groupsio-MsgNum: 47367
Content-Type: multipart/signed; boundary="nextPart2455217.9loHMJaYeU";
	micalg="sha1"; protocol="application/pkcs7-signature"

--nextPart2455217.9loHMJaYeU
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

=D0=92 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=B5 =D0=BE=D1=82 4 =D0=B4=D0=B5=
=D0=BA=D0=B0=D0=B1=D1=80=D1=8F 2013 11:59:07 =D0=BF=D0=BE=D0=BB=D1=8C=D0=
=B7=D0=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C Patrick Patat =D0=BD=D0=B0=
=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> +DEPENDS +=3D "perl openssl"
> +
> +EXTRA_CPANFLAGS =3D "INC=3D'-I${STAGING_INCDIR}' LIBS=3D'-L${STAGING=
_LIBDIR}
> -lssl -L${STAGING_DIR_TARGET}${base_libdir} -lcrypto'" +
> +S =3D "${WORKDIR}/Crypt-OpenSSL-RSA-${PV}"
> +
> +inherit cpan
> +
> +do_compile() {
> +        export LIBC=3D"$(find ${STAGING_DIR_TARGET}${base_libdir}/ -=
name
> 'libc-*.so')" +=09export OTHERLDFLAGS=3D'-Wl,-rpath'
> +        cpan_do_compile
> +}

Although this one:
http://git.openembedded.org/openembedded/commit/?id=3D0f2de8ebc39040620=
5fd0b27f62c833895aa6901
is for a bit different version in a bit different kind of OE, I think y=
ou=20
don't need this kind of CPANFLAGS and do_compile mangling. Also, inheri=
ting=20
cpan already sets proper perl DEPENDS/RDEPENDS.

--nextPart2455217.9loHMJaYeU
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIMPTCCBpAw
ggR4oAMCAQICAQMwDQYJKoZIhvcNAQEFBQAwgZYxCzAJBgNVBAYTAlJVMQswCQYDVQQIEwJOVzEM
MAoGA1UEBxMDU1BiMRQwEgYDVQQKEwtBbHRlbGwgTHRkLjEXMBUGA1UECxMOU2VjdXJpdHkgRGVw
dC4xGjAYBgNVBAMTEUFsdGVsbCBNYXN0ZXIgQ0EyMSEwHwYJKoZIhvcNAQkBFhJzZWN1cml0eUBh
bHRlbGwucnUwHhcNMTIwNjI5MTIyMTAwWhcNMjcwNjI5MTIwMDAwWjCBjzELMAkGA1UEBhMCUlUx
CzAJBgNVBAgTAk5XMQwwCgYDVQQHEwNTUGIxFDASBgNVBAoTC0FsdGVsbCBMdGQuMRcwFQYDVQQL
Ew5TZWN1cml0eSBEZXB0LjETMBEGA1UEAxMKQWx0ZWxsIENBMjEhMB8GCSqGSIb3DQEJARYSc2Vj
dXJpdHlAYWx0ZWxsLnJ1MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAnilC4C9xC/OV
RqePImRL7mAG0DnSRepBJBM1SJdeDelRMRMNVq6nlqk+/pmA8quUCkJIaUiy+bQMHnlEirPuVK/2
GEMR7NtBop22YBWTd5n9Ktx+X/mQIViBC+x5AbwOqezgM2xhOIdpwxCB3N51xgIwFjRe6a7lqArg
RPOW1IRYQ2SEh0QxnE4j+Rznho3tLlVlpok3HxQLXixImOPrNudAllUgdVlaMEtnmTz8lGubenxa
l7b0sWqvIf8rnEDZWnOHwzmdm/+Rh9jL3ovtFa9bmz4R6I9bE4udnlSBb57IOQ8Y4SXzQlnOzhGf
vO1EIU4mCXBC4kAxxWM+LlZD4QIDAQABo4IB7DCCAegwEgYDVR0TAQH/BAgwBgEB/wIBADAOBgNV
HQ8BAf8EBAMCAQYwEQYJYIZIAYb4QgEBBAQDAgAHMBkGCWCGSAGG+EIBDQQMFgpBbHRlbGwgQ0Ey
MB0GA1UdDgQWBBRy22VUSPsELcg8vpMkV7ZoiNgGkzCBwwYDVR0jBIG7MIG4gBQMEQDmy8Yf6XYP
birE/JiMsgD2vaGBnKSBmTCBljELMAkGA1UEBhMCUlUxCzAJBgNVBAgTAk5XMQwwCgYDVQQHEwNT
UGIxFDASBgNVBAoTC0FsdGVsbCBMdGQuMRcwFQYDVQQLEw5TZWN1cml0eSBEZXB0LjEaMBgGA1UE
AxMRQWx0ZWxsIE1hc3RlciBDQTIxITAfBgkqhkiG9w0BCQEWEnNlY3VyaXR5QGFsdGVsbC5ydYIB
ATA8BgNVHR8ENTAzMDGgL6AthitodHRwOi8vY3Jscy5hbHRlbGwucnUvQWx0ZWxsX01hc3Rlcl9D
QTIuY3JsMHEGCCsGAQUFBwEBBGUwYzAoBggrBgEFBQcwAYYcaHR0cDovL29jc3Aub2ZmaWNlLmFs
dGVsbC5ydTA3BggrBgEFBQcwAoYraHR0cDovL2NybHMuYWx0ZWxsLnJ1L0FsdGVsbF9NYXN0ZXJf
Q0EyLmNydDANBgkqhkiG9w0BAQUFAAOCAgEAYp66/s1LChfJQFfE/ALDNDp3769XnARCuaHnIJ0J
pMMlvTN4F2+QOhxaa8ApeDbEUrcZT0SXCNmcdjUMTWOFGMMYE/bRKrCLQQpyg2Qf4xx7AZD4Fw2q
XXkQq8n2sEoZXyWnjBwYU+5mk3TzCH4quryJr0nURuessXDCSLfvWBYLbUT/prcBP4lMrexK6yWX
9jMcNJfZ9V08n+hOYGVRkvOlvUce/QsTRY+l83LBfFHrfEFUevb2NxLcwiRkOum3LJY4yLmed+6O
pvvPgeRnmGiS/Q4TQ6d8OIca6QusQR7dIhYSdBIqel2ccltyEaGeI+I+s8SHVphJmLM1hAZpVDhO
hrWDyK2VPgH29/HzY6dJg86X8fXU/iHI9vZ8H7vtZYyIr4byrhPzsTyM6sxc6nKfsCCQT1OWg93/
/xn76lACkibtnFmnul9EoPtdIwdXr8jsUkYw9Y8sdxCLpiV3Jhsxpd3NqrYJ6ewNyozJ8QVpz9ND
vMIrjVNnHJH+Bc0PIsKGkzCueMQU3wRxxSyiW2E1CeYql+bViqmmKU7NFx54FFXCzshx4u8UhJxz
IJdECzZw5XUumoPjOiayif3L44mxwrANBD3h+V92FwxWn3xYmOGDjhy4sMYYY5G/CII7nRaH0Tc9
ZFqUcuMlZx7rhkmZhtPCBqx+Qu4l3/cHQiAwggWlMIIEjaADAgECAgE2MA0GCSqGSIb3DQEBBQUA
MIGPMQswCQYDVQQGEwJSVTELMAkGA1UECBMCTlcxDDAKBgNVBAcTA1NQYjEUMBIGA1UEChMLQWx0
ZWxsIEx0ZC4xFzAVBgNVBAsTDlNlY3VyaXR5IERlcHQuMRMwEQYDVQQDEwpBbHRlbGwgQ0EyMSEw
HwYJKoZIhvcNAQkBFhJzZWN1cml0eUBhbHRlbGwucnUwHhcNMTIwNzMwMDg1NTAwWhcNMjIwNzMw
MDg1NTAwWjCBkjELMAkGA1UEBhMCUlUxCzAJBgNVBAgTAk5XMQwwCgYDVQQHEwNTUGIxFDASBgNV
BAoTC0FsdGVsbCBMdGQuMRowGAYDVQQLExFEZXZlbG9wbWVudCBEZXB0LjEVMBMGA1UEAxMMUm9t
YW4gS2hpbW92MR8wHQYJKoZIhvcNAQkBFhBraGltb3ZAYWx0ZWxsLnJ1MIIBIjANBgkqhkiG9w0B
AQEFAAOCAQ8AMIIBCgKCAQEA3XPlIFz/ziAuZdVAUP0esYrAlu5Sk7UJgQg6iO3/dwzEv6oZlZrT
zyawj4kOAfeVflFAp/1q/BN6jcDZNenf8r4ky/h8kPPOVYYNo7NeAQF1yB5IR6YRRPxRfsuHpkej
iJzI6zWoqFsfmeBE/NycmrUpJbWY0cBp6cCDDOfxoXlLGFBWlhVY1miCDeKU7vsxIKh8VVgRpQ8t
qeEZItAwMx284jgiOVlPdsmiAYUxmt+3/dSVsaU++bYnNWLd190MxCrL6NQdN5Hkhfb6tH5fgji4
BTt+Xt2vfMFyq6XXlUG5DlCbpLKi0BZum6F9157UIpHRbrRfKHb/aDC3rdV5dQIDAQABo4ICBTCC
AgEwDAYDVR0TAQH/BAIwADAOBgNVHQ8BAf8EBAMCBPAwKQYDVR0lBCIwIAYIKwYBBQUHAwIGCCsG
AQUFBwMEBgorBgEEAYI3FAICMDUGA1UdHwQuMCwwKqAooCaGJGh0dHA6Ly9jcmxzLmFsdGVsbC5y
dS9BbHRlbGxfQ0EyLmNybDBqBggrBgEFBQcBAQReMFwwKAYIKwYBBQUHMAGGHGh0dHA6Ly9vY3Nw
Lm9mZmljZS5hbHRlbGwucnUwMAYIKwYBBQUHMAKGJGh0dHA6Ly9jcmxzLmFsdGVsbC5ydS9BbHRl
bGxfQ0EyLmNydDARBglghkgBhvhCAQEEBAMCBaAwGwYJYIZIAYb4QgENBA4WDFJvbWFuIEtoaW1v
djAdBgNVHQ4EFgQUMjX4TmZYAF3fqJ7TOmMLQVN7XvIwgcMGA1UdIwSBuzCBuIAUcttlVEj7BC3I
PL6TJFe2aIjYBpOhgZykgZkwgZYxCzAJBgNVBAYTAlJVMQswCQYDVQQIEwJOVzEMMAoGA1UEBxMD
U1BiMRQwEgYDVQQKEwtBbHRlbGwgTHRkLjEXMBUGA1UECxMOU2VjdXJpdHkgRGVwdC4xGjAYBgNV
BAMTEUFsdGVsbCBNYXN0ZXIgQ0EyMSEwHwYJKoZIhvcNAQkBFhJzZWN1cml0eUBhbHRlbGwucnWC
AQMwDQYJKoZIhvcNAQEFBQADggEBACu7ReCTW8egyQF5vVRiTB6s840pRvmAU0A6XHkc2ONWcqbo
4bcmeaU20ShOVWrggKkbgzmcHsMw8R9D7qLp9g+zCvK6lc7Th2HZfgNvt37AJEfGqBULFzDaqkkf
BfYBXo2FgbndI9zIt66UTbkdmvfhr5kW0Apg8y2AshBfj09S8s0G0GiBt3JotgEgtIwEyIgehT2a
/JwImBXWAxyaxkBXBiP5yr955hZdItCEovOJIOJZwpK1UIcv8kh5po60LoPNwW7IuLzKpIWdCUsT
Nb96Fg7N+PMLHMt12zZIcukqjbeQnLKto6jw7jUKeu+Wpbge1S6JBG7Zdzspqg4w1/4xggJHMIIC
QwIBATCBlTCBjzELMAkGA1UEBhMCUlUxCzAJBgNVBAgTAk5XMQwwCgYDVQQHEwNTUGIxFDASBgNV
BAoTC0FsdGVsbCBMdGQuMRcwFQYDVQQLEw5TZWN1cml0eSBEZXB0LjETMBEGA1UEAxMKQWx0ZWxs
IENBMjEhMB8GCSqGSIb3DQEJARYSc2VjdXJpdHlAYWx0ZWxsLnJ1AgE2MAkGBSsOAwIaBQCggYcw
GAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTMxMjA0MTEyODQwWjAj
BgkqhkiG9w0BCQQxFgQUbN1kLHLP930KhA8pFGYoQ5aNWKwwKAYJKoZIhvcNAQkPMRswGTALBglg
hkgBZQMEAQIwCgYIKoZIhvcNAwcwDQYJKoZIhvcNAQEBBQAEggEAMYeDt9wIWXPJUJgGQ62ndYAA
1xoczcHoffywXIdyM9fcaI8U4tAt8ER2UI25R1u39QsWkypuh2YBwqbuMkDPj6jlWK6gGdIUYNhh
gisLTUmvePgiVCX35kJ91BE1oRni/Qn72P6KwWs+YwS5TZBv1iw6Zpzv8H6A/Xk9SNoD7bYnrhGZ
+SCc2WnuoqU67nG/EPqegF7yqMVn2woCYUJ7pSwaVKAdvEWuiHBcgDqSP3FWShFm+V6LzhnBqrLH
j0Sq69BWnJwD2xmlgRocnsO9as7hSkRpige18/k7GNcna8tfUXlrhRIH0qo+tU3OxQ6CGKwWoePe
XMAs5ag2ZhBwUAAAAAAAAA==

--nextPart2455217.9loHMJaYeU--
