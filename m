Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F78CD98E3
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 01:42:58 +0000 (UTC)
Received: from us-smtp-delivery-172.mimecast.com (us-smtp-delivery-172.mimecast.com [170.10.133.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.139798.1781557508059505648
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2026 14:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@dekaresearch.com header.s=mimecast20240828 header.b=WsoleztP;
 spf=pass (domain: dekaresearch.com, ip: 170.10.133.172, mailfrom: sszabo@dekaresearch.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dekaresearch.com;
	s=mimecast20240828; t=1781557506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=7f2wC7HCgc4WOoSSP7dvPqS77M2+DfbzhB9YsW1/Xn8=;
	b=WsoleztP91JSpHD57c5o8lEoTNeD3hJzPk8h1qyPkbYFL5F254I8buwJ76+MVJkJbgITCy
	otfPr64VAprp/1q3f50Lr8SLFeQ0TfU51Hih1CWiK09Bhl1Q7IdKlN1bMYjZuD5w4NBEC0
	9YT3aXhCGUvZpCZS43cQgXoSL3vgzOQ=
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11022081.outbound.protection.outlook.com [52.101.53.81]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-331-pWt33slAOmmteBFNurTnrw-1; Mon,
 15 Jun 2026 16:58:08 -0400
X-MC-Unique: pWt33slAOmmteBFNurTnrw-1
X-Mimecast-MFC-AGG-ID: pWt33slAOmmteBFNurTnrw_1781557088
Received: from SA1PR18MB5926.namprd18.prod.outlook.com (2603:10b6:806:3e6::10)
 by DS4PPF324B86F34.namprd18.prod.outlook.com (2603:10b6:f:fc00::a93) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Mon, 15 Jun
 2026 20:58:05 +0000
Received: from SA1PR18MB5926.namprd18.prod.outlook.com
 ([fe80::6732:4dbc:8fca:32de]) by SA1PR18MB5926.namprd18.prod.outlook.com
 ([fe80::6732:4dbc:8fca:32de%5]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 20:58:05 +0000
From: Stephen Szabo <sszabo@dekaresearch.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: Cale Surgen <csurgen@dekaresearch.com>, Adnan Suljevic
	<asuljevic@dekaresearch.com>
Subject: No option to disable PROMPT when booting with extlinux
Thread-Topic: No option to disable PROMPT when booting with extlinux
Thread-Index: Adz8/8krXb/4c5I8RzKif3dPPq8h7w==
Date: Mon, 15 Jun 2026 20:58:05 +0000
Message-ID: <SA1PR18MB5926F18056B88BB45AB2F91DB1E62@SA1PR18MB5926.namprd18.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR18MB5926:EE_|DS4PPF324B86F34:EE_
x-ms-office365-filtering-correlation-id: c4fbf89f-12e3-4869-88b8-08decb20cc08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|38070700021|18002099003|13003099007|11063799006|8096899003|56012099006
x-microsoft-antispam-message-info: +Y50czqeQcIuyRqNfkR4lOPvPIwJmxu1udaz54oB5bCXMcCSU7M74OhEB7/1g94D5pWyM182nXfLywszRAHFSi2ya02yNyiwI8TQWHru2BkuFKXwzx41usQXIuQQUhBLaRtk3jT4ZG7htVkm82ODdtKDQAjOtM4pqr/46g8TrA1yiVpT/H3j2X4XFrQ7OzYpvLFhcSZWNynx42JhCstF1H3Vq/+Am3Af1/zY/Jh6TI8a5GJUBpcYsF3/UbQPmgmNOR5paw2pRCv1TfWb+BUh+fXJuvob4VDLoEPaVlXPhp+uATxdTCsTFavknVxL6/LwiRn+fmNvHhDTDCuWzvk8rSIA9KVBJx84IEPE6KTJolKU3floiv7xYjAJRueVN1DThEx6Tw0GgC8oGUTG8O/IZwGQQcCeoT67cf6mAkLRVl31KqwV5g4K6ytpqQKwT/AEl7d52GqUJp2yfKLL5UaLXpN6PxdoZVeTvAJrCUsW20m0rSVcBVrSyqOPcEkYvmvLQ5/19zkIpDclk4tgHeJ0gkP920PHMCXhrZKbIkns2pS74AuYVxsSep9eCm4E4OROPNefgcjfTJdNUs0L4uAXDV4K27BKLa9rPShCqfO/S4fSvs1KZ6lQjcRsofaCbsPiIXi0uYd/zed5D0XheIa6PRpTyD980MQR0Uj/IIALDi7DSDzVF51KYheK1hsgE74DSC1LG7WKRVSl0RAjE/PcaQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR18MB5926.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(38070700021)(18002099003)(13003099007)(11063799006)(8096899003)(56012099006);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?F7PO6orttzPx+TkY+tX6lF4/RE7cKx9lI4Zca5Pph7zTljOBfmejBa14G171?=
 =?us-ascii?Q?ypiM4Sdv46jnjci3XWId9anCHhgQQl1f+fjnemP/c1Bvmd+4Bh0PJOaEdZIJ?=
 =?us-ascii?Q?ufKM7NN82vGo0ULaWvvk+SAhhdhIk3n+aMqazY8/ucKJ2n2NQLGdPDE7lWh7?=
 =?us-ascii?Q?3lycx2FnvBaWskU9u3CW23gKQ5kgITp/pqv/XWyh2ZKJSzSZrc+87bRTm9n0?=
 =?us-ascii?Q?93uyLfvbusLU1ZuEYfMce0VRAx/Cgjyr2Ny8BSrMeWTa8fwANr3ySqb4myZN?=
 =?us-ascii?Q?D6YexpBy2o++D2lcCrGh813uB60SjckrDvZjEKNGTXAs6+eadnUbPRS7v0z1?=
 =?us-ascii?Q?k1NdddVw7x6MFyJpgo1eNqcBUClwLSZczjkuSp/VeE+9jT1BExCFJAtFRhHf?=
 =?us-ascii?Q?9J+q3J+nVkqQSPn9sOwB2kmS8BkO8Be7YoVl4QElmNOMMFp/SopJWCtFMllQ?=
 =?us-ascii?Q?tW0ZmeWyL7owE71Wy8RKnxo/s4RB06oW/znD+2lP83sMPEAn3Y3lH8KR1Hq0?=
 =?us-ascii?Q?JMBGDyqlIfez8Ogxhe/o8oFgcVjRg0QR329bOQ0Cb7/Aa0NcEIANjujMquUe?=
 =?us-ascii?Q?TU+gE+rukMUjXoIuqnZlRzWFWvuccFBpKp8v6ArfErLd/qzb404L6js4nvm7?=
 =?us-ascii?Q?sw6BJmhig0cZrvu1BfuJNKejnO5bn/778a0A2S8KJAaja2Lv4dxNDyu5Yfuc?=
 =?us-ascii?Q?PnQyGgt/x0FQ7YuK0nkwtpmkAnRs8pI8ekyx5VjZurtTHBjP6sw2PihWZSX3?=
 =?us-ascii?Q?xuig9kjxRbyXtUcrqVeqDlQ5WRFog6eAxr7ERI4/GL+TifZWflEjyPM3aGGq?=
 =?us-ascii?Q?zwDP6pj03FHc2r+0S+mkK1p4qQlRf8bRPU3ogwfT1GkrG9vCv3JiUFgjSWa9?=
 =?us-ascii?Q?kJbKz2jTDCrNjZg/keqvSsd2fKDn1N8erfeFlB9b9ALTfIF0c9Kl4pHWddmE?=
 =?us-ascii?Q?KGx8/vbW63CD3JrCKis30uyoFliO99YoAWYvnMbC/CR3vXuCY5J3usKvmCN5?=
 =?us-ascii?Q?ipsCiKYOhvlCgRL5jnLLCI0qrapnnJTUR77UuK+RgFXjf99p7X3b/ECgbrVj?=
 =?us-ascii?Q?FiX+D9zYW5zaHzg2YHfhEBNVZTaYM36j3Ae5UQuVDioy97HCf78y50oKc7RC?=
 =?us-ascii?Q?axYET2rGOsiy4+xwovVZe+Sjwa8zs8A5qOgZ21zlbtM1/LaAk41+HcMouhfF?=
 =?us-ascii?Q?TwKkHkxO/HOMC56RW1MDQbmTu0d97YVIPVR38Q+5HskjPjOstjlX+C3HEtjJ?=
 =?us-ascii?Q?L7sdg/Ikdc2K7rHsuIAVUp2jKvN3z/eWZHMvYz8nm2teq1Z2/W2VmJsX0N0U?=
 =?us-ascii?Q?493fmd3mK5nrxb3SAv9CRYJQCWFLgnWFY1DoV8ij6RAK5xjuSDpKPfvsPbuA?=
 =?us-ascii?Q?o4h8xDTbsVdsGlwDQm4ayvCdocnM8T1AA4/uG3K6OnjNkYlDdwkKw23QNp2o?=
 =?us-ascii?Q?8+yq2NVTmUFuWTP49wBP0sRN+k5KuM+ftKJj+reKdYwzEHiCWlEXBXM2a93i?=
 =?us-ascii?Q?6EDNdlqkj7qn7tZl7/zyYGz3IFZlk5HfZbo43iM8LGriH6I3PxiiVHMR0wth?=
 =?us-ascii?Q?fQUsOBsc/bNjUP421e1cLlDWcjj6xzeoletG40yqkFhi+IWGkKn2+IoeLk4y?=
 =?us-ascii?Q?SJMRp/Qifv0cOyHzhtzTxxW67uBuos/XYWHV6y47X2Dik9H8zyg5WnyMiGRO?=
 =?us-ascii?Q?Gkd5X6/MzzoF/MThejPePIz5ewx2DlIlEFWNEM7WilZZq1DeNnw6lsQXANPv?=
 =?us-ascii?Q?yeKID/H8Vg=3D=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: hQtiEjDANpBGdRa+0sq4i06R6Olb9XhbIUKQFslvFs8c+MS0SBqYH0Onm/lsihLhFUBpN2Lw4oWgCcoEFWhDRUI9+bgPtj+y1hHvw597CTgdJPGzXqihKiHMdo05Bm/ngis4ljkOdAwk58UDYHsbqyo0RP9EuBfAAtuced/O8OBYPE7oueLxm6KAWj+SHr2P3ggKfG4vtbf5XRc7AABX2HRBA8somOjMTW/54pM0PFMnGQ6JqyOYFetgazIebqVC/KdBE9oc92YGfqIFZ6cXmMhQ1mkX/MPFpZpV0xTpNYZ6RXa+h9eXpg1cwNNcfcpKHXL69+UrQM88CJXf6MK7pQ==
X-OriginatorOrg: dekaresearch.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR18MB5926.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4fbf89f-12e3-4869-88b8-08decb20cc08
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 20:58:05.5653
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1637ed59-b316-467c-9815-03b974d92c2b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rVypvLTI+GWnfvNSi24lzvPM8IeBmR/iAZUg8XSTe3+6TwHcIqhSkzH+DOJKJFdUiKekVFky93Bpj08NSu31ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF324B86F34
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kPuJtwKcCZHxP6GRJJUkUuvnSo78w0Yt2r4OqAUZDE0_1781557088
X-Mimecast-Originator: dekaresearch.com
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SA1PR18MB5926F18056B88BB45AB2F91DB1E62SA1PR18MB5926namp_"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 01:42:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127595

--_000_SA1PR18MB5926F18056B88BB45AB2F91DB1E62SA1PR18MB5926namp_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hello,

I believe we've found a bug in the `uboot-extlinux-config.bbclass` class an=
d was hoping for confirmation. Please feel free to point me in the right di=
rection if this isn't the appropriate mailing list.

A few years ago U-boot was patched to properly parse the PROMPT value in ex=
tlinux.conf files and restore the default menu behavior to prompt for a lab=
el unless explicitly disabled.
- See this bug report: https://groups.google.com/g/linux.debian.bugs.dist/c=
/wI_3vFvErTc
- Which was upstreamed here: https://github.com/u-boot/u-boot/commit/739e83=
61f3fe78038251216df6096a32bc2d5839

After updating our yocto build to a newer branch on Scarthgap, we started s=
eeing these prompts for extlinux labels from U-boot. The boot prompt that g=
ets displayed is interruptible via <CTRL-C>, which is a potential security =
vulnerability, so we would like to disable the extlinux boot prompt altoget=
her. However, there exists no option in `uboot-extlinux-config.bbclass` for=
 explicitly setting the PROMPT option.

I've generated a small fix that would allow developers to explicitly set th=
e PROMPT value similarly to any other (E.G. TIMEOUT). Could someone confirm=
 whether or not the missing PROMPT variable in `uboot-extlinux-config.bbcla=
ss` is intentional? If not, I can generate a proper patch to submit for rev=
iew as necessary.

```
diff --git a/meta/classes-recipe/uboot-extlinux-config.bbclass b/meta/class=
es-recipe/uboot-extlinux-config.bbclass
index 0413e760bd..659560c675 100644
--- a/meta/classes-recipe/uboot-extlinux-config.bbclass
+++ b/meta/classes-recipe/uboot-extlinux-config.bbclass
@@ -21,6 +21,7 @@
# UBOOT_EXTLINUX_ROOT              - Root kernel cmdline.
# UBOOT_EXTLINUX_TIMEOUT           - Timeout before DEFAULT selection is ma=
de.
#                                    Measured in 1/10 of a second.
+# UBOOT_EXTLINUX_PROMPT            - Enable/disable prompting for a boot l=
abel.
# UBOOT_EXTLINUX_DEFAULT_LABEL     - Target to be selected by default after
#                                    the timeout period.
# UBOOT_EXTLINUX_MENU_TITLE        - Menu title. If empty, MENU TITLE entry
@@ -106,6 +107,10 @@ python do_create_extlinux_config() {
             if timeout:
                 cfgfile.write('TIMEOUT %s\n' % (timeout))

+            prompt =3D localdata.getVar('UBOOT_EXTLINUX_PROMPT')
+            if prompt:
+                cfgfile.write('PROMPT %s\n' % (prompt))
+
             if len(labels.split()) > 1:
                 default =3D localdata.getVar('UBOOT_EXTLINUX_DEFAULT_LABEL=
')
                 if default:
```


Additionally, despite the documentation stating that no prompt shall be dis=
played when only one boot label exists, we are still seeing prompting behav=
ior with only one extlinux boot label. Would someone be able to confirm tha=
t this is not limited to just our platform?

-          https://github.com/openembedded/openembedded-core/blob/master/me=
ta/classes-recipe/uboot-extlinux-config.bbclass#L31

Please let me know how best to proceed.

Thank you,
Stephen

--_000_SA1PR18MB5926F18056B88BB45AB2F91DB1E62SA1PR18MB5926namp_
Content-Type: text/html; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
=09{font-family:Wingdings;
=09panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
=09{font-family:"Cambria Math";
=09panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
=09{font-family:"Yu Gothic";
=09panose-1:2 11 4 0 0 0 0 0 0 0;}
@font-face
=09{font-family:Calibri;
=09panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
=09{font-family:"\@Yu Gothic";
=09panose-1:2 11 4 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin:0in;
=09margin-bottom:.0001pt;
=09font-size:11.0pt;
=09font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
=09{mso-style-priority:99;
=09color:#0563C1;
=09text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
=09{mso-style-priority:99;
=09color:#954F72;
=09text-decoration:underline;}
p
=09{mso-style-priority:99;
=09margin:0in;
=09margin-bottom:.0001pt;
=09font-size:12.0pt;
=09font-family:"Times New Roman",serif;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
=09{mso-style-priority:34;
=09margin-top:0in;
=09margin-right:0in;
=09margin-bottom:0in;
=09margin-left:.5in;
=09margin-bottom:.0001pt;
=09font-size:11.0pt;
=09font-family:"Calibri",sans-serif;}
span.EmailStyle17
=09{mso-style-type:personal-compose;
=09font-family:"Calibri",sans-serif;
=09color:black;}
.MsoChpDefault
=09{mso-style-type:export-only;
=09font-family:"Calibri",sans-serif;}
@page WordSection1
=09{size:8.5in 11.0in;
=09margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
=09{page:WordSection1;}
/* List Definitions */
@list l0
=09{mso-list-id:668752034;
=09mso-list-type:hybrid;
=09mso-list-template-ids:215937898 67698703 67698713 67698715 67698703 6769=
8713 67698715 67698703 67698713 67698715;}
@list l0:level1
=09{mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l0:level2
=09{mso-level-number-format:alpha-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l0:level3
=09{mso-level-number-format:roman-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:right;
=09text-indent:-9.0pt;}
@list l0:level4
=09{mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l0:level5
=09{mso-level-number-format:alpha-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l0:level6
=09{mso-level-number-format:roman-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:right;
=09text-indent:-9.0pt;}
@list l0:level7
=09{mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l0:level8
=09{mso-level-number-format:alpha-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l0:level9
=09{mso-level-number-format:roman-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:right;
=09text-indent:-9.0pt;}
@list l1
=09{mso-list-id:1050347097;
=09mso-list-type:hybrid;
=09mso-list-template-ids:1189797254 -1193134684 67698691 67698693 67698689 =
67698691 67698693 67698689 67698691 67698693;}
@list l1:level1
=09{mso-level-number-format:bullet;
=09mso-level-text:-;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Calibri",sans-serif;
=09mso-fareast-font-family:"Yu Gothic";}
@list l1:level2
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l1:level3
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
@list l1:level4
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0B7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Symbol;}
@list l1:level5
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l1:level6
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
@list l1:level7
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0B7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Symbol;}
@list l1:level8
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l1:level9
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
@list l2
=09{mso-list-id:1861625682;
=09mso-list-type:hybrid;
=09mso-list-template-ids:1040188614 67698705 67698713 67698715 67698703 676=
98713 67698715 67698703 67698713 67698715;}
@list l2:level1
=09{mso-level-text:"%1\)";
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l2:level2
=09{mso-level-number-format:alpha-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l2:level3
=09{mso-level-number-format:roman-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:right;
=09text-indent:-9.0pt;}
@list l2:level4
=09{mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l2:level5
=09{mso-level-number-format:alpha-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l2:level6
=09{mso-level-number-format:roman-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:right;
=09text-indent:-9.0pt;}
@list l2:level7
=09{mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l2:level8
=09{mso-level-number-format:alpha-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l2:level9
=09{mso-level-number-format:roman-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:right;
=09text-indent:-9.0pt;}
ol
=09{margin-bottom:0in;}
ul
=09{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:black">Hello,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">I believe we&#8217;ve fo=
und a bug in the `uboot-extlinux-config.bbclass` class and was hoping for c=
onfirmation. Please feel free to point me in the right direction if this is=
n&#8217;t the appropriate mailing list.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">A few years ago U-boot w=
as patched to properly parse the PROMPT value in extlinux.conf files and re=
store the default menu behavior to prompt for a label unless explicitly dis=
abled.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><span style=3D"color:blac=
k">- See this bug report:
<a href=3D"https://groups.google.com/g/linux.debian.bugs.dist/c/wI_3vFvErTc=
">https://groups.google.com/g/linux.debian.bugs.dist/c/wI_3vFvErTc</a><o:p>=
</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><span style=3D"color:blac=
k">- Which was upstreamed here:
<a href=3D"https://github.com/u-boot/u-boot/commit/739e8361f3fe78038251216d=
f6096a32bc2d5839">
https://github.com/u-boot/u-boot/commit/739e8361f3fe78038251216df6096a32bc2=
d5839</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">After updating our yocto=
 build to a newer branch on Scarthgap, we started seeing these prompts for =
extlinux labels from U-boot. The boot prompt that gets displayed is interru=
ptible via &lt;CTRL-C&gt;, which is a potential
 security vulnerability, so we would like to disable the extlinux boot prom=
pt altogether. However, there exists no option in `uboot-extlinux-config.bb=
class` for explicitly setting the PROMPT option.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">I&#8217;ve generated a s=
mall fix that would allow developers to explicitly set the PROMPT value sim=
ilarly to any other (E.G. TIMEOUT). Could someone confirm whether or not th=
e missing PROMPT variable in `uboot-extlinux-config.bbclass`
 is intentional? If not, I can generate a proper patch to submit for review=
 as necessary.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">```<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"color:black">diff --git a/meta/classe=
s-recipe/uboot-extlinux-config.bbclass b/meta/classes-recipe/uboot-extlinux=
-config.bbclass<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">index 0413e760bd..659560=
c675 100644<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">--- a/meta/classes-recip=
e/uboot-extlinux-config.bbclass<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">+++ b/meta/classes-recip=
e/uboot-extlinux-config.bbclass<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">@@ -21,6 +21,7 @@<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"># UBOOT_EXTLINUX_ROOT&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 - Root kernel cmdline.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"># UBOOT_EXTLINUX_TIMEOUT=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Timeout befo=
re DEFAULT selection is made.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">#&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Measured in 1/10 of a second.<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">+# UBOOT_EXTLINUX_PROMPT=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Enable=
/disable prompting for a boot label.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"># UBOOT_EXTLINUX_DEFAULT=
_LABEL&nbsp;&nbsp;&nbsp;&nbsp; - Target to be selected by default after<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">#&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the timeout period.<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black"># UBOOT_EXTLINUX_MENU_TI=
TLE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Menu title. If empty, MENU =
TITLE entry<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">@@ -106,6 +107,10 @@ pyt=
hon do_create_extlinux_config() {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if timeout:<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cf=
gfile.write('TIMEOUT %s\n' % (timeout))<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">+&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prompt =3D localdata.getVar('UB=
OOT_EXTLINUX_PROMPT')<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">+&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if prompt:<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"color:black">+&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cfgfile=
.write('PROMPT %s\n' % (prompt))<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">+<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if len(labels.split()) &gt=
; 1:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; de=
fault =3D localdata.getVar('UBOOT_EXTLINUX_DEFAULT_LABEL')<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if=
 default: <o:p>
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">```<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-ser=
if">Additionally, despite the documentation stating that no prompt shall be=
 displayed when only one boot label exists, we are still seeing prompting b=
ehavior with only one extlinux boot label. Would
 someone be able to confirm that this is not limited to just our platform?<=
o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l1 level=
1 lfo3"><![if !supportLists]><span style=3D"color:black"><span style=3D"mso=
-list:Ignore">-<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"color:black"><a href=3D"https=
://github.com/openembedded/openembedded-core/blob/master/meta/classes-recip=
e/uboot-extlinux-config.bbclass#L31">https://github.com/openembedded/openem=
bedded-core/blob/master/meta/classes-recipe/uboot-extlinux-config.bbclass#L=
31</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">Please let me know how b=
est to proceed.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">Thank you,<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"color:black">Stephen<o:p></o:p></span=
></p>
</div>
</body>
</html>

--_000_SA1PR18MB5926F18056B88BB45AB2F91DB1E62SA1PR18MB5926namp_--

