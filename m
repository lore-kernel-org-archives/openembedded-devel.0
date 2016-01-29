Return-Path: <Nate.Karstens@garmin.com>
X-Greylist: delayed 861 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 29 Jan 2016 01:36:16 UTC
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0118.outbound.protection.outlook.com [65.55.169.118])
	by mail.openembedded.org (Postfix) with ESMTP id 1C8C2770E0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2016 01:36:16 +0000 (UTC)
Received: from BLUPR0401CA0035.namprd04.prod.outlook.com (10.162.114.173) by
	DM2PR04MB398.namprd04.prod.outlook.com (10.141.102.24) with Microsoft
	SMTP Server (TLS) id 15.1.390.13; Fri, 29 Jan 2016 01:21:55 +0000
Received: from BY2FFO11FD053.protection.gbl (2a01:111:f400:7c0c::173) by
	BLUPR0401CA0035.outlook.office365.com (2a01:111:e400:525a::45) with
	Microsoft SMTP Server (TLS) id 15.1.390.13 via Frontend Transport;
	Fri, 29 Jan 2016 01:21:54 +0000
Authentication-Results: spf=permerror (sender IP is 204.77.163.247)
	smtp.mailfrom=garmin.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=none action=none
	header.from=garmin.com;
Received-SPF: PermError (protection.outlook.com: domain of garmin.com used an
	invalid SPF mechanism)
Received: from garmin.com (204.77.163.247) by
	BY2FFO11FD053.mail.protection.outlook.com (10.1.15.190) with Microsoft
	SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Fri, 29 Jan 2016 01:21:53 +0000
Received: from OLAWPA-EXHT02.ad.garmin.com (10.5.143.142) by
	edgetransport.garmin.com (192.168.18.220) with Microsoft SMTP Server
	(TLS) id 14.3.266.1; Thu, 28 Jan 2016 19:21:45 -0600
Received: from OLAWPA-EXMB03.ad.garmin.com ([169.254.2.163]) by
	OLAWPA-EXHT02.ad.garmin.com ([10.5.143.142]) with mapi id
	14.03.0248.002; Thu, 28 Jan 2016 19:21:52 -0600
From: "Karstens, Nate" <Nate.Karstens@garmin.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [oe] [meta-networking][PATCH v4] dhcpcd: add recipe for dhcpcd
Thread-Index: AQHRTtPZ8jdzfgE2/0y7iVy2NRk3GJ8P4V6AgAHnMHA=
Date: Fri, 29 Jan 2016 01:21:51 +0000
Message-ID: <145451D4E6785E4DA4DFA353A58CB7B2F7E579FF@OLAWPA-EXMB03.ad.garmin.com>
References: <1452726499-3950-1-git-send-email-nate.karstens@garmin.com>
	<20160127141549.GG2574@jama>
In-Reply-To: <20160127141549.GG2574@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.5.143.129]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.000.1202-22098.003
x-tm-as-result: No--49.200000-0.000000-31
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD053;
	1:jluRWYLUdD+oAU4MQ+nPpxmSh9RqOybBHKHvXEELVQiHf61E4X5EFcq8u1P6blZD9vsnEzSuooWC7N12gM0mK+ZetCFG/hazgXrBMPZfv3XG+J/ZhrW27LgW3SIIAzJHIpy7Y5hIj2e74VbYd0zD18D8K3vTaPv03ttKecvzWoi/Rd5rxKhzd3OASOB9aWnDTmLAv3peaqwlrdBdmDxW/Km7hUIYUIkmO4x9s3dj7GFQ1cfxnOXQl4tmJRPZPc4LTFEi2lycEqDD8HVZhgMK5kbqbxQDJxrQZ+Tm8i3ZaK1oq91XnwvPpys/lBNl3tLfGytnz7IMKLxbFqczy0mK677JSKZguP/cd1IYNWelKoBrR+ezbF1JmelDffpGTv76j+3hexW6DGP1tSqL53yPboHpCbe9FIsImdezU2ZCAnQ=
