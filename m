Return-Path: <Nate.Karstens@garmin.com>
X-Greylist: delayed 1985 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 05 Jan 2016 14:10:43 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0111.outbound.protection.outlook.com [207.46.100.111])
	by mail.openembedded.org (Postfix) with ESMTP id ED4356FF97
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jan 2016 14:10:43 +0000 (UTC)
Received: from BY2PR04CA057.namprd04.prod.outlook.com (10.141.249.175) by
	BN1PR04MB391.namprd04.prod.outlook.com (10.141.60.150) with Microsoft
	SMTP Server (TLS) id 15.1.361.13; Tue, 5 Jan 2016 13:37:38 +0000
Received: from BY2FFO11FD005.protection.gbl (2a01:111:f400:7c0c::125) by
	BY2PR04CA057.outlook.office365.com (2a01:111:e400:2c5e::47) with
	Microsoft
	SMTP Server (TLS) id 15.1.361.13 via Frontend Transport; Tue, 5 Jan 2016
	13:37:38 +0000
Authentication-Results: spf=pass (sender IP is 204.77.163.247)
	smtp.mailfrom=garmin.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
	204.77.163.247 as permitted sender) receiver=protection.outlook.com;
	client-ip=204.77.163.247; helo=garmin.com;
Received: from garmin.com (204.77.163.247) by
	BY2FFO11FD005.mail.protection.outlook.com (10.1.14.126) with Microsoft
	SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Tue, 5 Jan 2016 13:37:37 +0000
Received: from OLAWPA-EXHT04.ad.garmin.com (10.5.131.25) by
	edgetransport.garmin.com (192.168.18.224) with Microsoft SMTP Server
	(TLS) id 14.3.266.1; Tue, 5 Jan 2016 07:37:47 -0600
Received: from OLAWPA-EXMB03.ad.garmin.com ([169.254.2.163]) by
	OLAWPA-EXHT04.ad.garmin.com ([10.5.131.25]) with mapi id 14.03.0266.001;
	Tue, 5 Jan 2016 07:37:35 -0600
From: "Karstens, Nate" <Nate.Karstens@garmin.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] dhcpcd: add recipe for dhcpcd
Thread-Index: AQHRPnsjY8K/Go9KB06jZmUMi+FuRZ7s/NLA
Date: Tue, 5 Jan 2016 13:37:35 +0000
Message-ID: <145451D4E6785E4DA4DFA353A58CB7B2F7E4E724@OLAWPA-EXMB03.ad.garmin.com>
References: <1450954209-2353-1-git-send-email-nate.karstens@garmin.com>
	<CAMKF1sqp0gM9VgvE8M1-HAsAapDsNdNfs0S+AnaROfqFWXFYNg@mail.gmail.com>
In-Reply-To: <CAMKF1sqp0gM9VgvE8M1-HAsAapDsNdNfs0S+AnaROfqFWXFYNg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.5.143.129]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.000.1202-22046.007
x-tm-as-result: No--50.336700-0.000000-31
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD005;
	1:SC1ySQOsGMafSmDDHevPUlnIjXaGVrf/ZK+tNMS3MWMeOrO3eCP2R7lLvOEZ7TguZmg2vmOjKqvHjmJwjTGeZetiRxcYpqA3kGZaRy+RvIJey5a7PTAKg8zeSjzN2N7dhDIb3uSS8RjBxaMtgMiDgmuR2TtjnMkiT/Kp10krmJYfdoC6P162aYL1ntH37kc4V3DC6g8OhrXoxSzO6fJxKWHIEu5zKyLU9c2F3o5mqot1nspyvHFfomwdsGvhcjBFIBmGVuLC5vLXmHiNuNnTl4iu5GA+jFa1igxxSuWEkGfawx0HITZYLk/yhAd46UjoOyBxUeavqO9pEeQA7MvoFYq9UuanHDGgnjEzzLrUrFVo7C+4Vgh7HFHqkhq3M8e0
