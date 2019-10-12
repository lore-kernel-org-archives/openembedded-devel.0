Return-Path: <stefan.wiehler@missinglinkelectronics.com>
Received: from smtp.missinglinkelectronics.com
	(smtp.missinglinkelectronics.com [94.130.14.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9C13B7F4AF
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2019 12:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp.missinglinkelectronics.com (Postfix) with ESMTP id 3C2A4E0197
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2019 14:45:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at missinglinkelectronics.com
Received: from smtp.missinglinkelectronics.com ([127.0.0.1])
	by localhost (mail.missinglinkelectronics.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id pKAvPI_6SPrL
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2019 14:45:07 +0200 (CEST)
Received: from pfanne-bionic1.mle (p578c5bfe.dip0.t-ipconnect.de
	[87.140.91.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested) (Authenticated sender: stefan)
	by smtp.missinglinkelectronics.com (Postfix) with ESMTPSA id E0907E011C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2019 14:45:06 +0200 (CEST)
From: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Oct 2019 14:44:33 +0200
Message-Id: <20191012124434.129278-1-stefan.wiehler@missinglinkelectronics.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20191009151926.1733788-1-raj.khem@gmail.com>
References: <20191009151926.1733788-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH] nvme-cli: defer host ID generation to post installation
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
X-List-Received-Date: Sat, 12 Oct 2019 12:45:06 -0000
Content-Transfer-Encoding: 8bit


Right now, we only generate the hostnqn post-installation, but not the
hostid; I agree however that it makes more sense to perform both tasks
on the target.


