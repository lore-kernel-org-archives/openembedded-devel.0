Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id D20826B6EA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Nov 2016 15:43:21 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id f82so6900763wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Nov 2016 07:43:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=N4ABqiEL8AvIvvZyWLxnBcMrioIqQ/9PN0xvI/7JEbM=;
	b=bo6kLCUXCwaFVhsQf01/IW+ayCAg5izBjMDhIdRMx031aMwAGMrlfPLyGR1RFt9Ujr
	kXXNJai3rjVED972VcQlPqSmkAFKZFXkpP7Voyd3i/bTD2K6Jp2li3/fF4NnZTS5Eek3
	D90KNnIBtnWbHK8Gi6bfs6lzAWrnhmNroKvZFCZQs07JkRDlHXkuM7rwArWs9TcI+aJM
	6gnLfTF6qxDCeU1+ZcWwJe8OgW6f1Az7k6UO0Y/P7SDd6YUQfKGg5ZrE+tPcE0UWkDne
	1KZk+hnAPvtokRn3iVUS76BeVrV4YIrPB+w3r+3QwA4O1O1Jqh7Vtx6LQ2EUhvKpBpB7
	T5Vw==
X-Gm-Message-State: ABUngvfwwkuot8O76Ms2o/KTLIwZhBTaRRWA0d8fVqyjLhw46gow3jcoqNWQUKeIpfrpmw==
X-Received: by 10.28.218.213 with SMTP id r204mr4508639wmg.69.1479224602171;
	Tue, 15 Nov 2016 07:43:22 -0800 (PST)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	f134sm4880716wmf.19.2016.11.15.07.43.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Nov 2016 07:43:21 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Nov 2016 15:43:09 +0000
Message-Id: <20161115154311.30118-1-git@andred.net>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [meta-networking][PATCH 0/2] ncp - a fast file copy tool for LANs
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
X-List-Received-Date: Tue, 15 Nov 2016 15:43:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

"ncp" is a utility for copying files in a LAN. It has absolutely
no security or integrity checking, no throttling, no features,
except one:
  you don't have to type the coordinates of your peer.

Basically it works like this:

- You and your buddy want to play Quake
- Your buddy has a level that you don't have
- He types npush filename and waits. npush sends out UDP
  announcement packets proclaiming that someone wants to
  send something
- You type npoll. npoll waits until it sees one of these packets
- The files are copied with tar over a TCP socket, so permissions
  and file dates (and if you are root, owners) are preserved
- There are other usage modes. You can also use it like this:

  peer1$ ncp
                           peer2$ ncp peer1 file1 file2 file3
or like this:

  peer1$ npush file1
                           peer2$ npoll peer1