X-Forefront-Antispam-Report: CIP:204.77.163.247; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(438002)(199003)(13464003)(36304003)(24454002)(377454003)(189002)(97736004)(50466002)(50986999)(6806005)(6116002)(586003)(54356999)(1220700001)(2900100001)(15975445007)(40036005)(5890100001)(97756001)(87936001)(86362001)(106466001)(21086003)(92566002)(1720100001)(5008740100001)(5004730100002)(76176999)(77096005)(2950100001)(55846006)(2351001)(2920100001)(189998001)(575784001)(81156007)(2501003)(19300405004)(46406003)(47776003)(5001960100002)(19580395003)(16796002)(33656002)(106116001)(110136002)(5003600100002)(3846002)(69596002)(1096002)(102836003)(4326007)(23726003)(19580405001)(11100500001)(129583001)(17423001)(156123004)(562404015);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN1PR04MB391; H:garmin.com; FPR:;
	SPF:Pass; PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR04MB391;
	2:/OnYRGH/8bh0xqJxA5In13VvW7G2DXdZsqh5Ye0ccUnPpkwg9KPcueOj5idnDPBlIHX7zatiRklFegaB8ZRF/nx5Xyr3YICo8SnPYdSDyalv6JvZHCwC9+D532yfPSIn0RVhc6XrXOj0ed9oXtM6cg==;
	3:5tXg2IxLfKdBukb9tjqOPpFNexdK0qdGGaCow3KJ7sp2M2LVqczKqNvhM6yPNMrIhLwD2ZJRftPaI04xrkgeHFZj7z0993L1Gr8g7UA1nklv31JRmrnnqVeay1MA+HkKDViyrjxJkoZMFRSiwYe06fotheBTrLkmF5opMLDMVFO2dPT7cuwnrov722Q+mCNUgDpwuRL8sBBQeZYmaSxiIFA0gt+m4tcRJPMRj9SzeHFcWOR2jJIvQvtJQg6FYITajJE4D6CXv2XJguxuJ1/tjg==;
	25:GUgTWA7aJ2fN5wjDYEcLINjp+TsjzfrfmnsDmUI/NIqI1LfBJKPVkYUvMjRvo080lr9mZZBpUHjl2qY5PFAe64H4Xd0a/sRoAU8mB9V9+oAJi/6eMsFFRCy8QRpS16W/KE1VkgL+ZNZO7qW3NYCvjbsTOoBnNKT4rh8HEYOIG5ToRYPQiOVFFtzpQyXCYUzOPsz//RZ14UH385hPcMn7/8OSO7vYFW2GU06NYGGFD26SNCOzdB/GSniE2p1ViJWU
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501001);
	SRVR:BN1PR04MB391; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR04MB391;
	20:7D9jQq8IJ/zrrz+cNTVt2h8Bn9q6WzFxwz/M1OeeeDRsKr3enc7DNjCTYXQGrab9HYcGpZPZkQzmnB8gGRT+f3gpyNe52Uw6WeBiy9aiBtjdZCOLG2+YnMXLzJF0MTzGDijnrvxUFyJZgOGsApVEsfxoo5nZqeV4rXOmXJx8c4NyvwJkm+fdVs+5Z0+ddbMdQyrolP0qMKhd2Q8ZcZsFiDJZI5Uv2UOQnzrW/XwGExnNnb5Uv9MzSHFu0B6e7Eron5WsHJvmKuCQ3BoZZz9h0FoEvevbxGo1nc3s6sZFTZOc9WcpwER85WZWZ0B/wQGqUO+da14GofX6vPnegftHp//J8iqesTw5YLxn7JvKnGuqOmMtzDJTJGhE1/W1+ni3g9vLo255Qdh7aB5UKquvi5Y5v7nHOHv8mzI8QPztd2JPd0Y6dQZSehuYCSjcnHPBYix1ILYozTSLL4SkxTR5PXqKyctB/aq7qznYDp+jcRa+k0Xwj0e90ti+a9vnm13w;
	4:xxct7sC5cz7scgzi6BZvPINUyyCRjQS2CtHffC0+ofKMdUkWlVXLiXVpa8tJYf3K15iA25mAN7bzCJD2kfmfDRgSo9fzOraaovgI2oLCEP4XaAWnJ9lDZqK59BCmsvxrZ9JxwKfpYJO3P6wZwpeQTGtAMakmmPQEnkVK/jUyb6DFMZ1gD3BrIXDGtOFQoxlla2Oft/HTLOskRy6vnheeI8cGz+QfS0J/TjLgzWe2vVMADyobQ4e00eik1bSR5U+48ZOsrdaMgg0ArEtdqCtD9cePrbOpq7XSb40o3WfjaBnrg9x1fmAbIh539eFw9l2E4Nz7oo7kFhqy/ifebzZhrZ3wD1SvQAXK0myOVkzg+j+4wPiKR7U6H9y17rJh9cdLQJEEm18wXyLGDh5gkD7/YdrKtyFr7lvHh5287bE/TvI=
