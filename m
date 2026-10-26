Received: from outbound.qs.icloud.com (outbound.qs.icloud.com [57.103.84.190])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.473.1793036586158418186
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 10:43:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@subset.ch header.s=sig1 header.b=Dyl+V4K/;
 spf=pass (domain: subset.ch, ip: 57.103.84.190, mailfrom: patrick.wicki@subset.ch)
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-10-percent-2 (Postfix) with ESMTPS id BA49B3000137;
	Mon, 26 Oct 2026 17:43:02 +0000 (UTC)
X-ICL-RepId: 01a1794e-fee9-710f-889c-0e24c2a91e92
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhICkMFWwBeC0kEQwVYEhVdRUMMQxlbE1JWRARUAFswSg1RHlIfHBNRWFUJChhHEkodR0NUAxICWkUBTV8OXh8EF0YZVQRHHl1WQh4ZAlEcVg1XQ1QEX1BJDEFQbFoARxdIHV0ZWW9QXRwOHkIJQRVNVlAFFwZbFAREAV0FXQNAC04CWgNZBkUXSQdaD1wARhRKHh1WH0AZWhMdGl4IWRl5C0YPRA5GXloQDU1DEkIVBBtGHkMEXy9dF14MXgU=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1; t=1793036585; x=1824572585; bh=K5Qs5OKovVNpfcuuVxt8SrjLO79yTnGDlws4SdWwods=; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=Dyl+V4K/BAv7Yj64UsTmZ3/75eomEcklj2TmDgW5O9d56xuVJxdwMhZoUgk6laILSlKXh6avvUFjtLR6Vt3ScsFWoGXGPqCkZTFpc2M2a6mROv+Ds/fg+mICqkQtZ2BhErM3DvL7VP00+5r0a74kkD15jmI0KwzPgMpqNRagavv/3k677Dfjf2ZA0Mgty12/vQHI/25TLv5oM6eDo3nK0vly9yyMmRFs67IZoyRMaMcILtoDA7o5W5ZzpxQpqj9gV+JTwA8oW8FjluSIKoTdGVGPs0n66cywRC7VfWjKdo+w54GKBVxGSF+vwAhA/hr+an/PXDlyEMpiOJo2tpmylA==
mail-alias-created-date: 1663698038540
Received: from desk.internal (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-10-percent-2 (Postfix) with ESMTPSA id 46A1A3000352;
	Mon, 26 Oct 2026 17:43:01 +0000 (UTC)
From: patrick.wicki@subset.ch
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Wicki <patrick.wicki@siemens.com>
Subject: [meta-networking][PATCH 2/2] squid: use /run instead of /var/run in tmpfiles.d
Date: Mon, 26 Oct 2026 18:42:45 +0100
Message-ID: <20261026174245.1478726-2-patrick.wicki@subset.ch>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026174245.1478726-1-patrick.wicki@subset.ch>
References: <20261026174245.1478726-1-patrick.wicki@subset.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Authority-Info-Out: v=2.4 cv=bNsb4f+Z c=1 sm=1 tr=0 ts=6adf9127
 cx=c_apl:c_pps:t_out a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=a_U1oVfrAAAA:8 a=EUgBE1UYJte-LVu3LvYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: vJus0P55_x3D6L5KTXmJgYuecwXVD_dC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA3MCBTYWx0ZWRfX7TsPvAsxWUpc
 B5EzB6U8ZLevvCpUqqK9Jqvbn55GEUq6gakll18bvdbe/B8T+DlmfTM3LE+BDqB1R68TF8CDY1j
 aQpzdffRnWCGRtYW9ln+TZhGLy9sRNrnJCTMTBIDsZ/RJppPQiudinjglaJX/6id4/No3TgRqRN
 HRSrpD/b2nt94Et/ti9cG8pzKRWAsQ6dZtbCQe/fYIsh6znOP5N19CVYWnGuueTBQjWf5FiKBMR
 VNKHlzdyyPFf3ul6x4i5N/bstktVWlLdKRThrCzJLTmgYpXYCvOVUH/BSA57eS63RV12u1IZV1h
 80VHfsVULH38bJtDkGlg4/SroRlEGbXabqboS11HkMIud1IsaIzn1fKZiHmep0=
X-Proofpoint-GUID: vJus0P55_x3D6L5KTXmJgYuecwXVD_dC
X-JNJ: AAAAAAABssr6Bn1Vuwhj5bERqTZRPmIbn64cCwrjtgS1ZLslTYI+ELHSG301vlxYU+YRhBSiaIv1DeDzR0o/tR8feNTnjazSXCzBdHoght1B1YEKQLnT2C1dDlgbYmFrlPXzlsE3jnru0XDjy4AGx6W0Tfcoyl69248fQufLkM0JoW7JYbqRx1ubkNwWZswzgnZezs5BsjJy7aqLRitGRPJ/b9SEhYhYQzzI1+HYb1s04QFXIxymgmm5eZpnruk6xDlw1FwXi/IrPnxQXgTIXTwBTFPLwBcHYDI7TpaPJyLDAyguqYpqM80AqBelX19wqNbjHFcKXp7cODWY2/rUm2Ib+B0b+t8WZ976JBSfwVCZC5otjAdbo2Ck2OGjn+mJ59vwFWYRo43xpxj6A1KcUlorwdzPAcJcsXMXcR4HE6B8e/G7xDUTuQDJqfOyqGoLCO9jZmvJI0aLTPrlTlfqpWDzm+0iYEaO413HCaHEMncb1lBoC01RrS1tOOUMPFk/v3C61wTDBsxvT6rZi5X5a29y8OH6/p42yiTMZ7qiogl3b8g7iTTIuByjNSBnAKFmVjnfdYeencmghqSk43E3WcNGI+ijcN6vMs+3rlrLbtlZYsBfgXhsnCcVV9K3WnmKburh4oTPIem6blVKnVkaJwpemrvg1MvG78GLzs/uBRh98P730DQx+DvsBjt/Ks59AE5nR3lHLxjLkLcdoWFw5kVgfUYWPuw9YyqkGC/dMva1Y7yp77bCjMVvHxx1rntN
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 17:43:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131440

From: Patrick Wicki <patrick.wicki@siemens.com>

systemd-tmpfiles warns about the legacy path:

  /etc/tmpfiles.d/squid.conf:1: Line references path below legacy
  directory /var/run/, updating /var/run/squid =E2=86=92 /run/squid; plea=
se
  update the tmpfiles.d/ drop-in file accordingly.

Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
---
 meta-networking/recipes-daemons/squid/squid_7.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/squid/squid_7.7.bb b/meta-ne=
tworking/recipes-daemons/squid/squid_7.7.bb
index bda8f124cb..7649342596 100644
--- a/meta-networking/recipes-daemons/squid/squid_7.7.bb
+++ b/meta-networking/recipes-daemons/squid/squid_7.7.bb
@@ -122,7 +122,7 @@ do_install:append() {
=20
         # Configure tmpfiles.d
         install -d ${D}${sysconfdir}/tmpfiles.d
-        echo "d ${localstatedir}/run/${BPN} 0755 squid squid -" >> ${D}$=
{sysconfdir}/tmpfiles.d/${BPN}.conf
+        echo "d ${runtimedir}/${BPN} 0755 squid squid -" >> ${D}${syscon=
fdir}/tmpfiles.d/${BPN}.conf
         echo "d ${localstatedir}/log/${BPN} 0750 squid squid -" >> ${D}$=
{sysconfdir}/tmpfiles.d/${BPN}.conf
     fi
=20
--=20
2.56.0

