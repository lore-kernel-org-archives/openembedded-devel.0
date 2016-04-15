Return-Path: <sujith.h@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 209D373175
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2016 07:50:25 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id j35so76837416qge.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2016 00:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZDZiLrc3sp9vqeD1Q348gbheSbsmWbZ7I5NjSeF69GQ=;
	b=iZM13ANk6wG3ZqiW0OyyFJYiJP5g1qPkfr4w7T/R9XC1mpqbKq/3h5FGeDtM5Lt13t
	08aNpWRXQKbzwzKvk+cPV5dV4jLewPnJ5vSSu8lF7iDfQ/fINo5SxnEYuDbYV7fS+nVc
	hODOvAv09NEj0sNIIXow2x5cwCbIFQNaDQdxg0nYm6JYu12S/eUqfWShUSi8a4hQxZkl
	JHbuLzlqCHMOaRTTNq1A25rtM+5jD1bC6kwUq3tAS5X2nKDNUlVC4gvXo9TZoZLH9sQb
	NN57whcaV+Knh91uibO5a0Pnc69C7dO6TVmnzitUs2urp5IYNGsS+Ybexn24JjIHoP40
	3QSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZDZiLrc3sp9vqeD1Q348gbheSbsmWbZ7I5NjSeF69GQ=;
	b=hCslbyHTVFcE1px7M2+VQNFbPFaKk+lFEo/UkENledNcW3gbYwY5xvKTSEYElQizzd
	7SouhJrChNPAFuT7B3FLo6fpYV6JFMoNp7s7H7ViyA8l5zMNb5uhe32eyuO6ILPdvgvu
	3YrQJpdiLsn5IMnw//j98nnDbbJUX3/5M44P6z+5ff14BahTBY+9RnPgmzBpOWYLxB0B
	fWN34Uj5SkGMCgVTLqEujhvtU/YVUagQ3WPnWeAsACX1JKKNLfYNIpWpp9T2lAow/fIP
	Yrw+mf/95FsPF+8angIcro3FAzYgwyTY1kmB4EMHGnyFq+z5JAYGFySEjyfrhH2Kkrm+
	3hJg==
X-Gm-Message-State: AOPr4FV/E2tkMbuYMpvoyDsIewzlHTEf5iKoysNxtfCSJQix2/5g+JMr3jQyrcMI6o2HyT2IAhzs2dQt7REsWA==
X-Received: by 10.140.227.82 with SMTP id x79mr24739872qhb.101.1460706626111; 
	Fri, 15 Apr 2016 00:50:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.89.178 with HTTP; Fri, 15 Apr 2016 00:50:06 -0700 (PDT)
In-Reply-To: <CADyYWLkKaW0fFjentEq7h9AgojtHyLRFRnmCd7heA+bTBX515w@mail.gmail.com>
References: <CADyYWLkKaW0fFjentEq7h9AgojtHyLRFRnmCd7heA+bTBX515w@mail.gmail.com>
From: sujith h <sujith.h@gmail.com>
Date: Fri, 15 Apr 2016 13:20:06 +0530
Message-ID: <CADyYWLkNEyw9VGJk9Euufd-F7wEk6+sS-OK-iERv4k9sm8aa-g@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [yocto][meta-qt5] How to increase depth of qemuarm from bootargs?
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
X-List-Received-Date: Fri, 15 Apr 2016 07:50:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

---------- Forwarded message ----------
From: sujith h <sujith.h@gmail.com>
Date: Thu, Apr 14, 2016 at 2:53 PM
Subject: [yocto][meta-qt5] How to increase depth of qemuarm from bootargs?
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>
Cc: Noor_Ahsan@mentor.com


Hi all,

I am trying to build Qt5 from meta-qt5 ( master branch ) with poky( machine
is qemuarm). The qtbase is built successfully and is installed into
core-image-sato. When I run : runqemu qemuarm
I can see the matchbox window launched successfully.The qtbase is having
gles2 enabled in the PACKAGECONFIG and gl is removed from PACKAGECONFIG. In
mesa I have enabled gallium. I do see a problem when I try to run qtbase
opengl examples.The gui gets displayed. But the image(s) associated with it
never displays. For example lets say there is an example known as cube.
When I try to run cube ( with -platform xcb), I could see a black screen.
The cube image never comes. So my query is if it's possible to increase the
depth ( default used is 16 for qemuarm ) to 24 through bootargs? If so a
helping hand would be great. Let me know if more information is required
regarding my setup. I have poky + meta-qt5 + meta-oe + meta-ruby layers in
bblayers.conf.

Thanks,
Sujith H

--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
<Project>Contributor to Yocto project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info
C-x C-c



--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
<Project>Contributor to Yocto project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info
C-x C-c