X-Microsoft-Antispam-PRVS: <BN1PR04MB391F95773DB4D9A9CA1960C9CF30@BN1PR04MB391.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(210672237334638);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(520078)(8121501046)(5005006)(10201501046)(3002001);
	SRVR:BN1PR04MB391; BCL:0; PCL:0; RULEID:; SRVR:BN1PR04MB391; 
X-Forefront-PRVS: 0812095267
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN1PR04MB391;
	23:FM83eoCmlitwY07HmSYRv7hdPhgPXqp528t6iDNCbg?=
	=?us-ascii?Q?SJoGD+COK7VMbLp0UNK2/w20EOL6dARKiFaaf14b4PZAi6UnElM8YQPSv2PB?=
	=?us-ascii?Q?P5YVOvnK+4mG9+IuGVsZL1E3mkJls7Vx76FvnKSde/GiaeP4cXOKjyJWmjcH?=
	=?us-ascii?Q?H+AwnIRkqKuBj3KxUkHQwQlfR+tLIwrYYgSSiph07fBD1pesx9a+OAt9TbAO?=
	=?us-ascii?Q?tCAw+1E3JjiMA2ZhLPbFfvwu7tWHIZlDfPYB3oOJQf0DPsMyELV4XB1xv29h?=
	=?us-ascii?Q?b4q3w7pfZaJl9bhbjrZeIfR3jm7o300rRB3cUK/kf8y9IRYemMkm+YKpKkIC?=
	=?us-ascii?Q?KnhIGALxqo1WqAyGRKxKb6MxsqkcnS4q1t3fJ0h5EG+NeoigniBrTEqXRpQP?=
	=?us-ascii?Q?JALuwmg7o9vVScce11M45qRY1GyfGRiCI7VP3Wny2Fsn22KCrf7SvnwI+CJj?=
	=?us-ascii?Q?Zb57+luvqatpdj7hrhCIRDMhZgt0TlnfcPsdORqVKdGkf4TOani60paQBhSZ?=
	=?us-ascii?Q?j01Oc519rKf4MCXi4/3V8498i54GBueV6lhrRdXNbUsBtucDNdtvI5RgHJsN?=
	=?us-ascii?Q?vj+/GByTtQFs+S2ifwZElO8xlKG7kkjGanvuGdQrgvOiJcOfWWweHt6u2veQ?=
	=?us-ascii?Q?i05S3hbg6rbIEEyEj0gdLyV89zmbsobr2AwglKGhzxvPyc7Kq9zzH030dZzY?=
	=?us-ascii?Q?NS2O7ipK4gQLAhewsSTmnPCNrQeHnFU6Pq0r8KRqoZIrf2poRvZ+p+1OWfe5?=
	=?us-ascii?Q?PS15Exz74rz3yZHXlAzLZFGBqiyG97DZRwJAS2CmgSuMTHSWK2WXR+rRFBH5?=
	=?us-ascii?Q?mRD0hpX89e5aa6pKj8L6kX4RJBBw0E5mW5rJYc3oNEYa3oc4z+xbYhfNCWQL?=
	=?us-ascii?Q?Zi5OUjU0MSKuS1NlPq9nVkoKj1CCWymq/TtZt8P2Km+4yoG5Yl9LdDGqQsPG?=
	=?us-ascii?Q?Q27H0iCBo++dnt+yQNRXcFQ/V8rRGM5SFb8JmuEzFkVNY7LeO8a3ja51XDE4?=
	=?us-ascii?Q?CGuVbHtNZwPfq/CmBUcMkP5N5ETicQeE17WJX2jEaj7LjGF342pCGHihh5EX?=
	=?us-ascii?Q?uuvs6X97+gQJJ9PrOURW0jL2vwZkCKZdUrVbumRkLDszNN2DJFhKs2FPC/HE?=
	=?us-ascii?Q?84VUwYEdcCpwY60Un1lGue3+GD2832AMJLPxbwKazUcfB/xpfsVuz+hnXl6Z?=
	=?us-ascii?Q?2TSSH+I3O/PONXEffmF5puLMinPvUcuGeQYng4ZByjZlodf3PGN4WsT6eQX6?=
	=?us-ascii?Q?/tYJcIeg5Am1K0kHk1jfj8+S3WXo7mFc6tNaeMC2NTFw64mUuK4axGhQtciH?=
	=?us-ascii?Q?m6nEwxywmDR1nwbHWbRmGHtIksMjd64ZZAadpHC8uSJJLQDzcRcQhFqrK0GV?=
	=?us-ascii?Q?uub8/2963rpzZNzTMchQLlM9tBChN65+TXBjAkkjZj4XGlYaxMYGXUxoNqje?=
	=?us-ascii?Q?W5F1KH0i8lp7sT3w8JVy78I3kiN4A/Yzb3QxJHmM/vkV1Bb/8SWjLeH+tTPw?=
	=?us-ascii?Q?HPv0+t+6KL9H+ed3gOUs9JOr6xy5h5gyC8JpTJ2zzNVJJbP4HgKEAV1Z+BmH?=
	=?us-ascii?Q?hnsJp6AJIYdGccQUTxNHLAjDGlvkcOJKaWz3Q=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR04MB391;
	5:Xi4vpxnUi+eUmqVCNcQlwfo3fPbLz3OJIRF+kkSiJHrLdaR57zQ7MEzE0/eExvunGjgxn3sD5BBJpJz+gdK8Z677TIZUSSUOHqqfT/PfwvtZo4byUUSPNIaoCmSK2fAgovYm+BmeYGQudOgPq1driA==;
	24:o52RAJSs6XAdkqxZpmsrF+f0Gw4Tfzf29mHiK96isz5PhZZXRRxWQEbSSct3CbGFNrmEpDxc2+PpW77cJProeWCgzuGa2qGOzn4fPPwxBgk=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2016 13:37:37.9131 (UTC)
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
	Ip=[204.77.163.247]; Helo=[garmin.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR04MB391
Cc: "stephen.arnold@acm.org" <stephen.arnold@acm.org>
Subject: Re: [meta-oe][PATCH] dhcpcd: add recipe for dhcpcd
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
X-List-Received-Date: Tue, 05 Jan 2016 14:10:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry for the delay. I contacted the author and he pointed me to the follow=
ing page:

http://roy.marples.name/projects/dhcpcd/wiki?name=3Dhistory

To summarize, this recipe is for a fork of the original project that has be=
en entirely rewritten.

Rather than removing the old recipe entirely, do you think it makes sense t=
o move it to meta-networking and allow users to use PREFERRED_VERSION to ch=
oose which version of the program they want?

I can submit a separate patch to move or delete the old recipe, depending o=
n your preference. Do you want that done before proceeding with this patch?

Nate

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Khem Raj
Sent: Thursday, December 24, 2015 12:43 PM
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] dhcpcd: add recipe for dhcpcd

