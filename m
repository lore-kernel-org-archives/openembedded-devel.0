Return-Path: <kraaggorim@gmail.com>
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
	[209.85.219.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0C5377D6B4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 15:42:37 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id k15so1090023ybd.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 07:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=9Jkt9vgIW+0YIGwDr7gesFROMxO2Hrw0guhPYfYZ+zE=;
	b=EQbBLYb9HrYHYZbYnY4wmU/VRfwUaELOSAqKd2xaQT6njrJ0NhATo4CRr5ECdbBrcS
	xJQPVk3Qeoh4MhDCvf5eBWqIvXlczST3cOV72XZUvuxardwDcLTfCdORsZbrmKFjOZNx
	vRgqQDT3XH0mW8EQxjxKLUnXDwPvNd0MMH0JDPVuJOSQv8QF7JJzxx8+SOUELs3NK3Sr
	44g2KrlcsfjgPp68sNZaLoEWXKUfqV9ozzfd2DHyA4g2Ky9ECAT8mDVPEEgi9wdc3KBZ
	t7bRA/zRMluHn5zUdCt068X+8+RIcR3sxaCryr+y894H+Z10ZY363quyR6G1zkH25oh0
	9XZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=9Jkt9vgIW+0YIGwDr7gesFROMxO2Hrw0guhPYfYZ+zE=;
	b=mR9iCqgkzDKDpzEmKwkwQV/L8Q2VyJiSqe7GAIZkignYlMSElqB1ajkJ3PPGPux8Fx
	zZiBtA7C+TftOgOe2pLgzLSfehb8VBLAn9D3r25gXMrD2+dKn7QkzteZ/4kHACUgGCKp
	KxkJo2mWvf3GAnKUTviFX5bB8RPVte4Ob3e8duK37bSurIRZ1PvxhHFrqRx8ZARn71yx
	+x5eUqWsWFWZFLqZy06usWiHyTwSGWxjEGNDrvFwGk6u0xhuUip8frgS5rA2JrLTbKvF
	9/P+sP5e2Mg1FyUGgKH8yq+DzUNWG7CpE/M8/PBpcRVZJGs2Hpt8/OALQUGqSsrLqsT0
	OCKQ==
X-Gm-Message-State: APjAAAUGTEaG/f+bsOrNZo4ZZeaz/Ck0iJjNwS3TvIkl3R02sQqnNNsy
	Pl3AE7odyPRpmeSLmn9CfoUQ0iQw8a4bpqkNi19XqnEVXuk=
X-Google-Smtp-Source: APXvYqz6YG0D9GZW9dfrxSWdNG2sxADAvBwUAb9q/3S5RE37WHLRXFV3jHHqDZlAQOXUpYGS9daGxneRZPrnIjV7NTs=
X-Received: by 2002:a25:d990:: with SMTP id q138mr2890631ybg.114.1579880558799;
	Fri, 24 Jan 2020 07:42:38 -0800 (PST)
MIME-Version: 1.0
From: Kraag Gorim <kraaggorim@gmail.com>
Date: Fri, 24 Jan 2020 16:42:28 +0100
Message-ID: <CACc3Zv4pUUEV83nLDom9EzeQh1UmBKqoQRBrUn4iC7o4OZF=WA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [PATCH 0/2] [meta-java] inherit python native
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
X-List-Received-Date: Fri, 24 Jan 2020 15:42:38 -0000
Content-Type: text/plain; charset="UTF-8"

Building openjdk with python and meta-java on their zeus releases
revealed some problems regarding python. Multiple package make use of
python to build or for configuration. Cacao even gets python patched
into its tools which is late on used by other packages. To avoid
requring having python set as HOSTTOOL it should be added to the
corresponding packages.

