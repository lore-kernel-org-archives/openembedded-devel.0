Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 56D597DD9F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 06:36:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5P6aNKk029330
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Jun 2019 23:36:23 -0700 (PDT)
Received: from [128.224.162.195] (128.224.162.195) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Mon, 24 Jun 2019 23:36:22 -0700
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <aae96935-730b-f67d-71c1-322c88d7d209@windriver.com>
Date: Tue, 25 Jun 2019 14:36:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
X-Originating-IP: [128.224.162.195]
Subject: mongodb and itstool depend on meta-python
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
X-List-Received-Date: Tue, 25 Jun 2019 06:36:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi,

Ideally, the meta-oe should not depend on other layers except oe-core 
layer. But I found there are 2 recipes mongodb and itstool in this layer 
depend on some python packages in meta-python layer:

ERROR: Nothing PROVIDES 'python-pyyaml-native' (but 
/buildarea/openembedded-core/meta-openembedded/meta-oe/recipes-dbs/mongodb/mongodb_git.bb 
DEPENDS on or otherwise requires it).
ERROR: Nothing PROVIDES 'python-cheetah-native' (but 
/buildarea/openembedded-core/meta-openembedded/meta-oe/recipes-dbs/mongodb/mongodb_git.bb 
DEPENDS on or otherwise requires it).
ERROR: Nothing PROVIDES 'python-typing-native' (but 
/buildarea/openembedded-core/meta-openembedded/meta-oe/recipes-dbs/mongodb/mongodb_git.bb 
DEPENDS on or otherwise requires it).
ERROR: Nothing PROVIDES 'python3-lxml-native' (but 
/buildarea/openembedded-core/meta-openembedded/meta-oe/recipes-support/itstool/itstool_2.0.5.bb 
DEPENDS on or otherwise requires it).

Should we move these python recipes from meta-python to meta-oe?

Regards,
Yi


