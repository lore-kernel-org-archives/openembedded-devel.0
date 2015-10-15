Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8BE32770AD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 03:15:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9F3F42S006811
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 20:15:04 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.159]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0248.002;
	Wed, 14 Oct 2015 20:15:03 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-xfce][PATCH] vim: do not autoenable the mouse
Thread-Index: AQHRBM6qhySTRKPSo0eVWse/z7H94J5r5Szw
Date: Thu, 15 Oct 2015 03:15:03 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA010BCF61AE@ALA-MBA.corp.ad.wrs.com>
References: <1444641333-11313-1-git-send-email-jackie.huang@windriver.com>
In-Reply-To: <1444641333-11313-1-git-send-email-jackie.huang@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.236]
MIME-Version: 1.0
Subject: Re: [meta-xfce][PATCH] vim: do not autoenable the mouse
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
X-List-Received-Date: Thu, 15 Oct 2015 03:15:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of jackie.huang@windriver.com
> Sent: Monday, October 12, 2015 5:16 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-xfce][PATCH] vim: do not autoenable the mouse
>=20
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> The mouse being autoenabled is just annoying in xfce4-terminal (mouse dra=
g make vim go into
> visual mode and there is no right click menu), so remove the setting for =
mouse.
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta-xfce/recipes-support/vim/vim_%.bbappend | 6 ++++++
>  1 file changed, 6 insertions(+)
>  create mode 100644 meta-xfce/recipes-support/vim/vim_%.bbappend
>=20
> diff --git a/meta-xfce/recipes-support/vim/vim_%.bbappend b/meta-xfce/rec=
ipes-
> support/vim/vim_%.bbappend
> new file mode 100644
> index 0000000..abd3128
> --- /dev/null
> +++ b/meta-xfce/recipes-support/vim/vim_%.bbappend
> @@ -0,0 +1,6 @@
> +do_install_append() {
> +	# The mouse being autoenabled is just annoying in xfce4-terminal (mouse
> +	# drag make vim go into visual mode and there is no right click menu),
> +	# delete the block.
> +	sed -i '/the mouse works just fine/,+4d' ${D}/${datadir}/${PN}/vimrc }

Please ignore this since it will fail for multilib, I will change PN -> BPN=
 and send
v2 patch.

Thanks,
Jackie

> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

