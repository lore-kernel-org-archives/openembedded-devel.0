Received: from [212.227.17.10] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <christian@poessinger.com>) id 1LYhxd-0006k6-8Z
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Feb 2009 15:27:09 +0100
Received: from tardis (ppp-93-104-75-21.dynamic.mnet-online.de [93.104.75.21])
	by mrelayeu.kundenserver.de (node=mrelayeu7) with ESMTP (Nemesis)
	id 0ML2xA-1LYhvw16sk-0001XE; Sun, 15 Feb 2009 15:25:24 +0100
From: =?iso-8859-1?Q?Christian_P=F6ssinger?= <christian@poessinger.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 15 Feb 2009 15:25:24 +0100
Message-ID: <000d01c98f79$3e36e6d0$baa4b470$@com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcmPeTzdWAH37Q9STYSB82QzpguZBw==
X-Provags-ID: V01U2FsdGVkX1/dJAdT8uc1l7ZUHQ2CQ3jLwtgb0/X3/PnZeXq
	0aQRrPj4oaeXUmL3h3torbLPXw2a4OEMdiWuoYrsypcy8OEcOa
	4v1eWirgjRfr34qj/nnUeHKIB4F/6jsDkgdpgVZe9LWI2hFpPw dug==
Subject: image.bbclass broken?
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
X-List-Received-Date: Sun, 15 Feb 2009 14:27:09 -0000
X-Groupsio-MsgNum: 7754
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=SHA1; boundary="----=_NextPart_000_0009_01C98F81.9EC7B0D0"
Content-Language: de

------=_NextPart_000_0009_01C98F81.9EC7B0D0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,=20

after a recent 'git pull' of the -dev branch I'm not able to create =
images.

I receive the following error:

| awk: {size =3D 10240 + $1; print (size > ${IMAGE_ROOTFS_SIZE} ? size :
${IMAGE_ROOTFS_SIZE}) }
| awk:
^ syntax=20
| du: write error

Doing a grep for the line I found it:

org.openembedded.dev/classes/image.bbclass:110:
ROOTFS_SIZE=3D`du -ks ${IMAGE_ROOTFS}|awk '{size =3D =
${IMAGE_EXTRA_SPACE} + $1;
print (size >                  ${IMAGE_ROOTFS_SIZE} ? size :
${IMAGE_ROOTFS_SIZE}) }'`

After replacing image.bbclass with the one from the -stable branch
everything worked again. I run OE on an up-2-date Ubuntu Server 8.10.


Can anyone confirm this behavior?

Best Regards
Christian P=F6ssinger


