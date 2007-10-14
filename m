Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dp@xora.org.uk>) id 1Ih8Xc-0000Q5-DA
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Oct 2007 20:50:20 +0200
Received: from [192.168.1.64] ([::ffff:78.86.130.156])
	(AUTH: PLAIN dp, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Sun, 14 Oct 2007 19:44:01 +0100
	id 0006400B.47126371.0000401A
Message-ID: <4712638E.80706@xora.org.uk>
Date: Sun, 14 Oct 2007 19:44:30 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.6 (X11/20070824)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1Ih50X-0005Xp-KR@linuxtogo.org>
In-Reply-To: <E1Ih50X-0005Xp-KR@linuxtogo.org>
Subject: Re: [oe-commits] org.oe.dev libmad: fix SRC_URI - close #3147
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 14 Oct 2007 18:50:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

eha commit wrote:
>  
> -SRC_URI = "ftp://ftp.mars.org/pub/mpeg/libmad-${PV}.tar.gz"
> +SRC_URI = "http://downloads.sourceforge.net/mad/libmad-${PV}.tar.gz"
>  S = "${WORKDIR}/libmad-${PV}"
>  
>   
This doesnt look right, it should I think use the
${SOURCEFORGE_MIRROR} variable. Please fix ASAP.

Graeme



