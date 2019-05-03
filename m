Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
	[209.85.167.177])
	by mail.openembedded.org (Postfix) with ESMTP id E6CA560069
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 May 2019 14:21:39 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id j9so3781827oie.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 May 2019 07:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Bq3h3rrlnntgk7flOV0JqJVxLj3NGO+/6h9F4/uyGQE=;
	b=uV76wxulcKGwDQTW5ztBTb5w385Bo2GTTMpjInWrUw3fQ7lP/yCn6LrjSz+ikqLcdW
	MGcELKofHfeQeXqwMzwllO2+gDQ4Rqxb/8wGk9uaQvL4jGxig3M1SZx7MjdzBSJ3BPtg
	S17/F5Um4yOPCtdN9z1Pgcpfu+ZH0PrJCGUISXfmF84we3XHS80BASV4DYDF/kTtgs8O
	Rt82F7uZMvJKfVbPVmjrFumXt666TWk1na0Nj2AMOwYDsNTLEk5GNY3dqUMXkfbDSyvu
	gZ7gmZMO/ipcvOf8Gkib257Qdi92yOxz2UsQgM657dKJZLdnYhiZ5rNeEQvp8Mz2+gOS
	fjLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Bq3h3rrlnntgk7flOV0JqJVxLj3NGO+/6h9F4/uyGQE=;
	b=GATsEih6DRid1nrZd/HKDfru1OpGfrqQtY+gcvpk5PjgTrgzC4VuuX03/vSn9tTfHt
	JmszZkaiHUNIOIFXIiMkgs4GLu6B+/rL2kzih+CSw8Z00ggxh+sOmN5j3WpyiaKKkPHS
	g0QJppAyxw/gsbrkGYT2gNKw6o74AhVH0pztFFXphRc2ZHiO0gTKzq2tW6lZgHV43h7Z
	zFLXb75xDoJwmVmud8b9Flk8tBiMXJqM1rp04YwyEehlMHh/mvMRpsQ9z3cSMgBtG8xS
	p066Bv2xslQkcOzs54CbvD5d8a2Eomw/trQU2h+Ec+rMxExfxhcg7Iv+RM9Bx+ZE8Gdn
	wdJw==
X-Gm-Message-State: APjAAAWtAK0XYJOqM0f21Mz5ArH6wetVrOtrqTK//fRyQeHx1RhqAvGO
	Os4rERLBCCnlV9IbrLco93M9o1LPJtLB7v8WCsc=
X-Google-Smtp-Source: APXvYqy/nue+O2FpXHa2zgyhenmsotDgB+OuuEV21rc1un4DiVaau88zCO4wRKYXwBOYwxGTf+GNfUZz3Sokul5IbGY=
X-Received: by 2002:aca:3189:: with SMTP id x131mr776740oix.88.1556893300768; 
	Fri, 03 May 2019 07:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <HE1PR05MB4635B39CEC6B61094BD46679C5350@HE1PR05MB4635.eurprd05.prod.outlook.com>
In-Reply-To: <HE1PR05MB4635B39CEC6B61094BD46679C5350@HE1PR05MB4635.eurprd05.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 3 May 2019 16:21:29 +0200
Message-ID: <CANNYZj8dCJguNCSu5m13-=mRiz_O_GNQp7vv5gL-J2AkY=1GPA@mail.gmail.com>
To: "Visser Sander (2) (Consultant)" <sander.visser.2@consultant.volvo.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Unable to customize python packaging in a clean way
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
X-List-Received-Date: Fri, 03 May 2019 14:21:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I guess to address the underlying issue, you could modify the python3
recipe to take the manifest file name from a variable. Patches welcome
:)

Alex

On Fri, 3 May 2019 at 16:13, Visser Sander (2) (Consultant)
<sander.visser.2@consultant.volvo.com> wrote:
>
> If I want to override the python3-manifest.json part of the python3 recip=
e; how should I do that from a layer of my own?
>
>
>
> I first attempted to add a custom python3-manifest.json in my custom laye=
r that has higher BBFILE_PRIORITY than poky. I observe that my json is inst=
alled to the $WORKSPACE, but package splitting is still done using the .jso=
n from poky meta layer...
>
>
>
> The way that the manifest is included from python3.bb (rocko-warrior) see=
ms to not allow custom manifest?
>
> filename =3D os.path.join(d.getVar('THISDIR'), 'python3', 'python3-manife=
st.json')
>
>
>
> I could not find any documentation on how customization is supposed to wo=
rk after the introduction of the JSON manifest.
>
>
>
> I want to be able to remove rdepends on python3-email when installing pyt=
hon3-netclient (in sumo), as my use of netclient actually does not use emai=
l (and email has many dependancies that make including it add a large footp=
rint to my image).
>
>
>
> I did find a hack to be able to do what I want, but it is not very clean.=
 Is there a cleaner solution?
>
>
>
> Hack:
>
> In my custom layer create a modified copy of the JSON manifest in
>
> recipes-devtools/python/python3/python3-manifest.json
>
> For sumo in my custom layer with higher prio than poky create a recipes-d=
evtools/python/python3_3.5.5.bb file with the following content:
>
>
>
> require ../../../../poky/meta/recipes-devtools/python/python3_3.5.5.bb
>
>
>
> #  Adapted JSON manifest is found from THISDIR, so no need to add custom =
${THISDIR}/python3 to FILESEXTRAPATHS
>
> FILESEXTRAPATHS_prepend :=3D "${THISDIR}/../../../../poky/meta/recipes-de=
vtools/python/python3:"
>
>
>
>
>
>
>
> /Regards Sander
>
>
> This email message and any attachments may contain confidential informati=
on and may be privileged. If you are not the intended recipient or otherwis=
e not authorized to receive this message, you are prohibited to use, copy, =
disclose or take any action based on this email or any information containe=
d herein. If you are not the intended recipient, please advise the sender i=
mmediately by replying to this email and permanently delete this message an=
d any attachments from your system.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

