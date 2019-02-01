Return-Path: <benswanson1@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 86E937C296
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Feb 2019 10:24:29 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id m22so5622434wml.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Feb 2019 02:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:mime-version:subject:message-id:date:to;
	bh=KCjgQ6ZBZrd/kfvqGE5N0RESCje24yIu9JJQoE3oKjo=;
	b=FNxEGsR0MolIn8PfYorwWzU/X0we4cn8KVCjRh990EIkXehK54yTNdEtXmMUe39VVm
	j2kZhSnPEO75ao4BX45Yyz+J8ulo4ROfDbifAvYqaa4JUJRmRc/yAX7EERWgIIBgvKdx
	kicm1o/N7mzAIAHZc9QdeFq+4N/VFMWlDOh4GGtxVs//gp2BODJgxLwmBtGu9E8vKQu2
	z35714kFhtODnHeJgC0pAdVl0+6ZQB63aS1MpT9G3WZA452MzslRdaesDKgN55olfSwi
	7bcL2NYOFkk5s7JBQVVeX2YfNcqAvgTvVyq7Yjvl3aImImyh3o6e6RIq/tNafpT0J70y
	WbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:subject:message-id:date:to;
	bh=KCjgQ6ZBZrd/kfvqGE5N0RESCje24yIu9JJQoE3oKjo=;
	b=uQuN+UL80JyZl2V6RNFkbTZY8N3gJJFvCTHrmi50jIqUkNLfX2P2ylGzVftyJkjRlg
	8DeWjnHoX4aUNTtX2RrxASR+JW0gJbDfGk2tN9PCncqhw5gQZ98OsEjr//RD/qOY1Ae9
	EQksJQA2jmZylsF1NCyBuMkfsQDWgRwWs/XFR3PJv6m0npIH/78PrxA/8Db5ZN+2Lpu9
	9GlPYJKoSaStqLHYYr//CiELfsWk03ccCvP6gF1Njv44y97EyjDiZh6Lzao9N5nnFFqJ
	s0m971IMf9a58g3ld2ZBR7rCL7XhCL9BBTUrnJokdOjBDjdhFlRy4Y4qO2NkpgpUQZHN
	MwzQ==
X-Gm-Message-State: AHQUAubx89577GQug7gp8JmTqkRNwbRpEV5wiOIvRlSVb13YGjX+lFwv
	gn1MfO/V7EiKccLGb5tIaJtJc8Yx
X-Google-Smtp-Source: AHgI3IbdSzd/oCmzxU5cd3bxcmroRax1uJ94Ooq5R8TxFcBo8TLP+1baDEQooiNrD7Z0sJMbC/+rWg==
X-Received: by 2002:a1c:a9d4:: with SMTP id s203mr1705416wme.132.1549016669704;
	Fri, 01 Feb 2019 02:24:29 -0800 (PST)
Received: from [192.168.98.4] (rakocontrols1.pndsl.co.uk. [80.229.182.230])
	by smtp.gmail.com with ESMTPSA id
	k23sm1447433wmj.32.2019.02.01.02.24.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Feb 2019 02:24:29 -0800 (PST)
From: Ben Swanson <benswanson1@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Message-Id: <6B41539F-A409-41E5-8562-D6607B44F769@gmail.com>
Date: Fri, 1 Feb 2019 10:24:28 +0000
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3445.102.3)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-java] icedtea build failure
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
X-List-Received-Date: Fri, 01 Feb 2019 10:24:29 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

I=E2=80=99m getting a compile issue on meta-java, poky. a6f135f7ac7

https://pastebin.com/fuK8WCkM <https://pastebin.com/fuK8WCkM>

openjdk-boot/hotspot/src/share/vm/adlc/output_c.cpp:577:6: error: =
=E2=80=98%*d=E2=80=99 directive output between 1 and 2147483647 bytes =
may cause result to exceed =E2=80=98INT_MAX=E2=80=99 =
[-Werror=3Dformat-overflow=3D]
  void ArchDesc::build_pipe_classes(FILE *fp_cpp) {
       ^~~~~~~~

I tried increasing the icedtea version with no success.

Thanks,

Ben=20



