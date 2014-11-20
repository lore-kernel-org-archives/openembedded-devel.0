Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B64BB70620
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Nov 2014 08:59:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43716392"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Nov 2014 16:56:34 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAK8xWdK026317;
	Thu, 20 Nov 2014 16:59:32 +0800
Received: from Fedora (10.167.226.40) by G08CNEXCHPEKD03.g08.fujitsu.local
	(10.167.33.89) with Microsoft SMTP Server id 14.3.181.6;
	Thu, 20 Nov 2014 16:59:52 +0800
Date: Thu, 20 Nov 2014 16:59:46 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <martin.jansa@gmail.com>
Message-ID: <20141120165946.3ca734ec@Fedora>
In-Reply-To: <20141119143756.GH3315@jama>
References: <1416368645-23882-1-git-send-email-qianl.fnst@cn.fujitsu.com>
	<20141119143756.GH3315@jama>
Organization: FNST
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] tiptop: Add new recipe
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
X-List-Received-Date: Thu, 20 Nov 2014 08:59:48 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

Jansa:

Sorry there's a bug in my patch. Tiptop can not be compiled in the host with
libxml2 installed, because it will use libxml2 in the HOST first,rather than
the libxml2 we specified. 

Modified it in version 2, please apply this one.
Thanks.

-- 
Qian Lei

