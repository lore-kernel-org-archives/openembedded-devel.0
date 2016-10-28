Return-Path: <ting.liu@nxp.com>
X-Greylist: delayed 943 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 28 Oct 2016 10:23:13 UTC
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0089.outbound.protection.outlook.com [104.47.42.89])
	by mail.openembedded.org (Postfix) with ESMTP id 77DDE6FF73
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Oct 2016 10:23:13 +0000 (UTC)
Received: from BN6PR03CA0011.namprd03.prod.outlook.com (10.168.230.149) by
	BY2PR0301MB1624.namprd03.prod.outlook.com (10.163.28.30) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.679.12; Fri, 28 Oct 2016 10:07:30 +0000
Received: from BY2FFO11OLC014.protection.gbl (2a01:111:f400:7c0c::171) by
	BN6PR03CA0011.outlook.office365.com (2603:10b6:404:23::21) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.16 via
	Frontend Transport; Fri, 28 Oct 2016 10:07:30 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; ossystems.com.br; dkim=none (message not signed)
	header.d=none; ossystems.com.br;
	dmarc=fail action=none header.from=nxp.com; 
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11OLC014.mail.protection.outlook.com (10.1.15.48) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.679.5
	via Frontend Transport; Fri, 28 Oct 2016 10:07:29 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u9SA7ReK015305; Fri, 28 Oct 2016 03:07:27 -0700
