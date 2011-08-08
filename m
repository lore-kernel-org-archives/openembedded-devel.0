Received: from mail2.multitech.net ([65.126.90.254] helo=mail2.multitech.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jgilles@multitech.com>) id 1QqUbD-0003Y3-R8
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Aug 2011 20:30:53 +0200
Received: from mail2.multitech.com (localhost.localdomain [127.0.0.1])
	by localhost (Email Security Appliance) with SMTP id
	C14C05B04AA_E402A4EB for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Aug 2011 18:26:22 +0000 (GMT)
Received: from mail.multitech.com (unknown [192.168.11.244])
	by mail2.multitech.com (Sophos Email Appliance) with ESMTP id
	A2C025B02FC_E402A4EF for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Aug 2011 18:26:22 +0000 (GMT)
X-Ninja-PIM: Scanned by Ninja
X-Ninja-AttachmentFiltering: (no action)
Received: from [192.168.52.113] ([192.168.52.113]) by mail.multitech.com with
	Microsoft SMTPSVC(5.0.2195.7381); Mon, 8 Aug 2011 13:25:42 -0500
From: Jesse Gilles <jgilles@multitech.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1312821482-32319-1-git-send-email-jgilles@multitech.com>
References: <1312821482-32319-1-git-send-email-jgilles@multitech.com>
Date: Mon, 08 Aug 2011 13:26:20 -0500
Message-ID: <1312827980.683.6.camel@jjg-linux>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-OriginalArrivalTime: 08 Aug 2011 18:25:43.0122 (UTC)
	FILETIME=[95410B20:01CC55F8]
Subject: Re: [PATCH] jakarta-libs: fix SRC_URIs for avalon-framework, logkit
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Aug 2011 18:30:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Please apply to 2011.03-maintenance.  Without this patch, building
openjdk from scratch (no sources dir) fails because the
avalon-framework-api tarball can't be downloaded.  Apache.org put up a
placeholder page for http://www.apache.org/dist/excalibur/ that ends up
getting downloaded instead of the tarball.

Thanks,
Jesse



