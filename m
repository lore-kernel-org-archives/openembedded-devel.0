Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KsEb4-0002kp-9y
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Oct 2008 12:36:18 +0200
Received: from imp050244.vpn.mi.fu-berlin.de ([130.133.50.244])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KsEaj-0005op-6z
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Oct 2008 12:35:57 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Oct 2008 12:36:27 +0200
User-Agent: KMail/1.9.9
References: <1224508369-30155-1-git-send-email-jonas.bonn@gmail.com>
In-Reply-To: <1224508369-30155-1-git-send-email-jonas.bonn@gmail.com>
MIME-Version: 1.0
Message-Id: <200810211236.28030.zecke@selfish.org>
Subject: Re: [PATCH] File perms required when O_CREAT is used
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
X-List-Received-Date: Tue, 21 Oct 2008 10:36:18 -0000
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 20 October 2008 15:12:49 Jonas Bonn wrote:
> On Ubuntu Intrepid, D_FORTIFY_SOURCE is enabled by default, thus
> requiring file permissions when the O_CREAT flag is set on open.  This
> patch remedies this for gcc-3.4.6.
>
> Signed-off-by: Jonas Bonn <jonas.bonn@gmail.com>

yupp, the next will be dirent.h in qemu-native and I have not continued from 
there yet. If you look at the gettext-native patch you see the debian folks 
decided to use the numeric constants instead of 0666 but both should be okay


z.