------=_NextPart_000_0009_01C98F81.9EC7B0D0
Content-Type: application/x-pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIILgTCCA1ww
ggLFoAMCAQICAgPpMA0GCSqGSIb3DQEBBAUAMIG8MQswCQYDVQQGEwJERTEQMA4GA1UECBMHSGFt
YnVyZzEQMA4GA1UEBxMHSGFtYnVyZzE6MDgGA1UEChMxVEMgVHJ1c3RDZW50ZXIgZm9yIFNlY3Vy
aXR5IGluIERhdGEgTmV0d29ya3MgR21iSDEiMCAGA1UECxMZVEMgVHJ1c3RDZW50ZXIgQ2xhc3Mg
MSBDQTEpMCcGCSqGSIb3DQEJARYaY2VydGlmaWNhdGVAdHJ1c3RjZW50ZXIuZGUwHhcNOTgwMzA5
MTE1OTU5WhcNMTEwMTAxMTE1OTU5WjCBvDELMAkGA1UEBhMCREUxEDAOBgNVBAgTB0hhbWJ1cmcx
EDAOBgNVBAcTB0hhbWJ1cmcxOjA4BgNVBAoTMVRDIFRydXN0Q2VudGVyIGZvciBTZWN1cml0eSBp
biBEYXRhIE5ldHdvcmtzIEdtYkgxIjAgBgNVBAsTGVRDIFRydXN0Q2VudGVyIENsYXNzIDEgQ0Ex
KTAnBgkqhkiG9w0BCQEWGmNlcnRpZmljYXRlQHRydXN0Y2VudGVyLmRlMIGfMA0GCSqGSIb3DQEB
AQUAA4GNADCBiQKBgQCwKeu0drOu17ZbtF7nveOxnEkEV1uhq9l/Exv9umGr2Odx3y0AlF1RSH0j
73VihJA8Ch9ZEXQvjoCl/TACPSlSzXIaSSGcvMtSjkihY5bIEIUwaVd0RcBahsbVPeBoV30xaiSN
RZc+MX5oZjJuJG3sMjbJQcrwMUTIo2HKG6A2HwIDAQABo2swaTAPBgNVHRMBAf8EBTADAQH/MA4G
A1UdDwEB/wQEAwIBhjAzBglghkgBhvhCAQgEJhYkaHR0cDovL3d3dy50cnVzdGNlbnRlci5kZS9n
dWlkZWxpbmVzMBEGCWCGSAGG+EIBAQQEAwIABzANBgkqhkiG9w0BAQQFAAOBgQBPmVmFyGRWgsVv
PdhGCS88UcGncFiBkhLq9NQWAJZecijn1jZfGpyvH8KDGrQFVZmmWFw3KPJXHutdv7HTRQ9yHAPS
AMcsVdr+X4l2i+LUd/VNCRevxLqrMCtPuB3q2f9Z8FB0Rrpe6jaw65J7D1jaMuFSvSM3D/XzAEqu
sF7ebjCCA+wwggNVoAMCAQICDwDENwABAALlou1Djx5XszANBgkqhkiG9w0BAQUFADCBvDELMAkG
A1UEBhMCREUxEDAOBgNVBAgTB0hhbWJ1cmcxEDAOBgNVBAcTB0hhbWJ1cmcxOjA4BgNVBAoTMVRD
IFRydXN0Q2VudGVyIGZvciBTZWN1cml0eSBpbiBEYXRhIE5ldHdvcmtzIEdtYkgxIjAgBgNVBAsT
GVRDIFRydXN0Q2VudGVyIENsYXNzIDEgQ0ExKTAnBgkqhkiG9w0BCQEWGmNlcnRpZmljYXRlQHRy
dXN0Y2VudGVyLmRlMB4XDTA3MDkyNjA3MjQwOVoXDTEwMTIzMTIyNTk1OVowfTELMAkGA1UEBhMC
REUxHDAaBgNVBAoTE1RDIFRydXN0Q2VudGVyIEdtYkgxJTAjBgNVBAsTHFRDIFRydXN0Q2VudGVy
IENsYXNzIDEgTDEgQ0ExKTAnBgNVBAMTIFRDIFRydXN0Q2VudGVyIENsYXNzIDEgTDEgQ0EgSUlJ
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDt9kYre5b9JKbNj5LffhGsiGlfobkfluO2XqPL
zKoMOnduw9+sfHUINrW76Y9B02KC9vF3SDmxbIM4fKM3+7k/dKzb0zI4w66PBHx+5CqeykhMm8sQ
aI4EpOUu7tWVfH8ZGHT9UpbVG17+Gi4znxxb/T9+IuB2Q/qr0ZJ5tR/7hwIDAQABo4IBLDCCASgw
VwYIKwYBBQUHAQEESzBJMEcGCCsGAQUFBzAChjtodHRwOi8vd3d3LnRydXN0Y2VudGVyLmRlL2Nl
cnRzZXJ2aWNlcy9jYWNlcnRzL3RjY2xhc3MxLmNydDASBgNVHRMBAf8ECDAGAQH/AgEAMEoGA1Ud
IARDMEEwPwYJKoIUACwBAQEBMDIwMAYIKwYBBQUHAgEWJGh0dHA6Ly93d3cudHJ1c3RjZW50ZXIu
ZGUvZ3VpZGVsaW5lczAOBgNVHQ8BAf8EBAMCAQYwHQYDVR0OBBYEFP2u3ZGgztA5KkvvKMwSnk9+
FKp1MD4GA1UdHwQ3MDUwM6AxoC+GLWh0dHA6Ly93d3cudHJ1c3RjZW50ZXIuZGUvY3JsL3YyL3Rj
Y2xhc3MxLmNybDANBgkqhkiG9w0BAQUFAAOBgQBe8NTmpp39KWyazqfbPAUwvRv/TEpem4Xy4Gsr
8t4RGG9ExKT/ktfFi2tXO+7LpTmJTbvQ+qHoxkBlmhD1oVVUn2zSIq372vfPvFoFtkvFatpmHDVu
cTm1vVfeq1t3yDsvs3WLicz5jT4MSV5EFBaGMgaKjgAIU0NOMXSadvg1FDCCBC0wggOWoAMCAQIC
DwDGeQABAAJleOfDDs0k2jANBgkqhkiG9w0BAQUFADB9MQswCQYDVQQGEwJERTEcMBoGA1UEChMT
VEMgVHJ1c3RDZW50ZXIgR21iSDElMCMGA1UECxMcVEMgVHJ1c3RDZW50ZXIgQ2xhc3MgMSBMMSBD
QTEpMCcGA1UEAxMgVEMgVHJ1c3RDZW50ZXIgQ2xhc3MgMSBMMSBDQSBJSUkwHhcNMDgwNjAyMTk1
OTE0WhcNMDkwNjAzMTk1OTE0WjBVMQswCQYDVQQGEwJERTEdMBsGA1UEAwwUQ2hyaXN0aWFuIFDD
tnNzaW5nZXIxJzAlBgkqhkiG9w0BCQEWGGNocmlzdGlhbkBwb2Vzc2luZ2VyLmNvbTCBnzANBgkq
hkiG9w0BAQEFAAOBjQAwgYkCgYEAuguFcdn+JUOZE1zrf7pNe49W/VOCLZ5qMl4oadEeC2gQEphG
9arX0oBpkpGvvHnZUPDk7YRgQvJCOKQAKpZl4s5yEHFzeT7TIrslx0gCvZTnz2/irp91OdTM/ODf
IFLVm6y/9zUwqhE8xjOANKlKJjGWb1MZQa3OxVt0bAzx2aECAwEAAaOCAdUwggHRMIGZBggrBgEF
BQcBAQSBjDCBiTBSBggrBgEFBQcwAoZGaHR0cDovL3d3dy50cnVzdGNlbnRlci5kZS9jZXJ0c2Vy
dmljZXMvY2FjZXJ0cy90Y19jbGFzczFfTDFfQ0FfSUlJLmNydDAzBggrBgEFBQcwAYYnaHR0cDov
L29jc3AuSUlJLnRjY2xhc3MxLnRydXN0Y2VudGVyLmRlMB8GA1UdIwQYMBaAFP2u3ZGgztA5Kkvv
KMwSnk9+FKp1MEoGA1UdIARDMEEwPwYJKoIUACwBAQEBMDIwMAYIKwYBBQUHAgEWJGh0dHA6Ly93
d3cudHJ1c3RjZW50ZXIuZGUvZ3VpZGVsaW5lczAOBgNVHQ8BAf8EBAMCBeAwHQYDVR0OBBYEFFsT
sBwLENTiHhGnFoxQdRHfWH5kMEkGA1UdHwRCMEAwPqA8oDqGOGh0dHA6Ly93d3cudHJ1c3RjZW50
ZXIuZGUvY3JsL3YyL3RjX2NsYXNzMV9MMV9DQV9JSUkuY3JsMCcGA1UdJQQgMB4GCCsGAQUFBwMC
BggrBgEFBQcDBAYIKwYBBQUHAwcwIwYDVR0RBBwwGoEYY2hyaXN0aWFuQHBvZXNzaW5nZXIuY29t
MA0GCSqGSIb3DQEBBQUAA4GBAO125wEI0aBufMa0kTLKOucyyMuu5imnJR39B/Ujbbivd9TR1NV1
JASrmgipzCxIL1GyaBL+ctUGbCyjxNd5C9NGdNBbdMQ/flcQEG7jWfDYpOCR3krSiRKFbsVXMhgh
mn6iHbG2bzzj76IFqhKHvFS4OP5Hi79A9MGt4DATcm6JMYIDSzCCA0cCAQEwgZAwfTELMAkGA1UE
BhMCREUxHDAaBgNVBAoTE1RDIFRydXN0Q2VudGVyIEdtYkgxJTAjBgNVBAsTHFRDIFRydXN0Q2Vu
dGVyIENsYXNzIDEgTDEgQ0ExKTAnBgNVBAMTIFRDIFRydXN0Q2VudGVyIENsYXNzIDEgTDEgQ0Eg
SUlJAg8AxnkAAQACZXjnww7NJNowCQYFKw4DAhoFAKCCAhAwGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMDkwMjE1MTQyNTIzWjAjBgkqhkiG9w0BCQQxFgQUMKYD4G4w
XWgMGHKZQAGsJQGgXdUwZwYJKoZIhvcNAQkPMVowWDAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgIC
AIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwBwYFKw4DAhowCgYIKoZI
hvcNAgUwgaEGCSsGAQQBgjcQBDGBkzCBkDB9MQswCQYDVQQGEwJERTEcMBoGA1UEChMTVEMgVHJ1
c3RDZW50ZXIgR21iSDElMCMGA1UECxMcVEMgVHJ1c3RDZW50ZXIgQ2xhc3MgMSBMMSBDQTEpMCcG
A1UEAxMgVEMgVHJ1c3RDZW50ZXIgQ2xhc3MgMSBMMSBDQSBJSUkCDwDGeQABAAJleOfDDs0k2jCB
owYLKoZIhvcNAQkQAgsxgZOggZAwfTELMAkGA1UEBhMCREUxHDAaBgNVBAoTE1RDIFRydXN0Q2Vu
dGVyIEdtYkgxJTAjBgNVBAsTHFRDIFRydXN0Q2VudGVyIENsYXNzIDEgTDEgQ0ExKTAnBgNVBAMT
IFRDIFRydXN0Q2VudGVyIENsYXNzIDEgTDEgQ0EgSUlJAg8AxnkAAQACZXjnww7NJNowDQYJKoZI
hvcNAQEBBQAEgYBab06JgKLEiQcCGcYETk1j4oXbGmxsU1Yxvco/nTj9Khl39ba3rhk/md8ZL5hq
iH7xTmeWajmHMT2lq5nVlzRI3Lq6GxrqERMVVQZLEMlsCyGpvg8F9TIH/NC06FQRwy8hZJ2/6XYl
rmEs1Y6hWf/JAmejzE0tT+ql7pQQXZEVBQAAAAAAAA==

------=_NextPart_000_0009_01C98F81.9EC7B0D0--