X-Forefront-Antispam-Report: CIP:204.77.163.247; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(189002)(24454002)(377454003)(13464003)(199003)(36304003)(5001960100002)(46406003)(5008740100001)(19580395003)(19580405001)(5004730100002)(110136002)(69596002)(3846002)(1096002)(6116002)(85326001)(1220700001)(102836003)(3470700001)(23726003)(106116001)(586003)(6806005)(4326007)(33656002)(40036005)(50466002)(97736004)(50986999)(2906002)(16796002)(189998001)(81156007)(15975445007)(575784001)(86362001)(106466001)(87936001)(2920100001)(21086003)(76176999)(2900100001)(54356999)(2950100001)(92566002)(77096005)(5890100001)(55846006)(1720100001)(97756001)(47776003)(5003600100002)(129583001)(17423001)(156123004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR04MB398; H:garmin.com; FPR:;
	SPF:PermError; PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR04MB398;
	2:pcfxuII/8dxLtXqzMfoyvlHGtYC0qvR6R1hD0vYFle8fKeGyesM0kwjQ5Om9gRc+majsCqa6/pWwb7tCrMjnDck8zgkcDF51badVNE9AaHiRROgwpZyOE1QLkbjebk54br8ug05semPt/a8DHFAM6w==;
	3:qldx9BwObmEubq8P2g/5Ht5GLzf7GNpPhfDt/lu8+e74zpB830/7Q+kiP4MAHa1J5M8XgoTOWKqceuVHwxSElvV6ssOTavKuST/rzQQMVc+rKEHGwAReCKIJVBNHWCZs6PoXRVbuncFDhvv7ljvAg8OOo/MiluRkImj7koU+/Lgzd0pyN2PtkF4vmmxR70poSsjnZawNqHYi4mLW9exHbDt70h7NPXlXUpPQjGvBVl8=;
	25:3d8wKnnNjFirH+ugW7xI5iI5eako4naTMDI2FdQbAFpcdEWnwr3+Kfx0hPSweP08EPpg6ea5QjDIqMiMezP0gJFVJDeporOe4WroerJbi81aJapcPYuJbul51z3Y9s5cEZw1eUnVyUQ4sTAqqYTA31mPPkqRIFTo5WC439sEYJbdmzEc5BaFAo0LyLPgesaJ8i7nLv5yXColDP8PEUz5y5HRlj8djWDuCcQK3MRGqXqN7ydFat4AouywyYq92EV1
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DM2PR04MB398;
X-MS-Office365-Filtering-Correlation-Id: 47a84fc2-29ca-4ee7-4b9d-08d3284a92a6
X-Microsoft-Exchange-Diagnostics: 1; DM2PR04MB398;
	20:Arl5jUdccpVIdI56CVsG1h1336cX8RfcWc8Qt46gA4NdaL/uiwadsI+kqq0mXC6NcN6VlIVP+EeEaK75zDU61PmIW2kpERWdn5ItukaI2q+gXBJjd6CsEd4E1ghCingnZO/Uo7pfuEvuEGCPRlHHZN5AOKKj4id/mOaQfPaDSzOBMlY0qzWXodoS7uK/ZxB7/BlmHs7d3FWjYjHHIfcms9wxFUa/cQmaTzUPEqXwo1AmrTJee5dKgH7De9lljMa5SkS0vIxIlx9WFFYfwl0qtBN2GpPqeB8++NwO4O1XZKf5aytFeLK5GNAr+x4RoD00QiC6FN9aT+pz1sDBvmglqlpcxnSxXQhzQY2wvqDuZHPv5ELsMP5nrKskOHLeCl/+ysg1FnxIaHvbtMVYZwnn/+4k7xgm6U4jIPG+lut0fS9HeJusZHk9izyFytF6vhZIPgVeFOCUcM0KLGPOKb1Nn8wRjdlSiQtmtIo0puHv4bAqBI9/VQRjV32RCQKx+Xxz
X-Microsoft-Antispam-PRVS: <DM2PR04MB3983B4AB7A4C9572384AB0E9CDB0@DM2PR04MB398.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(210672237334638);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13024025)(13018025)(5005006)(13017025)(13015025)(13023025)(8121501046)(3002001)(10201501046);
	SRVR:DM2PR04MB398; BCL:0; PCL:0; RULEID:; SRVR:DM2PR04MB398; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR04MB398;
	4:MTjpnNfO6QlbDszQFGmkJx1Q3QIU1+9PoeyFItr78vhzbQ2SB8pl26TNV4/O5j1i3daSBT89aMWnOgLWabsH9ptnBjELtvuSnElh+ElcotKnL/DWixJelmDoOhhHM8pe4aJnOPh/HDzxDZZoyRNxZt5I1jhKt0fvLwfKznPgytBhN+37zGNoc39dDXT6a++mPTgXoLe4S9fGy7vIKlvY4aTg7OYN6u9fpYTJdBSPQ3Z4utUrC2RlFOV7IsnE9gXCA3RhI8ZKKn/2PkBPDFS7SU5PZRdLP9IxqtiXjyBP46zND3ry7knubx1Gz8wj1uIyf2l4ZP3BJ5XqzOtxFm6OJOEb8EtXBhBckTHpYbkcFKIRQqcdKPUtMThVowQspkI37AI6hA04voLC1PbLk0wdu1OLSWmP94cl/WjPxXf6y6pNqC/Mjd0kyzF8qAQRMbXjlSRP7mXye/y9SjPj9A5x9rPzrJB4Mu5O8I9X2yJtHgWA2WOpUniNu0xFUYxfxWT+
