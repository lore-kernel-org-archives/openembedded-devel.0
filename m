Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com
	[209.85.161.173])
	by mail.openembedded.org (Postfix) with ESMTP id 28A437860F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 09:54:36 +0000 (UTC)
Received: by mail-yw0-f173.google.com with SMTP id l34so4613744ywk.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 01:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=GgiZ0qui/zPuBVWNeXXZz5tNFaY2FiNUP1Yu0gUL0Yk=;
	b=UMJjWgzWBnpxOz4aqGKo9ou5IpNA87MUwRUxpDcJyYMRxwz+KO5OL25wQOMt3B96DR
	g7idP501H5RG8d7l7mzheZRxRsHEaTkZOyRrY10556aU73+R/LBurDTEtWSHQ4Duwk2Y
	g3zx4qEDm1b4h6M8Mgu3kHYd6SePzTF9702EAPl2S/5odNWyeyyuCCC+rwY2JhvWW/Sw
	3smZsw9TvyaDPd7FyHi7rKLMNQPp5BcEIqZt+imyFMPeEIRax1uBJdlAtnGJDUBh1G7B
	uw5rhDsFj3ZrnKYg4+UzJWeM4WVx91rkaa9ou/b42Eg6sHoBg5MSlje/ue2PMbLhaXOA
	rgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=GgiZ0qui/zPuBVWNeXXZz5tNFaY2FiNUP1Yu0gUL0Yk=;
	b=DeQHyulklIfCw2X/17Qk2y+rK0u4GuZJIhtcBE2r0CQhtLMzkHWBCWvl659gQ5d/aw
	YOF6mGMVCHuTQTa+IxwCMVR3hYuyxdhTr5kivEB04AKEVQ7hk3lhPWP+CRbmTH9EgH81
	p0i9AYMh5Zwo+pW9dDGHxgfrl1wechQ92XMfIot3axecYIEPEcLrKmQXA/bNXi3SDq6G
	mG+/liawVKj1gc9Bl6gL0L+5WXYwpNgM1+QQGlmtLVHcYR3e+MPomUMIq5wQ7V3fXCFp
	KccnDY/PfGrZzMkpCGRure/uVXRQvc8+md+h8Ovt53XJsbB6Yw2t2dswSA092y/oEyk/
	clKA==
X-Gm-Message-State: APf1xPDwjPzPRbB3KBSBCxJx5B/QBvQj4FFPH0OgudY4dyQOZkAT9PQL
	gr5raI3AGyxobspTJY35HrzhREJxW3h/Z7bFQKIA3w==
X-Google-Smtp-Source: AH8x227BxwOuZ7qb92WtsSiv3nBXYDcxgqHkn48i0DGAP7uYAtmKn2DnxVrSTwSgXurJ/r7OuHneGcibH39+pqzt4bg=
X-Received: by 10.129.154.10 with SMTP id r10mr12373791ywg.163.1519120477779; 
	Tue, 20 Feb 2018 01:54:37 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a25:c787:0:0:0:0:0 with HTTP; Tue, 20 Feb 2018 01:54:37
	-0800 (PST)
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 20 Feb 2018 10:54:37 +0100
Message-ID: <CALbNGRRAoHBSpsC0Ngenp2dPVxccOb+OeTerw44Bi4Of+bOACA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: [meta-qt5] qtbase-native/qmake broken for 5.10?
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
X-List-Received-Date: Tue, 20 Feb 2018 09:54:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

giving Qt 5.10.0 a build I ran into the following issue detected by
meta-qt5-extra/sddm build failure:

Running native 'qmake -query' outputs

| qmake -query
| Empty filename passed to function
| QT_SYSROOT:/home/superandy/tmp/oe-core-glibc/work/x86_64-linux/qtbase-nat=
ive/5.10.0+gitAUTOINC+50117d738a-r0/recipe-sysroot-native
| ...

ask for a certain property e.g QT_INSTALL_IMPORTS (this is what sddm
does during build):

| qmake -query QT_INSTALL_IMPORTS
| Empty filename passed to function
| /home/superandy/tmp/oe-core-glibc/work/x86_64-linux/qtbase-native/5.10.0+=
gitAUTOINC+50117d738a-r0/recipe-sysroot-native/home/superandy/tmp/oe-core-g=
libc/work/x86_64-linux/qtbase-native/5.10.0+gitAUTOINC+50117d738a-r0/recipe=
-sysroot-native/usr/lib/qt5/imports

First line always reports 'Empty filename passed to function' which is
not exactly useful when expecting a path.

I've searched the web without success for this so I decided to start
debugging. Due to standard optimization most interesting variables are
optimized out :(

So before I rebuild qtbase-native without optimization and debug again
I thought there might be someone here knowing something helpful
regarding this issue.

Thanks in advance

Andreas

