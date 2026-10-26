Received: from outbound.qs.icloud.com (outbound.qs.icloud.com [57.103.84.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.447.1793036581442581943
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 10:43:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@subset.ch header.s=sig1 header.b=k1lNUcq4;
 spf=pass (domain: subset.ch, ip: 57.103.84.141, mailfrom: patrick.wicki@subset.ch)
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-10-percent-2 (Postfix) with ESMTPS id E0CA730000B2;
	Mon, 26 Oct 2026 17:42:59 +0000 (UTC)
X-ICL-RepId: 01a1794e-f38a-7fa5-9479-7a4048aa0dd9
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhICkMFWwBeC0kEQwVYEhVdRUMMQxlbE1JWRARUAFswSg1RHlIfHBNRWFUJChhHEkodR0NUAxICWkUBTV8OXh8EF0YZVQRHHl1WQh4ZAlEcVg1XQ1QEX1BJDEFQbFoARxdIHV0ZWW9QXRwOHkIJQRVNVlAFFwZbFAREAV0FXQNAC04CWgNZBkUXSQdaD1wARhRJHh1WH0AZWhMdGl4IWRl5C0YPRA5GXloQDU1DEkIVBBtGHkMEXy9dF14MXgU=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1; t=1793036580; x=1824572580; bh=QDtkG3dW2m8MZFMo2DFgREiCUqZZUOUAz/e30wlmTGo=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=k1lNUcq4AJk3WPBDFlIfNiUlCRpjecti1cgJTQFySe9EhpTTm4bpsDBOPoORbcwetONS+hpmj8+W3oqRQfJNOeLMLV07U8sYRMh3NeIM85bivsidabC7NzvfEmw27fSgfPqMrSdwB8vasqHBkHxoNlxxkLFEQ570+VDfHavnkkpHaJnCc1s3wo0KVFimcxlclEzttLIqaZK459UWd0uP/a5cJ695m/YZ6S6Z9HsOMHC+tS3NL3XI/t5ZmSy67WSxYIM3VhZxXOOzDy+WkFLUZH55IxwNbUYwUyKzoAZXJ2BPca98zv5o7lCYNOhy3b8TGchI99EY7qmlAdM5oTCJHA==
mail-alias-created-date: 1663698038540
Received: from desk.internal (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-10-percent-2 (Postfix) with ESMTPSA id C44BC3000169;
	Mon, 26 Oct 2026 17:42:58 +0000 (UTC)
From: patrick.wicki@subset.ch
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Wicki <patrick.wicki@siemens.com>
Subject: [meta-networking][PATCH 1/2] squid: install systemd unit without executable bit
Date: Mon, 26 Oct 2026 18:42:44 +0100
Message-ID: <20261026174245.1478726-1-patrick.wicki@subset.ch>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA3MCBTYWx0ZWRfX3wmnj5WOKIDj
 tyqvOP6ogD2hCRSZ96LrwcDE5Tot7qCScIeSOB5ii6fM+2NlyLGaMVQFw3D+7Dmc9h+EiyK7gha
 w0HICrv+XAzDEu+5A5KEqY8DJeCLFJjyhuhzfNaulqOwwTPGW4EaNqLnYnr1XmHYAjvZV4pvv+b
 xh42Juce8zlTS3nJeaas3ThA8nSNadNSV839i6MMdVVIVjxZoZJEEyXJiOk33VbrEQtWpftqUgC
 4JwlBE0n7BEsLvToeFA4yZAWI3zDz5YdNaeku79uxmXyUGHpqeFDw5dnqUX/Tc34DkSP/Fw+KAu
 lcY/QlbezwNIFXiScO4PCgAsFb/+dkFQFS1L9h8St5VFQOe40DvFVd6Gd/n/Rc=
X-Authority-Info-Out: v=2.4 cv=dPGrWeZb c=1 sm=1 tr=0 ts=6adf9124
 cx=c_apl:c_pps:t_out a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=a_U1oVfrAAAA:8 a=8tgSK7xUebHiGByt24EA:9
X-Proofpoint-GUID: weIpUQgFSnH6LqBx0oig6hmQzhNjV6YD
X-Proofpoint-ORIG-GUID: weIpUQgFSnH6LqBx0oig6hmQzhNjV6YD
X-JNJ: AAAAAAABdkSZjdnBrelYqQ9QMaVCSQE0GtsRU+Mrx1S7Oe3lYL0kjWPUykggo+K+7piwz/mKh1sjOSDYdviK0uCKV1ekdpLuXUH9nu73GL2jLxvJuzF/kPfiTqUCj5V4Rlfojg8m+d38kiN/iQ7Rkzchq1svY9TojAZvtQUpqmqcGofKNsZ9b0MAuoIqleTcZoydn39bMMWDItlxVcWpE3KGF0oQQvd2BMnF3GSP3nHXgBxQvfMduVgBdPMv5TAaTW9L+44lbje0myy5aui2HOhyd2zBYYXzzFMOIGIL9RBsKuVGaOz+nPIdkR4QKDZI8trkjekYTiP1GqcxBxKw9N7MxQPMVl+1JCo0H/t5uA9c5d+onHBCYB1BiwJ2V5NtrIIh+sxTYRHVGOEVzS/XaLg+jwU0XG99UcnQQgiMD0XtMntJaqw2IL1UknO4WT6knHduZETH5cBGP2cUvpodFpfG4teVU3nOdvEquq2AVdrylj1nhzahPl7spXLVMyH7TjqK72Ex1UihoUc6OeSlF1ktEiJvdoikmL5i/nYyVWFbw+FhqzMOMzkC354v+JUvqxwH+Hc8xMmqGrLvs9Jz2ZM/Fwfru+R2NJTnGPVEheP7qwjXWIVdduKeoycNLWPd743Ws2tfyAqQRrT5s4bXtkijq9rTqL3shMy2BRH6WvWFMDr2mn7DKe0Y8b3oSw2PUIwS70Y9CN3dldF+HSbbidxuSpXdpCVqZ+SkMgn5fgkfKj3whi+3irDrh7djfu5Y6aZr92vhmLMqeRe/hyQw1BobVXwPNbuxlfaK+5zpJX/DD7egHQ3Q+W1WV+PNmq4qThIjWnHwNkhzDdNAJLdHApG2aB3jKFPbUM+1UMV+HIwNqHPhrV0MmfCaH4fcowqy60B08nhtDKKAFqBvWHbeofxrSvBI96o/TvdrEiK24NypUvEC6kLxe3nXjSwD144ytqPadRe6Bv9hBlnNfbZ+nL13BbQjO/S
 CmwUFwCqHYLbio5RzaI24G5M0xGJ5fphkWLnfzwWcyeuFKMZsPMmAHg38RaPIEjkzg8SujtI54BvjiaQAj0XhZ4U5Spyoc+7lcUW58ISr4w3K/qSis/Z6c/jQZhmdDqCqjW9PToQDxoeQKJKUdilWnw3izWW7qd1abcSqkECEHjDYzuPizocCJpOXOG6AI8M/JWMsqP5lc2X6K0I8tUCN4OYEoT8jQlAr4RVCjxJoCgofIvFljoe1CvxHHrahVZI0wAw=
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 17:43:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131439
Content-Type: text/plain; charset="utf-8"

From: Patrick Wicki <patrick.wicki@siemens.com>

install defaults to mode 0755, which makes systemd complain:

  Configuration file /usr/lib/systemd/system/squid.service is marked
  executable. Please remove executable permission bits. Proceeding anyway=
.

Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
---
 meta-networking/recipes-daemons/squid/squid_7.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/squid/squid_7.7.bb b/meta-ne=
tworking/recipes-daemons/squid/squid_7.7.bb
index b657197fd7..bda8f124cb 100644
--- a/meta-networking/recipes-daemons/squid/squid_7.7.bb
+++ b/meta-networking/recipes-daemons/squid/squid_7.7.bb
@@ -117,7 +117,7 @@ do_install:append() {
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false=
', d)}; then
         # Install service unit file
         install -d ${D}/${systemd_unitdir}/system
-        install ${S}/tools/systemd/squid.service ${D}/${systemd_unitdir}=
/system
+        install -m 0644 ${S}/tools/systemd/squid.service ${D}/${systemd_=
unitdir}/system
         sed -i 's:/var/run/:/run/:g' ${D}/${systemd_unitdir}/system/squi=
d.service
=20
         # Configure tmpfiles.d
--=20
2.56.0