X-Forefront-PRVS: 083691450C
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR04MB398;
	23:Y/tRFo1EYXkqmQO1mccPB1IUzz8O4IHRTwe7zPwhJ0?=
	=?us-ascii?Q?6uiAjzbxTMuTZwmaD3cEJgTtVmHPYqp/xhow+JsKe6AoF4TzSYiAlzWnAL2q?=
	=?us-ascii?Q?j0FiF85RSkLL/BM9FW+5Oo356GEId4jOyCvBN9wJy9V4sg4aqtEPv+JAS7fj?=
	=?us-ascii?Q?X1HGshWL1uIXc20odagdJWwjhkxEUwzh8AmprHV1y1bhygWbR0xsHC3lWPBW?=
	=?us-ascii?Q?JPx4MufvCuBb0leYALdmwG1T8Op85Z0JlbRcp2NUkVIxS1SLIzqS5tyUXMdg?=
	=?us-ascii?Q?jSR8b+5o3L/MFf+7b5QqOsWu/7dr4Avejx9pCIhX1EGwUOW7Bp260QqM/i38?=
	=?us-ascii?Q?rWcanfCNM6GVj9IS5Cca2Bz5YPMYm1R3P1ptMCQ9ePlO6pL5dZtb1Wk3aAKC?=
	=?us-ascii?Q?xF2SOvPSQYozfeL0YX/TG+pcNf7bgSlRumTWT29qR87wakOh7DUBg2uyMPg1?=
	=?us-ascii?Q?+AG/A8Gb7opQTnQlAr37hFNGYVQZsiDBkGufGdMwB73sQFqxRKncQgnNRUc+?=
	=?us-ascii?Q?ah5ws/GkF+i7B0lJBS1qVCa6KjwhGS61aSHZQ8AEvj40S8N2gLTA3zjVhAn0?=
	=?us-ascii?Q?SFyvDSCc0Iiv5yMKU0qHqbw+HBkWsAjF2T0y7OspYkDlGOX4dUrLfN4taL6X?=
	=?us-ascii?Q?PJRd8gX+GWKyIeFOtO4xpQjvpyjWhZNyfmh6wTVzzsedOvArWxxv1Qb1GsFW?=
	=?us-ascii?Q?UydQkdZJq6uxsxOmyrGGR/N4Cey2sv/bmszUAsBhtgXvs3pOpq5/V4L/6LaR?=
	=?us-ascii?Q?h8HbwILoSEhKZNT2zEqszNU3Rh/LP0UdPy06zo8mFxq2irD9R2uFAwhCbPUU?=
	=?us-ascii?Q?wsMaoJ0XI1s9dL1BMuHmfM939k9Z2KDZN1/yesq7v3z1U8zri+ky8+030pPF?=
	=?us-ascii?Q?iDG7w60VB2aot0AN4TP2qicrud1G5451Tuc4eoD6t4LZo1u3Z7T3QFzJav5o?=
	=?us-ascii?Q?fsvWfX6ziVw78684B+5Wue7pXZ6KxhfmJ2VR6OUz9iNyYbrQoqVM4iQlVCPJ?=
	=?us-ascii?Q?i900+JvwS/AZNYikIRfBsdMPuUMTFw5IDP3knm/GftA+1v3923vsbPYAck0H?=
	=?us-ascii?Q?kHza2uNwEyG0TCNMZgnyyZA5c6k9EAy3FHUO0PGWfuLba57gyE/lfa4ii3tZ?=
	=?us-ascii?Q?RCUhfuHfRUOPCzUkXOspjEf9rTfmq6qHBgB4N6lsSDimmy1XFvuM30o/EiVF?=
	=?us-ascii?Q?v/xcfWkgLpL/NYVTBcT1BtFzWtHAxQdtn76v8NZ4iXTF7j48ANhmCgLDwK8L?=
	=?us-ascii?Q?NHzT1Ot3tTYWc0WSTN72LZRPyWy8bqM34Cg4ScMpWEaY3OquZ8F0ZxCPmc1Z?=
	=?us-ascii?Q?lRwoFi/ekpnMeL4wNScVaFBq/jfD65A/bP34P8jtR2sViga/eBcrM2YlyXAT?=
	=?us-ascii?Q?qbTHgvnhAiTUULoehLAOEipeW3yWGm0/WldsgDzrJWPiXtioNJMYMsKO/kdp?=
	=?us-ascii?Q?U/QJ97Jn9XWqWjGWQ7cwSqGnNmGiiWrCFo8shbYEVxPDHGQXAimjPBSbMNol?=
	=?us-ascii?Q?DBixx98cYRsZBCAGy+pLD6yIvqhY8/ZJg=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR04MB398;
	5:YwyJ+D7lssa8G9UwxhOhslQJp5VjiAh7oiD0z82xBvcyMTDbGFveSd6e/c3g3MM3GjKnZy41noc0oKEtvMCBVqSxnFuUmYGS7OBlERV5FpSGqEGgC9DAC3HEcZWiVdhrME2L/mEqc4KPbckuqO17LA==;
	24:LVfziOveg9Kg/iihtzNqZVljU8j504UE2rsazsBcTav3qh1eUZd1j3ArxgNRlHY7+zJ9A5WtPqphhh9EDmrWdcf3Ybs7C7F/xIWAlRWfv88=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2016 01:21:53.9002 (UTC)
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
	Ip=[204.77.163.247]; Helo=[garmin.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR04MB398
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v4] dhcpcd: add recipe for dhcpcd
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
X-List-Received-Date: Fri, 29 Jan 2016 01:36:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Martin,

