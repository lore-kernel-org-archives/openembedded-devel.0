Return-Path: <Pengyu.Ma@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4214465E21;
	Wed, 11 Jun 2014 02:47:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5B2ljIi014208
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Jun 2014 19:47:45 -0700 (PDT)
Received: from yu.wr (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Tue, 10 Jun 2014 19:47:44 -0700
Message-ID: <5397C34A.8090708@windriver.com>
Date: Wed, 11 Jun 2014 10:47:38 +0800
From: Pengyu Ma <pengyu.ma@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>, Weiwei Wang
	<weiwei.wang@windriver.com>, <scott.a.garman@intel.com>,
	<openembedded-core@lists.openembedded.org>
X-Originating-IP: [128.224.162.213]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Why "--disable-perl-regexp" is used for configration in grep
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Jun 2014 02:47:46 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Scott and others,

in oe-core grep, perl-regexp is disabled by default:

meta/recipes-extended/grep/grep_2.18.bb:

...

EXTRA_OECONF = "--disable-perl-regexp"

...

Can I know why it is disabled? Any background? I tried to enable it, it 
seems no problem from my side.

Thanks

Pengyu

