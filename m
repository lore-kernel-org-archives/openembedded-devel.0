Return-Path: <joe@deserted.net>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5076577266
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 00:54:56 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id z135so197242465iof.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 16:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:subject:date:message-id;
	bh=NQrc/p0dRWaxpUrHwUK2o13KZ412pUL/30OBZdsLX9o=;
	b=rjNRJCTLtMvcEgXqJPqBI+Fn7cWLnb3IHnPICgcfJlebVylbzSF3CYrpmVgCkNjs9F
	wlPRcQz+OKK41VQugGOzPK5MoqSdyH5O8J/wi+rMmjzmTKXzv1CkX+LpwGAKlDpzr9Zk
	u5Qdr+I9M+Jg6GXwjfqNFcIm4I5KSWKKj2+35JqMZnXP+908xGa3kuFyXYk/CuSkPVGt
	sD/iIESoGf3JJn9M1DlvMbcpeXZMjokKEHfl8LfMZLGRS4zmetlgzBFb/FxsYPgZKeSY
	cY1fVZ0x9XEbjfJ46S72PmB8MUaUmUOFPZRBsZJdbE3SH25fK+S+L/oA/9xKmLDsXa+I
	Sg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id;
	bh=NQrc/p0dRWaxpUrHwUK2o13KZ412pUL/30OBZdsLX9o=;
	b=lA+MKVRWXHVSePelvrDdHkeQibv3ny2qeJmSQrmp2WE5xOAPaKupwMvYYy/cjHvzz/
	PqqaSNXgxgFWrSeqpn3JNn5e8e0t9zpWh34WsHLxge0GXT0QuIFwlr9F9LwP0dtw5c02
	nLfxOQI4qW22NmW7ewUx72jo8A1Z42tpyKXn9W0XsJJFtQdAgRDA+3V0qYK107Cl8/fl
	FwOb4hBQhowwpTLiGTYXGHet71bMDVvhdTzCzmSagsHqPONCgXHISh5VloPfMEYby7c5
	oMqtCg9yxlKBQcPcjdOTxreE2D3pYLE/PBzgkW4mgWB2xxMDW12RMyKUPFwLfd9b6v+q
	sW8A==
X-Gm-Message-State: AG10YORg2uqJuBSKVhW8r+FjXXI9ZvsQW/yN3EA3k+AVJ/fKpF1eQD4cTA82u9vr98KYtw==
X-Received: by 10.107.3.30 with SMTP id 30mr31850233iod.9.1456188896896;
	Mon, 22 Feb 2016 16:54:56 -0800 (PST)
Received: from mir.deserted.net ([23.233.31.74])
	by smtp.gmail.com with ESMTPSA id
	l91sm12570703ioi.3.2016.02.22.16.54.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Feb 2016 16:54:54 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 19:55:09 -0500
Message-Id: <1456188910-29029-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
Subject: (No subject)
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
X-List-Received-Date: Tue, 23 Feb 2016 00:54:57 -0000

These four are bridge measures I took to get my images building again
while merging the backlog of meta-networking patches.  I'm now circling
back to clear out first the waf issue, which I think will resolve the
samba and libldb (and related library) errors, then start looking at the
excess of blacklisting we've had to do lately.

-- 
Joe MacDonald
:wq