From: <ting.liu@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Oct 2016 18:07:23 +0800
Message-ID: <1477649243-26613-1-git-send-email-ting.liu@nxp.com>
X-Mailer: git-send-email 1.9.0
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131221228501850161;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(86152002)(81166006)(8936002)(97736004)(81156014)(8676002)(86362001)(92566002)(50986999)(189998001)(575784001)(36756003)(33646002)(626004)(2876002)(77096005)(68736007)(230783001)(2906002)(4326007)(50226002)(5660300001)(2351001)(229853001)(105606002)(106466001)(586003)(11100500001)(50466002)(19580405001)(6916009)(8666005)(5003940100001)(110136003)(48376002)(6666003)(85426001)(104016004)(7846002)(87936001)(356003)(19580395003)(305945005)(47776003)(7059030)(228453006)(19627235001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR0301MB1624;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11OLC014;
	1:cd2zl5PsY1BUE/xafNC7dKukhqqo0MfTsyETfj0HyD0rWtXD0dwHOD02NgsgCKHnmAIjhQYSyipuJMoODPUJdxL+BxGnZh9vx9KzGLs4CYkLTfwWqS2IlLpRd1DVMWjZENLMY7589XLMtNVxMYnqfpCuvsv0P3p0YgHvdcm1GHqQ3xJqbEPy0xVqx8a6Vi3v3Wr7nDOuNGlmgH2vC/u/OwaoHfVyC5kdHPLUmrzsvZSQN5UlIipxI2cRQuQdCf9Bb/Cmut5v8BsaPXzzmRO2ikU150e4Ub4q+tq9ue/wwJfKd/DzdAAwxqAqUsB9Fl4pi3vm2KZWAmzLOGSAnnAgkkj+91PZGMTEMmcPmJnluyOCDb3ceycPccGvUaENKjpmjKmjTz+e1iZ1Dki/Au7UWDd+D4h7LJqSR3QFVzEaTCjrSlFMykz9uLbl4bSKqurtzU/ic4ljEZ1aRExy+A4d/Kd9Rf0pP7GXej/JVIcQUvWG4fQWwLJa7AkKj0wkHFA3+tb3igzWtjVecgX6UGaGI22Z88qVujeArbM/qEZxkcwQVe812AbUeNK7GQxRdKpswyRM+0wJ8pxzFWQ+uX20LYyRV02+1UiXcbyEZfos2hPkcml5MbLG0CXGSgheVQYj
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 73de9c4b-f6e9-43b1-d831-08d3ff1a3a4e
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB1624;
	2:8Fzk4rFZcnLWqK7mIqfVJcr/yvYxHXdNIzk7VwtV/X0LRM1nhPwkRzpTCc2n3FH/KXqJuuQknVN8RfB+/v411L/DnNuhMMpJlAvqIMi9plDRoROhwqFaGiGhh4YyYFBgbuvxB5jeXnJhBP5gGlVeKvTO4FHXzzgnQP1MfLl2unAIzM89eh6PvJ+qKIsJX+ROpEyX8/xhUkMcreHuXrcjXw==;
	3:0Xwe9j9gHrun0LxQp2FVY2nrdCYvnuslF+lDvaX4oOkCWFluAwWYKVg0cV3QGsNmHcZaeIAAA4o/2ehsnh+krZHuuP63lYC4t+kAjRNqgJxkVkR0wY6DOsdRDuAl+Z2tZOLfWJMUHuFt5H87n5jQPRDE0YgLv7zYANGLyz1KAjOvK6dn7jufnFSC/EtJe2b13xr1SB2yNnx3WMvFE0fYa7vrgKTVMbUPTosQPkSthjIUTNBPWKYrWCGdwT534dke;
	25:m2CkJheDGLyN2qP+LGl1Cr59bioZlETDvL6ZQdVr9059uPNX2bED+oFCoqDJm98NNNp0dXGHTc9OKOAQOBJMYi8u0+IehDnJkFrSEWVbqunFVrl7NdUWSlKsXV9Tw1Sf/ZN++jjEt1cDj5Nsa9R0ldIUMMFNNQt7bDvrCnRXwW3dNkcS8fQR9z/Oax7J/LVkI4oFJL30zSK3sJFjecajso0NmMv2wAq5MVXt39pGI0feuhPfG3iPGPL7VROcQpfwxQFywJ5pzplerZMf3ariamogbDAFSjLBrdJp3XKPSxN8vGjnsRUu/UgjVKdb6H82LVNUjSoYUkpaWc64udT23uZ3YdAl/jZ2d+1AdGkc60T0IR9XdYgkhCYyd5ranLOOz931HDKP7Kk9L39aADkT7qcjvSqM0IPl5toHWrL2uhkUkBE2YWFinKn6Ii9kkwQhFO6DSyXIBEVailJoOdNUKQ==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY2PR0301MB1624;
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB1624;
	31:UvWWH7/SC5/aOjVFbg02ZDJBSk4sujudmg2IdFc0dypXFeLys/MPxKtW7omhgfU7UejDXL06cd0RAPZRKorYNg0xmzvBrm2KNcJJYHWA4vkGzDtOqtW5Cx1binkadOxJ2vpu040cT49MsOp4b2GhZz8kXFXfO7+KJmVWWhEYncMPPUkNqXve1IWsgYX11ucnmvpNGjE0ZknZfJk2QyNnWSqdh8LgEsab/nmPZRLSB2s45KZ8/vya5Je0racekkSTMbA14eOcWm8NfX5S6zSzdg==;
	4:rmwVtK5IDZjUANL4ww5EWDEtnmcspLb93QvNSWx9E0HTrbnXgCZ0R3NhM+7Ja+fTavoytk7m76b3Jkae8Y7QZ+IjA54MCxVhNv6o2ybVd8C9USsBEB7fxoweiHdmO+IHdXXZ0mlJqMs7d2T+1H263V3gS2unmkVqpI2AH6lE4iKupPvqIsox77AiBcO5hMeHAUiBbF2rbexMg3jcuXPYnhiSKaz7jMz5TIhjVwfRIceHvFC0dvef0miJD9vyTy40uoGHUoi6OPe1d3Zgp1Aqru58z9vMRmgM7Oe9Xs1DQ9el5zsTJQjCVx3oyuyb3ypSChTjdcovBxkZlUqkvSR/CtOdmb/ePJH6egPaHv8xBKYvkI3gN5TXa3MzAQMuWP4JPbz7Y11RjSLZwMvlqkuKSn2t7VEXsHLh6xVYjR/N9e96L5jlXTFAN87+APOBJ54kqd7Qv+GcENoFvl5tVyv/fn7ggnupskE9vq70IN00U4l24yu57VPrSaLrrEFdR/tA+OE/2QB41boz64fYGumqR5fKGoTxAFmRFU7Txz52m6vJrY7L/9edicwr+DPp9+hQ
X-Microsoft-Antispam-PRVS: <BY2PR0301MB1624FFCFD8B7A6E65F76CAC999AD0@BY2PR0301MB1624.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13024025)(8121501046)(13015025)(13023025)(5005006)(13017025)(13018025)(10201501046)(3002001)(6055026);
	SRVR:BY2PR0301MB1624; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BY2PR0301MB1624; 
