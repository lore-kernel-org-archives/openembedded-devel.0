Return-Path: <nilesh.kokane@mindastoneridge.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 945066FECD
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Aug 2014 11:36:12 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id w62so4154841wes.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Aug 2014 04:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=zazh7r2euNYM8w4QGC/1d2P3Nr/b3hpgeormh7zlQ08=;
	b=WsaafCxv34SYloWpHu8wSat6xodbBtBIYGkcPh4DAefnpf100d3aCN50EYOfHscSEk
	iI3iTC8ru3lvV2FT444OyvHu0VpuFin3y7q+e1l9f2F1k8TrusetPpkPqQZD2CU8pZ5G
	clXvZCZ4a4bqYUA2txnxoIQbxo0odcXaNbq0waIc/xLSH94CyEVmSIfjqWBCtbvznX7m
	TqvN1GC63V9mw6NsDJxTe4Marw91VmRKfPOTiLNmlEhgFUlPIeRZrBultQuIuXzDSFFT
	RBzMRTA6ApG1//W99y91We1Fp4S2ylU+GA3Ca61g8oIP44VE2hn0ljBnNd/q1eWMx/+O
	14Jw==
X-Gm-Message-State: ALoCoQkA3JuLtSRz7+eZoMqQprcgSHmlGofrtW6Mkl1SU4qel9y38FpHRXeD/icOgoK0lISVyEYd6gRmdm2qKM+ushwJkqABwTTm9d0E77J/J802nmvNJbOyvyxeYIVfI9Y35wP8M+jC
MIME-Version: 1.0
X-Received: by 10.180.184.20 with SMTP id eq20mr5789439wic.37.1406892972658;
	Fri, 01 Aug 2014 04:36:12 -0700 (PDT)
Received: by 10.217.38.72 with HTTP; Fri, 1 Aug 2014 04:36:12 -0700 (PDT)
Date: Fri, 1 Aug 2014 17:06:12 +0530
Message-ID: <CAHURY+15jB-vQQakQSfjL7WsNjpQyQy6Nq-dcUVPKJ11SNWF7w@mail.gmail.com>
From: Nilesh Kokane <nilesh.kokane@mindastoneridge.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: bitbake meta-toolchain error
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
X-List-Received-Date: Fri, 01 Aug 2014 11:36:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,



I followed
http://wiki.wandboard.org/index.php/Building_Qt5_using_yocto_on_Wandboard
(newly added) on wandboard solo


The DISTRO_FEATURES_remove =3D "x11 wayland" is removed from the local.conf


And after giving the bitbake core-image-minimal I'm logged with the errors
as posted on pastebin http://pastebin.com/hsMhT9f8




ERROR: Function failed: do_compile (log file is located at
/home/minda/bin/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-mx6-po=
ky-linux-gnueabi/qtbase/5.2.1-r0/temp/log.do_compile.28369)
ERROR: Logfile of failure stored in:
/home/minda/bin/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-mx6-po=
ky-linux-gnueabi/qtbase/5.2.1-r0/temp/log.do_compile.28369



ERROR: Task 655
(/home/minda/bin/fsl-community-bsp/sources/meta-qt5/recipes-qt/qt5/
qtbase_5.2.1.bb, do_compile) failed with exit code '1'





can anyone suggest.


Thanks
Nilesh kokane

--=20
=E2=80=9CThe contents of this e-mail message and any attachments are confid=
ential=20
and are intended solely for addressee. The information may also be legally=
=20
privileged. This transmission is sent in trust, for the sole purpose of=20
delivery to the intended recipient. If you have received this transmission=
=20
in error, any use, reproduction or dissemination of this transmission is=20
strictly prohibited. If you are not the intended recipient, please=20
immediately notify the sender by reply e-mail or phone and delete this=20
message and its attachments, if any.=E2=80=9D

