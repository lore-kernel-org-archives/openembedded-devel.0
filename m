Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 188EB7D20A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 13:28:29 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id h4so21335578wre.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2019 06:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=tNxR+erOjfSPmRKPOht475s9ajGV6g73mYMIcja9g50=;
	b=YIdau7/eirUuGXuV8UVq6QCLr5jZXTkPAMTWg4JndhcLKej0T1bUAvhv8caD8oUHxv
	xwEhJWqvvbY8CmL+5wdf0B2mWQzW+uaGEBF1hEe3C5soDvDgyBGQy/UdQr3i6tOYYrGk
	j2gEiCJQSc1ze1wt+PCjBPg2G7RabNzRNUzStGgddRYlSt7vARAGfHRfBclxGZISyuvS
	ahQ46pVzbAiNYlRgKDh2Cl4MhfyIA2luySOXO87fBstzLw9CwSEpqgeka4CFLDkqv12f
	+fC6B/6T9DvHrwghIEVzfbQRmaFrHYgXZq9y7hTsecqJyIseqT3gZEPMRLLhDnh3ORIj
	KQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tNxR+erOjfSPmRKPOht475s9ajGV6g73mYMIcja9g50=;
	b=R1nuJbsZzrQaZigKaSt4tQH2+OwNGVVlAsXIxAYv3BoHC4rZHR9DFO4T3alb7mvGBg
	k3ioU0l8j0ZBxdhBtjgIUOEyUcRGGXKk859xwyU1ESy/s4eQ39BuQwfqBCup1Nr1mcPo
	IsD5SKo0e9U0GlWx0Kfsqp6tw9UEZabOdIaD96buKYtDVjEZzR7g5OXHhTrivKDmta4o
	ZGa364pHtO9gRQO3bHIWbgexxsicodzwZyiVNKgw325ajzh6okVMEeBla3YcxFEtveMK
	RwFzR76dwhPKEbmS9P8rctfEZT+5KVEn1L3eRre8gjKbPP8t1TInS7RJQE6m7h5geyM8
	m8Iw==
X-Gm-Message-State: APjAAAXKIXBkBOiuweMNpHeslTU4P4bZLSYh0ScXXBlnrXhcLYnG/6LI
	0cMSVI5817jq5rVqAZUGw4lahwDDWOIypA==
X-Google-Smtp-Source: APXvYqyRVBZtQFDLvJLQ/4EWMToO7OXV3XGurQszjOBaldAuYT82ZBHX5JGgTiuAeCmXFhJrlWlvvQ==
X-Received: by 2002:adf:fec3:: with SMTP id q3mr52398088wrs.173.1554298109671; 
	Wed, 03 Apr 2019 06:28:29 -0700 (PDT)
Received: from VM-VPR.corporate.saft.org ([80.215.155.216])
	by smtp.gmail.com with ESMTPSA id
	g13sm13221490wmh.11.2019.04.03.06.28.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Apr 2019 06:28:28 -0700 (PDT)
From: Vincent Prince <vincent.prince.fr@gmail.com>
To: openembedded-devel@lists.openembedded.org, bunk@stusta.de,
	martin.jansa@gmail.com
Date: Wed,  3 Apr 2019 15:28:12 +0200
Message-Id: <1554298095-26709-1-git-send-email-vincent.prince.fr@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH v2 0/3] Bump zeromq libraries versions
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
X-List-Received-Date: Wed, 03 Apr 2019 13:28:30 -0000

These patches are intended to bump zeromq libraries to latest stable releases including:
 - libzmq
 - czmq
 - cppzmq

Vincent Prince (3):
  zeromq: bump version 4.2.5 => 4.3.1
  cppzmq: bump version 4.2.3 => 4.3.1
  czmq: bump version 4.1.1 => 4.2.0

 meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb  |  6 ++--
 .../zeromq/{czmq_4.1.1.bb => czmq_4.2.0.bb}        | 18 ++++++------
 .../0001-Problem-out-of-date-with-zproject.patch   | 31 ---------------------
 .../recipes-connectivity/zeromq/zeromq_4.2.5.bb    | 32 ----------------------
 .../recipes-connectivity/zeromq/zeromq_4.3.1.bb    | 26 ++++++++++++++++++
 5 files changed, 39 insertions(+), 74 deletions(-)
 rename meta-oe/recipes-connectivity/zeromq/{czmq_4.1.1.bb => czmq_4.2.0.bb} (56%)
 delete mode 100644 meta-oe/recipes-connectivity/zeromq/files/0001-Problem-out-of-date-with-zproject.patch
 delete mode 100644 meta-oe/recipes-connectivity/zeromq/zeromq_4.2.5.bb
 create mode 100644 meta-oe/recipes-connectivity/zeromq/zeromq_4.3.1.bb

-- 
2.7.4