X-Forefront-PRVS: 0109D382B0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR0301MB1624;
	23:E/DaWM27NmPZ1+AjJKs1H87dM0CDH2g9e0up8rJ?=
	=?us-ascii?Q?woX53mEjw9/h4zqY8upqIW8o9VKwXy87zJxNzKLoFovmyIIakGakxdKUxUax?=
	=?us-ascii?Q?bUDD75qvsMeM5fx1BcP7acmCsuHZLFIsi9nERwP8FbDSt7tLJsQs4TJDhVVU?=
	=?us-ascii?Q?AyVRvjb8hZUDuZxdmKVTK3vjpJQdLXdQkoJWWgozQX+1KDnKc+kwnvKZ5/vr?=
	=?us-ascii?Q?giVlRVTH5F8JUdw/aWZD8lkFnYYq9ag/jjXXXU3kpPYYhOhTdJXus/hlVKJi?=
	=?us-ascii?Q?EORpDIb2pHKFpQPwAsoTjhjtwBDP/n2yjwiItprv5FS58e/6EMCde+eCkWra?=
	=?us-ascii?Q?EMJrqDOpqAWbef7YzzQaC74Mz5JQZoJuLHnxbr/bi8iIwp9lCOE4Qo90Ph6T?=
	=?us-ascii?Q?jU4PvdLx2NREEb03ZKMcG4OrPMTbUMXxghv8/YpnKX+sRiPxXyD3TiQfmC5Z?=
	=?us-ascii?Q?UpPXynhT6b0s9kdjsF4nuhsvPSQ4il+jhK2zp6yJom4EZgfI/UMoor3ZKWvq?=
	=?us-ascii?Q?LuQHuXiFMTDBBTZTaAp/ZTPjJ/B006Gq2KdRt+VWFxHS5k1KR5g0tyRsMG9Y?=
	=?us-ascii?Q?l21ChE8wiv/+e6shKC9Txfe98PJyfmBsga+gq1tpNtob3PoHEEgHGJqnGqhj?=
	=?us-ascii?Q?bOWFbWlfKWmr0FjkXelSqad2iN0tHgY7k8Y+WGc1Q9cjmDTtsj40KmZt2zHf?=
	=?us-ascii?Q?STqj+mLSCOVf4UZnufRGNR5HMlNa40AySrx60NEmOtlD6EVjmWFO7FUXc+4h?=
	=?us-ascii?Q?7r2dMnpQgw88pI8cIFYsY6WqYtZmJX0RHlsuLjAI8+WKw9HXZk5SqEBbjo+R?=
	=?us-ascii?Q?3KH1BLyFME5t9QUX/znnRQmU03LbHj6XrJJDKIj/MW2ISE5v1GQnEXUHTfWJ?=
	=?us-ascii?Q?6zjjj10+VyMcGxd8hyNoT9UdnHT4VpCqLxSTGbrgIdQx+DHi69GIXnfkj+Ja?=
	=?us-ascii?Q?m4eQTyNpHzknfFMZ1Jmr3V3PF+Lhb1xtvBtxbufecRQCYY32qFl5R35JLQD1?=
	=?us-ascii?Q?s9Dn02dA1t2eQBBGW4zQCWTTmPmsdY5FDYF2C5y1sDzz+2sy94naH4XaWF52?=
	=?us-ascii?Q?rPcNpaWhDp0P7QsbUz7uYAUpNhhzJJt3+wCunULNelgBJpEUs2INJTDRANeU?=
	=?us-ascii?Q?Xxj9h2iDQDVo42B5u7zfJE7yPrm2UT5XoR2XtH0VPf2EGDGPe+G+euqh54Mj?=
	=?us-ascii?Q?vb5Yl+hLtfJLRHUKKnlzgSCEIs65ZC9I1fomu9M6fEcN9ikjbjpqCGRDCzrO?=
	=?us-ascii?Q?8OjljtMqAhszB4yWo+YXCOzPP8IyIVqAsnkVfCxqDlWqfSP6BjlUasFAzNKC?=
	=?us-ascii?Q?9oQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB1624;
	6:qKKsOg6ChVXyIXZyDxsQCAMGnSgd5H7Pf4hLSwOZ1K4gqhhQiikYvUA9OH6N5mPme/0jLALipWpARuWUvgU9wTO9qgDgzksOf8Jfk8ICgQaPTOhsdUqju28jZ8U0Dxvmtd6kYA9GAGslCfcsD+WUgTx9q2BoW9rn3y89OBmZswo3Adcw7TmWEuexIExpVjDY5hJpw9tf5i4Yj9K3VsYMU8qG+D19vbPtxxYy7eLquS5Ca9ZtDC+B+SJ4JbRv+a1qeCAV5QtR3pccMTgNCy7sjCkgn1YJwvMiBAgysi7Lfiwj1j0Rs7bPkJ6mcoqs3+u+;
	5:QPu1NxJmsJ86nQ/Oy7rjctb+G0ZP8vHpITj0rRuk2b3eFGEXcxFk9cWvUUB467fp7yDpNrf5vvlIP6ixvR3XMPTe77p3Jc11YUT/0holl4dG0Y/aKEoLq/4qKtyQHVWMvPFNVAUJm04xG8HQFRkCNcF9eaf69Bw/pQnUjeygbkHTBC9uW+E+Id5prfSVwzuX;
	24:tvwk/ARMiLW8oAXvPXvB9m1z9mBksT7tjTauEZ85Ql3ZtH8WrI0WATHzj0Ukxm5gQWXGS9SwfDhaX93Ao1VKl2+mGgMEZa6lXct/wSRu4nw=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB1624;
	7:g4GJ+M3XtTB8xjJCVh8mFC2WLQ8lBqhUvOeKgzUqDBtAJMZh8uf6FJBRGq8kh/o+Rv5pWkYrk6SULfHp7dyuS/Gvfjc8uR7Xxcx4xbjLstbUT3ou2v4SojB2aLMSB3XHbUgZRHKPrs/9n73DeJ/FHlvtrxIh/YkbK0le6fryMAYpjVFxKiJ0dcoa7o4RHkDiFSHEciHCvmSIR+ZZFH6C81cSmQxLHSVr+ilEIW6EzThSi2TV6BgT+blEs0vmWgVIAGd8IpLDUSx3N0QC0/q5kElworj27lsoezncOAC/k3lSo9Cz3ECjk59I5d8lKTlgjbPrxi6CETiRZchjCw7gEYb7VeIqTrGnnJNvtzjjwDI=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2016 10:07:29.9822 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR0301MB1624
