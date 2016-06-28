Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7A1B77001D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2016 08:37:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5S8bScj004391
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2016 01:37:28 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 28 Jun 2016 01:37:27 -0700
From: <mingli.yu@windriver.com>
To: <mingli.yu@windriver.com>, <openembedded-devel@lists.openembedded.org>,
	<Jackie.Huang@windriver.com>
Date: Tue, 28 Jun 2016 16:36:30 +0800
Message-ID: <1467102993-4925-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-python][PATCH]: update some python packages bb
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
X-List-Received-Date: Tue, 28 Jun 2016 08:37:29 -0000
Content-Type: text/plain

1, 
  Remove pytest for python-mccabe to avoid dependency 
  on python-runner as only one file test_mccabe.py import 
  pytest and this test_mccabe.py file not install on 
  our target eventually.

2, Add python-pbr bb file as python-mock depends on
  python-pbr-native

3, Add python-pbr-native dependency for python-mock

