Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1LYE4M-0006LT-Ke
	for openembedded-devel@openembedded.org; Sat, 14 Feb 2009 07:32:06 +0100
Received: (qmail 19786 invoked by uid 813007); 14 Feb 2009 06:30:34 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 14 Feb 2009 06:30:34 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 14 Feb 2009 07:30:31 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.29-rc2; KDE/4.2.0; x86_64; ; )
References: <200902140035.13820.khimov@altell.ru>
In-Reply-To: <200902140035.13820.khimov@altell.ru>
MIME-Version: 1.0
Message-Id: <200902140730.32782.openembedded@haerwu.biz>
Subject: Re: [PATCH] New package: siproxd
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
X-List-Received-Date: Sat, 14 Feb 2009 06:32:07 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 13 of February 2009 22:35:13 Roman I Khimov wrote:

> diff --git a/packages/siproxd/siproxd.inc

> +RDEPENDS = "libosip2"

> diff --git a/packages/siproxd/siproxd_0.7.1.bb

> +PR = "r0"

Drop those two lines. You should not add libs to RDEPENDS (OE takes care 
of it) and "r0" is default PR value.

Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




