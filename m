Return-Path: <joe@deserted.net>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 15D816FFED
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 02:15:15 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id c20so29301082itb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2016 18:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id;
	bh=TQZpmAO+/OoUZry8J9cEI5rqeg9zRN/s1ldM+Qadnjg=;
	b=v1bcto8/PbRuAesm0Su7kRqo3vpfyZij/IMVpaVmX68/gKB5CFmjKeH8KhH01QV1nK
	w390Ak7J4CgrHrlEh9B64ytUYS5/6VnCBRu7pFR1kGgPHiEoE/IJaCg+kaljwVrlPE51
	Eoz3coHduzP2r09ZhfimhEXYbvdOFq5IPpgOhmxxd5SZU2UTCj43M4EOnm++uhFH81EO
	T/OMyLyJh0lbZKLG9VWdtpLlFdIQfJufqdP3eG3v3CQA9KYOF0L/Ed79LwX17GQ7FGKS
	+RBZ3kbckn036y0VNrEqtwM0VEFlN7RekG+UP3QAE7NI6w2GjgPuBVO5vIktkTXKVXZ3
	Zngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=TQZpmAO+/OoUZry8J9cEI5rqeg9zRN/s1ldM+Qadnjg=;
	b=JkBIM0TrkMugOf9icalVoCIjRJfMJNdwIWQ76SI6Bkf7FVcE/qWvSBgFUSvpOT2vmv
	bVPPYbfRa3hFmnKWCcShf/yRZsP6a9k0I1V9F3kiTiOO3REN3sli7k6sMG/3JF3jh7bg
	geW603stBtBbUNJIsUxRkc9s7XavBNT8cfkvy5HEy3B/i1ScQ78i+YQUUnYnGQzt3uHK
	HrzIwDBy1fLHsqCPc0FJ8dw+6uhtOWsClim0Q8da+s4HKpejodUqsOqo8Xjj46H2KhvW
	nLUGM8HUW31KLEh1/nWKTcZqhuHdIZKPyEMIUurIEmwpIu2zN/dHakKLEeRbfqj9YhsU
	Fd7g==
X-Gm-Message-State: AKaTC02ioDfcw1pfkS805KFW4xAepQpbSpeaSU7cXrFlAOJCI9d1dfVaw4A/NmGSj2YdFQ==
X-Received: by 10.36.33.21 with SMTP id e21mr6194998ita.111.1481940916929;
	Fri, 16 Dec 2016 18:15:16 -0800 (PST)
Received: from mir.deserted.net (23-233-31-74.cpe.pppoe.ca. [23.233.31.74])
	by smtp.gmail.com with ESMTPSA id l73sm3804122ioe.1.2016.12.16.18.15.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Dec 2016 18:15:16 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Dec 2016 21:15:12 -0500
Message-Id: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH 00/11] samba: refresh pending patches
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
X-List-Received-Date: Sat, 17 Dec 2016 02:15:16 -0000

As I mentioned earlier this week, I'm taking a stab at updating the samba
patches from Andreas Oberritter that now have conflicts due to other
changes queued up for samba.  Quite a few of them actually applied cleanly
after resolving earlier conflicts and the basic smoke tests seem to pass
for me, but this definitely needs a bit of soak time in master-next and if
you're around, Andreas, and can double-check my work on your patches,
that'd be much appreciated.

-- 
-Joe MacDonald.
:wq