Cc: otavio.salvador@ossystems.com.br
Subject: [meta-oe][PATCH] xterm: use ${libdir} to avoid installed-vs-shipped error on ppc64
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
X-List-Received-Date: Fri, 28 Oct 2016 10:23:16 -0000
Content-Type: text/plain

From: Ting Liu <ting.liu@nxp.com>

xterm installs files into PREFIX/lib/X11/app-defaults by default.
This leads to QA issue on ppc64 which defines libdir as /usr/lib64:
ERROR: QA Issue: xterm: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/X11
  /usr/lib/X11/app-defaults
  /usr/lib/X11/app-defaults/UXTerm
  /usr/lib/X11/app-defaults/KOI8RXTerm-color
  /usr/lib/X11/app-defaults/XTerm-color
  /usr/lib/X11/app-defaults/UXTerm-color
  /usr/lib/X11/app-defaults/KOI8RXTerm
  /usr/lib/X11/app-defaults/XTerm

Fix it by passing --with-app-defaults=${libdir}/X11/app-defaults to configure.

Signed-off-by: Ting Liu <ting.liu@nxp.com>
---
 meta-oe/recipes-graphics/xorg-app/xterm_325.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_325.bb b/meta-oe/recipes-graphics/xorg-app/xterm_325.bb
index e0baf3c..48556c7 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_325.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_325.bb
@@ -14,6 +14,7 @@ PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig fre
 
 EXTRA_OECONF = " --x-includes=${STAGING_INCDIR} \
                  --x-libraries=${STAGING_LIBDIR} \
+                 --with-app-defaults=${libdir}/X11/app-defaults \
                  FREETYPE_CONFIG=${STAGING_BINDIR_CROSS}/freetype-config \
                  --disable-imake \
                  --disable-rpath-hack \
-- 
2.7.4


