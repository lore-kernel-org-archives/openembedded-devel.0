Return-Path: <kdgoncharov@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3E57460272
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 11:25:46 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id 18-v6so33937739wml.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 04:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:date:from:message-id:subject:to;
	bh=EKCAuvxh1UyerRGiZOdHdW2f9AeTqyIuYf/WSPyyX+8=;
	b=V7+XaQLMz8sQmn5UEIpoIdjbzVTQtzJrhd+hku7x4+vlUyIKTbVhj8oRXF7Xj2ax9u
	alHLtbmVEr2ZVvJYEEWaq0yU50MMi7ExIy8WIkBPAjxtoW+qpU8IKkyHAV6DiEq5mg12
	lr1qTVnj5usNgsnY4nNRWXlsJCS/Hf6M7NVF5tcoPM/snThDMMRk1Xo17x2AJuYX6TLQ
	UTWAAis4l3bYIc7qE3ef0xZVdEqgvXEGlqQPvmqO6N4sYk/aEbTt8o9kEnlQtLBb+HMm
	5rP+roT2lEPCaCTxhq1N5u/Wo+1gCtMpi5/pYUcD4krsFcaIZaLfTdVRZIOHRedKEwir
	Vymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:date:from:message-id:subject:to;
	bh=EKCAuvxh1UyerRGiZOdHdW2f9AeTqyIuYf/WSPyyX+8=;
	b=azzaI65NF+yXRJRaFQCijAEhaNiwU9uSZuP0If8ks+Q4TOWOxmDLdmCjv+P5Y0z9KV
	WHVXnvm7s+BzOppR17iCkltfcKP8O7zs9vGHlu7LTgczZnR26cD0L28aHK2VcqH1vBEW
	ehl+usTvcfB5ZwN6mg5RleRn5vhCBCzmS+nQ7u0MhSQLjN/7KEbgX5U26liwBpGGCz0C
	d9GR1UjUr3qqVf1wRvQGHpATRYiOOZdlF70WH6AxmXe0S+c5H8YyJlbcibYjNCAV/rac
	ctRlkjt7JnQg6ioDDdvhSQW4YRbPmxSXssvAC0urI1zLh2lSTDEaYboagaiiJLVieZCT
	5T4Q==
X-Gm-Message-State: ALKqPweOXYkWxrk497YsG+xqpo/9MHHRHbFr7EaLEes1VIFFtwrz+rIy
	hX7X4+5V4fkLaRtwv3vlQvEnnHDj
X-Google-Smtp-Source: ADUXVKJ4lM15GSgulUjdkeLCYPt6Mv1Igkl+OzZ8r1f1I3GX6rqW6Zg6xzdZqYt71KeIaCnTCCZoVw==
X-Received: by 2002:a2e:6c10:: with SMTP id
	h16-v6mr10850583ljc.81.1527593147464; 
	Tue, 29 May 2018 04:25:47 -0700 (PDT)
Received: from localhost ([46.101.243.230]) by smtp.gmail.com with ESMTPSA id
	q25-v6sm6333212ljj.68.2018.05.29.04.25.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 04:25:46 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 29 May 2018 11:25:45 +0000
X-Mailer: RainLoop/1.12.0
From: kdgoncharov@gmail.com
Message-ID: <422140a5a5f8db29ddc6a78f8de60a73@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5] QtWebEngine SEGV_MAPERR when opening web view on Raspberry Pi 3
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
X-List-Received-Date: Tue, 29 May 2018 11:25:47 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi=0A=0AI'm using meta-qt5 and meta-raspberrypi layers to build an image =
for Rapberry Pi 3. The image contains PyQt app running with eglfs plugin.=
=0AStarting from QT 5.9.4 (commit e1046125d212a016d96944ff907e17d51a5b41a=
f on rocko branch), QtWebEngine view started to crash with SEGV_MAPERR. T=
he error also occurs with QT 5.10.1 built from the sumo branch:=0A=0ARece=
ived signal 11 SEGV_MAPERR 000000000000=0A#0 0x000072a7ab4a <unknown>=0A#=
1 0x000072a7a9c6 <unknown>=0A#2 0x000071eda2c8 <unknown>=0A#3 0x000072a7a=
dc2 <unknown>=0A#4 0x000076bb4d30 <unknown>=0A[end of stack trace]=0ACall=
ing _exit(1). Core file will not be generated.=0A=0AI posted a bug report=
 on QT tracker with more details about the crash: https://bugreports.qt.i=
o/browse/QTBUG-68484 (https://bugreports.qt.io/browse/QTBUG-68484)=0ABut =
maybe something is wrong with my configuration and I have to update it?=
=0A=0AI'm using core-image-minimal with several modifications. Here is my=
 qtbase_git.bbappend:=0A=0APACKAGECONFIG_GL =3D "eglfs gles2"=0APACKAGECO=
NFIG_append =3D " fontconfig=20"