On Thu, Dec 24, 2015 at 2:50 AM, Nate Karstens <nate.karstens@garmin.com> w=
rote:
> Adds a new recipe for dhcpcd. Modifies the configure script to keep
> the host system header files from being used instead of the target system=
.
>

Can you also see how you differ with
https://github.com/sarnold/meta-alt-desktop-extras/blob/master/recipes-conn=
ectivity/dhcpcd/dhcpcd_1.3.22-pl4.bb

and I would prefer you to send a removal patch to above layer and let it us=
e it from meta-networking.

> Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
> ---
>  .../dhcpcd/dhcpcd-6.9.4/configure.patch               | 12 ++++++++++++
>  .../recipes-connectivity/dhcpcd/dhcpcd_6.9.4.bb       | 19 +++++++++++++=
++++++
>  2 files changed, 31 insertions(+)
>  create mode 100644
> meta-networking/recipes-connectivity/dhcpcd/dhcpcd-6.9.4/configure.pat
> ch  create mode 100644
> meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.9.4.bb
>
> diff --git
> a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd-6.9.4/configure.p
> atch
> b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd-6.9.4/configure.p
> atch
> new file mode 100644
> index 0000000..d61b05e
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd-6.9.4/configu
> +++ re.patch
> @@ -0,0 +1,12 @@
> +--- ./configure
> ++++ ./configure
> +@@ -316,9 +316,6 @@
> + if [ "$STATIC" =3D yes ]; then
> +       echo "LDFLAGS+=3D -static" >>$CONFIG_MK  fi -for x in
> +$INCLUDEDIR; do
> +-      echo "CPPFLAGS+=3D        -I$x" >>$CONFIG_MK
> +-done
> +
> + if [ -z "$DEBUG" -a -f .fslckout ]; then
> +       printf "Found fossil checkout ... "
> diff --git
> a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.9.4.bb
> b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.9.4.bb
> new file mode 100644
> index 0000000..1c0aff4
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.9.4.bb
> @@ -0,0 +1,19 @@
> +SECTION =3D "console/network"
> +SUMMARY =3D "dhcpcd - a DHCP client"
> +DESCRIPTION =3D "dhcpcd runs on your machine and silently configures you=
r computer to work on the attached networks without trouble and mostly with=
out configuration."
> +
> +HOMEPAGE =3D "http://roy.marples.name/projects/dhcpcd/"
> +
> +LICENSE =3D "BSD-2-Clause"
> +LIC_FILES_CHKSUM =3D "file://dhcpcd.c;endline=3D26;md5=3D7daf225c91b8065=
ecc974fc594b2a7de"
> +
> +SRC_URI =3D "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.x=
z \
> +           file://configure.patch"
> +
> +SRC_URI[md5sum] =3D "02f5043a415cd4b6d089631a0cd95f5b"
> +SRC_URI[sha256sum] =3D "c3f3ff7473ef158a1e71db9aea7424df2c3477ad064e2b54=
2f27948a5abc9ba0"
> +
> +inherit autotools
> +
> +B =3D "${S}"
> +EXTRA_OECONF =3D "--enable-ipv4 --enable-ipv6"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

________________________________

CONFIDENTIALITY NOTICE: This email and any attachments are for the sole use=
 of the intended recipient(s) and contain information that may be confident=
ial and/or legally privileged. If you have received this email in error, pl=
ease notify the sender by reply email and delete the message. Any disclosur=
e, copying, distribution or use of this communication (including attachment=
s) by someone other than the intended recipient is prohibited. Thank you.