It looks like the recipe that was merged in was for 6.10.0, but the warning=
 is for version 6.9.4. Is it an issue with the 6.10.0 version as well?

Nate

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Martin Jansa
Sent: Wednesday, January 27, 2016 8:16 AM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-networking][PATCH v4] dhcpcd: add recipe for dhcpcd

On Wed, Jan 13, 2016 at 05:08:19PM -0600, Nate Karstens wrote:
> Adds a new recipe for dhcpcd version 6.10.0.

It was merged, but there is QA warning:
dhcpcd-6.9.4: dhcpcd rdepends on libudev, but it isn't a build dependency? =
[build-deps]

Please send follow-up patch to fix this.

> Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
> ---
>  .../recipes-connectivity/dhcpcd/dhcpcd_6.10.0.bb   | 22 ++++++++++++++++=
++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.=
10.0.bb
>
> diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.10.0.bb=
 b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.10.0.bb
> new file mode 100644
> index 0000000..058a932
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.10.0.bb
> @@ -0,0 +1,22 @@
> +SECTION =3D "console/network"
> +SUMMARY =3D "dhcpcd - a DHCP client"
> +DESCRIPTION =3D "dhcpcd runs on your machine and silently configures you=
r computer to work on the attached networks without trouble and mostly with=
out configuration."
> +
> +HOMEPAGE =3D "http://roy.marples.name/projects/dhcpcd/"
> +
> +LICENSE =3D "BSD-2-Clause"
> +LIC_FILES_CHKSUM =3D "file://dhcpcd.c;endline=3D26;md5=3D77c40d671aff804=
ca91ea99556da8e9b"
> +
> +SRC_URI =3D "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.x=
z"
> +
> +SRC_URI[md5sum] =3D "f39c5773e7c4bea352d9fb7367c899de"
> +SRC_URI[sha256sum] =3D "ab56af9b2e86913c55a965cb0f835e87749df78318564acf=
90d5d698f413ad35"
> +
> +inherit autotools
> +
> +B =3D "${S}"
> +EXTRA_OECONF =3D "--enable-ipv4 --enable-ipv6"
> +
> +FILES_${PN}-dbg +=3D "${libdir}/dhcpcd/dev/.debug"
> +
> +RDEPENDS_${PN} =3D "udev"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

________________________________

CONFIDENTIALITY NOTICE: This email and any attachments are for the sole use=
 of the intended recipient(s) and contain information that may be confident=
ial and/or legally privileged. If you have received this email in error, pl=
ease notify the sender by reply email and delete the message. Any disclosur=
e, copying, distribution or use of this communication (including attachment=
s) by someone other than the intended recipient is prohibited. Thank you.

